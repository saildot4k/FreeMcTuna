EE_BIN = Installer.elf
EE_BIN_PACKED = OPENTUNAtoPS2BBL-INSTALLER.ELF
EE_BIN_STRIPPED = stripped.elf
EE_OBJS = main.o gs.o pad.o  gs_asm.o ps2_asm.o dma_asm.o
EE_OBJS += restartdel_icn.o restarticon_sys.o restartlist_icn.o restart_elf.o powerdel_icn.o powericon_sys.o powerlist_icn.o poweroff_elf.o apps_icn.o appsdel_icn.o appsicon_sys.o  \
	esr_elf.o boot2_elf.o boot_elf.o icon_sys.o copy_icn.o del_icn.o boot_icn.o appinfo_pbt.o whatisbootx_txt.o OpenTuna_sys.o OpenTuna_SLIMS.o OpenTuna_FAT-170.o \
	OpenTuna_FAT-110-120-150-160.o PADMAN_irx.o SIO2MAN_irx.o MCMAN_irx.o MCSERV_irx.o \
	sysconffreemcb_cnf.o sysconfipconfig_dat.o \
	sysconflaunchelf_cnf.o sysconfps2bbl_ini.o sysconfusbd_irx.o sysconfusbhdfsd_irx.o sysconfcopy_icn.o sysconfdel_icn.o sysconfendvdpl_irx.o sysconficon_sys.o \
	sysconfsysconf_icn.o sysconfappinfo_pbt.o sysconfpsxbbl_ini.o sysconfosdmenu_cnf.o \
	sys_osdmenu_appinfo_pbt.o sys_osdmenu_copy_icn.o sys_osdmenu_del_icn.o sys_osdmenu_icon_sys.o sys_osdmenu_list_icn.o sys_osdmenu_osdmenu_elf.o sys_osdmenu_title_cfg.o
EE_SRC = restartdel_icn.s restarticon_sys.s restartlist_icn.s restart_elf.s powerdel_icn.s powericon_sys.s powerlist_icn.s poweroff_elf.s \
	apps_icn.s appsdel_icn.s appsicon_sys.s esr_elf.s boot2_elf.s boot_elf.s icon_sys.s copy_icn.s del_icn.s \
	boot_icn.s appinfo_pbt.s whatisbootx_txt.s OpenTuna_sys.s OpenTuna_SLIMS.s OpenTuna_FAT-170.s OpenTuna_FAT-110-120-150-160.s \
	PADMAN_irx.c SIO2MAN_irx.c MCMAN_irx.c MCSERV_irx.c \
	sysconffreemcb_cnf.s sysconfipconfig_dat.s sysconflaunchelf_cnf.s sysconfps2bbl_ini.s \
	sysconfusbd_irx.s sysconfusbhdfsd_irx.s sysconfcopy_icn.s sysconfdel_icn.s sysconfendvdpl_irx.s sysconficon_sys.s sysconfsysconf_icn.s sysconfappinfo_pbt.s sysconfpsxbbl_ini.s sysconfosdmenu_cnf.s \
	sys_osdmenu_appinfo_pbt.s sys_osdmenu_copy_icn.s sys_osdmenu_del_icn.s sys_osdmenu_icon_sys.s sys_osdmenu_list_icn.s sys_osdmenu_osdmenu_elf.s sys_osdmenu_title_cfg.s
EE_LIBS = -ldebug -lcdvd -lpatches -lpadx -lmc

all:
	$(MAKE) $(EE_BIN_PACKED)
# RESTART assets
restartdel_icn.s:
	bin2s INSTALL/RESTART/DEL.ICN restartdel_icn.s restartdel_icn

restarticon_sys.s:
	bin2s INSTALL/RESTART/ICON.SYS restarticon_sys.s restarticon_sys

restartlist_icn.s:
	bin2s INSTALL/RESTART/LIST.ICN restartlist_icn.s restartlist_icn

restart_elf.s:
	bin2s INSTALL/RESTART/RESTART.ELF restart_elf.s restart_elf

# POWEROFF assets
powerdel_icn.s:
	bin2s INSTALL/POWEROFF/DEL.ICN powerdel_icn.s powerdel_icn

powericon_sys.s:
	bin2s INSTALL/POWEROFF/ICON.SYS powericon_sys.s powericon_sys

powerlist_icn.s:
	bin2s INSTALL/POWEROFF/LIST.ICN powerlist_icn.s powerlist_icn

poweroff_elf.s:
	bin2s INSTALL/POWEROFF/POWEROFF.ELF poweroff_elf.s poweroff_elf

#APPS assets
apps_icn.s:
	bin2s INSTALL/APPS/APPS.ICN apps_icn.s apps_icn

appsdel_icn.s:
	bin2s INSTALL/APPS/DEL.ICN appsdel_icn.s appsdel_icn

appsicon_sys.s:
	bin2s INSTALL/APPS/ICON.SYS appsicon_sys.s appsicon_sys

# BOOT assets
esr_elf.s:
	bin2s INSTALL/BOOT/ESR.ELF esr_elf.s esr_elf

boot2_elf.s:
	bin2s INSTALL/BOOT/BOOT2.ELF boot2_elf.s boot2_elf

boot_elf.s:
	bin2s INSTALL/BOOT/BOOT.ELF boot_elf.s boot_elf

icon_sys.s:
	bin2s INSTALL/BOOT/icon.sys icon_sys.s icon_sys

copy_icn.s:
	bin2s INSTALL/BOOT/copy.icn copy_icn.s copy_icn

del_icn.s:
	bin2s INSTALL/BOOT/del.icn del_icn.s del_icn

boot_icn.s:
	bin2s INSTALL/BOOT/boot.icn boot_icn.s boot_icn

appinfo_pbt.s:
	bin2s INSTALL/BOOT/APPINFO.PBT appinfo_pbt.s appinfo_pbt

whatisbootx_txt.s:
	bin2s INSTALL/BOOT/WHATISBOOTX.TXT whatisbootx_txt.s whatisbootx_txt


# SYS-CONF assets
sysconffreemcb_cnf.s:
	bin2s INSTALL/SYS-CONF/FREEMCB.CNF sysconffreemcb_cnf.s sysconffreemcb_cnf

sysconfipconfig_dat.s:
	bin2s INSTALL/SYS-CONF/IPCONFIG.DAT sysconfipconfig_dat.s sysconfipconfig_dat

sysconflaunchelf_cnf.s:
	bin2s INSTALL/SYS-CONF/LAUNCHELF.CNF sysconflaunchelf_cnf.s sysconflaunchelf_cnf

sysconfps2bbl_ini.s:
	bin2s INSTALL/SYS-CONF/PS2BBL.INI sysconfps2bbl_ini.s sysconfps2bbl_ini

sysconfusbd_irx.s:
	bin2s INSTALL/SYS-CONF/USBD.IRX sysconfusbd_irx.s sysconfusbd_irx

sysconfusbhdfsd_irx.s:
	bin2s INSTALL/SYS-CONF/USBHDFSD.IRX sysconfusbhdfsd_irx.s sysconfusbhdfsd_irx

sysconfcopy_icn.s:
	bin2s INSTALL/SYS-CONF/COPY.ICN sysconfcopy_icn.s sysconfcopy_icn

sysconfdel_icn.s:
	bin2s INSTALL/SYS-CONF/DEL.ICN sysconfdel_icn.s sysconfdel_icn

sysconfendvdpl_irx.s:
	bin2s INSTALL/SYS-CONF/ENDVDPL.IRX sysconfendvdpl_irx.s sysconfendvdpl_irx

sysconficon_sys.s:
	bin2s INSTALL/SYS-CONF/ICON.SYS sysconficon_sys.s sysconficon_sys

sysconfsysconf_icn.s:
	bin2s INSTALL/SYS-CONF/SYSCONF.ICN sysconfsysconf_icn.s sysconfsysconf_icn

sysconfappinfo_pbt.s:
	bin2s INSTALL/SYS-CONF/APPINFO.PBT sysconfappinfo_pbt.s sysconfappinfo_pbt

sysconfpsxbbl_ini.s:
	bin2s INSTALL/SYS-CONF/PSXBBL.INI sysconfpsxbbl_ini.s sysconfpsxbbl_ini

sysconfosdmenu_cnf.s:
	bin2s INSTALL/SYS-CONF/OSDMENU.CNF sysconfosdmenu_cnf.s sysconfosdmenu_cnf

# SYS-OSDMENU assets
sys_osdmenu_appinfo_pbt.s:
	bin2s INSTALL/SYS_OSDMENU/APPINFO.PBT sys_osdmenu_appinfo_pbt.s sys_osdmenu_appinfo_pbt

sys_osdmenu_copy_icn.s:
	bin2s INSTALL/SYS_OSDMENU/copy.icn sys_osdmenu_copy_icn.s sys_osdmenu_copy_icn

sys_osdmenu_del_icn.s:
	bin2s INSTALL/SYS_OSDMENU/del.icn sys_osdmenu_del_icn.s sys_osdmenu_del_icn

sys_osdmenu_icon_sys.s:
	bin2s INSTALL/SYS_OSDMENU/icon.sys sys_osdmenu_icon_sys.s sys_osdmenu_icon_sys

sys_osdmenu_list_icn.s:
	bin2s INSTALL/SYS_OSDMENU/list.icn sys_osdmenu_list_icn.s sys_osdmenu_list_icn

sys_osdmenu_osdmenu_elf.s:
	bin2s INSTALL/SYS_OSDMENU/osdmenu.elf sys_osdmenu_osdmenu_elf.s sys_osdmenu_osdmenu_elf

sys_osdmenu_title_cfg.s:
	bin2s INSTALL/SYS_OSDMENU/title.cfg sys_osdmenu_title_cfg.s sys_osdmenu_title_cfg

# OPENTUNA assets
OpenTuna_sys.s:
	bin2s INSTALL/OPENTUNA/icon.sys OpenTuna_sys.s opentuna_sys

OpenTuna_SLIMS.s:
	bin2s INSTALL/OPENTUNA/OpenTuna_Slims.bin OpenTuna_SLIMS.s opentuna_slims

OpenTuna_FAT-110-120-150-160.s:
	bin2s INSTALL/OPENTUNA/OpenTuna_FAT-110-120-150-160.bin OpenTuna_FAT-110-120-150-160.s opentuna_fats

OpenTuna_FAT-170.s:
	bin2s INSTALL/OPENTUNA/OpenTuna_FAT-170.bin OpenTuna_FAT-170.s opentuna_fat170

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
