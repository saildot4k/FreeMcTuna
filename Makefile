EE_BIN = Installer.elf
EE_BIN_PACKED = OPENTUNAtoPS2BBL-BAREBONES.ELF
EE_BIN_STRIPPED = stripped.elf
EE_OBJS = main.o gs.o pad.o  gs_asm.o ps2_asm.o dma_asm.o
EE_OBJS += restartdel_icn.o restarticon_sys.o restartlist_icn.o restart_elf.o powerdel_icn.o powericon_sys.o powerlist_icn.o poweroff_elf.o apps_icn.o appsdel_icn.o appsicon_sys.o  \
	boot2_elf.o boot_elf.o icon_sys.o copy_icn.o del_icn.o boot_icn.o appinfo_pbt.o whatisbootx_txt.o OpenTuna_sys.o OpenTuna_SLIMS.o OpenTuna_FAT-170.o \
	OpenTuna_FAT-110-120-150-160.o PADMAN_irx.o SIO2MAN_irx.o MCMAN_irx.o MCSERV_irx.o \
	sysconffreemcb_cnf.o sysconfipconfig_dat.o \
	sysconflaunchelf_cnf.o sysconfps2bbl_ini.o sysconfusbd_irx.o sysconfusbhdfsd_irx.o sysconfcopy_icn.o sysconfdel_icn.o sysconfendvdpl_irx.o sysconficon_sys.o \
	sysconflist_icn.o sysconfappinfo_pbt.o sysconfpsxbbl_ini.o sysconfosdmenu_cnf.o \
	sys_osdmenu_appinfo_pbt.o sys_osdmenu_copy_icn.o sys_osdmenu_del_icn.o sys_osdmenu_icon_sys.o sys_osdmenu_list_icn.o sys_osdmenu_osdmenu_elf.o sys_osdmenu_title_cfg.o
EE_SRC = restartdel_icn.c restarticon_sys.c restartlist_icn.c restart_elf.c powerdel_icn.c powericon_sys.c powerlist_icn.c poweroff_elf.c \
	apps_icn.c appsdel_icn.c appsicon_sys.c boot2_elf.c boot_elf.c icon_sys.c copy_icn.c del_icn.c \
	boot_icn.c appinfo_pbt.c whatisbootx_txt.c OpenTuna_sys.c OpenTuna_SLIMS.c OpenTuna_FAT-170.c OpenTuna_FAT-110-120-150-160.c \
	PADMAN_irx.c SIO2MAN_irx.c MCMAN_irx.c MCSERV_irx.c \
	sysconffreemcb_cnf.c sysconfipconfig_dat.c sysconflaunchelf_cnf.c sysconfps2bbl_ini.c \
	sysconfusbd_irx.c sysconfusbhdfsd_irx.c sysconfcopy_icn.c sysconfdel_icn.c sysconfendvdpl_irx.c sysconficon_sys.c sysconflist_icn.c sysconfappinfo_pbt.c sysconfpsxbbl_ini.c sysconfosdmenu_cnf.c \
	sys_osdmenu_appinfo_pbt.c sys_osdmenu_copy_icn.c sys_osdmenu_del_icn.c sys_osdmenu_icon_sys.c sys_osdmenu_list_icn.c sys_osdmenu_osdmenu_elf.c sys_osdmenu_title_cfg.c
EE_LIBS = -ldebug -lcdvd -lpatches -lpadx -lmc

all:
	$(MAKE) $(EE_BIN_PACKED)
# RESTART assets
restartdel_icn.c:
	bin2c INSTALL/RESTART/DEL.ICN restartdel_icn.c restartdel_icn

restarticon_sys.c:
	bin2c INSTALL/RESTART/ICON.SYS restarticon_sys.c restarticon_sys

restartlist_icn.c:
	bin2c INSTALL/RESTART/LIST.ICN restartlist_icn.c restartlist_icn

restart_elf.c:
	bin2c INSTALL/RESTART/RESTART.ELF restart_elf.c restart_elf

# POWEROFF assets
powerdel_icn.c:
	bin2c INSTALL/POWEROFF/DEL.ICN powerdel_icn.c powerdel_icn

powericon_sys.c:
	bin2c INSTALL/POWEROFF/ICON.SYS powericon_sys.c powericon_sys

powerlist_icn.c:
	bin2c INSTALL/POWEROFF/LIST.ICN powerlist_icn.c powerlist_icn

poweroff_elf.c:
	bin2c INSTALL/POWEROFF/POWEROFF.ELF poweroff_elf.c poweroff_elf

#APPS assets
apps_icn.c:
	bin2c INSTALL/APPS/APPS.ICN apps_icn.c apps_icn

appsdel_icn.c:
	bin2c INSTALL/APPS/DEL.ICN appsdel_icn.c appsdel_icn

appsicon_sys.c:
	bin2c INSTALL/APPS/ICON.SYS appsicon_sys.c appsicon_sys

# BOOT assets
boot2_elf.c:
	bin2c INSTALL/BOOT/BOOT2.ELF boot2_elf.c boot2_elf

boot_elf.c:
	bin2c INSTALL/BOOT/BOOT.ELF boot_elf.c boot_elf

icon_sys.c:
	bin2c INSTALL/BOOT/ICON.SYS icon_sys.c icon_sys

copy_icn.c:
	bin2c INSTALL/BOOT/COPY.ICN copy_icn.c copy_icn

del_icn.c:
	bin2c INSTALL/BOOT/DEL.ICN del_icn.c del_icn

boot_icn.c:
	bin2c INSTALL/BOOT/BOOT.ICN boot_icn.c boot_icn

appinfo_pbt.c:
	bin2c INSTALL/BOOT/APPINFO.PBT appinfo_pbt.c appinfo_pbt

whatisbootx_txt.c:
	bin2c INSTALL/BOOT/WHATISBOOTX.TXT whatisbootx_txt.c whatisbootx_txt


# SYS-CONF assets
sysconffreemcb_cnf.c:
	bin2c INSTALL/SYS-CONF/FREEMCB.CNF sysconffreemcb_cnf.c sysconffreemcb_cnf

sysconfipconfig_dat.c:
	bin2c INSTALL/SYS-CONF/IPCONFIG.DAT sysconfipconfig_dat.c sysconfipconfig_dat

sysconflaunchelf_cnf.c:
	bin2c INSTALL/SYS-CONF/LAUNCHELF.CNF sysconflaunchelf_cnf.c sysconflaunchelf_cnf

sysconfps2bbl_ini.c:
	bin2c INSTALL/SYS-CONF/PS2BBL.INI sysconfps2bbl_ini.c sysconfps2bbl_ini

sysconfusbd_irx.c:
	bin2c INSTALL/SYS-CONF/USBD.IRX sysconfusbd_irx.c sysconfusbd_irx

sysconfusbhdfsd_irx.c:
	bin2c INSTALL/SYS-CONF/USBHDFSD.IRX sysconfusbhdfsd_irx.c sysconfusbhdfsd_irx

sysconfcopy_icn.c:
	bin2c INSTALL/SYS-CONF/COPY.ICN sysconfcopy_icn.c sysconfcopy_icn

sysconfdel_icn.c:
	bin2c INSTALL/SYS-CONF/DEL.ICN sysconfdel_icn.c sysconfdel_icn

sysconfendvdpl_irx.c:
	bin2c INSTALL/SYS-CONF/ENDVDPL.IRX sysconfendvdpl_irx.c sysconfendvdpl_irx

sysconficon_sys.c:
	bin2c INSTALL/SYS-CONF/ICON.SYS sysconficon_sys.c sysconficon_sys

sysconflist_icn.c:
	bin2c INSTALL/SYS-CONF/LIST.ICN sysconflist_icn.c sysconflist_icn

sysconfappinfo_pbt.c:
	bin2c INSTALL/SYS-CONF/APPINFO.PBT sysconfappinfo_pbt.c sysconfappinfo_pbt

sysconfpsxbbl_ini.c:
	bin2c INSTALL/SYS-CONF/PSXBBL.INI sysconfpsxbbl_ini.c sysconfpsxbbl_ini

sysconfosdmenu_cnf.c:
	bin2c INSTALL/SYS-CONF/OSDMENU.CNF sysconfosdmenu_cnf.c sysconfosdmenu_cnf

# SYS-OSDMENU assets
sys_osdmenu_appinfo_pbt.c:
	bin2c INSTALL/SYS_OSDMENU/APPINFO.PBT sys_osdmenu_appinfo_pbt.c sys_osdmenu_appinfo_pbt

sys_osdmenu_copy_icn.c:
	bin2c INSTALL/SYS_OSDMENU/copy.icn sys_osdmenu_copy_icn.c sys_osdmenu_copy_icn

sys_osdmenu_del_icn.c:
	bin2c INSTALL/SYS_OSDMENU/del.icn sys_osdmenu_del_icn.c sys_osdmenu_del_icn

sys_osdmenu_icon_sys.c:
	bin2c INSTALL/SYS_OSDMENU/icon.sys sys_osdmenu_icon_sys.c sys_osdmenu_icon_sys

sys_osdmenu_list_icn.c:
	bin2c INSTALL/SYS_OSDMENU/list.icn sys_osdmenu_list_icn.c sys_osdmenu_list_icn

sys_osdmenu_osdmenu_elf.c:
	bin2c INSTALL/SYS_OSDMENU/osdmenu.elf sys_osdmenu_osdmenu_elf.c sys_osdmenu_osdmenu_elf

sys_osdmenu_title_cfg.c:
	bin2c INSTALL/SYS_OSDMENU/title.cfg sys_osdmenu_title_cfg.c sys_osdmenu_title_cfg

# OPENTUNA assets
OpenTuna_sys.c:
	bin2c INSTALL/OPENTUNA/icon.sys OpenTuna_sys.c opentuna_sys

OpenTuna_SLIMS.c:
	bin2c INSTALL/OPENTUNA/OpenTuna_Slims.bin OpenTuna_SLIMS.c opentuna_slims

OpenTuna_FAT-110-120-150-160.c:
	bin2c INSTALL/OPENTUNA/OpenTuna_FAT-110-120-150-160.bin OpenTuna_FAT-110-120-150-160.c opentuna_fats

OpenTuna_FAT-170.c:
	bin2c INSTALL/OPENTUNA/OpenTuna_FAT-170.bin OpenTuna_FAT-170.c opentuna_fat170

# OTHER
SIO2MAN_irx.c: $(PS2SDK)/iop/irx/freesio2.irx
	bin2c $(PS2SDK)/iop/irx/freesio2.irx SIO2MAN_irx.c SIO2MAN_irx

MCMAN_irx.c: $(PS2SDK)/iop/irx/mcman.irx
	bin2c $(PS2SDK)/iop/irx/mcman.irx MCMAN_irx.c MCMAN_irx

MCSERV_irx.c: $(PS2SDK)/iop/irx/mcserv.irx
	bin2c $(PS2SDK)/iop/irx/mcserv.irx MCSERV_irx.c MCSERV_irx

PADMAN_irx.c: $(PS2SDK)/iop/irx/freepad.irx
	bin2c $(PS2SDK)/iop/irx/freepad.irx PADMAN_irx.c PADMAN_irx

clean:
	rm -fr $(EE_OBJS) $(EE_BIN_PACKED) $(EE_BIN_STRIPPED) $(EE_BIN) $(EE_SRC)

$(EE_BIN_STRIPPED): $(EE_BIN)
	$(EE_STRIP) -o $@ $<

$(EE_BIN_PACKED): $(EE_BIN_STRIPPED)
	ps2-packer $< $@ > /dev/null

include $(PS2SDK)/samples/Makefile.pref
include $(PS2SDK)/samples/Makefile.eeglobal
