#!/usr/bin/env python3
import re
import sys
from pathlib import Path
from collections import defaultdict

ROOT = Path(__file__).resolve().parent
INSTALL_DIR = ROOT / "INSTALL"
MAIN_C = ROOT / "main.c"
MAKEFILE = ROOT / "Makefile"

SPECIAL_BASENAMES = {"SIO2MAN_irx", "PADMAN_irx", "MCMAN_irx", "MCSERV_irx"}

def die(msg):
    print(f"[ERROR] {msg}", file=sys.stderr)
    sys.exit(1)

def normalize_identifier(rel_path: Path) -> str:
    parts = list(rel_path.parts)
    name = "_".join(parts).replace(".", "_").lower()
    return name

def collect_install_files():
    if not INSTALL_DIR.is_dir():
        die(f"INSTALL directory not found at: {INSTALL_DIR}")
    files = []
    for p in sorted(INSTALL_DIR.rglob("*")):
        if p.is_file():
            files.append(p.relative_to(INSTALL_DIR))
    files = sorted(files, key=lambda r: tuple(str(r).split("/")))
    return files

def group_by_folder(files):
    d = defaultdict(list)
    for rel in files:
        d[rel.parts[0]].append(rel)
    return dict(sorted(d.items(), key=lambda kv: kv[0].lower()))

def generate_extern_block(files):
    out = []
    for rel in files:
        ident = normalize_identifier(rel)
        out.append(f"extern u8 {ident}[];")
        out.append(f"extern int size_{ident};")
        out.append("//----------------------------------------//")
    return "\n".join(out).rstrip() + "\n"

def generate_mkdir_block(folders):
    out = []
    for folder in sorted(set(folders), key=lambda s: s.lower()):
        out.append(f'\tret = mcMkDir(mcport, 0, "{folder}");')
        out.append('\tmcSync(0, NULL, &ret);')
    return "\n".join(out) + "\n"

def generate_write_embed_block(grouped):
    out = []
    for folder, filelist in grouped.items():
        out.append(f"\t// {folder} folder")
        for rel in sorted(filelist, key=lambda r: (str(r.parent).lower(), r.name.lower())):
            ident = normalize_identifier(rel)
            out.append(f'\tretorno = write_embed(&{ident}, size_{ident}, "{rel.parts[0]}", "{rel.name}", mcport);')
            out.append("\tif (retorno < 0)")
            out.append("\t{")
            out.append("\t\treturn 6;")
            out.append("\t}")
    return "\n".join(out) + "\n"

def update_main_c(files):
    text = MAIN_C.read_text(encoding="utf-8", errors="ignore")

    # Extern region
    i1 = text.find("///BOOT FOLDER")
    i2 = text.find("// Embedded IOP drivers")
    if i1 == -1 or i2 == -1 or i2 <= i1:
        die("Anchors not found in main.c (extern region)")
    text = text[:i1] + "///BOOT FOLDER\n" + generate_extern_block(files) + "\n// Embedded IOP drivers\n" + text[i2:]

    # mcMkDir region
    m1 = re.search(r'(?m)^[ \t]*ret[ \t]*=[ \t]*mcMkDir\(', text)
    m2 = re.search(r'(?m)^[ \t]*retorno[ \t]*=[ \t]*-12[ \t]*;', text)
    if not (m1 and m2 and m2.start() > m1.start()):
        die("Anchors not found in main.c (mkdir region)")
    start = text.rfind("\n", 0, m1.start()) + 1
    end   = text.rfind("\n", 0, m2.start())
    folders = [rel.parts[0] for rel in files]
    text = text[:start] + generate_mkdir_block(folders) + text[end+1:]

    # write_embed region
    m_after = re.search(r'(?m)^[ \t]*retorno[ \t]*=[ \t]*-12[ \t]*;', text)
    m_write = re.search(r'(?m)^[ \t]*retorno[ \t]*=[ \t]*write_embed\(', text[m_after.end():]) if m_after else None
    if not (m_after and m_write):
        die("Anchors not found in main.c (write_embed region)")
    ws = m_after.end() + m_write.start()
    m_end1 = re.search(r'PRINTF\("installation finished', text[ws:])
    m_end2 = re.search(r'(?m)^[ \t]*static[ \t]+sceMcTblGetDir', text[ws:])
    we = ws + (m_end1.start() if m_end1 else (m_end2.start() if m_end2 else 0))
    if we <= ws:
        die("Could not find end of write_embed region")
    grouped = group_by_folder(files)
    text = text[:ws] + generate_write_embed_block(grouped) + text[we:]
    MAIN_C.write_text(text, encoding="utf-8")
    print("[OK] main.c updated.")

def format_make_list(varname, items, op="+="):
    if not items:
        return f"{varname} {op}\n"
    lines = [f"{varname} {op}"]
    for i, it in enumerate(items):
        cont = " \\" if i != len(items)-1 else ""
        lines.append(f"\t{it}{cont}")
    return "\n".join(lines) + "\n"

def replace_specific_block(text, varname, op, new_block):
    pat = rf'(?m)^{varname}\s*{re.escape(op)}.*(?:\n[ \t]+\S.*)*'
    m = re.search(pat, text)
    if m:
        return text[:m.start()] + new_block.rstrip() + text[m.end():]
    return text.rstrip() + f"\n\n# Auto-generated {varname} {op} list\n" + new_block

def generate_bin2s_rules(files):
    out = []
    for rel in files:
        name = normalize_identifier(rel)
        src = f"INSTALL/{str(rel).upper().replace('\\', '/')}"
        out.append(f"{name}.s:")
        out.append(f"\tbin2s {src} {name}.s {name}")
        out.append("")
    return "\n".join(out).rstrip() + "\n"

def place_bin2s_rules(text, rules_block):
    # Remove previous simple rules
    text = re.sub(r'(?m)^[a-zA-Z0-9_]+\.s:\n\tbin2s[ \t]+INSTALL/[^\n]*\n(?:\n)?', '', text)
    # Remove prior labeled block, if any
    text = re.sub(r'\n?# Auto-generated bin2s rules from INSTALL\n(?:.|\n)*?(?=\n[a-zA-Z_][\w-]*\s*:|$)', '\n', text)

    header = "# Auto-generated bin2s rules from INSTALL\n" + rules_block + "\n"

    # Preferred: insert BEFORE the first 'clean:' target (strict match)
    m_clean = re.search(r'(?m)^[ \t]*clean\s*:\s*(?:\n|$)', text)
    if m_clean:
        return text[:m_clean.start()].rstrip() + "\n\n" + header + text[m_clean.start():]

    # Next: insert BEFORE the first include of PS2SDK Makefiles
    m_inc = re.search(r'(?m)^[ \t]*include[ \t]+\$\(PS2SDK\)/samples/Makefile\.pref', text)
    if m_inc:
        return text[:m_inc.start()].rstrip() + "\n\n" + header + text[m_inc.start():]

    # Next: before '# OTHER'
    m_other = re.search(r'(?m)^[ \t]*# OTHER[^\n]*$', text)
    if m_other:
        return text[:m_other.start()].rstrip() + "\n\n" + header + text[m_other.start():]

    # Fallback: end
    return text.rstrip() + "\n\n" + header

def update_makefile(files):
    text = MAKEFILE.read_text(encoding="utf-8", errors="ignore")

    names = [normalize_identifier(rel) for rel in files]
    objs = [f"{n}.o" for n in names]   # for EE_OBJS +=
    srcs = [f"{n}.s" for n in names]   # for EE_SRC  =

    # Preserve special drivers if already present
    special_o = [f"{b}.o" for b in SPECIAL_BASENAMES if re.search(rf'\b{re.escape(b)}\.o\b', text)]
    special_s = [f"{b}.s" for b in SPECIAL_BASENAMES if re.search(rf'\b{re.escape(b)}\.s\b', text)]
    objs = special_o + objs if special_o else objs
    srcs = special_s + srcs if special_s else srcs

    # Refresh ONLY EE_OBJS +=
    text = replace_specific_block(text, "EE_OBJS", "+=", format_make_list("EE_OBJS", objs, "+="))

    # Ensure single EE_SRC = block
    new_src = format_make_list("EE_SRC", srcs, "=")
    m_src = re.search(r'(?m)^EE_SRC\s*=\s*.*(?:\n[ \t]+\S.*)*', text)
    if m_src:
        text = text[:m_src.start()] + new_src.rstrip() + text[m_src.end():]
    else:
        text = text.rstrip() + "\n\n# Auto-generated EE_SRC = list\n" + new_src

    # Place bin2s rules
    text = place_bin2s_rules(text, generate_bin2s_rules(files))

    MAKEFILE.write_text(text, encoding="utf-8")
    print("[OK] Makefile updated with bin2s rules before 'clean:'.")

def main():
    files = collect_install_files()
    if not files:
        die("No files found in INSTALL/. Nothing to do.")
    update_main_c(files)
    update_makefile(files)
    print("[DONE] All updates applied.")

if __name__ == "__main__":
    main()
