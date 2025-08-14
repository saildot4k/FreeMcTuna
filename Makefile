EE_BIN = Installer.elf
EE_BIN_PACKED = OPENTUNAtoPS2BBL-INSTALLER.ELF
EE_BIN_STRIPPED = stripped.elf
EE_OBJS = main.o gs.o pad.o  gs_asm.o ps2_asm.o dma_asm.o
EE_OBJS += opentuna_icon_sys.o opentuna_opentuna_slims_bin.o opentuna_opentuna_fat_170_bin.o opentuna_opentuna_fat_110_120_150_160_bin.o \
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
	boot_appinfo_pbt.o \
	boot_boot_elf.o \
	boot_boot2_elf.o \
	boot_esr_elf.o \
	boot_whatisbootx_txt.o \
	boot_boot_icn.o \
	boot_copy_icn.o \
	boot_del_icn.o \
	boot_icon_sys.o \
	boot_osdmenu_elf.o \
	neutrino_appinfo_pbt.o \
	neutrino_config_bsd_ata_toml.o \
	neutrino_config_bsd_ilink_toml.o \
	neutrino_config_bsd_mmce_toml.o \
	neutrino_config_bsd_mx4sio_toml.o \
	neutrino_config_bsd_udpbd_hdd_toml.o \
	neutrino_config_bsd_udpbd_toml.o \
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
	neutrino_modules_fhi_bd_defrag_irx.o \
	neutrino_modules_filexio_irx.o \
	neutrino_modules_hdlfs_irx.o \
	neutrino_modules_ilinkman_irx.o \
	neutrino_modules_imgdrv_irx.o \
	neutrino_modules_iomanx_irx.o \
	neutrino_modules_mc_emu_irx.o \
	neutrino_modules_mmcefhi_irx.o \
	neutrino_modules_mmceman_irx.o \
	neutrino_modules_mx4sio_bd_mini_irx.o \
	neutrino_modules_patch_membo_irx.o \
	neutrino_modules_patch_rc_uya_irx.o \
	neutrino_modules_ps2hdd_bdm_irx.o \
	neutrino_modules_smap_udpbd_irx.o \
	neutrino_modules_smap_udptty_irx.o \
	neutrino_modules_udnl_t300_irx.o \
	neutrino_modules_udnl_irx.o \
	neutrino_modules_usbd_mini_irx.o \
	neutrino_modules_usbmass_bd_mini_irx.o \
	neutrino_neutrino_elf.o \
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
	sys_conf_sysconf_icn.o
EE_SRC = oopentuna_icon_sys.s opentuna_opentuna_slims_bin.s opentuna_opentuna_fat_170_bin.s opentuna_opentuna_fat_110_120_150_160_bin.s \
	MCMAN_irx.s \
	SIO2MAN_irx.s \
	MCSERV_irx.s \
	PADMAN_irx.s \
	apps_apps_icn.s \
	apps_del_icn.s \
	apps_icon_sys.s \
	app_nhddl_appinfo_pbt.s \
	app_nhddl_copy_icn.s \
	app_nhddl_del_icn.s \
	app_nhddl_icon_sys.s \
	app_nhddl_list_icn.s \
	app_nhddl_nhddl_elf.s \
	app_nhddl_nhddl_yaml.s \
	app_nhddl_title_cfg.s \
	app_opl_appinfo_pbt.s \
	app_opl_opl_elf.s \
	app_opl_copy_icn.s \
	app_opl_del_icn.s \
	app_opl_icon_sys.s \
	app_opl_list_icn.s \
	app_opl_title_cfg.s \
	boot_appinfo_pbt.s \
	boot_boot_elf.s \
	boot_boot2_elf.s \
	boot_esr_elf.s \
	boot_whatisbootx_txt.s \
	boot_boot_icn.s \
	boot_copy_icn.s \
	boot_del_icn.s \
	boot_icon_sys.s \
	boot_osdmenu_elf.s \
	neutrino_appinfo_pbt.s \
	neutrino_config_bsd_ata_toml.s \
	neutrino_config_bsd_ilink_toml.s \
	neutrino_config_bsd_mmce_toml.s \
	neutrino_config_bsd_mx4sio_toml.s \
	neutrino_config_bsd_udpbd_hdd_toml.s \
	neutrino_config_bsd_udpbd_toml.s \
	neutrino_config_bsd_usb_debug_toml.s \
	neutrino_config_bsd_usb_toml.s \
	neutrino_config_bsdfs_bd_toml.s \
	neutrino_config_bsdfs_exfat_toml.s \
	neutrino_config_bsdfs_hdl_toml.s \
	neutrino_config_compat_toml.s \
	neutrino_config_emu_ata_file_toml.s \
	neutrino_config_emu_dvd_esr_toml.s \
	neutrino_config_emu_dvd_file_toml.s \
	neutrino_config_emu_mc_file_toml.s \
	neutrino_config_i_bdm_toml.s \
	neutrino_config_i_dev9_hidden_toml.s \
	neutrino_config_i_dev9_ns_toml.s \
	neutrino_config_p_membo_toml.s \
	neutrino_config_p_membo2k_toml.s \
	neutrino_config_p_steeldr_toml.s \
	neutrino_config_p_uya_toml.s \
	neutrino_config_system_toml.s \
	neutrino_del_icn.s \
	neutrino_icon_sys.s \
	neutrino_list_icn.s \
	neutrino_modules_ieee1394_bd_mini_irx.s \
	neutrino_modules_ata_bd_irx.s \
	neutrino_modules_atad_emu_irx.s \
	neutrino_modules_bdfs_irx.s \
	neutrino_modules_bdm_irx.s \
	neutrino_modules_bdmfs_fatfs_irx.s \
	neutrino_modules_cdvdfsv_irx.s \
	neutrino_modules_cdvdman_emu_irx.s \
	neutrino_modules_cdvdman_esr1_irx.s \
	neutrino_modules_cdvdman_esr2_irx.s \
	neutrino_modules_dev9_hidden_irx.s \
	neutrino_modules_dev9_ns_irx.s \
	neutrino_modules_ee_core_elf.s \
	neutrino_modules_eesync_irx.s \
	neutrino_modules_fakemod_irx.s \
	neutrino_modules_fhi_bd_irx.s \
	neutrino_modules_fhi_bd_defrag_irx.s \
	neutrino_modules_filexio_irx.s \
	neutrino_modules_hdlfs_irx.s \
	neutrino_modules_ilinkman_irx.s \
	neutrino_modules_imgdrv_irx.s \
	neutrino_modules_iomanx_irx.s \
	neutrino_modules_mc_emu_irx.s \
	neutrino_modules_mmcefhi_irx.s \
	neutrino_modules_mmceman_irx.s \
	neutrino_modules_mx4sio_bd_mini_irx.s \
	neutrino_modules_patch_membo_irx.s \
	neutrino_modules_patch_rc_uya_irx.s \
	neutrino_modules_ps2hdd_bdm_irx.s \
	neutrino_modules_smap_udpbd_irx.s \
	neutrino_modules_smap_udptty_irx.s \
	neutrino_modules_udnl_t300_irx.s \
	neutrino_modules_udnl_irx.s \
	neutrino_modules_usbd_mini_irx.s \
	neutrino_modules_usbmass_bd_mini_irx.s \
	neutrino_neutrino_elf.s \
	neutrino_title_cfg.s \
	neutrino_version_txt.s \
	poweroff_poweroff_elf.s \
	poweroff_del_icn.s \
	poweroff_icon_sys.s \
	poweroff_list_icn.s \
	restart_restart_elf.s \
	restart_del_icn.s \
	restart_icon_sys.s \
	restart_list_icn.s \
	sys_conf_appinfo_pbt.s \
	sys_conf_freemcb_cnf.s \
	sys_conf_ipconfig_dat.s \
	sys_conf_launchelf_cnf.s \
	sys_conf_osdmenu_cnf.s \
	sys_conf_ps2bbl_ini.s \
	sys_conf_psxbbl_ini.s \
	sys_conf_usbd_irx.s \
	sys_conf_usbhdfsd_irx.s \
	sys_conf_copy_icn.s \
	sys_conf_del_icn.s \
	sys_conf_endvdpl_irx.s \
	sys_conf_icon_sys.s \
	sys_conf_sysconf_icn.s
	
EE_LIBS = -ldebug -lcdvd -lpatches -lpadx -lmc

all:
	$(MAKE) $(EE_BIN_PACKED)

# Auto-generated bin2s rules from INSTALL
apps_apps_icn.s:
	bin2s INSTALL/APPS/APPS.ICN apps_apps_icn.s apps_apps_icn

apps_del_icn.s:
	bin2s INSTALL/APPS/DEL.ICN apps_del_icn.s apps_del_icn

apps_icon_sys.s:
	bin2s INSTALL/APPS/ICON.SYS apps_icon_sys.s apps_icon_sys

app_nhddl_appinfo_pbt.s:
	bin2s INSTALL/APP_NHDDL/APPINFO.PBT app_nhddl_appinfo_pbt.s app_nhddl_appinfo_pbt

app_nhddl_copy_icn.s:
	bin2s INSTALL/APP_NHDDL/copy.icn app_nhddl_copy_icn.s app_nhddl_copy_icn

app_nhddl_del_icn.s:
	bin2s INSTALL/APP_NHDDL/del.icn app_nhddl_del_icn.s app_nhddl_del_icn

app_nhddl_icon_sys.s:
	bin2s INSTALL/APP_NHDDL/icon.sys app_nhddl_icon_sys.s app_nhddl_icon_sys

app_nhddl_list_icn.s:
	bin2s INSTALL/APP_NHDDL/list.icn app_nhddl_list_icn.s app_nhddl_list_icn

app_nhddl_nhddl_elf.s:
	bin2s INSTALL/APP_NHDDL/nhddl.elf app_nhddl_nhddl_elf.s app_nhddl_nhddl_elf

app_nhddl_nhddl_yaml.s:
	bin2s INSTALL/APP_NHDDL/nhddl.yaml app_nhddl_nhddl_yaml.s app_nhddl_nhddl_yaml

app_nhddl_title_cfg.s:
	bin2s INSTALL/APP_NHDDL/title.cfg app_nhddl_title_cfg.s app_nhddl_title_cfg

app_opl_appinfo_pbt.s:
	bin2s INSTALL/APP_OPL/APPINFO.PBT app_opl_appinfo_pbt.s app_opl_appinfo_pbt

app_opl_opl_elf.s:
	bin2s INSTALL/APP_OPL/OPL.ELF app_opl_opl_elf.s app_opl_opl_elf

app_opl_copy_icn.s:
	bin2s INSTALL/APP_OPL/copy.icn app_opl_copy_icn.s app_opl_copy_icn

app_opl_del_icn.s:
	bin2s INSTALL/APP_OPL/del.icn app_opl_del_icn.s app_opl_del_icn

app_opl_icon_sys.s:
	bin2s INSTALL/APP_OPL/icon.sys app_opl_icon_sys.s app_opl_icon_sys

app_opl_list_icn.s:
	bin2s INSTALL/APP_OPL/list.icn app_opl_list_icn.s app_opl_list_icn

app_opl_title_cfg.s:
	bin2s INSTALL/APP_OPL/title.cfg app_opl_title_cfg.s app_opl_title_cfg

boot_appinfo_pbt.s:
	bin2s INSTALL/BOOT/APPINFO.PBT boot_appinfo_pbt.s boot_appinfo_pbt

boot_boot_elf.s:
	bin2s INSTALL/BOOT/BOOT.ELF boot_boot_elf.s boot_boot_elf

boot_boot2_elf.s:
	bin2s INSTALL/BOOT/BOOT2.ELF boot_boot2_elf.s boot_boot2_elf

boot_esr_elf.s:
	bin2s INSTALL/BOOT/ESR.ELF boot_esr_elf.s boot_esr_elf

boot_whatisbootx_txt.s:
	bin2s INSTALL/BOOT/WHATISBOOTX.TXT boot_whatisbootx_txt.s boot_whatisbootx_txt

boot_boot_icn.s:
	bin2s INSTALL/BOOT/BOOT.ICN boot_boot_icn.s boot_boot_icn

boot_copy_icn.s:
	bin2s INSTALL/BOOT/COPY.ICN boot_copy_icn.s boot_copy_icn

boot_del_icn.s:
	bin2s INSTALL/BOOT/DEL.ICN boot_del_icn.s boot_del_icn

boot_icon_sys.s:
	bin2s INSTALL/BOOT/ICON.SYS boot_icon_sys.s boot_icon_sys

boot_osdmenu_elf.s:
	bin2s INSTALL/BOOT/OSDMENU.ELF boot_osdmenu_elf.s boot_osdmenu_elf

neutrino_appinfo_pbt.s:
	bin2s INSTALL/NEUTRINO/APPINFO.PBT neutrino_appinfo_pbt.s neutrino_appinfo_pbt

neutrino_config_bsd_ata_toml.s:
	bin2s INSTALL/NEUTRINO/config/bsd-ata.toml neutrino_config_bsd_ata_toml.s neutrino_config_bsd_ata_toml

neutrino_config_bsd_ilink_toml.s:
	bin2s INSTALL/NEUTRINO/config/bsd-ilink.toml neutrino_config_bsd_ilink_toml.s neutrino_config_bsd_ilink_toml

neutrino_config_bsd_mmce_toml.s:
	bin2s INSTALL/NEUTRINO/config/bsd-mmce.toml neutrino_config_bsd_mmce_toml.s neutrino_config_bsd_mmce_toml

neutrino_config_bsd_mx4sio_toml.s:
	bin2s INSTALL/NEUTRINO/config/bsd-mx4sio.toml neutrino_config_bsd_mx4sio_toml.s neutrino_config_bsd_mx4sio_toml

neutrino_config_bsd_udpbd_hdd_toml.s:
	bin2s INSTALL/NEUTRINO/config/bsd-udpbd-hdd.toml neutrino_config_bsd_udpbd_hdd_toml.s neutrino_config_bsd_udpbd_hdd_toml

neutrino_config_bsd_udpbd_toml.s:
	bin2s INSTALL/NEUTRINO/config/bsd-udpbd.toml neutrino_config_bsd_udpbd_toml.s neutrino_config_bsd_udpbd_toml

neutrino_config_bsd_usb_debug_toml.s:
	bin2s INSTALL/NEUTRINO/config/bsd-usb-debug.toml neutrino_config_bsd_usb_debug_toml.s neutrino_config_bsd_usb_debug_toml

neutrino_config_bsd_usb_toml.s:
	bin2s INSTALL/NEUTRINO/config/bsd-usb.toml neutrino_config_bsd_usb_toml.s neutrino_config_bsd_usb_toml

neutrino_config_bsdfs_bd_toml.s:
	bin2s INSTALL/NEUTRINO/config/bsdfs-bd.toml neutrino_config_bsdfs_bd_toml.s neutrino_config_bsdfs_bd_toml

neutrino_config_bsdfs_exfat_toml.s:
	bin2s INSTALL/NEUTRINO/config/bsdfs-exfat.toml neutrino_config_bsdfs_exfat_toml.s neutrino_config_bsdfs_exfat_toml

neutrino_config_bsdfs_hdl_toml.s:
	bin2s INSTALL/NEUTRINO/config/bsdfs-hdl.toml neutrino_config_bsdfs_hdl_toml.s neutrino_config_bsdfs_hdl_toml

neutrino_config_compat_toml.s:
	bin2s INSTALL/NEUTRINO/config/compat.toml neutrino_config_compat_toml.s neutrino_config_compat_toml

neutrino_config_emu_ata_file_toml.s:
	bin2s INSTALL/NEUTRINO/config/emu-ata-file.toml neutrino_config_emu_ata_file_toml.s neutrino_config_emu_ata_file_toml

neutrino_config_emu_dvd_esr_toml.s:
	bin2s INSTALL/NEUTRINO/config/emu-dvd-esr.toml neutrino_config_emu_dvd_esr_toml.s neutrino_config_emu_dvd_esr_toml

neutrino_config_emu_dvd_file_toml.s:
	bin2s INSTALL/NEUTRINO/config/emu-dvd-file.toml neutrino_config_emu_dvd_file_toml.s neutrino_config_emu_dvd_file_toml

neutrino_config_emu_mc_file_toml.s:
	bin2s INSTALL/NEUTRINO/config/emu-mc-file.toml neutrino_config_emu_mc_file_toml.s neutrino_config_emu_mc_file_toml

neutrino_config_i_bdm_toml.s:
	bin2s INSTALL/NEUTRINO/config/i_bdm.toml neutrino_config_i_bdm_toml.s neutrino_config_i_bdm_toml

neutrino_config_i_dev9_hidden_toml.s:
	bin2s INSTALL/NEUTRINO/config/i_dev9_hidden.toml neutrino_config_i_dev9_hidden_toml.s neutrino_config_i_dev9_hidden_toml

neutrino_config_i_dev9_ns_toml.s:
	bin2s INSTALL/NEUTRINO/config/i_dev9_ns.toml neutrino_config_i_dev9_ns_toml.s neutrino_config_i_dev9_ns_toml

neutrino_config_p_membo_toml.s:
	bin2s INSTALL/NEUTRINO/config/p_membo.toml neutrino_config_p_membo_toml.s neutrino_config_p_membo_toml

neutrino_config_p_membo2k_toml.s:
	bin2s INSTALL/NEUTRINO/config/p-membo2k.toml neutrino_config_p_membo2k_toml.s neutrino_config_p_membo2k_toml

neutrino_config_p_steeldr_toml.s:
	bin2s INSTALL/NEUTRINO/config/p-steeldr.toml neutrino_config_p_steeldr_toml.s neutrino_config_p_steeldr_toml

neutrino_config_p_uya_toml.s:
	bin2s INSTALL/NEUTRINO/config/p-uya.toml neutrino_config_p_uya_toml.s neutrino_config_p_uya_toml

neutrino_config_system_toml.s:
	bin2s INSTALL/NEUTRINO/config/system.toml neutrino_config_system_toml.s neutrino_config_system_toml

neutrino_del_icn.s:
	bin2s INSTALL/NEUTRINO/del.icn neutrino_del_icn.s neutrino_del_icn

neutrino_icon_sys.s:
	bin2s INSTALL/NEUTRINO/icon.sys neutrino_icon_sys.s neutrino_icon_sys

neutrino_list_icn.s:
	bin2s INSTALL/NEUTRINO/list.icn neutrino_list_icn.s neutrino_list_icn

neutrino_modules_ieee1394_bd_mini_irx.s:
	bin2s INSTALL/NEUTRINO/modules/IEEE1394_BD_MINI.IRX neutrino_modules_ieee1394_bd_mini_irx.s neutrino_modules_ieee1394_bd_mini_irx

neutrino_modules_ata_bd_irx.s:
	bin2s INSTALL/NEUTRINO/modules/ata_bd.irx neutrino_modules_ata_bd_irx.s neutrino_modules_ata_bd_irx

neutrino_modules_atad_emu_irx.s:
	bin2s INSTALL/NEUTRINO/modules/atad_emu.irx neutrino_modules_atad_emu_irx.s neutrino_modules_atad_emu_irx

neutrino_modules_bdfs_irx.s:
	bin2s INSTALL/NEUTRINO/modules/bdfs.irx neutrino_modules_bdfs_irx.s neutrino_modules_bdfs_irx

neutrino_modules_bdm_irx.s:
	bin2s INSTALL/NEUTRINO/modules/bdm.irx neutrino_modules_bdm_irx.s neutrino_modules_bdm_irx

neutrino_modules_bdmfs_fatfs_irx.s:
	bin2s INSTALL/NEUTRINO/modules/bdmfs_fatfs.irx neutrino_modules_bdmfs_fatfs_irx.s neutrino_modules_bdmfs_fatfs_irx

neutrino_modules_cdvdfsv_irx.s:
	bin2s INSTALL/NEUTRINO/modules/cdvdfsv.irx neutrino_modules_cdvdfsv_irx.s neutrino_modules_cdvdfsv_irx

neutrino_modules_cdvdman_emu_irx.s:
	bin2s INSTALL/NEUTRINO/modules/cdvdman_emu.irx neutrino_modules_cdvdman_emu_irx.s neutrino_modules_cdvdman_emu_irx

neutrino_modules_cdvdman_esr1_irx.s:
	bin2s INSTALL/NEUTRINO/modules/cdvdman_esr1.irx neutrino_modules_cdvdman_esr1_irx.s neutrino_modules_cdvdman_esr1_irx

neutrino_modules_cdvdman_esr2_irx.s:
	bin2s INSTALL/NEUTRINO/modules/cdvdman_esr2.irx neutrino_modules_cdvdman_esr2_irx.s neutrino_modules_cdvdman_esr2_irx

neutrino_modules_dev9_hidden_irx.s:
	bin2s INSTALL/NEUTRINO/modules/dev9_hidden.irx neutrino_modules_dev9_hidden_irx.s neutrino_modules_dev9_hidden_irx

neutrino_modules_dev9_ns_irx.s:
	bin2s INSTALL/NEUTRINO/modules/dev9_ns.irx neutrino_modules_dev9_ns_irx.s neutrino_modules_dev9_ns_irx

neutrino_modules_ee_core_elf.s:
	bin2s INSTALL/NEUTRINO/modules/ee_core.elf neutrino_modules_ee_core_elf.s neutrino_modules_ee_core_elf

neutrino_modules_eesync_irx.s:
	bin2s INSTALL/NEUTRINO/modules/eesync.irx neutrino_modules_eesync_irx.s neutrino_modules_eesync_irx

neutrino_modules_fakemod_irx.s:
	bin2s INSTALL/NEUTRINO/modules/fakemod.irx neutrino_modules_fakemod_irx.s neutrino_modules_fakemod_irx

neutrino_modules_fhi_bd_irx.s:
	bin2s INSTALL/NEUTRINO/modules/fhi_bd.irx neutrino_modules_fhi_bd_irx.s neutrino_modules_fhi_bd_irx

neutrino_modules_fhi_bd_defrag_irx.s:
	bin2s INSTALL/NEUTRINO/modules/fhi_bd_defrag.irx neutrino_modules_fhi_bd_defrag_irx.s neutrino_modules_fhi_bd_defrag_irx

neutrino_modules_filexio_irx.s:
	bin2s INSTALL/NEUTRINO/modules/filexio.irx neutrino_modules_filexio_irx.s neutrino_modules_filexio_irxF

neutrino_modules_hdlfs_irx.s:
	bin2s INSTALL/NEUTRINO/modules/hdlfs.irx neutrino_modules_hdlfs_irx.s neutrino_modules_hdlfs_irx

neutrino_modules_ilinkman_irx.s:
	bin2s INSTALL/NEUTRINO/modules/ilinkman.irx neutrino_modules_ilinkman_irx.s neutrino_modules_ilinkman_irx

neutrino_modules_imgdrv_irx.s:
	bin2s INSTALL/NEUTRINO/modules/imgdrv.irx neutrino_modules_imgdrv_irx.s neutrino_modules_imgdrv_irx

neutrino_modules_iomanx_irx.s:
	bin2s INSTALL/NEUTRINO/modules/iomanx.irx neutrino_modules_iomanx_irx.s neutrino_modules_iomanx_irx

neutrino_modules_mc_emu_irx.s:
	bin2s INSTALL/NEUTRINO/modules/mc_emu.irx neutrino_modules_mc_emu_irx.s neutrino_modules_mc_emu_irx

neutrino_modules_mmcefhi_irx.s:
	bin2s INSTALL/NEUTRINO/modules/mmcefhi.irx neutrino_modules_mmcefhi_irx.s neutrino_modules_mmcefhi_irx

neutrino_modules_mmceman_irx.s:
	bin2s INSTALL/NEUTRINO/modules/mmceman.irx neutrino_modules_mmceman_irx.s neutrino_modules_mmceman_irx

neutrino_modules_mx4sio_bd_mini_irx.s:
	bin2s INSTALL/NEUTRINO/modules/mx4sio_bd_mini.irx neutrino_modules_mx4sio_bd_mini_irx.s neutrino_modules_mx4sio_bd_mini_irx

neutrino_modules_patch_membo_irx.s:
	bin2s INSTALL/NEUTRINO/modules/patch_membo.irx neutrino_modules_patch_membo_irx.s neutrino_modules_patch_membo_irx

neutrino_modules_patch_rc_uya_irx.s:
	bin2s INSTALL/NEUTRINO/modules/patch_rc_uya.irx neutrino_modules_patch_rc_uya_irx.s neutrino_modules_patch_rc_uya_irx

neutrino_modules_ps2hdd_bdm_irx.s:
	bin2s INSTALL/NEUTRINO/modules/ps2hdd-bdm.irx neutrino_modules_ps2hdd_bdm_irx.s neutrino_modules_ps2hdd_bdm_irx

neutrino_modules_smap_udpbd_irx.s:
	bin2s INSTALL/NEUTRINO/modules/smap_udpbd.irx neutrino_modules_smap_udpbd_irx.s neutrino_modules_smap_udpbd_irx

neutrino_modules_smap_udptty_irx.s:
	bin2s INSTALL/NEUTRINO/modules/smap_udptty.irx neutrino_modules_smap_udptty_irx.s neutrino_modules_smap_udptty_irx

neutrino_modules_udnl_t300_irx.s:
	bin2s INSTALL/NEUTRINO/modules/udnl-t300.irx neutrino_modules_udnl_t300_irx.s neutrino_modules_udnl_t300_irx

neutrino_modules_udnl_irx.s:
	bin2s INSTALL/NEUTRINO/modules/udnl.irx neutrino_modules_udnl_irx.s neutrino_modules_udnl_irx

neutrino_modules_usbd_mini_irx.s:
	bin2s INSTALL/NEUTRINO/modules/usbd_mini.irx neutrino_modules_usbd_mini_irx.s neutrino_modules_usbd_mini_irx

neutrino_modules_usbmass_bd_mini_irx.s:
	bin2s INSTALL/NEUTRINO/modules/usbmass_bd_mini.IRX neutrino_modules_usbmass_bd_mini_irx.s neutrino_modules_usbmass_bd_mini_irx

neutrino_neutrino_elf.s:
	bin2s INSTALL/NEUTRINO/neutrino.elf neutrino_neutrino_elf.s neutrino_neutrino_elf

neutrino_title_cfg.s:
	bin2s INSTALL/NEUTRINO/title.cfg neutrino_title_cfg.s neutrino_title_cfg

neutrino_version_txt.s:
	bin2s INSTALL/NEUTRINO/version.txt neutrino_version_txt.s neutrino_version_txt

opentuna_opentuna_fat_110_120_150_160_bin.s:
	bin2s INSTALL/OPENTUNA/OpenTuna_FAT-110-120-150-160.bin opentuna_opentuna_fat_110_120_150_160_bin.s opentuna_opentuna_fat_110_120_150_160_bin

opentuna_opentuna_fat_170_bin.s:
	bin2s INSTALL/OPENTUNA/OpenTuna_FAT-170.bin opentuna_opentuna_fat_170_bin.s opentuna_opentuna_fat_170_bin

opentuna_opentuna_slims_bin.s:
	bin2s INSTALL/OPENTUNA/OpenTuna_Slims.bin opentuna_opentuna_slims_bin.s opentuna_opentuna_slims_bin

opentuna_icon_sys.s:
	bin2s INSTALL/OPENTUNA/icon.sys opentuna_icon_sys.s opentuna_icon_sys

poweroff_poweroff_elf.s:
	bin2s INSTALL/POWEROFF/POWEROFF.ELF poweroff_poweroff_elf.s poweroff_poweroff_elf

poweroff_del_icn.s:
	bin2s INSTALL/POWEROFF/del.icn poweroff_del_icn.s poweroff_del_icn

poweroff_icon_sys.s:
	bin2s INSTALL/POWEROFF/icon.sys poweroff_icon_sys.s poweroff_icon_sys

poweroff_list_icn.s:
	bin2s INSTALL/POWEROFF/list.icn poweroff_list_icn.s poweroff_list_icn

restart_restart_elf.s:
	bin2s INSTALL/RESTART/RESTART.ELF restart_restart_elf.s restart_restart_elf

restart_del_icn.s:
	bin2s INSTALL/RESTART/del.icn restart_del_icn.s restart_del_icn

restart_icon_sys.s:
	bin2s INSTALL/RESTART/icon.sys restart_icon_sys.s restart_icon_sys

restart_list_icn.s:
	bin2s INSTALL/RESTART/list.icn restart_list_icn.s restart_list_icn

sys_conf_appinfo_pbt.s:
	bin2s INSTALL/SYS-CONF/APPINFO.PBT sys_conf_appinfo_pbt.s sys_conf_appinfo_pbt

sys_conf_freemcb_cnf.s:
	bin2s INSTALL/SYS-CONF/FREEMCB.CNF sys_conf_freemcb_cnf.s sys_conf_freemcb_cnf

sys_conf_ipconfig_dat.s:
	bin2s INSTALL/SYS-CONF/IPCONFIG.DAT sys_conf_ipconfig_dat.s sys_conf_ipconfig_dat

sys_conf_launchelf_cnf.s:
	bin2s INSTALL/SYS-CONF/LAUNCHELF.CNF sys_conf_launchelf_cnf.s sys_conf_launchelf_cnf

sys_conf_osdmenu_cnf.s:
	bin2s INSTALL/SYS-CONF/OSDMENU.CNF sys_conf_osdmenu_cnf.s sys_conf_osdmenu_cnf

sys_conf_ps2bbl_ini.s:
	bin2s INSTALL/SYS-CONF/PS2BBL.INI sys_conf_ps2bbl_ini.s sys_conf_ps2bbl_ini

sys_conf_psxbbl_ini.s:
	bin2s INSTALL/SYS-CONF/PSXBBL.INI sys_conf_psxbbl_ini.s sys_conf_psxbbl_ini

sys_conf_usbd_irx.s:
	bin2s INSTALL/SYS-CONF/USBD.IRX sys_conf_usbd_irx.s sys_conf_usbd_irx

sys_conf_usbhdfsd_irx.s:
	bin2s INSTALL/SYS-CONF/USBHDFSD.IRX sys_conf_usbhdfsd_irx.s sys_conf_usbhdfsd_irx

sys_conf_copy_icn.s:
	bin2s INSTALL/SYS-CONF/copy.icn sys_conf_copy_icn.s sys_conf_copy_icn

sys_conf_del_icn.s:
	bin2s INSTALL/SYS-CONF/del.icn sys_conf_del_icn.s sys_conf_del_icn

sys_conf_endvdpl_irx.s:
	bin2s INSTALL/SYS-CONF/endvdpl.irx sys_conf_endvdpl_irx.s sys_conf_endvdpl_irx

sys_conf_icon_sys.s:
	bin2s INSTALL/SYS-CONF/icon.sys sys_conf_icon_sys.s sys_conf_icon_sys

sys_conf_sysconf_icn.s:
	bin2s INSTALL/SYS-CONF/sysconf.icn sysconf_sysconf_icn.s sys_conf_sysconf_icn

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
