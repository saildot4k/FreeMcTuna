# converts image.h to image.h.extension 
# useful to see what image.h looks like.

import re
from os import listdir, mkdir
from os.path import join, exists, basename, splitext

from PIL import Image


def parse_pixel(pixel: str):
    pixel = pixel.strip()

    s = bytes.fromhex(pixel[2:])
    if len(s) == 4:
        b = s[1]
        g = s[2]
        r = s[3]
    else:
        b = s[0]
        g = s[1]
        r = s[2]

    return r, g, b


def export_bitmap(file: str):
    print(file)

    outfile = join("export", splitext(basename(file))[0] + ".bmp")

    f = open(file, "r")
    contents = f.read()

    w = 0
    h = 0

    lines = contents.splitlines()

    for line in lines:
        m = re.match(r".*_([wh]) = ([0-9]+);.*", line.strip())
        if m:
            d, v = m.groups()
            if d == "w":
                w = int(v)
            elif d == "h":
                h = int(v)

    start = contents.find("{")+1
    end = contents.find("}")

    pixels = list(map(parse_pixel, contents[start:end].split(",")))

    im = Image.new("RGB", (w, h))
    im.putdata(pixels)
    im.save(outfile)


mkdir("export")
dir = listdir("BMP")

for file in dir:
    if file.endswith(".h"):
        if exists(join("BMP", file + ".bmp")):
            export_bitmap(join("BMP", file))