function AssignKBInfo(id,obs,cExpire,surveyURL)
{
	this.id = id;
	this.obs = obs;
	this.cExpire = cExpire;
	this.surveyURL = surveyURL;
}

KBInfo = new Array()
var n = 0;
KBInfo[n++] = new AssignKBInfo("kb_EN-US_acc10kb","3","30",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_acc10vbakb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_acc2000","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_acc2000kb","26","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_accesskb","38","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_accidea","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_accother","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_accsoft","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_accvba","7","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_accvba2000","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_actimates","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_activexdk","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_adobj","12","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_ALL","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_appcenterkb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_araccess","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_arbasic","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_arcrossprod","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_arfoxpro","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_arhome","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_arinet","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_arlanguages","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_armessage","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_armisc","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_arnetwork","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_aroffice","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_aropenv","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_arpub_ppt","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_arvbapps","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_arwinpro","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_arword","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_asppluskb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_automap","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_axsdk","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_axsf","14","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_bblockskb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_biztalkkb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_BOSRELEASEkb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_bpc","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_bpp","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_browser","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_classvrkb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_CliporgKB","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_commerce","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_compluskb","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_comti","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_contentx","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_crossnet","16","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_custserv","30","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_dbtools","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_dbweb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_dosworks","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_dreamworks","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_dspolicy","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_dts_fest","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_eas","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_entouragekb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_excelkb","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_exch2000kb","5","30",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_exchange","5","30",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_fortran","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_foxmisc","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_foxpro","10","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_fp10kb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_fp10vbakb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_fp2k","11","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_fp97","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_fp98","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_fpserver","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_frontpg","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_FrontPgVBAKb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_handheld","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_hlander","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_homegame","14","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_homekids","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_homemisc","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_homemm","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_homepub","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_htmlhelp","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_hwother","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_icp","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_icsa","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_idea","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_ie","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_ie_app","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_ie_dev","14","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_ieak","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_iearchive","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_ierelease","30","30",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_iis","3","30",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_imagec","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_inetmisc","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_investorkb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_ISAPI","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_istudio","9","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_java","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_joystick","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_kbproc","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_kbstream","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_kbsykes","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_keyboard","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_lanman","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_lqmotion","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_LVP","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_macmail","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_macofficekb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_macofficevbakb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_macpptkb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_macpptvbakb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_macsys","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_macword","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_macwordkb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_macworks","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_macxlkb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_macxlvbakb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_mapi","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_masm","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_mastering","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_mcis_msg","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_mdac","5","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_merchantsvr","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_MetaDirKB","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_miscsdk","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_mobilekb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_mod10kb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_mod2000","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_moneykb","5","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_mouse","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_msagent","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_msdn","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_msdos","6","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_msj","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_msmq","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_msnetwork","14","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_mspn","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_mspress","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_mstest","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_MSTVkb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_MSXMLkb","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_netclients","14","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_netshow","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_news","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_ntrelease","200","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_odbc","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_oemce","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_of20","38","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_of97","5","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_ofc","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_off10kb","9","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_off10vbakb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_OffDev","6","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_officekb","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_officese","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_offmac","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_offwatkb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_ol10codekb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_ol10kb","3","30",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_ol20","39","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_ol2000kb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_ol2001kb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_OL20codekb","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_OL97codekb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_ol98","11","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_OL98codekb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_oleapps","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_oledb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_oleprog","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_olexpress","33","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_olmac","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_onebill","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_otherbasics","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_outlook","11","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_owc10kb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_ows10kb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_owskb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_paintbrushkb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_pcmail","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_photodraw","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_pictureit","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_plus98","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_portalsvrkb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_powerpt","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_ppt10kb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_ppt10vbakb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_ppt2k","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_ppt97kb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_pptgeneralkb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_PPTVBA2Kkb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_PPTVBA97kb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_projectkb","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_ProjectVBAkb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_proxysvr","5","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_pssproc","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_pub10kb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_pub2k","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_pub98","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_publisher","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_repository","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_SBS","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_schedplus","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_scripting","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_setup","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_Sharepointkb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_sitemcis","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_sms","5","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_sna","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_sqlserver","5","30",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_ssafe","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_taxsaverkb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_techinfo","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_terminalsvr","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_tmgr","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_transpt","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_transsrv","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_unknown","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_utilities","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_VBA2000","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_vbapps","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_vbasdk","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_vbasic16kb","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_vbcetoolkitkb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_vbscript","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_vbwin","3","30",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_visio10kb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_visio10vbakb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_visiokb","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_visualc","11","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_visualc16kb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_visualj","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_vizact","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_vstudio","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_vstudio7kb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_wd10kb","3","30",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_wd10vbakb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_win16ddk","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_win16sdk","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_win2000homekb","30","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_win32ddk","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_win32sdk","12","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_win3x","5","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_win95ddk","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_win95x","81","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_win98x","125","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_winceddk","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_windna","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_winidea","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_winmil","156","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_winmisc","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_winnt","197","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_winnt31","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_winprint","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_winworks","5","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_wkssuitekb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_word","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_word2000kb","11","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_word97","5","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_WordBasicKB","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_wordkb","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_WordVBA2Kkb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_WordVBA97kb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_xl10kb","3","30",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_xl10vbakb","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_xl2000kb","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_xl97kb","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_xlgeneralkb","4","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_xlvba","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_xlvba2k","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
KBInfo[n++] = new AssignKBInfo("kb_EN-US_xlvba97","3","90",'/isapi/gosupport.asp?target=/survey/survey.asp?ID=sw;en;kb')
