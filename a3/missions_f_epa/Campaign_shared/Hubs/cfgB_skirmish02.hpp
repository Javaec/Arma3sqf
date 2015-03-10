// Marksman
class BIS_Skirmish02Squad1:Skirmish
{
	identity = "EPB_Skirmish02Squad1";
	appearance = "B_G_Soldier_M_F";

	primaryWeapon[] =
	{
		{"srifle_EBR_DMS_F", "20Rnd_762x51_Mag", 6}
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
		{"headgear", "H_Bandanna_sgg"},
		{"magazine","HandGrenade",2},
		{"magazine","SmokeShell",2}
	};
};

// Autorifleman
class BIS_Skirmish02Squad2:Skirmish
{
	identity = "EPB_Skirmish02Squad2";
	appearance = "B_G_Soldier_AR_F";

	primaryWeapon[] =
	{
		{"LMG_Mk200_F", "200Rnd_65x39_cased_Box", 3}
	};

	remove[] =
	{
		"weapons",
		"items",
		"goggles",
		"headgear"
	};

	add[] =
	{
		{"uniform", "U_BG_Guerilla1_1"},
		{"vest", "V_PlateCarrierIA1_dgtl"},
		{"item", "FirstAidKit"},
		{"headgear", "H_Shemag_olive"},
		{"magazine","HandGrenade",2},
		{"magazine","SmokeShell",2}
	};
};

// Rifleman (AT)
class BIS_Skirmish02Squad3:Skirmish
{
	identity = "EPB_Skirmish02Squad3";
	appearance = "B_G_Soldier_LAT_F";

	primaryWeapon[] =
	{
		{"arifle_TRG20_ACO_F", "30Rnd_556x45_Stanag", 6}
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
		{"uniform", "U_BG_Guerilla2_3"},
		{"vest", "V_TacVest_blk"},
		{"item", "FirstAidKit"},
		{"backpack", "B_Bergen_blk"},
		{"goggles", "G_Shades_Red"},
		{"magazine","HandGrenade",2},
		{"magazine","SmokeShell",2},
		{"magazine","RPG32_F",3},
		{"weapon","launch_RPG32_F",1,"equip"}
	};
};

// Grenadier
class BIS_Skirmish02Squad4:Skirmish
{
	identity = "EPB_Skirmish02Squad4";
	appearance = "B_G_Soldier_GL_F";

	primaryWeapon[] =
	{
		{"arifle_TRG21_GL_MRCO_F", "30Rnd_556x45_Stanag", 6}
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
		{"vest", "V_TacVest_blk"},
		{"item", "FirstAidKit"},
		{"headgear", "H_Cap_blk"},
		{"magazine","HandGrenade",2},
		{"magazine","SmokeShell",2},
		{"magazine","1Rnd_HE_Grenade_shell",5}
	};
};

// Rifleman
class BIS_Skirmish02Squad5:Skirmish
{
	identity = "EPB_Skirmish02Squad5";
	appearance = "B_G_Soldier_F";

	primaryWeapon[] =
	{
		{"arifle_Katiba_ACO_F", "30Rnd_65x39_caseless_green", 6}
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
		{"vest", "V_TacVest_blk_POLICE"},
		{"item", "FirstAidKit"},
		{"headgear", "H_Beret_blk_POLICE"},
		{"magazine","HandGrenade",2},
		{"magazine","SmokeShell",2}
	};
};

// Rifleman
class BIS_Skirmish02Squad6:Skirmish
{
	identity = "EPB_Skirmish02Squad6";
	appearance = "B_G_Soldier_F";

	primaryWeapon[] =
	{
		{"arifle_TRG21_F", "30Rnd_556x45_Stanag", 8}
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
		{"vest", "V_Chestrig_oli"},
		{"item", "FirstAidKit"},
		{"goggles", "G_Sport_Blackred"},
		{"magazine","HandGrenade",2},
		{"magazine","SmokeShell",2}
	};
};

// Rifleman (light)
class BIS_Skirmish02Squad7:Skirmish
{
	identity = "EPB_Skirmish02Squad7";
	appearance = "B_G_Soldier_lite_F";

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
		{"uniform", "U_BG_Guerilla1_1"},
		{"vest", "V_Chestrig_oli"},
		{"item", "FirstAidKit"},
		{"headgear", "H_Shemag_olive"},
		{"magazine","SmokeShell",2}
	};
};