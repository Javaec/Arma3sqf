// Medic
class BIS_Skirmish03Squad1:Default
{
	identity = "EPB_Skirmish03Squad1";
	appearance = "B_G_medic_F";

	skirmish = 1;

	primaryWeapon[] =
	{
		{"arifle_Katiba_C_F", "30Rnd_65x39_caseless_green", 6}
	};

	remove[] =
	{
		"weapons",
		"items",
		"headgear",
		"goggles",
		"backpack"
	};

	add[] =
	{
		{"uniform", "U_BG_Guerilla1_1"},
		{"vest", "V_PlateCarrierIA1_dgtl"},
		{"item", "FirstAidKit"},
		{"headgear", "H_Cap_blk"},
		{"magazine","SmokeShell",2},
		{"backpack", "B_AssaultPack_blk"},
		{"item","Medikit",1,"backpack"},
		{"item","NVGoggles_indep"}
	};
};

// Autorifleman
class BIS_Skirmish03Squad2:Default
{
	identity = "EPB_Skirmish03Squad2";
	appearance = "B_G_Soldier_AR_F";

	skirmish = 1;

	primaryWeapon[] =
	{
		{"LMG_Zafir_F", "150Rnd_762x51_Box", 3}
	};

	remove[] =
	{
		"weapons",
		"items",
		"headgear",
		"goggles"
	};

	add[] =
	{
		{"uniform", "U_BG_Guerilla2_3"},
		{"vest", "V_PlateCarrier1_blk"},
		{"item", "FirstAidKit"},
		{"headgear", "H_Watchcap_camo"},
		{"magazine","HandGrenade",2},
		{"magazine","SmokeShell",2},
		{"item","NVGoggles_opfor"}
	};
};

// Rifleman (AT)
class BIS_Skirmish03Squad3:Default
{
	identity = "EPB_Skirmish03Squad3";
	appearance = "B_G_Soldier_LAT_F";

	skirmish = 1;

	primaryWeapon[] =
	{
		{"arifle_Katiba_ACO_F", "30Rnd_65x39_caseless_green", 6}
	};

	remove[] =
	{
		"weapons",
		"items",
		"backpack",
		"headgear",
		"goggles"
	};

	add[] =
	{
		{"uniform", "U_BG_Guerilla1_1"},
		{"vest", "V_PlateCarrierIA2_dgtl"},
		{"item", "FirstAidKit"},
		{"headgear", "H_Shemag_olive_hs"},
		{"backpack", "B_FieldPack_oli"},
		{"magazine","HandGrenade",2},
		{"magazine","SmokeShell",2},
		{"weapon","launch_NLAW_F",1},
		{"magazine","NLAW_F",3},
		{"item","NVGoggles_indep"}
	};
};

// Rifleman
class BIS_Skirmish03Squad4:Default
{
	identity = "EPB_Skirmish03Squad4";
	appearance = "B_G_Soldier_F";

	skirmish = 1;

	primaryWeapon[] =
	{
		{"arifle_TRG21_MRCO_F", "30Rnd_556x45_Stanag", 6}
	};

	remove[] =
	{
		"weapons",
		"items",
		"headgear",
		"goggles"
	};

	add[] =
	{
		{"uniform", "U_BG_Guerilla2_1"},
		{"vest", "V_TacVest_brn"},
		{"item", "FirstAidKit"},
		{"headgear", "H_Bandanna_cbr"},
		{"magazine","HandGrenade",2},
		{"magazine","SmokeShell",2}
	};
};

// Grenadier
class BIS_Skirmish03Squad5:Default
{
	identity = "EPB_Skirmish03Squad5";
	appearance = "B_G_Soldier_GL_F";

	skirmish = 1;

	primaryWeapon[] =
	{
		{"arifle_Katiba_GL_ACO_F", "30Rnd_65x39_caseless_green", 6}
	};

	remove[] =
	{
		"weapons",
		"items",
		"headgear",
		"goggles"
	};

	add[] =
	{
		{"uniform", "U_BG_Guerilla1_1"},
		{"vest", "V_TacVest_camo"},
		{"item", "FirstAidKit"},
		{"headgear", "H_Bandanna_khk_hs"},
		{"magazine","HandGrenade",2},
		{"magazine","SmokeShell",2},
		{"magazine","1Rnd_HE_Grenade_shell",5}
	};
};

// Rifleman
class BIS_Skirmish03Squad6:Default
{
	identity = "EPB_Skirmish03Squad6";
	appearance = "B_G_Soldier_F";

	skirmish = 1;

	primaryWeapon[] =
	{
		{"arifle_TRG21_F", "30Rnd_556x45_Stanag", 6}
	};

	remove[] =
	{
		"weapons",
		"items",
		"headgear",
		"goggles"
	};

	add[] =
	{
		{"uniform", "U_BG_Guerilla2_3"},
		{"vest", "V_TacVest_blk"},
		{"item", "FirstAidKit"},
		{"headgear", "H_Cap_blk_CMMG"},
		{"magazine","HandGrenade",2},
		{"magazine","SmokeShell",2}
	};
};

// Autorifleman
class BIS_Skirmish03Squad7:Default
{
	identity = "EPB_Skirmish03Squad7";
	appearance = "B_G_Soldier_AR_F";

	skirmish = 1;

	primaryWeapon[] =
	{
		{"LMG_Mk200_F", "200Rnd_65x39_cased_Box", 3}
	};

	remove[] =
	{
		"weapons",
		"items",
		"headgear",
		"goggles"
	};

	add[] =
	{
		{"uniform", "U_BG_Guerilla1_1"},
		{"vest", "V_TacVest_oli"},
		{"item", "FirstAidKit"},
		{"headgear", "H_Booniehat_indp"},
		{"magazine","HandGrenade",2},
		{"magazine","SmokeShell",2}
	};
};

// Rifleman (Light)
class BIS_Skirmish03Squad8:Default
{
	identity = "EPB_Skirmish03Squad8";
	appearance = "B_G_Soldier_lite_F";

	skirmish = 1;

	primaryWeapon[] =
	{
		{"SMG_02_ACO_F", "30Rnd_9x21_Mag", 8}
	};

	remove[] =
	{
		"weapons",
		"items",
		"headgear",
		"goggles"
	};

	add[] =
	{
		{"uniform", "U_BG_Guerilla2_2"},
		{"vest", "V_TacVest_oli"},
		{"item", "FirstAidKit"},
		{"headgear", "H_StrawHat_dark"},
		{"magazine","SmokeShell",2}
	};
};