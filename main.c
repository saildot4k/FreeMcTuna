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
///BOOT FOLDER
extern u8 appinfo_pbt[];
extern int size_appinfo_pbt;
//----------------------------------------//
extern u8 boot_elf[];
extern int size_boot_elf;
//----------------------------------------//
extern u8 boot2_elf[];
extern int size_boot2_elf;
//----------------------------------------//
extern u8 boot_icn[];
extern int size_boot_icn;
//----------------------------------------//
extern u8 copy_icn[];
extern int size_copy_icn;
//----------------------------------------//
extern u8 del_icn[];
extern int size_del_icn;
//----------------------------------------//
extern u8 icon_sys[];
extern int size_icon_sys;
//----------------------------------------//
extern u8 whatisbootx_txt[];
extern int size_whatisbootx_txt;
//----------------------------------------//
///SYS-CONF FOLDER
extern u8 sysconfappinfo_pbt[];
extern int size_sysconfappinfo_pbt;
//----------------------------------------//
extern u8 sysconfcopy_icn[];
extern int size_sysconfcopy_icn;
//----------------------------------------//
extern u8 sysconfdel_icn[];
extern int size_sysconfdel_icn;
//----------------------------------------//
extern u8 sysconfendvdpl_irx[];
extern int size_sysconfendvdpl_irx;
//----------------------------------------//
extern u8 sysconffreemcb_cnf[];
extern int size_sysconffreemcb_cnf;
//----------------------------------------//
extern u8 sysconficon_sys[];
extern int size_sysconficon_sys;
//----------------------------------------//
extern u8 sysconfipconfig_dat[];
extern int size_sysconfipconfig_dat;
//----------------------------------------//
extern u8 sysconflaunchelf_cnf[];
extern int size_sysconflaunchelf_cnf;
//----------------------------------------//
extern u8 sysconfosdmenu_cnf[];
extern int size_sysconfosdmenu_cnf;
//----------------------------------------//
extern u8 sysconfps2bbl_ini[];
extern int size_sysconfps2bbl_ini;
//----------------------------------------//
extern u8 sysconfpsxbbl_ini[];
extern int size_sysconfpsxbbl_ini;
//----------------------------------------//
extern u8 sysconflist_icn[];
extern int size_sysconflist_icn;
//----------------------------------------//
extern u8 sysconfusbd_irx[];
extern int size_sysconfusbd_irx;
//----------------------------------------//
extern u8 sysconfusbhdfsd_irx[];
extern int size_sysconfusbhdfsd_irx;
//----------------------------------------//
///RESTART FOLDER
extern u8 restartdel_icn[];
extern int size_restartdel_icn;
//----------------------------------------//
extern u8 restarticon_sys[];
extern int size_restarticon_sys;
//----------------------------------------//
extern u8 restartlist_icn[];
extern int size_restartlist_icn;
//----------------------------------------//
extern u8 restart_elf[];
extern int size_restart_elf;
//----------------------------------------//
///POWEROFF FOLDER
extern u8 powerdel_icn[];
extern int size_powerdel_icn;
//----------------------------------------//
extern u8 powericon_sys[];
extern int size_powericon_sys;
//----------------------------------------//
extern u8 powerlist_icn[];
extern int size_powerlist_icn;
//----------------------------------------//
extern u8 poweroff_elf[];
extern int size_poweroff_elf;
//----------------------------------------//
///APPS FOLDER
extern u8 apps_icn[];
extern int size_apps_icn;
//----------------------------------------//
extern u8 appsdel_icn[];
extern int size_appsdel_icn;
//----------------------------------------//
extern u8 appsicon_sys[];
extern int size_appsicon_sys;
//----------------------------------------//
///SYS_OSDMENU FOLDER
extern u8 sys_osdmenu_appinfo_pbt[];
extern int size_sys_osdmenu_appinfo_pbt;
//----------------------------------------//
extern u8 sys_osdmenu_copy_icn[];
extern int size_sys_osdmenu_copy_icn;
//----------------------------------------//
extern u8 sys_osdmenu_del_icn[];
extern int size_sys_osdmenu_del_icn;
//----------------------------------------//
extern u8 sys_osdmenu_icon_sys[];
extern int size_sys_osdmenu_icon_sys;
//----------------------------------------//
extern u8 sys_osdmenu_list_icn[];
extern int size_sys_osdmenu_list_icn;
//----------------------------------------//
extern u8 sys_osdmenu_osdmenu_elf[];
extern int size_sys_osdmenu_osdmenu_elf;
//----------------------------------------//
extern u8 sys_osdmenu_title_cfg[];
extern int size_sys_osdmenu_title_cfg;
//----------------------------------------//

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
	ret = mcMkDir(mcport, 0, "OPENTUNA");
	mcSync(0, NULL, &ret);
	ret = mcMkDir(mcport, 0, "SYS_OSDMENU");
	mcSync(0, NULL, &ret);
	ret = mcMkDir(mcport, 0, "SYS-CONF");
	mcSync(0, NULL, &ret);
	ret = mcMkDir(mcport, 0, "BOOT");
	mcSync(0, NULL, &ret);
	ret = mcMkDir(mcport, 0, "APPS");
	mcSync(0, NULL, &ret);
	ret = mcMkDir(mcport, 0, "POWEROFF");
	mcSync(0, NULL, &ret);
	ret = mcMkDir(mcport, 0, "RESTART");
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

	// Adding SYS_OSDMENU items
	retorno = write_embed(&sys_osdmenu_appinfo_pbt, size_sys_osdmenu_appinfo_pbt, "SYS_OSDMENU", "APPINFO.PBT", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&sys_osdmenu_copy_icn, size_sys_osdmenu_copy_icn, "SYS_OSDMENU", "copy.icn", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&sys_osdmenu_del_icn, size_sys_osdmenu_del_icn, "SYS_OSDMENU", "del.icn", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&sys_osdmenu_icon_sys, size_sys_osdmenu_icon_sys, "SYS_OSDMENU", "icon.sys", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&sys_osdmenu_list_icn, size_sys_osdmenu_list_icn, "SYS_OSDMENU", "list.icn", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&sys_osdmenu_osdmenu_elf, size_sys_osdmenu_osdmenu_elf, "SYS_OSDMENU", "osdmenu.elf", mcport);
	if (retorno < 0)
	{
		return 6;
	}
	retorno = write_embed(&sys_osdmenu_title_cfg, size_sys_osdmenu_title_cfg, "SYS_OSDMENU", "title.cfg", mcport);
	if (retorno < 0)
	{
		return 6;
	}

    // Adding sysconf items
    retorno = write_embed(&sysconffreemcb_cnf, size_sysconffreemcb_cnf, "SYS-CONF", "FREEMCB.CNF", mcport);
    if (retorno < 0)
    {
        return 6;
    }
    retorno = write_embed(&sysconfipconfig_dat, size_sysconfipconfig_dat, "SYS-CONF", "IPCONFIG.DAT", mcport);
    if (retorno < 0)
    {
        return 6;
    }
    retorno = write_embed(&sysconflaunchelf_cnf, size_sysconflaunchelf_cnf, "SYS-CONF", "LAUNCHELF.CNF", mcport);
    if (retorno < 0)
    {
        return 6;
    }
    retorno = write_embed(&sysconfps2bbl_ini, size_sysconfps2bbl_ini, "SYS-CONF", "PS2BBL.INI", mcport);
    if (retorno < 0)
    {
        return 6;
    }
    retorno = write_embed(&sysconfpsxbbl_ini, size_sysconfpsxbbl_ini, "SYS-CONF", "PSXBBL.INI", mcport);
    if (retorno < 0)
    {
        return 6;
    }
    retorno = write_embed(&sysconfusbd_irx, size_sysconfusbd_irx, "SYS-CONF", "USBD.IRX", mcport);
    if (retorno < 0)
    {
        return 6;
    }
    retorno = write_embed(&sysconfusbhdfsd_irx, size_sysconfusbhdfsd_irx, "SYS-CONF", "USBHDFSD.IRX", mcport);
    if (retorno < 0)
    {
        return 6;
    }
    retorno = write_embed(&sysconfcopy_icn, size_sysconfcopy_icn, "SYS-CONF", "copy.icn", mcport);
    if (retorno < 0)
    {
        return 6;
    }
    retorno = write_embed(&sysconfdel_icn, size_sysconfdel_icn, "SYS-CONF", "del.icn", mcport);
    if (retorno < 0)
    {
        return 6;
    }
    retorno = write_embed(&sysconfendvdpl_irx, size_sysconfendvdpl_irx, "SYS-CONF", "endvdpl.irx", mcport);
    if (retorno < 0)
    {
        return 6;
    }
    retorno = write_embed(&sysconficon_sys, size_sysconficon_sys, "SYS-CONF", "icon.sys", mcport);
    if (retorno < 0)
    {
        return 6;
    }
    retorno = write_embed(&sysconflist_icn, size_sysconflist_icn, "SYS-CONF", "list.icn", mcport);
    if (retorno < 0)
    {
        return 6;
    }
	retorno = write_embed(&sysconfappinfo_pbt, size_sysconfappinfo_pbt, "SYS-CONF", "APPINFO.PBT", mcport);
    if (retorno < 0)
    {
        return 6;
    }
	retorno = write_embed(&sysconfosdmenu_cnf, size_sysconfosdmenu_cnf, "SYS-CONF", "OSDMENU.CNF", mcport);
    if (retorno < 0)
    {
        return 6;
    }

	// Adding BOOT folder
	    retorno = write_embed(&boot_elf, size_boot_elf, "BOOT", "BOOT.ELF", mcport);
    if (retorno < 0)
    {
        return 6;
    }
    retorno = write_embed(&boot2_elf, size_boot2_elf, "BOOT", "BOOT2.ELF", mcport);
    if (retorno < 0)
    {
        return 6;
    }
    retorno = write_embed(&icon_sys, size_icon_sys, "BOOT", "icon.sys", mcport);
    if (retorno < 0)
    {
        return 6;
    }
    retorno = write_embed(&copy_icn, size_copy_icn, "BOOT", "copy.icn", mcport);
    if (retorno < 0)
    {
        return 6;
    }
    retorno = write_embed(&del_icn, size_del_icn, "BOOT", "del.icn", mcport);
    if (retorno < 0)
    {
        return 6;
    }
    retorno = write_embed(&boot_icn, size_boot_icn, "BOOT", "boot.icn", mcport);
    if (retorno < 0)
    {
        return 6;
    }
    retorno = write_embed(&whatisbootx_txt, size_whatisbootx_txt, "BOOT", "WHATISBOOTX.TXT", mcport);
    if (retorno < 0)
    {
        return 6;
    }
    retorno = write_embed(&appinfo_pbt, size_appinfo_pbt, "BOOT", "APPINFO.PBT", mcport);
    if (retorno < 0)
    {
        return 6;
    }

	// Adding restart items
	
            retorno = write_embed(&restartdel_icn, size_restartdel_icn, "RESTART", "del.icn", mcport);
    if (retorno < 0)
    {
        return 6;
    }
    retorno = write_embed(&restarticon_sys, size_restarticon_sys, "RESTART", "icon.sys", mcport);
    if (retorno < 0)
    {
        return 6;
    }
    retorno = write_embed(&restartlist_icn, size_restartlist_icn, "RESTART", "list.icn", mcport);
    if (retorno < 0)
    {
        return 6;
    }
    retorno = write_embed(&restart_elf, size_restart_elf, "RESTART", "RESTART.ELF", mcport);
    if (retorno < 0)
    {
        return 6;
    }
	// Adding poweroff items
    retorno = write_embed(&powerdel_icn, size_powerdel_icn, "POWEROFF", "del.icn", mcport);
    if (retorno < 0)
    {
        return 6;
    }
    retorno = write_embed(&powericon_sys, size_powericon_sys, "POWEROFF", "icon.sys", mcport);
    if (retorno < 0)
    {
        return 6;
    }
    retorno = write_embed(&powerlist_icn, size_powerlist_icn, "POWEROFF", "list.icn", mcport);
    if (retorno < 0)
    {
        return 6;
    }
    retorno = write_embed(&poweroff_elf, size_poweroff_elf, "POWEROFF", "POWEROFF.ELF", mcport);
    if (retorno < 0)
    {
        return 6;
    }
        retorno = write_embed(&apps_icn, size_apps_icn, "APPS", "apps.icn", mcport);
    if (retorno < 0)
    {
        return 6;
    }
    retorno = write_embed(&appsdel_icn, size_appsdel_icn, "APPS", "del.icn", mcport);
    if (retorno < 0)
    {
        return 6;
    }
    retorno = write_embed(&appsicon_sys, size_appsicon_sys, "APPS", "icon.sys", mcport);
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
