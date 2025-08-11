# SAS (Save Application Support) compliant BM Script:
# Due to wildcard bug on memory card, APPINFO.PBT can not be in root folders where elf exists, so APPINFO.PBT will be in mc?:/BM/APPS/
# Memory Card structure mc?:/BM/APPS/$SAS$/APPINFO.PBT and elf in mc?:/$SAS$/APPINFO.PBT
# Non-Memory Card Structure: device:/$SAS$/APPINFO.PBT or device:/APPS/$SAS$/APPINFO.PBT NOTE: $PWD$ should work for both.

# Change this information to describe the application and where it should be ran from for memcard (SAS) or other devices (SAS_NON_MC)
# SAS is the App folder name. SAS_NON_MC defines if app is in root of non-memcard device (non_mc:/$SAS$) or APP folder (non_mc:/APPS/$SAS$)
# This is so that you do not have to edit any info below line 20.
#
# Some devices are case sensitive! Make sure your case matches!
#
# Source: 
SET "TITLE" "[APP] BOOT Folder"
SET "VERSION" "N/A"
SET "AUTHOR" ""
SET "DESC" "Choose which mc?:/BOOT.ELF - BOOT3.ELF to run."
SET "SAS" "BOOT"
# Comment out 1 of the 2 lines below. If app is in non-mc:/$SAS$ comment out the first, if in non-mc:/APPS/$SAS$ comment out the second
# SET "SAS_NON_MC" "$SAS$"
SET "SAS_NON_MC" "APPS/$SAS$"
#

# Do not change these 2 lines!
GOTO "$ARG1$"
RETURN -1

# Used for Autoboot Labels
:LABEL_NAME
    ADDWIDGET "LABEL" "$ARG2$$TITLE$ v$VERSION$"
    EXIT 0

:QUERY
    ADDWIDGET "CALL" "$TITLE$" "$BM.TXT_VERSION$: $VERSION$ $BM.TXT_AUTHOR$: $AUTHOR$ $BM.TXT_DESC$: $DESC$" $ARG2$ "$ARG0$" "$ARG3$" "$ARG4$" "$ARG5$" "$TITLE$" "$PWD$" "$SAS$" "$SAS_NON_MC$"
    EXIT 0

:INSTALL
        IF MATCHES "mc?" "$ARG2$"
            GOTO "INSTALL_TO_MC"
        ELSEIF NOT MATCHES "mc?" "$ARG2$"
            GOTO "INSTALL_TO_NONMC"
        ENDIF

:INSTALL_TO_MC
    IF FAIL COPY "$PWD$" "$ARG2$:/$SAS$"
        ECHO "Failed installing $TITLE$"
        MESSAGE "Failed installing $TITLE$"
        RRM "$ARG2$:/$SAS$"
        RETURN -1
    ENDIF
    EXIT 0

:INSTALL_TO_NONMC
    IF FAIL COPY "$PWD$" "$ARG2$:/$SAS_NON_MC$"
        ECHO "Failed installing $TITLE$"
        MESSAGE "Failed installing $TITLE$"
        RRM "$ARG2$:/$SAS_NON_MC$"
        RETURN -1
    ENDIF
    EXIT 0

:REMOVE
    IF FAIL RRM "$PWD$"
        IF FAIL RRM "$PWD$"
            IF FAIL RRM "$PWD$"
                MESSAGE "Failed removing $TITLE$!"
                RETURN -1
            ENDIF
        ENDIF
    ENDIF
    EXIT 0

:RUN
    CLEARWIDGETS
    SETTITLE "Choose which BOOT(X).ELF to run:"
    ADDWIDGET "LABEL" " from"
    ADDWIDGET "LABEL" "$PWD$"
    IF EXISTS "$PWD$/BOOT.ELF"
        # Matrix Infinity, DMS3/4, Ghost 2
        ADDWIDGET "CALL" "BOOT.ELF -Matrix Inf, DMS3/4, Ghost 2" "$PWD$/BOOT.ELF" "$ARG0$" "COMP_MODE_CHOICE" "BOOT.ELF" "$PWD$/BOOT.ELF"
    ENDIF
    IF EXISTS "$PWD$/BOOT0.ELF"
        # Ghost 2
        ADDWIDGET "CALL" "BOOT0.ELF -Ghost 2" "$PWD$/BOOT0.ELF" "$ARG0$" "COMP_MODE_CHOICE" "BOOT0.ELF" "$PWD$/BOOT0.ELF"
    ENDIF
    IF EXISTS "$PWD$/BOOT1.ELF"
        # Ghost 2
        ADDWIDGET "CALL" "BOOT1.ELF -Ghost 2" "$PWD$/BOOT1.ELF" "$ARG0$" "COMP_MODE_CHOICE" "BOOT1.ELF" "$PWD$/BOOT1.ELF"
    ENDIF
    IF EXISTS "$PWD$/BOOT2.ELF"
        # Matrix Infinity, Ghost 2
        ADDWIDGET "CALL" "BOOT2.ELF -Matrix Inf, Ghost 2" "$PWD$/BOOT2.ELF" "$ARG0$" "COMP_MODE_CHOICE" "BOOT2.ELF" "$PWD$/BOOT2.ELF"
    ENDIF
    IF EXISTS "$PWD$/BOOT3.ELF"
        # Matrix Infinity, Ghost 2
        ADDWIDGET "CALL" "BOOT3.ELF -Matrix Inf, Ghost 2" "$PWD$/BOOT3.ELF" "$ARG0$" "COMP_MODE_CHOICE" "BOOT3.ELF" "$PWD$/BOOT3.ELF"
    ENDIF
    IF EXISTS "$PWD$/osdmenu.elf"
        ADDWIDGET "CALL" "osdmenu.elf" "$PWD$/osdmenu.elf" "$ARG0$" "COMP_MODE_CHOICE" "osdmenu.elf" "$PWD$/osdmenu.elf"
    ENDIF
    RETURN 0

:COMP_MODE_CHOICE
    CLEARWIDGETS
    SETTITLE "$ARG2$ compatibily options:"
    ADDWIDGET "LABEL" " from"
    ADDWIDGET "LABEL" "$PWD$"

    ADDWIDGET "CALL" "Enhanced Mode" "All chip functionality enabled" "$ARG0$" "RUN_COMP_MODE" "NONE" "$ARG3$"
    ADDWIDGET "CALL" "Shutdown Module Manager" "SHUTDOWN ^"MM^"" "$ARG0$" "RUN_COMP_MODE" "SHUTDOWN" "$ARG3$"
    ADDWIDGET "CALL" "Autoload File System Drivers OFF" "SET ^"BM.AUTOLOAD_FSD_EN^" ^"0^"" "$ARG0$" "RUN_COMP_MODE" "AUTOLOADFSD0" "$ARG3$"
    ADDWIDGET "LABEL" ""
    ADDWIDGET "CALL" "Advanced Boot Mode Choices..." "Typically used for Discs/More Problematic Homebrew" "$ARG0$" "ADVANCED_BOOT" "$ARG2$" "$ARG3$"
    RETURN 0

:ADVANCED_BOOT
    CLEARWIDGETS
    SETTITLE "$ARG2$ advanced compatibily options:"
    ADDWIDGET "LABEL" " from"
    ADDWIDGET "LABEL" "$PWD$"
    ADDWIDGET "CALL" "CC Sleep Mode (BIOS Patch OFF / Shutdown ALL)" "SETBIOS ^"OFF^" and SHUTDOWN ^"ALL^"" "$ARG0$" "RUN_COMP_MODE" "SLEEP1" "$ARG3$"
    ADDWIDGET "CALL" "CC Sleep Mode (BIOS Patch OFF / Shutdown MM)" "SETBIOS ^"OFF^" and SHUTDOWN ^"MM^"" "$ARG0$" "RUN_COMP_MODE" "SLEEP2" "$ARG3$"
    ADDWIDGET "CALL" "CC Sleep Mode (BIOS Patch OFF / AutoLoad FSD Off)" "SETBIOS ^"OFF^" and SET ^"BM.AUTOLOAD_FSD_EN^" ^"0^"" "$ARG0$" "RUN_COMP_MODE" "SLEEP3" "$ARG3$"
    ADDWIDGET "LABEL" ""
    ADDWIDGET "CALL" "CC Sleep Mode (BIOS Patch PS2 / Shutdown ALL)" "SETBIOS ^"PS2^" and SHUTDOWN ^"ALL^"" "$ARG0$" "RUN_COMP_MODE" "SLEEP4" "$ARG3$"
    ADDWIDGET "CALL" "CC Sleep Mode (BIOS Patch PS2 / Shutdown MM)" "SETBIOS ^"PS2^" and SHUTDOWN ^"MM^"" "$ARG0$" "RUN_COMP_MODE" "SLEEP5" "$ARG3$"
    ADDWIDGET "CALL" "CC Sleep Mode (BIOS Patch PS2 / AutoLoad FSD Off)" "SETBIOS ^"PS2^" and SET ^"BM.AUTOLOAD_FSD_EN^" ^"0^"" "$ARG0$" "RUN_COMP_MODE" "SLEEP6" "$ARG3$"
    RETURN 0
    
:RUN_COMP_MODE
    IF MATCHES "NONE" "$ARG2$" 
        ECHO ENHANCED MODE, nothing disabled
    ELSEIF MATCHES "SHUTDOWN" "$ARG2$"
        ECHO SHUTDOWN "MM"
        SHUTDOWN "MM"
    ELSEIF MATCHES "AUTOLOADFSD0" "$ARG2$"
        ECHO SET "BM.AUTOLOAD_FSD_EN" "0"
        SET "BM.AUTOLOAD_FSD_EN" "0"

    ELSEIF MATCHES "SLEEP1" "$ARG2$"
        ECHO SETBIOS "OFF", SHUTDOWN "ALL"
        SETBIOS "OFF"
        SHUTDOWN "ALL"
    ELSEIF MATCHES "SLEEP2" "$ARG2$"
        ECHO SETBIOS "OFF" , SHUTDOWN "MM"
        SETBIOS "OFF"
        SHUTDOWN "MM"
    ELSEIF MATCHES "SLEEP3" "$ARG2$"
        # At least boots PS2BBL Chainloader to osdmenu.elf, no run apps?
        # osdmenu.elf boots...but also does not run apps
        ECHO SETBIOS "OFF", SET BM.AUTOLOAD_FSD_EN 0
        SETBIOS "OFF"
        SET "BM.AUTOLOAD_FSD_EN" "0"

    ELSEIF MATCHES "SLEEP4" "$ARG2$"
        ECHO SETBIOS "OFF", SHUTDOWN "ALL"
        SETBIOS "PS2"
        SHUTDOWN "ALL"
    ELSEIF MATCHES "SLEEP5" "$ARG2$"
        ECHO SETBIOS "PS2" , SHUTDOWN "MM"
        SETBIOS "PS2"
        SHUTDOWN "MM"
    ELSEIF MATCHES "SLEEP6" "$ARG2$"
        ECHO SETBIOS "PS2", SET BM.AUTOLOAD_FSD_EN 0
        SETBIOS "PS2"
        SET "BM.AUTOLOAD_FSD_EN" "0"
    ENDIF

    ECHO LOADEXEC "PBAT" "$BM.SCRIPTS$/LOADEXEC.PBT" "$ARG3$"
    LOADEXEC "PBAT" "$BM.SCRIPTS$/LOADEXEC.PBT" "$ARG3$"
    EXIT 0
