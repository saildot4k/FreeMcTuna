//#define __DEBUG_PRINTF__
#ifdef __DEBUG_PRINTF__
#define PRINTF(arg...) printf(arg...)
#else
#define PRINTF(arg...)
#endif
/*------------------------------------------------------------*/
#include "main.h"
#include "BMP/complete.h"
#include "BMP/error.h"
#include "BMP/wait.h"
#include "BMP/MensajeA.h"
#include "BMP/MensajeB.h"
#include "BMP/MensajeC.h"
#include "BMP/MensajeD.h"
#include "BMP/MensajeE.h"
#include "BMP/MensajeF.h"
#include "BMP/NON_COMPATIBLE.h"
#include "BMP/INST_SLOT_2.h"
#include "BMP/INST_SLOT_1.h"

enum ICN
{
	SLIMS = 0,	  // fat 0x190 and every 0x2?? ROM
	FATS,		  // 0x110, 0x120, 0x150, 0x160
	FAT170,		  // 0x170
	PROTOKERNELS, // this corresponds to rom 0x100 and 0x101, parrado won´t make the icons, but i will leavi it here in case someone makes it faster than instatuna
	UNSUPPORTED,
};

char* ICONTYPE_ALIAS[4] = {"190+","110+","170 ","100 "};
char* ICONFILE_NAMES[4] = {"slims","fats","fat170","protok"};

enum STATE
{
	STATE_MC0,
	STATE_MC1,
	STATE_INSTALL,
	STATE_FINISH,
	STATE_ERROR,
	STATE_BROWSER,
	STATE_UNSUPPORTED,
};

int GetIconType(unsigned long int ROMVERSION)
{
	int icontype = UNSUPPORTED;

	if (ROMVERSION >= 0x190)
		icontype = SLIMS;

	if ((ROMVERSION < 0x190) && (ROMVERSION >= 0x110))
		icontype = FATS;

	if (ROMVERSION == 0x170)
		icontype = FAT170;

	return icontype;
}


//----------------------------------------//
extern u8 opentuna_slims[];
extern int size_opentuna_slims;
//----------------------------------------//
extern u8 opentuna_fats[];
extern int size_opentuna_fats;
//----------------------------------------//
extern u8 opentuna_fat170[];
extern int size_opentuna_fat170;
//----------------------------------------//
extern u8 opentuna_sys[];
extern int size_opentuna_sys;
//----------------------------------------//

//APPS FOLDER
extern u8 apps_apps_icn[];
extern int size_apps_apps_icn;

extern u8 apps_del_icn[];
extern int size_apps_del_icn;

extern u8 apps_icon_sys[];
extern int size_apps_icon_sys;

// APP_NHDDL
extern u8 app_nhddl_appinfo_pbt[];
extern int size_app_nhddl_appinfo_pbt;

extern u8 app_nhddl_copy_icn[];
extern int size_app_nhddl_copy_icn;

extern u8 app_nhddl_del_icn[];
extern int size_app_nhddl_del_icn;

extern u8 app_nhddl_icon_sys[];
extern int size_app_nhddl_icon_sys;

extern u8 app_nhddl_list_icn[];
extern int size_app_nhddl_list_icn;

extern u8 app_nhddl_nhddl_elf[];
extern int size_app_nhddl_nhddl_elf;

extern u8 app_nhddl_nhddl_yaml[];
extern int size_app_nhddl_nhddl_yaml;

extern u8 app_nhddl_title_cfg[];
extern int size_app_nhddl_title_cfg;

// APP_OPL
extern u8 app_opl_appinfo_pbt[];
extern int size_app_opl_appinfo_pbt;

extern u8 app_opl_opl_elf[];
extern int size_app_opl_opl_elf;

extern u8 app_opl_copy_icn[];
extern int size_app_opl_copy_icn;

extern u8 app_opl_del_icn[];
extern int size_app_opl_del_icn;

extern u8 app_opl_icon_sys[];
extern int size_app_opl_icon_sys;

extern u8 app_opl_list_icn[];
extern int size_app_opl_list_icn;

extern u8 app_opl_title_cfg[];
extern int size_app_opl_title_cfg;

// PS1_DKWDRV
extern u8 ps1_dkwdrv_copy_icn[];
extern int size_ps1_dkwdrv_copy_icn;

extern u8 ps1_dkwdrv_del_icn[];
extern int size_ps1_dkwdrv_del_icn;

extern u8 ps1_dkwdrv_dkwdrv_elf[];
extern int size_ps1_dkwdrv_dkwdrv_elf;

extern u8 ps1_dkwdrv_icon_sys[];
extern int size_ps1_dkwdrv_icon_sys;

extern u8 ps1_dkwdrv_list_icn[];
extern int size_ps1_dkwdrv_list_icn;

extern u8 ps1_dkwdrv_title_cfg[];
extern int size_ps1_dkwdrv_title_cfg;

// BOOT
extern u8 boot_appinfo_pbt[];
extern int size_boot_appinfo_pbt;

extern u8 boot_boot_elf[];
extern int size_boot_boot_elf;

extern u8 boot_boot2_elf[];
extern int size_boot_boot2_elf;

extern u8 boot_esr_elf[];
extern int size_boot_esr_elf;

extern u8 boot_whatisbootx_txt[];
extern int size_boot_whatisbootx_txt;

extern u8 boot_boot_icn[];
extern int size_boot_boot_icn;

extern u8 boot_copy_icn[];
extern int size_boot_copy_icn;

extern u8 boot_del_icn[];
extern int size_boot_del_icn;

extern u8 boot_icon_sys[];
extern int size_boot_icon_sys;

extern u8 boot_osdmenu_elf[];
extern int size_boot_osdmenu_elf;

// NEUTRINO
extern u8 neutrino_appinfo_pbt[];
extern int size_neutrino_appinfo_pbt;

extern u8 neutrino_config_bsd_ata_toml[];
extern int size_neutrino_config_bsd_ata_toml;

extern u8 neutrino_config_bsd_ilink_toml[];
extern int size_neutrino_config_bsd_ilink_toml;

extern u8 neutrino_config_bsd_mmce_toml[];
extern int size_neutrino_config_bsd_mmce_toml;

extern u8 neutrino_config_bsd_mx4sio_toml[];
extern int size_neutrino_config_bsd_mx4sio_toml;

extern u8 neutrino_config_bsd_udpbd_hdd_toml[];
extern int size_neutrino_config_bsd_udpbd_hdd_toml;

extern u8 neutrino_config_bsd_udpbd_toml[];
extern int size_neutrino_config_bsd_udpbd_toml;

extern u8 neutrino_config_bsd_usb_debug_toml[];
extern int size_neutrino_config_bsd_usb_debug_toml;

extern u8 neutrino_config_bsd_usb_toml[];
extern int size_neutrino_config_bsd_usb_toml;

extern u8 neutrino_config_bsdfs_bd_toml[];
extern int size_neutrino_config_bsdfs_bd_toml;

extern u8 neutrino_config_bsdfs_exfat_toml[];
extern int size_neutrino_config_bsdfs_exfat_toml;

extern u8 neutrino_config_bsdfs_hdl_toml[];
extern int size_neutrino_config_bsdfs_hdl_toml;

extern u8 neutrino_config_compat_toml[];
extern int size_neutrino_config_compat_toml;

extern u8 neutrino_config_emu_ata_file_toml[];
extern int size_neutrino_config_emu_ata_file_toml;

extern u8 neutrino_config_emu_dvd_esr_toml[];
extern int size_neutrino_config_emu_dvd_esr_toml;

extern u8 neutrino_config_emu_dvd_file_toml[];
extern int size_neutrino_config_emu_dvd_file_toml;

extern u8 neutrino_config_emu_mc_file_toml[];
extern int size_neutrino_config_emu_mc_file_toml;

extern u8 neutrino_config_i_bdm_toml[];
extern int size_neutrino_config_i_bdm_toml;

extern u8 neutrino_config_i_dev9_hidden_toml[];
extern int size_neutrino_config_i_dev9_hidden_toml;

extern u8 neutrino_config_i_dev9_ns_toml[];
extern int size_neutrino_config_i_dev9_ns_toml;

extern u8 neutrino_config_p_membo_toml[];
extern int size_neutrino_config_p_membo_toml;

extern u8 neutrino_config_p_membo2k_toml[];
extern int size_neutrino_config_p_membo2k_toml;

extern u8 neutrino_config_p_steeldr_toml[];
extern int size_neutrino_config_p_steeldr_toml;

extern u8 neutrino_config_p_uya_toml[];
extern int size_neutrino_config_p_uya_toml;

extern u8 neutrino_config_system_toml[];
extern int size_neutrino_config_system_toml;

extern u8 neutrino_del_icn[];
extern int size_neutrino_del_icn;

extern u8 neutrino_icon_sys[];
extern int size_neutrino_icon_sys;

extern u8 neutrino_list_icn[];
extern int size_neutrino_list_icn;

extern u8 neutrino_modules_ieee1394_bd_mini_irx[];
extern int size_neutrino_modules_ieee1394_bd_mini_irx;

extern u8 neutrino_modules_ata_bd_irx[];
extern int size_neutrino_modules_ata_bd_irx;

extern u8 neutrino_modules_atad_emu_irx[];
extern int size_neutrino_modules_atad_emu_irx;

extern u8 neutrino_modules_bdfs_irx[];
extern int size_neutrino_modules_bdfs_irx;

extern u8 neutrino_modules_bdm_irx[];
extern int size_neutrino_modules_bdm_irx;

extern u8 neutrino_modules_bdmfs_fatfs_irx[];
extern int size_neutrino_modules_bdmfs_fatfs_irx;

extern u8 neutrino_modules_cdvdfsv_irx[];
extern int size_neutrino_modules_cdvdfsv_irx;

extern u8 neutrino_modules_cdvdman_emu_irx[];
extern int size_neutrino_modules_cdvdman_emu_irx;

extern u8 neutrino_modules_cdvdman_esr1_irx[];
extern int size_neutrino_modules_cdvdman_esr1_irx;

extern u8 neutrino_modules_cdvdman_esr2_irx[];
extern int size_neutrino_modules_cdvdman_esr2_irx;

extern u8 neutrino_modules_dev9_hidden_irx[];
extern int size_neutrino_modules_dev9_hidden_irx;

extern u8 neutrino_modules_dev9_ns_irx[];
extern int size_neutrino_modules_dev9_ns_irx;

extern u8 neutrino_modules_ee_core_elf[];
extern int size_neutrino_modules_ee_core_elf;

extern u8 neutrino_modules_eesync_irx[];
extern int size_neutrino_modules_eesync_irx;

extern u8 neutrino_modules_fakemod_irx[];
extern int size_neutrino_modules_fakemod_irx;

extern u8 neutrino_modules_fhi_bd_irx[];
extern int size_neutrino_modules_fhi_bd_irx;

extern u8 neutrino_modules_fhi_bd_defrag_irx[];
extern int size_neutrino_modules_fhi_bd_defrag_irx;

extern u8 neutrino_modules_filexio_irx[];
extern int size_neutrino_modules_filexio_irx;

extern u8 neutrino_modules_hdlfs_irx[];
extern int size_neutrino_modules_hdlfs_irx;

extern u8 neutrino_modules_ilinkman_irx[];
extern int size_neutrino_modules_ilinkman_irx;

extern u8 neutrino_modules_imgdrv_irx[];
extern int size_neutrino_modules_imgdrv_irx;

extern u8 neutrino_modules_iomanx_irx[];
extern int size_neutrino_modules_iomanx_irx;

extern u8 neutrino_modules_mc_emu_irx[];
extern int size_neutrino_modules_mc_emu_irx;

extern u8 neutrino_modules_mmcefhi_irx[];
extern int size_neutrino_modules_mmcefhi_irx;

extern u8 neutrino_modules_mmceman_irx[];
extern int size_neutrino_modules_mmceman_irx;

extern u8 neutrino_modules_mx4sio_bd_mini_irx[];
extern int size_neutrino_modules_mx4sio_bd_mini_irx;

extern u8 neutrino_modules_patch_membo_irx[];
extern int size_neutrino_modules_patch_membo_irx;

extern u8 neutrino_modules_patch_rc_uya_irx[];
extern int size_neutrino_modules_patch_rc_uya_irx;

extern u8 neutrino_modules_ps2hdd_bdm_irx[];
extern int size_neutrino_modules_ps2hdd_bdm_irx;

extern u8 neutrino_modules_smap_udpbd_irx[];
extern int size_neutrino_modules_smap_udpbd_irx;

extern u8 neutrino_modules_smap_udptty_irx[];
extern int size_neutrino_modules_smap_udptty_irx;

extern u8 neutrino_modules_udnl_t300_irx[];
extern int size_neutrino_modules_udnl_t300_irx;

extern u8 neutrino_modules_udnl_irx[];
extern int size_neutrino_modules_udnl_irx;

extern u8 neutrino_modules_usbd_mini_irx[];
extern int size_neutrino_modules_usbd_mini_irx;

extern u8 neutrino_modules_usbmass_bd_mini_irx[];
extern int size_neutrino_modules_usbmass_bd_mini_irx;

extern u8 neutrino_neutrino_elf[];
extern int size_neutrino_neutrino_elf;

extern u8 neutrino_title_cfg[];
extern int size_neutrino_title_cfg;

extern u8 neutrino_version_txt[];
extern int size_neutrino_version_txt;

// POWEROFF
extern u8 poweroff_poweroff_elf[];
extern int size_poweroff_poweroff_elf;

extern u8 poweroff_del_icn[];
extern int size_poweroff_del_icn;

extern u8 poweroff_icon_sys[];
extern int size_poweroff_icon_sys;

extern u8 poweroff_list_icn[];
extern int size_poweroff_list_icn;

// RESTART
extern u8 restart_restart_elf[];
extern int size_restart_restart_elf;

extern u8 restart_del_icn[];
extern int size_restart_del_icn;

extern u8 restart_icon_sys[];
extern int size_restart_icon_sys;

extern u8 restart_list_icn[];
extern int size_restart_list_icn;

// SYS-CONF
extern u8 sys_conf_appinfo_pbt[];
extern int size_sys_conf_appinfo_pbt;

extern u8 sys_conf_freemcb_cnf[];
extern int size_sys_conf_freemcb_cnf;

extern u8 sys_conf_ipconfig_dat[];
extern int size_sys_conf_ipconfig_dat;

extern u8 sys_conf_launchelf_cnf[];
extern int size_sys_conf_launchelf_cnf;

extern u8 sys_conf_osdmenu_cnf[];
extern int size_sys_conf_osdmenu_cnf;

extern u8 sys_conf_ps2bbl_ini[];
extern int size_sys_conf_ps2bbl_ini;

extern u8 sys_conf_psxbbl_ini[];
extern int size_sys_conf_psxbbl_ini;

extern u8 sys_conf_usbd_irx[];
extern int size_sys_conf_usbd_irx;

extern u8 sys_conf_usbhdfsd_irx[];
extern int size_sys_conf_usbhdfsd_irx;

extern u8 sys_conf_copy_icn[];
extern int size_sys_conf_copy_icn;

extern u8 sys_conf_del_icn[];
extern int size_sys_conf_del_icn;

extern u8 sys_conf_endvdpl_irx[];
extern int size_sys_conf_endvdpl_irx;

extern u8 sys_conf_icon_sys[];
extern int size_sys_conf_icon_sys;

extern u8 sys_conf_sysconf_icn[];
extern int size_sys_conf_sysconf_icn;


// Embedded IOP drivers
// Embedded IOP drivers
extern unsigned char SIO2MAN_irx[];
extern unsigned int size_SIO2MAN_irx;

extern unsigned char PADMAN_irx[];
extern unsigned int size_PADMAN_irx;

extern unsigned char MCMAN_irx[];
extern unsigned int size_MCMAN_irx;

extern unsigned char MCSERV_irx[];
extern unsigned int size_MCSERV_irx;

static int pad_inited = 0;

//--------------------------------------------------------------
static int file_exists(char *filepath)
{
	int fdn;

	fdn = open(filepath, O_RDONLY);
	if (fdn < 0)
		return 0;

	close(fdn);

	return 1;
}

//--------------------------------------------------------------
static void Reset_IOP(void)
{
	//parrado
	SifInitRpc(0);
	while (!SifIopReset("", 0))
	{
	};
	while (!SifIopSync())
	{
	};
	SifInitRpc(0);
}
//=============================================================
static void display_bmp(u16 W, u16 H, u32 *data)
{
	gs_print_bitmap(
		(gs_get_max_x() - W) / 2, //x
		(gs_get_max_y() - H) / 2, //y
		W,						  //w
		H,						  //h
		data					  //array
	);

	PRINTF("array displayed\n");
}
//=============================================================
/// DeleteFolder(); function was obtained from SP193's FreeMcBoot installer.
//thanks to SP193 for all his work
static int DeleteFolder(const char *folder)
{
	DIR *d = opendir(folder);
	size_t path_len = strlen(folder);
	int r = -1;

	if (d)
	{
		//scr_printf("Detected [%s], deleting...\n",folder);
		struct dirent *p;

		r = 0;
		while (!r && (p = readdir(d)))
		{
			int r2 = -1;
			char *buf;
			size_t len;

			/* Skip the names "." and ".." as we don't want to recurse on them. */
			if (!strcmp(p->d_name, ".") || !strcmp(p->d_name, ".."))
				continue;

			len = path_len + strlen(p->d_name) + 2;
			buf = malloc(len);

			if (buf)
			{
				struct stat statbuf;

				snprintf(buf, len, "%s/%s", folder, p->d_name);
				if (!stat(buf, &statbuf))
				{
					if (S_ISDIR(statbuf.st_mode))
						r2 = DeleteFolder(buf);
					else
						r2 = unlink(buf);
				}
				free(buf);
			}
			r = r2;
		}
		closedir(d);
	}

	if (!r)
		r = rmdir(folder);

	return r;
}
//=============================================================
static void InitPS2(void)
{
	Reset_IOP();
	SifInitIopHeap();
	SifLoadFileInit();
	fioInit();

	sbv_patch_enable_lmb();
	sbv_patch_disable_prefix_check();
	SifExecModuleBuffer(SIO2MAN_irx, size_SIO2MAN_irx, 0, NULL, NULL);
	SifExecModuleBuffer(PADMAN_irx, size_PADMAN_irx, 0, NULL, NULL);
	SifExecModuleBuffer(MCMAN_irx, size_MCMAN_irx, 0, NULL, NULL);
	SifExecModuleBuffer(MCSERV_irx, size_MCSERV_irx, 0, NULL, NULL);
	sbv_patch_fileio();// THANKS fjtrujy
	mcInit(MC_TYPE_XMC);
	PadInitPads();
}

//write &embed_file to path
// returns:
// -1 fail to open | -2 failed to write | 0 succes
static int write_embed(void *embed_file, const int embed_size, char *folder, char *filename, int mcport)
{
	char target[MAX_PATH];
	sprintf(target, "mc%d:/%s/%s", mcport, folder, filename);
	if (open(target, O_RDONLY) < 0) //if not exist
	{
		int ret, fd;
		if ((fd = open(target, O_CREAT | O_WRONLY | O_TRUNC)) < 0)
		{
			return -1;
		}
		ret = write(fd, embed_file, embed_size);
		if (ret != embed_size)
		{
			return -2;
		}
		close(fd);
	}

	PRINTF("embed file written: %s\n", target);
	return 0;
}
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//return 0 = ok, return 1 = error
static int install(int mcport, int icon_variant)
{
	char version_manifest_path[64];
	char temp_path[32];
	int ret, retorno,fd;
	static int mc_Type, mc_Free, mc_Format;
	
	sprintf(version_manifest_path, "mc%d:/OPENTUNA/icon_%s.cnf",mcport,ICONFILE_NAMES[icon_variant]);

	mcGetInfo(mcport, 0, &mc_Type, &mc_Free, &mc_Format);
	mcSync(0, NULL, &ret);
	PRINTF("mc_Type: %d\n", mc_Type);

	//If there's no MC, we have an error:
	if (ret != -1)
	{
		return 1;
	}

	//If it is not a PS2 MC, we have an error:
	if (mc_Type != sceMcTypePS2)
	{
		return 2;
	}

	//If there's no free space, we have an error:
	if (mc_Free < 4000)
	{
		return 3;
	}

	sprintf(temp_path,"mc%u:APPS", mcport);
		DeleteFolder(temp_path);
	sprintf(temp_path,"mc%u:OPL", mcport);
		DeleteFolder(temp_path);
	sprintf(temp_path,"mc%u:APP_OPL", mcport);
		DeleteFolder(temp_path);
	sprintf(temp_path,"mc%u:OPNPS2LD", mcport);
		DeleteFolder(temp_path);
	sprintf(temp_path,"mc%u:APP_ESR-LAUNCHER", mcport);
		DeleteFolder(temp_path);
	sprintf(temp_path,"mc%u:BOOT", mcport);
		DeleteFolder(temp_path);
	sprintf(temp_path, "mc%u:SYS-CONF", mcport);
		DeleteFolder(temp_path);
	sprintf(temp_path,"mc%u:SYS_FMCB-CFG", mcport);
		DeleteFolder(temp_path);
	sprintf(temp_path,"mc%u:SYS_FMCBCFG", mcport);
		DeleteFolder(temp_path);
	sprintf(temp_path,"mc%u:FMCBD-1.966", mcport);
		DeleteFolder(temp_path);
	sprintf(temp_path,"mc%u:FMCBD-1.953", mcport);
		DeleteFolder(temp_path);
	sprintf(temp_path,"mc%u:FMCBD-1.8C ", mcport);
		DeleteFolder(temp_path);
	sprintf(temp_path,"mc%u:LDR_FMCBD-1.966", mcport);
		DeleteFolder(temp_path);
	sprintf(temp_path, "mc%u:BXEXEC-FUNTUNA", mcport);
		DeleteFolder(temp_path);
	sprintf(temp_path, "mc%u:BXEXEC-OPENTUNA", mcport);
		DeleteFolder(temp_path);
	sprintf(temp_path,"mc%u:FORTUNA", mcport);
		DeleteFolder(temp_path);
	sprintf(temp_path,"mc%u:OPENTUNA", mcport);
		DeleteFolder(temp_path);
	sprintf(temp_path, "mc%u:FUNTUNA-FORK", mcport);
		DeleteFolder(temp_path);
	sprintf(temp_path, "mc%u:FUNTUNA", mcport);
		DeleteFolder(temp_path);
	sprintf(temp_path, "mc%u:DKWDRV", mcport);
		DeleteFolder(temp_path);
	sprintf(temp_path, "mc%u:PS1_DKWDRV", mcport);
		DeleteFolder(temp_path);

	//If the files exists, we have an error:
	if (mcport == 0)
	{
		if (file_exists("mc0:/OPENTUNA/icon.icn"))
		{
			return 4;
		}
		if (file_exists("mc0:/OPENTUNA/icon.sys"))
		{
			return 4;
		}
	}
	else
	{
		if (file_exists("mc1:/OPENTUNA/icon.icn"))
		{
			return 4;
		}
		if (file_exists("mc1:/OPENTUNA/icon.sys"))
		{
			return 4;
		}
	}
	ret = mcMkDir(mcport, 0, "APP_NHDDL");
	mcSync(0, NULL, &ret);
	ret = mcMkDir(mcport, 0, "APP_OPL");
	mcSync(0, NULL, &ret);
	ret = mcMkDir(mcport, 0, "APPS");
	mcSync(0, NULL, &ret);
	ret = mcMkDir(mcport, 0, "BOOT");
	mcSync(0, NULL, &ret);
	ret = mcMkDir(mcport, 0, "OPENTUNA");
	mcSync(0, NULL, &ret);
	ret = mcMkDir(mcport, 0, "POWEROFF");
	mcSync(0, NULL, &ret);
	ret = mcMkDir(mcport, 0, "RESTART");
	mcSync(0, NULL, &ret);
	ret = mcMkDir(mcport, 0, "SYS-CONF");
	mcSync(0, NULL, &ret);
	ret = mcMkDir(mcport, 0, "NEUTRINO");
	mcSync(0, NULL, &ret);
	ret = mcMkDir(mcport, 0, "NEUTRINO/config");
    mcSync(0, NULL, &ret);
    ret = mcMkDir(mcport, 0, "NEUTRINO/modules");
    mcSync(0, NULL, &ret);
	ret = mcMkDir(mcport, 0, "PS1_DKWDRV");
    mcSync(0, NULL, &ret);

		retorno = -12; ///to ensure installation quits if none of the hacked icons are written
	if (icon_variant == SLIMS)
	{
		retorno = write_embed(&opentuna_slims, size_opentuna_slims, "OPENTUNA", "icon.icn", mcport);
	}
	else if (icon_variant == FATS)
	{
		retorno = write_embed(&opentuna_fats, size_opentuna_fats, "OPENTUNA", "icon.icn", mcport);
	}
	else if (icon_variant == FAT170)
	{
		retorno = write_embed(&opentuna_fat170, size_opentuna_fat170, "OPENTUNA", "icon.icn", mcport);
	}
	if (retorno < 0)
	{
		return 6;
	}
	// <FILES SHARED BY ALL ICONS FROM NOW ON>
	retorno = write_embed(&opentuna_sys, size_opentuna_sys, "OPENTUNA", "icon.sys", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	if ((fd = open(version_manifest_path, O_CREAT | O_WRONLY | O_TRUNC)) >= 0){

	ret = write(fd, ICONTYPE_ALIAS[icon_variant], 4);//This will allow identifying the hacked icon variant without risking your mc contents
	close(fd);
	}


	// SYS-CONF folder
	retorno = write_embed(&sys_conf_appinfo_pbt, size_sys_conf_appinfo_pbt, "SYS-CONF", "APPINFO.PBT", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&sys_conf_copy_icn, size_sys_conf_copy_icn, "SYS-CONF", "copy.icn", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&sys_conf_del_icn, size_sys_conf_del_icn, "SYS-CONF", "del.icn", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&sys_conf_endvdpl_irx, size_sys_conf_endvdpl_irx, "SYS-CONF", "endvdpl.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&sys_conf_freemcb_cnf, size_sys_conf_freemcb_cnf, "SYS-CONF", "FREEMCB.CNF", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&sys_conf_icon_sys, size_sys_conf_icon_sys, "SYS-CONF", "icon.sys", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&sys_conf_ipconfig_dat, size_sys_conf_ipconfig_dat, "SYS-CONF", "IPCONFIG.DAT", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&sys_conf_launchelf_cnf, size_sys_conf_launchelf_cnf, "SYS-CONF", "LAUNCHELF.CNF", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&sys_conf_osdmenu_cnf, size_sys_conf_osdmenu_cnf, "SYS-CONF", "OSDMENU.CNF", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&sys_conf_ps2bbl_ini, size_sys_conf_ps2bbl_ini, "SYS-CONF", "PS2BBL.INI", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&sys_conf_psxbbl_ini, size_sys_conf_psxbbl_ini, "SYS-CONF", "PSXBBL.INI", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&sys_conf_sysconf_icn, size_sys_conf_sysconf_icn, "SYS-CONF", "sysconf.icn", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&sys_conf_usbd_irx, size_sys_conf_usbd_irx, "SYS-CONF", "USBD.IRX", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&sys_conf_usbhdfsd_irx, size_sys_conf_usbhdfsd_irx, "SYS-CONF", "USBHDFSD.IRX", mcport);
	if (retorno < 0)
	{
		return 6;
	}

	// BOOT folder
	retorno = write_embed(&boot_appinfo_pbt, size_boot_appinfo_pbt, "BOOT", "APPINFO.PBT", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&boot_boot_elf, size_boot_boot_elf, "BOOT", "BOOT.ELF", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&boot_boot_icn, size_boot_boot_icn, "BOOT", "boot.icn", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&boot_boot2_elf, size_boot_boot2_elf, "BOOT", "BOOT2.ELF", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&boot_copy_icn, size_boot_copy_icn, "BOOT", "copy.icn", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&boot_del_icn, size_boot_del_icn, "BOOT", "del.icn", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&boot_esr_elf, size_boot_esr_elf, "BOOT", "ESR.ELF", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&boot_icon_sys, size_boot_icon_sys, "BOOT", "icon.sys", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&boot_osdmenu_elf, size_boot_osdmenu_elf, "BOOT", "osdmenu.elf", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&boot_whatisbootx_txt, size_boot_whatisbootx_txt, "BOOT", "WHATISBOOTX.TXT", mcport);
	if (retorno < 0)
	{
		return 6;
	}

	// NEUTRINO folder
	retorno = write_embed(&neutrino_appinfo_pbt, size_neutrino_appinfo_pbt, "NEUTRINO", "APPINFO.PBT", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_del_icn, size_neutrino_del_icn, "NEUTRINO", "del.icn", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_icon_sys, size_neutrino_icon_sys, "NEUTRINO", "icon.sys", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_list_icn, size_neutrino_list_icn, "NEUTRINO", "list.icn", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_neutrino_elf, size_neutrino_neutrino_elf, "NEUTRINO", "neutrino.elf", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_title_cfg, size_neutrino_title_cfg, "NEUTRINO", "title.cfg", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_version_txt, size_neutrino_version_txt, "NEUTRINO", "version.txt", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_config_bsd_ata_toml, size_neutrino_config_bsd_ata_toml, "NEUTRINO", "config/bsd-ata.toml", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_config_bsd_ilink_toml, size_neutrino_config_bsd_ilink_toml, "NEUTRINO", "config/bsd-ilink.toml", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_config_bsd_mmce_toml, size_neutrino_config_bsd_mmce_toml, "NEUTRINO", "config/bsd-mmce.toml", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_config_bsd_mx4sio_toml, size_neutrino_config_bsd_mx4sio_toml, "NEUTRINO", "config/bsd-mx4sio.toml", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_config_bsd_udpbd_hdd_toml, size_neutrino_config_bsd_udpbd_hdd_toml, "NEUTRINO", "config/bsd-udpbd-hdd.toml", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_config_bsd_udpbd_toml, size_neutrino_config_bsd_udpbd_toml, "NEUTRINO", "config/bsd-udpbd.toml", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_config_bsd_usb_debug_toml, size_neutrino_config_bsd_usb_debug_toml, "NEUTRINO", "config/bsd-usb_debug.toml", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_config_bsd_usb_toml, size_neutrino_config_bsd_usb_toml, "NEUTRINO", "config/bsd-usb.toml", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_config_bsdfs_bd_toml, size_neutrino_config_bsdfs_bd_toml, "NEUTRINO", "config/bsdfs-bd.toml", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_config_bsdfs_exfat_toml, size_neutrino_config_bsdfs_exfat_toml, "NEUTRINO", "config/bsdfs-exfat.toml", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_config_bsdfs_hdl_toml, size_neutrino_config_bsdfs_hdl_toml, "NEUTRINO", "config/bsdfs-hdl.toml", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_config_compat_toml, size_neutrino_config_compat_toml, "NEUTRINO", "config/compat.toml", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_config_emu_ata_file_toml, size_neutrino_config_emu_ata_file_toml, "NEUTRINO", "config/emu-ata-file.toml", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_config_emu_dvd_esr_toml, size_neutrino_config_emu_dvd_esr_toml, "NEUTRINO", "config/emu-dvd-esr.toml", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_config_emu_dvd_file_toml, size_neutrino_config_emu_dvd_file_toml, "NEUTRINO", "config/emu-dvd-file.toml", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_config_emu_mc_file_toml, size_neutrino_config_emu_mc_file_toml, "NEUTRINO", "config/emu-mc-file.toml", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_config_i_bdm_toml, size_neutrino_config_i_bdm_toml, "NEUTRINO", "config/i_bdm.toml", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_config_i_dev9_hidden_toml, size_neutrino_config_i_dev9_hidden_toml, "NEUTRINO", "config/i_dev9_hidden.toml", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_config_i_dev9_ns_toml, size_neutrino_config_i_dev9_ns_toml, "NEUTRINO", "config/i_dev9_ns.toml", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_config_p_membo_toml, size_neutrino_config_p_membo_toml, "NEUTRINO", "config/p-membo.toml", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_config_p_membo2k_toml, size_neutrino_config_p_membo2k_toml, "NEUTRINO", "config/p-membo2k.toml", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_config_p_steeldr_toml, size_neutrino_config_p_steeldr_toml, "NEUTRINO", "config/p-steeldr.toml", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_config_p_uya_toml, size_neutrino_config_p_uya_toml, "NEUTRINO", "config/p-uya.toml", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_config_system_toml, size_neutrino_config_system_toml, "NEUTRINO", "config/system.toml", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_ata_bd_irx, size_neutrino_modules_ata_bd_irx, "NEUTRINO", "modules/ata_bd.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_atad_emu_irx, size_neutrino_modules_atad_emu_irx, "NEUTRINO", "modules/atad_emu.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_bdfs_irx, size_neutrino_modules_bdfs_irx, "NEUTRINO", "modules/bdfs.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_bdm_irx, size_neutrino_modules_bdm_irx, "NEUTRINO", "modules/bdm.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_bdmfs_fatfs_irx, size_neutrino_modules_bdmfs_fatfs_irx, "NEUTRINO", "modules/bdmfs_fatfs.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_cdvdfsv_irx, size_neutrino_modules_cdvdfsv_irx, "NEUTRINO", "modules/cdvdfsv.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_cdvdman_emu_irx, size_neutrino_modules_cdvdman_emu_irx, "NEUTRINO", "modules/cdvdman_emu.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_cdvdman_esr1_irx, size_neutrino_modules_cdvdman_esr1_irx, "NEUTRINO", "modules/cdvdman_esr1.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_cdvdman_esr2_irx, size_neutrino_modules_cdvdman_esr2_irx, "NEUTRINO", "modules/cdvdman_esr2.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_dev9_hidden_irx, size_neutrino_modules_dev9_hidden_irx, "NEUTRINO", "modules/dev9_hidden.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_dev9_ns_irx, size_neutrino_modules_dev9_ns_irx, "NEUTRINO", "modules/dev9_ns.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_ee_core_elf, size_neutrino_modules_ee_core_elf, "NEUTRINO", "modules/ee_core.elf", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_eesync_irx, size_neutrino_modules_eesync_irx, "NEUTRINO", "modules/eesync.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_fakemod_irx, size_neutrino_modules_fakemod_irx, "NEUTRINO", "modules/fakemod.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_fhi_bd_irx, size_neutrino_modules_fhi_bd_irx, "NEUTRINO", "modules/fhi_bd.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_fhi_bd_defrag_irx, size_neutrino_modules_fhi_bd_defrag_irx, "NEUTRINO", "modules/fhi_bd_defrag.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_filexio_irx, size_neutrino_modules_filexio_irx, "NEUTRINO", "modules/fileXio.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_hdlfs_irx, size_neutrino_modules_hdlfs_irx, "NEUTRINO", "modules/hdlfs.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_ieee1394_bd_mini_irx, size_neutrino_modules_ieee1394_bd_mini_irx, "NEUTRINO", "modules/IEEE1394_bd_mini.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_ilinkman_irx, size_neutrino_modules_ilinkman_irx, "NEUTRINO", "modules/iLinkman.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_imgdrv_irx, size_neutrino_modules_imgdrv_irx, "NEUTRINO", "modules/imgdrv.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_iomanx_irx, size_neutrino_modules_iomanx_irx, "NEUTRINO", "modules/iomanX.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_mc_emu_irx, size_neutrino_modules_mc_emu_irx, "NEUTRINO", "modules/mc_emu.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_mmcefhi_irx, size_neutrino_modules_mmcefhi_irx, "NEUTRINO", "modules/mmcefhi.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_mmceman_irx, size_neutrino_modules_mmceman_irx, "NEUTRINO", "modules/mmceman.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_mx4sio_bd_mini_irx, size_neutrino_modules_mx4sio_bd_mini_irx, "NEUTRINO", "modules/mx4sio_bd_mini.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_patch_membo_irx, size_neutrino_modules_patch_membo_irx, "NEUTRINO", "modules/patch_membo.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_patch_rc_uya_irx, size_neutrino_modules_patch_rc_uya_irx, "NEUTRINO", "modules/patch_rc_uya.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_ps2hdd_bdm_irx, size_neutrino_modules_ps2hdd_bdm_irx, "NEUTRINO", "modules/ps2hdd-bdm.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_smap_udpbd_irx, size_neutrino_modules_smap_udpbd_irx, "NEUTRINO", "modules/smap_udpbd.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_smap_udptty_irx, size_neutrino_modules_smap_udptty_irx, "NEUTRINO", "modules/smap_udptty.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_udnl_t300_irx, size_neutrino_modules_udnl_t300_irx, "NEUTRINO", "modules/udnl-t300.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_udnl_irx, size_neutrino_modules_udnl_irx, "NEUTRINO", "modules/udnl.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_usbd_mini_irx, size_neutrino_modules_usbd_mini_irx, "NEUTRINO", "modules/usbd_mini.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&neutrino_modules_usbmass_bd_mini_irx, size_neutrino_modules_usbmass_bd_mini_irx, "NEUTRINO", "modules/usbmass_bd_mini.irx", mcport);
	if (retorno < 0)
	{
		return 6;
	}

	// POWEROFF folder
	retorno = write_embed(&poweroff_del_icn, size_poweroff_del_icn, "POWEROFF", "del.icn", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&poweroff_icon_sys, size_poweroff_icon_sys, "POWEROFF", "icon.sys", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&poweroff_list_icn, size_poweroff_list_icn, "POWEROFF", "list.icn", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&poweroff_poweroff_elf, size_poweroff_poweroff_elf, "POWEROFF", "POWEROFF.ELF", mcport);
	if (retorno < 0)
	{
		return 6;
	}


	// RESTART folder
	retorno = write_embed(&restart_del_icn, size_restart_del_icn, "RESTART", "del.icn", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&restart_icon_sys, size_restart_icon_sys, "RESTART", "icon.sys", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&restart_list_icn, size_restart_list_icn, "RESTART", "list.icn", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&restart_restart_elf, size_restart_restart_elf, "RESTART", "RESTART.ELF", mcport);
	if (retorno < 0)
	{
		return 6;
	}

	// PS1_DKWDRV folder
		retorno = write_embed(&ps1_dkwdrv_copy_icn, size_ps1_dkwdrv_copy_icn, "PS1_DKWDRV", "copy.icn", mcport);
	if (retorno < 0)
	{
		return 6;
	}

			retorno = write_embed(&ps1_dkwdrv_del_icn, size_ps1_dkwdrv_del_icn, "PS1_DKWDRV", "del.icn", mcport);
	if (retorno < 0)
	{
		return 6;
	}

			retorno = write_embed(&ps1_dkwdrv_dkwdrv_elf, size_ps1_dkwdrv_dkwdrv_elf, "PS1_DKWDRV", "DKWDRV.ELF", mcport);
	if (retorno < 0)
	{
		return 6;
	}

			retorno = write_embed(&ps1_dkwdrv_icon_sys, size_ps1_dkwdrv_icon_sys, "PS1_DKWDRV", "icon.sys", mcport);
	if (retorno < 0)
	{
		return 6;
	}

			retorno = write_embed(&ps1_dkwdrv_list_icn, size_ps1_dkwdrv_list_icn, "PS1_DKWDRV", "list.icn", mcport);
	if (retorno < 0)
	{
		return 6;
	}

			retorno = write_embed(&ps1_dkwdrv_title_cfg, size_ps1_dkwdrv_title_cfg, "PS1_DKWDRV", "title.cfg", mcport);
	if (retorno < 0)
	{
		return 6;
	}

	// APP_OPL folder
	retorno = write_embed(&app_opl_appinfo_pbt, size_app_opl_appinfo_pbt, "APP_OPL", "APPINFO.PBT", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&app_opl_copy_icn, size_app_opl_copy_icn, "APP_OPL", "copy.icn", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&app_opl_del_icn, size_app_opl_del_icn, "APP_OPL", "del.icn", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&app_opl_icon_sys, size_app_opl_icon_sys, "APP_OPL", "icon.sys", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&app_opl_list_icn, size_app_opl_list_icn, "APP_OPL", "list.icn", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&app_opl_opl_elf, size_app_opl_opl_elf, "APP_OPL", "OPL.ELF", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&app_opl_title_cfg, size_app_opl_title_cfg, "APP_OPL", "title.cfg", mcport);
	if (retorno < 0)
	{
		return 6;
	}

	// APP_NHDDL folder
	retorno = write_embed(&app_nhddl_appinfo_pbt, size_app_nhddl_appinfo_pbt, "APP_NHDDL", "APPINFO.PBT", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&app_nhddl_copy_icn, size_app_nhddl_copy_icn, "APP_NHDDL", "copy.icn", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&app_nhddl_del_icn, size_app_nhddl_del_icn, "APP_NHDDL", "del.icn", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&app_nhddl_icon_sys, size_app_nhddl_icon_sys, "APP_NHDDL", "icon.sys", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&app_nhddl_list_icn, size_app_nhddl_list_icn, "APP_NHDDL", "list.icn", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&app_nhddl_nhddl_elf, size_app_nhddl_nhddl_elf, "APP_NHDDL", "nhddl.elf", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&app_nhddl_nhddl_yaml, size_app_nhddl_nhddl_yaml, "APP_NHDDL", "nhddl.yaml", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&app_nhddl_title_cfg, size_app_nhddl_title_cfg, "APP_NHDDL", "title.cfg", mcport);
	if (retorno < 0)
	{
		return 6;
	}


	// APPS folder
	retorno = write_embed(&apps_apps_icn, size_apps_apps_icn, "APPS", "APPS.icn", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&apps_del_icn, size_apps_del_icn, "APPS", "del.icn", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&apps_icon_sys, size_apps_icon_sys, "APPS", "icon.sys", mcport);
	if (retorno < 0)
	{
		return 6;
	}
PRINTF("installation finished\n");

	static sceMcTblGetDir mcDirAAA[64] __attribute__((aligned(64)));
	static sceMcStDateTime maximahora; //Maxium Timestamp, for the ones who does not speak Spanish

	maximahora.Resv2 = 0;
	maximahora.Sec = 59;
	maximahora.Min = 59;
	maximahora.Hour = 23;
	maximahora.Day = 31;
	maximahora.Month = 12;
	maximahora.Year = 2099;
	mcDirAAA->_Modify = maximahora;
	mcDirAAA->_Create = maximahora;
	mcSetFileInfo(mcport, 0, "OPENTUNA", mcDirAAA, 0x02);
	mcSync(0, NULL, &ret);

	PRINTF("timestamp changed\n");

	return 0;
}
//--------------------------------------------------------------

static void CleanUp(void) //trimmed from FMCB
{
	if (pad_inited)
	{
		padPortClose(0, 0);
		padPortClose(1, 0);
		padEnd();
	}

	Reset_IOP();

	// Reloads common modules
	SifLoadFileInit();
	sbv_patch_enable_lmb();
	sbv_patch_disable_prefix_check();

	SifLoadModule("rom0:SIO2MAN", 0, 0);
	SifLoadModule("rom0:CDVDFSV", 0, 0);
	SifLoadModule("rom0:CDVDMAN", 0, 0);
	SifLoadModule("rom0:MCMAN", 0, 0);
	SifLoadModule("rom0:MCSERV", 0, 0);
	SifLoadModule("rom0:PADMAN", 0, 0);

	fioExit();
	SifExitIopHeap();
	SifLoadFileExit();
	SifExitRpc();
	SifExitCmd();

	FlushCache(0);
	FlushCache(2);

	// clear the screen
	gs_set_fill_color(0, 0, 0);
	gs_fill_rect(0, 0, gs_get_max_x(), gs_get_max_y());
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//close program and go to browser
static void PS2_browser(void)
{
	CleanUp();
	LoadExecPS2("rom0:OSDSYS", 0, NULL);
}

void error_message(int iz)
{
	display_bmp(640, 448, error);
	switch (iz)
	{
	case 1:
		gs_print_bitmap(192, 343, 256, 40, MensajeA);
		break;
	case 2:
		gs_print_bitmap(192, 343, 256, 40, MensajeB);
		break;
	case 3:
		gs_print_bitmap(192, 343, 256, 40, MensajeC);
		break;
	case 4:
		gs_print_bitmap(192, 343, 256, 40, MensajeD);
		break;
	case 5:
		gs_print_bitmap(192, 343, 256, 40, MensajeE);
		break;
	case 6:
		gs_print_bitmap(192, 343, 256, 40, MensajeF);
		break;
	default:
		break;
	}
}

int wait_key(int key)
{
	while (1)
	{
		int new_pad = ReadCombinedPadStatus();
		if (new_pad & key)
			return new_pad;
	}
}

int main(int argc, char *argv[])
{
	int fdn, icontype;
	unsigned long int ROM_VERSION = 0x170;
	VMode = NTSC;
	int mcport, state;
	int key;

	// Loads Needed modules
	InitPS2();

	gs_reset();									   // Reset GS
	if ((fdn = open("rom0:ROMVER", O_RDONLY)) > 0) // Reading ROMVER
	{
		char romver[5];
		read(fdn, romver, 4);
		close(fdn);

		if (romver[4] == 'E')
			VMode = PAL;
		romver[4] = '\0';
		ROM_VERSION = strtoul(romver, NULL, 16); //convert ROM version to unsigned long int for further use on automatic Install
	}

	if (VMode == PAL)
		gs_init(PAL_640_512_32);
	else
		gs_init(NTSC_640_448_32);

	pad_inited = 1;
	icontype = GetIconType(ROM_VERSION);
	int iz = 0;

	if (icontype != UNSUPPORTED)
		state = STATE_MC0;
	else
		state = STATE_UNSUPPORTED;

	//Main menu rendering through Finite State Machine
	while (1)
	{

		switch (state)
		{
		case STATE_MC0:
			mcport = 0;
			display_bmp(640, 448, INST_SLOT_1);

			key = wait_key(-1);

			if ((key & PAD_CROSS) || (key & PAD_CIRCLE))
			{
				state = STATE_INSTALL;
				break;
			}

			if ((key & PAD_SELECT) || (key & PAD_L1))
			{
				state = STATE_MC1;
				break;
			}

			state = STATE_BROWSER;

			break;

		case STATE_MC1:
			mcport = 1;
			display_bmp(640, 448, INST_SLOT_2);

			key = wait_key(-1);

			if ((key & PAD_CROSS) || (key & PAD_CIRCLE))
			{
				state = STATE_INSTALL;
				break;
			}

			if ((key & PAD_SELECT) || (key & PAD_L1))
			{
				state = STATE_MC0;
				break;
			}

			state = STATE_BROWSER;

			break;

		case STATE_UNSUPPORTED:

			display_bmp(640, 448, NON_COMPATIBLE);
			key = wait_key(PAD_START);
			state = STATE_BROWSER;

			break;

		case STATE_INSTALL:
			display_bmp(640, 448, wait);
			iz = install(mcport, icontype);

			if (iz)
				state = STATE_ERROR;
			else
				state = STATE_FINISH;

			break;

		case STATE_FINISH:
			display_bmp(640, 448, complete);
			key = wait_key(PAD_START);
			state = STATE_BROWSER;

			break;
		case STATE_ERROR:
			error_message(iz);
			key = wait_key(PAD_START);

			state = STATE_BROWSER;

		case STATE_BROWSER:
			PS2_browser();
			break;

		default:
			break;
		}
	}

	return 0;
}
