EE_BIN = Installer.elf
EE_BIN_PACKED = OPENTUNAtoPS2BBL-INSTALLER-AIO.ELF
EE_BIN_STRIPPED = stripped.elf
EE_OBJS = main.o gs.o pad.o  gs_asm.o ps2_asm.o dma_asm.o
EE_OBJS += OpenTuna_sys.o OpenTuna_SLIMS.o OpenTuna_FAT-170.o OpenTuna_FAT-110-120-150-160.o \
	MCMAN_irx.o \
	SIO2MAN_irx.o \
	MCSERV_irx.o \
	PADMAN_irx.o \
	apps_apps_icn.o \
	apps_del_icn.o \
	apps_icon_sys.o \
	app_nhddl_appinfo_pbt.o \
	app_nhddl_copy_icn.o \
	app_nhddl_del_icn.o \
	app_nhddl_icon_sys.o \
	app_nhddl_list_icn.o \
	app_nhddl_nhddl_elf.o \
	app_nhddl_nhddl_yaml.o \
	app_nhddl_title_cfg.o \
	app_opl_appinfo_pbt.o \
	app_opl_opl_elf.o \
	app_opl_copy_icn.o \
	app_opl_del_icn.o \
	app_opl_icon_sys.o \
	app_opl_list_icn.o \
	app_opl_title_cfg.o \
	opl_icon_sys.o \
	opl_list_icn.o \
	boot_appinfo_pbt.o \
	boot_boot_elf.o \
	boot_boot2_elf.o \
	boot_whatisbootx_txt.o \
	boot_boot_icn.o \
	boot_copy_icn.o \
	boot_del_icn.o \
	boot_icon_sys.o \
	neutrino_appinfo_pbt.o \
	neutrino_config_bsd_ata_toml.o \
	neutrino_config_bsd_ata_net_toml.o \
	neutrino_config_bsd_ilink_toml.o \
	neutrino_config_bsd_mmce_toml.o \
	neutrino_config_bsd_mx4sio_toml.o \
	neutrino_config_bsd_udpbd_hdd_toml.o \
	neutrino_config_bsd_udpbd_toml.o \
	neutrino_config_bsd_udpfs_hdd_toml.o \
	neutrino_config_bsd_udpfs_toml.o \
	neutrino_config_bsd_usb_debug_toml.o \
	neutrino_config_bsd_usb_toml.o \
	neutrino_config_bsdfs_bd_toml.o \
	neutrino_config_bsdfs_exfat_toml.o \
	neutrino_config_bsdfs_hdl_toml.o \
	neutrino_config_compat_toml.o \
	neutrino_config_emu_ata_file_toml.o \
	neutrino_config_emu_dvd_esr_toml.o \
	neutrino_config_emu_dvd_file_toml.o \
	neutrino_config_emu_mc_file_toml.o \
	neutrino_config_i_bdm_toml.o \
	neutrino_config_i_dev9_hidden_toml.o \
	neutrino_config_i_dev9_ns_toml.o \
	neutrino_config_p_freemem_toml.o \
	neutrino_config_p_membo_toml.o \
	neutrino_config_p_membo2k_toml.o \
	neutrino_config_p_steeldr_toml.o \
	neutrino_config_p_uya_toml.o \
	neutrino_config_system_toml.o \
	neutrino_del_icn.o \
	neutrino_icon_sys.o \
	neutrino_list_icn.o \
	neutrino_modules_ieee1394_bd_mini_irx.o \
	neutrino_modules_ata_bd_irx.o \
	neutrino_modules_atad_emu_irx.o \
	neutrino_modules_bdfs_irx.o \
	neutrino_modules_bdm_irx.o \
	neutrino_modules_bdmfs_fatfs_irx.o \
	neutrino_modules_cdvdfsv_irx.o \
	neutrino_modules_cdvdman_emu_irx.o \
	neutrino_modules_cdvdman_esr1_irx.o \
	neutrino_modules_cdvdman_esr2_irx.o \
	neutrino_modules_dev9_hidden_irx.o \
	neutrino_modules_dev9_ns_irx.o \
	neutrino_modules_ee_core_elf.o \
	neutrino_modules_eesync_irx.o \
	neutrino_modules_fakemod_irx.o \
	neutrino_modules_fhi_bd_irx.o \
	neutrino_modules_filexio_irx.o \
	neutrino_modules_hdlfs_irx.o \
	neutrino_modules_ilinkman_irx.o \
	neutrino_modules_imgdrv_irx.o \
	neutrino_modules_iomanx_irx.o \
	neutrino_modules_mc_emu_irx.o \
	neutrino_modules_ministack_irx.o \
	neutrino_modules_mmcefhi_irx.o \
	neutrino_modules_mmceman_irx.o \
	neutrino_modules_mx4sio_bd_mini_irx.o \
	neutrino_modules_patch_freemem_irx.o \
	neutrino_modules_patch_membo_irx.o \
	neutrino_modules_patch_rc_uya_irx.o \
	neutrino_modules_ps2hdd_bdm_irx.o \
	neutrino_modules_smap_irx.o \
	neutrino_modules_udnl_t300_irx.o \
	neutrino_modules_udnl_irx.o \
	neutrino_modules_udpbd_irx.o \
	neutrino_modules_udpfs_bd_irx.o \
	neutrino_modules_udpfs_fhi_irx.o \
	neutrino_modules_udpfs_ioman_irx.o \
	neutrino_modules_usbd_mini_irx.o \
	neutrino_modules_usbmass_bd_mini_irx.o \
	neutrino_neutrino_elf.o \
	neutrino_nhddl_elf.o \
	neutrino_title_cfg.o \
	neutrino_version_txt.o \
	poweroff_poweroff_elf.o \
	poweroff_del_icn.o \
	poweroff_icon_sys.o \
	poweroff_list_icn.o \
	restart_restart_elf.o \
	restart_del_icn.o \
	restart_icon_sys.o \
	restart_list_icn.o \
	sys_conf_appinfo_pbt.o \
	sys_conf_freemcb_cnf.o \
	sys_conf_ipconfig_dat.o \
	sys_conf_launchelf_cnf.o \
	sys_conf_osdmenu_cnf.o \
	sys_conf_ps2bbl_ini.o \
	sys_conf_psxbbl_ini.o \
	sys_conf_usbd_irx.o \
	sys_conf_usbhdfsd_irx.o \
	sys_conf_copy_icn.o \
	sys_conf_del_icn.o \
	sys_conf_endvdpl_irx.o \
	sys_conf_icon_sys.o \
	sys_conf_list_icn.o \
	sys_osdmenu_appinfo_pbt.o \
	sys_osdmenu_copy_icn.o \
	sys_osdmenu_del_icn.o \
	sys_osdmenu_icon_sys.o \
	sys_osdmenu_list_icn.o \
	sys_osdmenu_osdmenu_elf.o \
	sys_osdmenu_title_cfg.o
EE_SRC = OpenTuna_sys.c OpenTuna_SLIMS.c OpenTuna_FAT-170.c OpenTuna_FAT-110-120-150-160.c \
	MCMAN_irx.c \
	SIO2MAN_irx.c \
	MCSERV_irx.c \
	PADMAN_irx.c \
	apps_apps_icn.c \
	apps_del_icn.c \
	apps_icon_sys.c \
	app_nhddl_appinfo_pbt.c \
	app_nhddl_copy_icn.c \
	app_nhddl_del_icn.c \
	app_nhddl_icon_sys.c \
	app_nhddl_list_icn.c \
	app_nhddl_nhddl_elf.c \
	app_nhddl_nhddl_yaml.c \
	app_nhddl_title_cfg.c \
	app_opl_appinfo_pbt.c \
	app_opl_opl_elf.c \
	app_opl_copy_icn.c \
	app_opl_del_icn.c \
	app_opl_icon_sys.c \
	app_opl_list_icn.c \
	app_opl_title_cfg.c \
	opl_icon_sys.c \
	opl_list_icn.c \
	boot_appinfo_pbt.c \
	boot_boot_elf.c \
	boot_boot2_elf.c \
	boot_whatisbootx_txt.c \
	boot_boot_icn.c \
	boot_copy_icn.c \
	boot_del_icn.c \
	boot_icon_sys.c \
	neutrino_appinfo_pbt.c \
	neutrino_config_bsd_ata_toml.c \
	neutrino_config_bsd_ata_net_toml.c \
	neutrino_config_bsd_ilink_toml.c \
	neutrino_config_bsd_mmce_toml.c \
	neutrino_config_bsd_mx4sio_toml.c \
	neutrino_config_bsd_udpbd_hdd_toml.c \
	neutrino_config_bsd_udpbd_toml.c \
	neutrino_config_bsd_udpfs_hdd_toml.c \
	neutrino_config_bsd_udpfs_toml.c \
	neutrino_config_bsd_usb_debug_toml.c \
	neutrino_config_bsd_usb_toml.c \
	neutrino_config_bsdfs_bd_toml.c \
	neutrino_config_bsdfs_exfat_toml.c \
	neutrino_config_bsdfs_hdl_toml.c \
	neutrino_config_compat_toml.c \
	neutrino_config_emu_ata_file_toml.c \
	neutrino_config_emu_dvd_esr_toml.c \
	neutrino_config_emu_dvd_file_toml.c \
	neutrino_config_emu_mc_file_toml.c \
	neutrino_config_i_bdm_toml.c \
	neutrino_config_i_dev9_hidden_toml.c \
	neutrino_config_i_dev9_ns_toml.c \
	neutrino_config_p_freemem_toml.c \
	neutrino_config_p_membo_toml.c \
	neutrino_config_p_membo2k_toml.c \
	neutrino_config_p_steeldr_toml.c \
	neutrino_config_p_uya_toml.c \
	neutrino_config_system_toml.c \
	neutrino_del_icn.c \
	neutrino_icon_sys.c \
	neutrino_list_icn.c \
	neutrino_modules_ieee1394_bd_mini_irx.c \
	neutrino_modules_ata_bd_irx.c \
	neutrino_modules_atad_emu_irx.c \
	neutrino_modules_bdfs_irx.c \
	neutrino_modules_bdm_irx.c \
	neutrino_modules_bdmfs_fatfs_irx.c \
	neutrino_modules_cdvdfsv_irx.c \
	neutrino_modules_cdvdman_emu_irx.c \
	neutrino_modules_cdvdman_esr1_irx.c \
	neutrino_modules_cdvdman_esr2_irx.c \
	neutrino_modules_dev9_hidden_irx.c \
	neutrino_modules_dev9_ns_irx.c \
	neutrino_modules_ee_core_elf.c \
	neutrino_modules_eesync_irx.c \
	neutrino_modules_fakemod_irx.c \
	neutrino_modules_fhi_bd_irx.c \
	neutrino_modules_filexio_irx.c \
	neutrino_modules_hdlfs_irx.c \
	neutrino_modules_ilinkman_irx.c \
	neutrino_modules_imgdrv_irx.c \
	neutrino_modules_iomanx_irx.c \
	neutrino_modules_mc_emu_irx.c \
	neutrino_modules_ministack_irx.c \
	neutrino_modules_mmcefhi_irx.c \
	neutrino_modules_mmceman_irx.c \
	neutrino_modules_mx4sio_bd_mini_irx.c \
	neutrino_modules_patch_freemem_irx.c \
	neutrino_modules_patch_membo_irx.c \
	neutrino_modules_patch_rc_uya_irx.c \
	neutrino_modules_ps2hdd_bdm_irx.c \
	neutrino_modules_smap_irx.c \
	neutrino_modules_udnl_t300_irx.c \
	neutrino_modules_udnl_irx.c \
	neutrino_modules_udpbd_irx.c \
	neutrino_modules_udpfs_bd_irx.c \
	neutrino_modules_udpfs_fhi_irx.c \
	neutrino_modules_udpfs_ioman_irx.c \
	neutrino_modules_usbd_mini_irx.c \
	neutrino_modules_usbmass_bd_mini_irx.c \
	neutrino_neutrino_elf.c \
	neutrino_nhddl_elf.c \
	neutrino_title_cfg.c \
	neutrino_version_txt.c \
	poweroff_poweroff_elf.c \
	poweroff_del_icn.c \
	poweroff_icon_sys.c \
	poweroff_list_icn.c \
	restart_restart_elf.c \
	restart_del_icn.c \
	restart_icon_sys.c \
	restart_list_icn.c \
	sys_conf_appinfo_pbt.c \
	sys_conf_freemcb_cnf.c \
	sys_conf_ipconfig_dat.c \
	sys_conf_launchelf_cnf.c \
	sys_conf_osdmenu_cnf.c \
	sys_conf_ps2bbl_ini.c \
	sys_conf_psxbbl_ini.c \
	sys_conf_usbd_irx.c \
	sys_conf_usbhdfsd_irx.c \
	sys_conf_copy_icn.c \
	sys_conf_del_icn.c \
	sys_conf_endvdpl_irx.c \
	sys_conf_icon_sys.c \
	sys_conf_list_icn.c \
	sys_osdmenu_appinfo_pbt.c \
	sys_osdmenu_copy_icn.c \
	sys_osdmenu_del_icn.c \
	sys_osdmenu_icon_sys.c \
	sys_osdmenu_list_icn.c \
	sys_osdmenu_osdmenu_elf.c \
	sys_osdmenu_title_cfg.c
	
EE_LIBS = -ldebug -lcdvd -lpatches -lpadx -lmc

all:
	$(MAKE) $(EE_BIN_PACKED)

# OPENTUNA assets
OpenTuna_sys.c:
	bin2c INSTALL/OPENTUNA/icon.sys OpenTuna_sys.c opentuna_sys

OpenTuna_SLIMS.c:
	bin2c INSTALL/OPENTUNA/OpenTuna_Slims.bin OpenTuna_SLIMS.c opentuna_slims

OpenTuna_FAT-110-120-150-160.c:
	bin2c INSTALL/OPENTUNA/OpenTuna_FAT-110-120-150-160.bin OpenTuna_FAT-110-120-150-160.c opentuna_fats

OpenTuna_FAT-170.c:
	bin2c INSTALL/OPENTUNA/OpenTuna_FAT-170.bin OpenTuna_FAT-170.c opentuna_fat170

# Auto-generated bin2c rules from INSTALL
# APPS
apps_apps_icn.c:
	bin2c INSTALL/APPS/APPS.ICN apps_apps_icn.c apps_apps_icn

apps_del_icn.c:
	bin2c INSTALL/APPS/DEL.ICN apps_del_icn.c apps_del_icn

apps_icon_sys.c:
	bin2c INSTALL/APPS/ICON.SYS apps_icon_sys.c apps_icon_sys

# APP_NHDDL
app_nhddl_appinfo_pbt.c:
	bin2c INSTALL/APP_NHDDL/APPINFO.PBT app_nhddl_appinfo_pbt.c app_nhddl_appinfo_pbt

app_nhddl_copy_icn.c:
	bin2c INSTALL/APP_NHDDL/copy.icn app_nhddl_copy_icn.c app_nhddl_copy_icn

app_nhddl_del_icn.c:
	bin2c INSTALL/APP_NHDDL/del.icn app_nhddl_del_icn.c app_nhddl_del_icn

app_nhddl_icon_sys.c:
	bin2c INSTALL/APP_NHDDL/icon.sys app_nhddl_icon_sys.c app_nhddl_icon_sys

app_nhddl_list_icn.c:
	bin2c INSTALL/APP_NHDDL/list.icn app_nhddl_list_icn.c app_nhddl_list_icn

app_nhddl_nhddl_elf.c:
	bin2c INSTALL/APP_NHDDL/nhddl.elf app_nhddl_nhddl_elf.c app_nhddl_nhddl_elf

app_nhddl_nhddl_yaml.c:
	bin2c INSTALL/APP_NHDDL/nhddl.yaml app_nhddl_nhddl_yaml.c app_nhddl_nhddl_yaml

app_nhddl_title_cfg.c:
	bin2c INSTALL/APP_NHDDL/title.cfg app_nhddl_title_cfg.c app_nhddl_title_cfg

# APP_OPL
app_opl_appinfo_pbt.c:
	bin2c INSTALL/APP_OPL/APPINFO.PBT app_opl_appinfo_pbt.c app_opl_appinfo_pbt

app_opl_opl_elf.c:
	bin2c INSTALL/APP_OPL/OPL.ELF app_opl_opl_elf.c app_opl_opl_elf

app_opl_copy_icn.c:
	bin2c INSTALL/APP_OPL/copy.icn app_opl_copy_icn.c app_opl_copy_icn

app_opl_del_icn.c:
	bin2c INSTALL/APP_OPL/del.icn app_opl_del_icn.c app_opl_del_icn

app_opl_icon_sys.c:
	bin2c INSTALL/APP_OPL/icon.sys app_opl_icon_sys.c app_opl_icon_sys

app_opl_list_icn.c:
	bin2c INSTALL/APP_OPL/list.icn app_opl_list_icn.c app_opl_list_icn

app_opl_title_cfg.c:
	bin2c INSTALL/APP_OPL/title.cfg app_opl_title_cfg.c app_opl_title_cfg

# OPL Config folder
opl_list_icn.c:
	bin2c INSTALL/OPL/list.icn opl_list_icn.c opl_list_icn

opl_icon_sys.c:
	bin2c INSTALL/OPL/icon.sys opl_icon_sys.c opl_icon_sys

# BOOT
boot_appinfo_pbt.c:
	bin2c INSTALL/BOOT/APPINFO.PBT boot_appinfo_pbt.c boot_appinfo_pbt

boot_boot_elf.c:
	bin2c INSTALL/BOOT/BOOT.ELF boot_boot_elf.c boot_boot_elf

boot_boot2_elf.c:
	bin2c INSTALL/BOOT/BOOT2.ELF boot_boot2_elf.c boot_boot2_elf

boot_whatisbootx_txt.c:
	bin2c INSTALL/BOOT/WHATISBOOTX.TXT boot_whatisbootx_txt.c boot_whatisbootx_txt

boot_boot_icn.c:
	bin2c INSTALL/BOOT/BOOT.ICN boot_boot_icn.c boot_boot_icn

boot_copy_icn.c:
	bin2c INSTALL/BOOT/COPY.ICN boot_copy_icn.c boot_copy_icn

boot_del_icn.c:
	bin2c INSTALL/BOOT/DEL.ICN boot_del_icn.c boot_del_icn

boot_icon_sys.c:
	bin2c INSTALL/BOOT/ICON.SYS boot_icon_sys.c boot_icon_sys

# NEUTRINO
neutrino_appinfo_pbt.c:
	bin2c INSTALL/NEUTRINO/APPINFO.PBT neutrino_appinfo_pbt.c neutrino_appinfo_pbt

neutrino_config_bsd_ata_toml.c:
	bin2c INSTALL/NEUTRINO/config/bsd-ata.toml neutrino_config_bsd_ata_toml.c neutrino_config_bsd_ata_toml

neutrino_config_bsd_ata_net_toml.c:
	bin2c INSTALL/NEUTRINO/config/bsd-ata-net.toml neutrino_config_bsd_ata_net_toml.c neutrino_config_bsd_ata_net_toml

neutrino_config_bsd_ilink_toml.c:
	bin2c INSTALL/NEUTRINO/config/bsd-ilink.toml neutrino_config_bsd_ilink_toml.c neutrino_config_bsd_ilink_toml

neutrino_config_bsd_mmce_toml.c:
	bin2c INSTALL/NEUTRINO/config/bsd-mmce.toml neutrino_config_bsd_mmce_toml.c neutrino_config_bsd_mmce_toml

neutrino_config_bsd_mx4sio_toml.c:
	bin2c INSTALL/NEUTRINO/config/bsd-mx4sio.toml neutrino_config_bsd_mx4sio_toml.c neutrino_config_bsd_mx4sio_toml

neutrino_config_bsd_udpbd_hdd_toml.c:
	bin2c INSTALL/NEUTRINO/config/bsd-udpbd-hdd.toml neutrino_config_bsd_udpbd_hdd_toml.c neutrino_config_bsd_udpbd_hdd_toml

neutrino_config_bsd_udpbd_toml.c:
	bin2c INSTALL/NEUTRINO/config/bsd-udpbd.toml neutrino_config_bsd_udpbd_toml.c neutrino_config_bsd_udpbd_toml

neutrino_config_bsd_udpfs_hdd_toml.c:
	bin2c INSTALL/NEUTRINO/config/bsd-udpfs-hdd.toml neutrino_config_bsd_udpfs_hdd_toml.c neutrino_config_bsd_udpfs_hdd_toml

neutrino_config_bsd_udpfs_toml.c:
	bin2c INSTALL/NEUTRINO/config/bsd-udpfs.toml neutrino_config_bsd_udpfs_toml.c neutrino_config_bsd_udpfs_toml

neutrino_config_bsd_usb_debug_toml.c:
	bin2c INSTALL/NEUTRINO/config/bsd-usb-debug.toml neutrino_config_bsd_usb_debug_toml.c neutrino_config_bsd_usb_debug_toml

neutrino_config_bsd_usb_toml.c:
	bin2c INSTALL/NEUTRINO/config/bsd-usb.toml neutrino_config_bsd_usb_toml.c neutrino_config_bsd_usb_toml

neutrino_config_bsdfs_bd_toml.c:
	bin2c INSTALL/NEUTRINO/config/bsdfs-bd.toml neutrino_config_bsdfs_bd_toml.c neutrino_config_bsdfs_bd_toml

neutrino_config_bsdfs_exfat_toml.c:
	bin2c INSTALL/NEUTRINO/config/bsdfs-exfat.toml neutrino_config_bsdfs_exfat_toml.c neutrino_config_bsdfs_exfat_toml

neutrino_config_bsdfs_hdl_toml.c:
	bin2c INSTALL/NEUTRINO/config/bsdfs-hdl.toml neutrino_config_bsdfs_hdl_toml.c neutrino_config_bsdfs_hdl_toml

neutrino_config_compat_toml.c:
	bin2c INSTALL/NEUTRINO/config/compat.toml neutrino_config_compat_toml.c neutrino_config_compat_toml

neutrino_config_emu_ata_file_toml.c:
	bin2c INSTALL/NEUTRINO/config/emu-ata-file.toml neutrino_config_emu_ata_file_toml.c neutrino_config_emu_ata_file_toml

neutrino_config_emu_dvd_esr_toml.c:
	bin2c INSTALL/NEUTRINO/config/emu-dvd-esr.toml neutrino_config_emu_dvd_esr_toml.c neutrino_config_emu_dvd_esr_toml

neutrino_config_emu_dvd_file_toml.c:
	bin2c INSTALL/NEUTRINO/config/emu-dvd-file.toml neutrino_config_emu_dvd_file_toml.c neutrino_config_emu_dvd_file_toml

neutrino_config_emu_mc_file_toml.c:
	bin2c INSTALL/NEUTRINO/config/emu-mc-file.toml neutrino_config_emu_mc_file_toml.c neutrino_config_emu_mc_file_toml

neutrino_config_i_bdm_toml.c:
	bin2c INSTALL/NEUTRINO/config/i_bdm.toml neutrino_config_i_bdm_toml.c neutrino_config_i_bdm_toml

neutrino_config_i_dev9_hidden_toml.c:
	bin2c INSTALL/NEUTRINO/config/i_dev9_hidden.toml neutrino_config_i_dev9_hidden_toml.c neutrino_config_i_dev9_hidden_toml

neutrino_config_i_dev9_ns_toml.c:
	bin2c INSTALL/NEUTRINO/config/i_dev9_ns.toml neutrino_config_i_dev9_ns_toml.c neutrino_config_i_dev9_ns_toml

neutrino_config_p_freemem_toml.c:
	bin2c INSTALL/NEUTRINO/config/p-freemem.toml neutrino_config_p_freemem_toml.c neutrino_config_p_freemem_toml

neutrino_config_p_membo_toml.c:
	bin2c INSTALL/NEUTRINO/config/p-membo.toml neutrino_config_p_membo_toml.c neutrino_config_p_membo_toml

neutrino_config_p_membo2k_toml.c:
	bin2c INSTALL/NEUTRINO/config/p-membo2k.toml neutrino_config_p_membo2k_toml.c neutrino_config_p_membo2k_toml

neutrino_config_p_steeldr_toml.c:
	bin2c INSTALL/NEUTRINO/config/p-steeldr.toml neutrino_config_p_steeldr_toml.c neutrino_config_p_steeldr_toml

neutrino_config_p_uya_toml.c:
	bin2c INSTALL/NEUTRINO/config/p-uya.toml neutrino_config_p_uya_toml.c neutrino_config_p_uya_toml

neutrino_config_system_toml.c:
	bin2c INSTALL/NEUTRINO/config/system.toml neutrino_config_system_toml.c neutrino_config_system_toml

neutrino_del_icn.c:
	bin2c INSTALL/NEUTRINO/del.icn neutrino_del_icn.c neutrino_del_icn

neutrino_icon_sys.c:
	bin2c INSTALL/NEUTRINO/icon.sys neutrino_icon_sys.c neutrino_icon_sys

neutrino_list_icn.c:
	bin2c INSTALL/NEUTRINO/list.icn neutrino_list_icn.c neutrino_list_icn

neutrino_modules_ieee1394_bd_mini_irx.c:
	bin2c INSTALL/NEUTRINO/modules/IEEE1394_bd_mini.irx neutrino_modules_ieee1394_bd_mini_irx.c neutrino_modules_ieee1394_bd_mini_irx

neutrino_modules_ata_bd_irx.c:
	bin2c INSTALL/NEUTRINO/modules/ata_bd.irx neutrino_modules_ata_bd_irx.c neutrino_modules_ata_bd_irx

neutrino_modules_atad_emu_irx.c:
	bin2c INSTALL/NEUTRINO/modules/atad_emu.irx neutrino_modules_atad_emu_irx.c neutrino_modules_atad_emu_irx

neutrino_modules_bdfs_irx.c:
	bin2c INSTALL/NEUTRINO/modules/bdfs.irx neutrino_modules_bdfs_irx.c neutrino_modules_bdfs_irx

neutrino_modules_bdm_irx.c:
	bin2c INSTALL/NEUTRINO/modules/bdm.irx neutrino_modules_bdm_irx.c neutrino_modules_bdm_irx

neutrino_modules_bdmfs_fatfs_irx.c:
	bin2c INSTALL/NEUTRINO/modules/bdmfs_fatfs.irx neutrino_modules_bdmfs_fatfs_irx.c neutrino_modules_bdmfs_fatfs_irx

neutrino_modules_cdvdfsv_irx.c:
	bin2c INSTALL/NEUTRINO/modules/cdvdfsv.irx neutrino_modules_cdvdfsv_irx.c neutrino_modules_cdvdfsv_irx

neutrino_modules_cdvdman_emu_irx.c:
	bin2c INSTALL/NEUTRINO/modules/cdvdman_emu.irx neutrino_modules_cdvdman_emu_irx.c neutrino_modules_cdvdman_emu_irx

neutrino_modules_cdvdman_esr1_irx.c:
	bin2c INSTALL/NEUTRINO/modules/cdvdman_esr1.irx neutrino_modules_cdvdman_esr1_irx.c neutrino_modules_cdvdman_esr1_irx

neutrino_modules_cdvdman_esr2_irx.c:
	bin2c INSTALL/NEUTRINO/modules/cdvdman_esr2.irx neutrino_modules_cdvdman_esr2_irx.c neutrino_modules_cdvdman_esr2_irx

neutrino_modules_dev9_hidden_irx.c:
	bin2c INSTALL/NEUTRINO/modules/dev9_hidden.irx neutrino_modules_dev9_hidden_irx.c neutrino_modules_dev9_hidden_irx

neutrino_modules_dev9_ns_irx.c:
	bin2c INSTALL/NEUTRINO/modules/dev9_ns.irx neutrino_modules_dev9_ns_irx.c neutrino_modules_dev9_ns_irx

neutrino_modules_ee_core_elf.c:
	bin2c INSTALL/NEUTRINO/modules/ee_core.elf neutrino_modules_ee_core_elf.c neutrino_modules_ee_core_elf

neutrino_modules_eesync_irx.c:
	bin2c INSTALL/NEUTRINO/modules/eesync.irx neutrino_modules_eesync_irx.c neutrino_modules_eesync_irx

neutrino_modules_fakemod_irx.c:
	bin2c INSTALL/NEUTRINO/modules/fakemod.irx neutrino_modules_fakemod_irx.c neutrino_modules_fakemod_irx

neutrino_modules_fhi_bd_irx.c:
	bin2c INSTALL/NEUTRINO/modules/fhi_bd.irx neutrino_modules_fhi_bd_irx.c neutrino_modules_fhi_bd_irx

neutrino_modules_filexio_irx.c:
	bin2c INSTALL/NEUTRINO/modules/fileXio.irx neutrino_modules_filexio_irx.c neutrino_modules_filexio_irx

neutrino_modules_hdlfs_irx.c:
	bin2c INSTALL/NEUTRINO/modules/hdlfs.irx neutrino_modules_hdlfs_irx.c neutrino_modules_hdlfs_irx

neutrino_modules_ilinkman_irx.c:
	bin2c INSTALL/NEUTRINO/modules/iLinkman.irx neutrino_modules_ilinkman_irx.c neutrino_modules_ilinkman_irx

neutrino_modules_imgdrv_irx.c:
	bin2c INSTALL/NEUTRINO/modules/imgdrv.irx neutrino_modules_imgdrv_irx.c neutrino_modules_imgdrv_irx

neutrino_modules_iomanx_irx.c:
	bin2c INSTALL/NEUTRINO/modules/iomanX.irx neutrino_modules_iomanx_irx.c neutrino_modules_iomanx_irx

neutrino_modules_mc_emu_irx.c:
	bin2c INSTALL/NEUTRINO/modules/mc_emu.irx neutrino_modules_mc_emu_irx.c neutrino_modules_mc_emu_irx

neutrino_modules_ministack_irx.c:
	bin2c INSTALL/NEUTRINO/modules/ministack.irx neutrino_modules_ministack_irx.c neutrino_modules_ministack_irx

neutrino_modules_mmcefhi_irx.c:
	bin2c INSTALL/NEUTRINO/modules/mmcefhi.irx neutrino_modules_mmcefhi_irx.c neutrino_modules_mmcefhi_irx

neutrino_modules_mmceman_irx.c:
	bin2c INSTALL/NEUTRINO/modules/mmceman.irx neutrino_modules_mmceman_irx.c neutrino_modules_mmceman_irx

neutrino_modules_mx4sio_bd_mini_irx.c:
	bin2c INSTALL/NEUTRINO/modules/mx4sio_bd_mini.irx neutrino_modules_mx4sio_bd_mini_irx.c neutrino_modules_mx4sio_bd_mini_irx

neutrino_modules_patch_freemem_irx.c:
	bin2c INSTALL/NEUTRINO/modules/patch_freemem.irx neutrino_modules_patch_freemem_irx.c neutrino_modules_patch_freemem_irx

neutrino_modules_patch_membo_irx.c:
	bin2c INSTALL/NEUTRINO/modules/patch_membo.irx neutrino_modules_patch_membo_irx.c neutrino_modules_patch_membo_irx

neutrino_modules_patch_rc_uya_irx.c:
	bin2c INSTALL/NEUTRINO/modules/patch_rc_uya.irx neutrino_modules_patch_rc_uya_irx.c neutrino_modules_patch_rc_uya_irx

neutrino_modules_ps2hdd_bdm_irx.c:
	bin2c INSTALL/NEUTRINO/modules/ps2hdd-bdm.irx neutrino_modules_ps2hdd_bdm_irx.c neutrino_modules_ps2hdd_bdm_irx

neutrino_modules_smap_irx.c:
	bin2c INSTALL/NEUTRINO/modules/smap.irx neutrino_modules_smap_irx.c neutrino_modules_smap_irx

neutrino_modules_udnl_t300_irx.c:
	bin2c INSTALL/NEUTRINO/modules/udnl-t300.irx neutrino_modules_udnl_t300_irx.c neutrino_modules_udnl_t300_irx

neutrino_modules_udnl_irx.c:
	bin2c INSTALL/NEUTRINO/modules/udnl.irx neutrino_modules_udnl_irx.c neutrino_modules_udnl_irx

neutrino_modules_udpbd_irx.c:
	bin2c INSTALL/NEUTRINO/modules/udpbd.irx neutrino_modules_udpbd_irx.c neutrino_modules_udpbd_irx

neutrino_modules_udpfs_bd_irx.c:
	bin2c INSTALL/NEUTRINO/modules/udpfs_bd.irx neutrino_modules_udpfs_bd_irx.c neutrino_modules_udpfs_bd_irx

neutrino_modules_udpfs_fhi_irx.c:
	bin2c INSTALL/NEUTRINO/modules/udpfs_fhi.irx neutrino_modules_udpfs_fhi_irx.c neutrino_modules_udpfs_fhi_irx

neutrino_modules_udpfs_ioman_irx.c:
	bin2c INSTALL/NEUTRINO/modules/udpfs_ioman.irx neutrino_modules_udpfs_ioman_irx.c neutrino_modules_udpfs_ioman_irx

neutrino_modules_usbd_mini_irx.c:
	bin2c INSTALL/NEUTRINO/modules/usbd_mini.irx neutrino_modules_usbd_mini_irx.c neutrino_modules_usbd_mini_irx

neutrino_modules_usbmass_bd_mini_irx.c:
	bin2c INSTALL/NEUTRINO/modules/usbmass_bd_mini.irx neutrino_modules_usbmass_bd_mini_irx.c neutrino_modules_usbmass_bd_mini_irx

neutrino_neutrino_elf.c:
	bin2c INSTALL/NEUTRINO/neutrino.elf neutrino_neutrino_elf.c neutrino_neutrino_elf

neutrino_nhddl_elf.c:
	bin2c INSTALL/NEUTRINO/nhddl.elf neutrino_nhddl_elf.c neutrino_nhddl_elf

neutrino_title_cfg.c:
	bin2c INSTALL/NEUTRINO/title.cfg neutrino_title_cfg.c neutrino_title_cfg

neutrino_version_txt.c:
	bin2c INSTALL/NEUTRINO/version.txt neutrino_version_txt.c neutrino_version_txt

# POWEROFF
poweroff_poweroff_elf.c:
	bin2c INSTALL/POWEROFF/POWEROFF.ELF poweroff_poweroff_elf.c poweroff_poweroff_elf

poweroff_del_icn.c:
	bin2c INSTALL/POWEROFF/DEL.ICN poweroff_del_icn.c poweroff_del_icn

poweroff_icon_sys.c:
	bin2c INSTALL/POWEROFF/ICON.SYS poweroff_icon_sys.c poweroff_icon_sys

poweroff_list_icn.c:
	bin2c INSTALL/POWEROFF/LIST.ICN poweroff_list_icn.c poweroff_list_icn

# RESTART
restart_restart_elf.c:
	bin2c INSTALL/RESTART/RESTART.ELF restart_restart_elf.c restart_restart_elf

restart_del_icn.c:
	bin2c INSTALL/RESTART/DEL.ICN restart_del_icn.c restart_del_icn

restart_icon_sys.c:
	bin2c INSTALL/RESTART/ICON.SYS restart_icon_sys.c restart_icon_sys

restart_list_icn.c:
	bin2c INSTALL/RESTART/LIST.ICN restart_list_icn.c restart_list_icn

# SYS-OSDMENU
sys_osdmenu_appinfo_pbt.c:
	bin2c INSTALL/SYS_OSDMENU/APPINFO.PBT sys_osdmenu_appinfo_pbt.c sys_osdmenu_appinfo_pbt

sys_osdmenu_copy_icn.c:
	bin2c INSTALL/SYS_OSDMENU/COPY.ICN sys_osdmenu_copy_icn.c sys_osdmenu_copy_icn

sys_osdmenu_del_icn.c:
	bin2c INSTALL/SYS_OSDMENU/DEL.ICN sys_osdmenu_del_icn.c sys_osdmenu_del_icn

sys_osdmenu_icon_sys.c:
	bin2c INSTALL/SYS_OSDMENU/ICON.SYS sys_osdmenu_icon_sys.c sys_osdmenu_icon_sys

sys_osdmenu_list_icn.c:
	bin2c INSTALL/SYS_OSDMENU/LIST.ICN sys_osdmenu_list_icn.c sys_osdmenu_list_icn

sys_osdmenu_osdmenu_elf.c:
	bin2c INSTALL/SYS_OSDMENU/OSDMENU.ELF sys_osdmenu_osdmenu_elf.c sys_osdmenu_osdmenu_elf

sys_osdmenu_title_cfg.c:
	bin2c INSTALL/SYS_OSDMENU/TITLE.CFG sys_osdmenu_title_cfg.c sys_osdmenu_title_cfg

# SYS-CONF
sys_conf_appinfo_pbt.c:
	bin2c INSTALL/SYS-CONF/APPINFO.PBT sys_conf_appinfo_pbt.c sys_conf_appinfo_pbt

sys_conf_freemcb_cnf.c:
	bin2c INSTALL/SYS-CONF/FREEMCB.CNF sys_conf_freemcb_cnf.c sys_conf_freemcb_cnf

sys_conf_ipconfig_dat.c:
	bin2c INSTALL/SYS-CONF/IPCONFIG.DAT sys_conf_ipconfig_dat.c sys_conf_ipconfig_dat

sys_conf_launchelf_cnf.c:
	bin2c INSTALL/SYS-CONF/LAUNCHELF.CNF sys_conf_launchelf_cnf.c sys_conf_launchelf_cnf

sys_conf_osdmenu_cnf.c:
	bin2c INSTALL/SYS-CONF/OSDMENU.CNF sys_conf_osdmenu_cnf.c sys_conf_osdmenu_cnf

sys_conf_ps2bbl_ini.c:
	bin2c INSTALL/SYS-CONF/PS2BBL.INI sys_conf_ps2bbl_ini.c sys_conf_ps2bbl_ini

sys_conf_psxbbl_ini.c:
	bin2c INSTALL/SYS-CONF/PSXBBL.INI sys_conf_psxbbl_ini.c sys_conf_psxbbl_ini

sys_conf_usbd_irx.c:
	bin2c INSTALL/SYS-CONF/USBD.IRX sys_conf_usbd_irx.c sys_conf_usbd_irx

sys_conf_usbhdfsd_irx.c:
	bin2c INSTALL/SYS-CONF/USBHDFSD.IRX sys_conf_usbhdfsd_irx.c sys_conf_usbhdfsd_irx

sys_conf_copy_icn.c:
	bin2c INSTALL/SYS-CONF/COPY.ICN sys_conf_copy_icn.c sys_conf_copy_icn

sys_conf_del_icn.c:
	bin2c INSTALL/SYS-CONF/DEL.ICN sys_conf_del_icn.c sys_conf_del_icn

sys_conf_endvdpl_irx.c:
	bin2c INSTALL/SYS-CONF/ENDVDPL.IRX sys_conf_endvdpl_irx.c sys_conf_endvdpl_irx

sys_conf_icon_sys.c:
	bin2c INSTALL/SYS-CONF/ICON.SYS sys_conf_icon_sys.c sys_conf_icon_sys

sys_conf_list_icn.c:
	bin2c INSTALL/SYS-CONF/LIST.ICN sys_conf_list_icn.c sys_conf_list_icn

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
