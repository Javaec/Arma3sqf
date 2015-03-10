// Miller
class BIS_recon:Default
{
	identity = "EPB_B_Miller";
	appearance = "I_G_Story_SF_Captain_F";

	primaryWeapon[] = {
		{"arifle_MX_Black_Hamr_pointer_F", "30Rnd_65x39_caseless_mag", 7}
	};

	remove[] = {
		"weapons",
		"items"
	};

	add[] = {
		{"uniform", "U_BG_Guerilla2_3"},
		{"vest", "V_TacVest_blk"},
		{"item", "FirstAidKit"}
	};
};

// Radcliffe (CTRG Team Lead)
class BIS_SFA:Default
{
	identity = "EPB_B_CTRG1";
	appearance = "B_Soldier_TL_F";

	primaryWeapon[] = {
		{"arifle_MX_Black_Hamr_pointer_F", "30Rnd_65x39_caseless_mag", 7}
	};

	remove[] = {
		"weapons",
		"items",
		"NVGoggles"
	};

	add[] = {
		{"uniform", "U_BG_Guerilla2_1"},
		{"vest", "V_TacVest_khk"},
		{"headgear", "H_Cap_khaki_specops_UK"}
	};
};

// CTRG Grenadier
class BIS_SFB:Default
{
	identity = "EPB_B_CTRG3";
	appearance = "B_Soldier_GL_F";

	primaryWeapon[] = {
		{
			"arifle_MX_GL_Black_Hamr_pointer_F",
			"30Rnd_65x39_caseless_mag", 7,
			"1Rnd_HE_Grenade_shell", 4
		}
	};

	remove[] = {
		"weapons",
		"NVGoggles",
		"items"
	};

	add[] = {
		{"uniform", "U_BG_Guerilla2_3"},
		{"vest", "V_TacVest_camo"},
		{"headgear", "H_Beret_brn_SF"},
		{"goggles", "G_tactical_clear"},
		{"item", "FirstAidKit"}
	};
};

// CTRG Marksman; ambient
class BIS_SFC:Default
{
	identity = "EPB_B_CTRG2";
	appearance = "B_soldier_M_F";

	primaryWeapon[] = {
		{"arifle_MXM_Black_F", "30Rnd_65x39_caseless_mag", 7}	// 0 = this spawn {waitUntil {primaryWeapon _this == "arifle_MXM_Black_F"}; {_this addPrimaryWeaponItem _x} forEach ["optic_hamr", "acc_pointer_IR"]}
	};

	remove[] = {
		"weapons",
		"items",
		"goggles",
		"NVGoggles"
	};

	add[] = {
		{"uniform", "U_BG_leader"},
		{"vest", "V_TacVest_camo"},
		{"headgear", "H_Watchcap_blk"},
		{"item", "FirstAidKit"}
	};
};

// CTRG Medic; ambient
class BIS_SFD:Default
{
	identity = "EPB_B_CTRG4";
	appearance = "B_medic_F";

	primaryWeapon[] = {
		{"arifle_MXC_Black_F", "30Rnd_65x39_caseless_mag", 7}
	};

	remove[] = {
		"weapons",
		"items",
		"backpack",
		"NVGoggles"
	};

	add[] = {
		{"uniform", "U_BG_Guerilla2_3"},
		{"vest", "V_TacVest_camo"},
		{"backpack", "B_AssaultPack_rgr_Medic"},
		{"goggles", "G_Shades_Red"},
		{"headgear", "H_Cap_blk"}
	};
};

// James; elite, not always on hub
class BIS_SFX:Default
{
	identity = "EPB_B_James";
	appearance = "B_CTRG_soldier_M_medic_F";

	primaryWeapon[] = {
		{"srifle_EBR_Hamr_pointer_F", "20Rnd_762x51_Mag", 7}
	};

	remove[] = {
		"weapons",
		"items",
		"backpack",
		"NVGoggles"
	};

	add[] = {
		{"uniform", "U_BG_Guerilla1_1"},
		{"vest", "V_BandollierB_blk"},
		{"item", "FirstAidKit"}
	};
};