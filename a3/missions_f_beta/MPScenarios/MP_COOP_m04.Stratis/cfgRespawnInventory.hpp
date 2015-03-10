class CfgRespawnInventory
{
	class WEST1
	{
		displayName = $STR_a3_mp_coop_04_cfgrespawninventory_light;
		show = "side group _this == west";
		weapons[] = {
			"arifle_MXC_F",
			"hgun_P07_F",
			"Binocular"
		};
		magazines[] = {
			"30Rnd_65x39_caseless_mag",
			"30Rnd_65x39_caseless_mag",
			"30Rnd_65x39_caseless_mag",
			"30Rnd_65x39_caseless_mag",
			"16Rnd_9x21_Mag",
			"16Rnd_9x21_Mag",
			"SmokeShell",
			"SmokeShell",
			"SmokeShell",
			"Chemlight_blue",
			"Chemlight_blue",
			"Chemlight_blue",
			"HandGrenade",
			"HandGrenade"
		};
		items[] = {
			"FirstAidKit"
		};
		linkedItems[] = {
			"V_Chestrig_khk",
			{"H_Watchcap_blk","H_MilCap_mcamo","H_Cap_headphones",""},
			"optic_Aco",
			"acc_flashlight",
			{"G_Squares","G_Shades_Black","","",""},
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass[] = {"U_B_CombatUniform_mcam_tshirt","U_B_CombatUniform_mcam_tshirt","U_Rangemaster"};
		backpack = "B_AssaultPack_mcamo";
	};
	class WEST2
	{
		displayName = $STR_a3_mp_coop_04_cfgrespawninventory_medium;
		show = "side group _this == west && missionnamespace getvariable ['BIS_fnc_moduleMPTypeDefense_tier',0] > 2";
		weapons[] = {
			"arifle_MX_GL_F",
			"hgun_P07_F",
			"Binocular"
		};
		magazines[] = {
			"30Rnd_65x39_caseless_mag",
			"30Rnd_65x39_caseless_mag",
			"30Rnd_65x39_caseless_mag",
			"30Rnd_65x39_caseless_mag",
			"30Rnd_65x39_caseless_mag",
			"16Rnd_9x21_Mag",
			"16Rnd_9x21_Mag",
			"16Rnd_9x21_Mag",
			"1Rnd_HE_Grenade_shell",
			"1Rnd_HE_Grenade_shell",
			"UGL_FlareYellow_F",
			"UGL_FlareYellow_F",
			"UGL_FlareYellow_F",
			"UGL_FlareYellow_F",
			"SmokeShellBlue",
			"SmokeShellBlue",
			"SmokeShellBlue",
			"Chemlight_blue",
			"Chemlight_blue",
			"Chemlight_blue",
			"HandGrenade",
			"HandGrenade"
		};
		items[] = {
			"FirstAidKit"
		};
		linkedItems[] = {
			"V_PlateCarrier1_rgr",
			"H_HelmetB_light",
			{"G_Tactical_Black",""},
			"optic_Hamr",
			"acc_flashlight",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "U_B_CombatUniform_mcam_vest";
		backpack = "B_Kitbag_mcamo";
	};
	class WEST3
	{
		displayName = $STR_a3_mp_coop_04_cfgrespawninventory_heavy;
		show = "side group _this == west && missionnamespace getvariable ['BIS_fnc_moduleMPTypeDefense_tier',0] > 4";
		weapons[] = {
			"arifle_MXM_F",
			"hgun_P07_F",
			"Binocular"
		};
		magazines[] = {
			"30Rnd_65x39_caseless_mag",
			"30Rnd_65x39_caseless_mag",
			"30Rnd_65x39_caseless_mag",
			"30Rnd_65x39_caseless_mag",
			"30Rnd_65x39_caseless_mag",
			"30Rnd_65x39_caseless_mag",
			"16Rnd_9x21_Mag",
			"16Rnd_9x21_Mag",
			"16Rnd_9x21_Mag",
			"16Rnd_9x21_Mag",
			"SmokeShellBlue",
			"SmokeShellBlue",
			"SmokeShellBlue",
			"Chemlight_blue",
			"Chemlight_blue",
			"Chemlight_blue",
			"HandGrenade",
			"HandGrenade"
		};
		items[] = {
			"FirstAidKit",
		};
		linkedItems[] = {
			"V_PlateCarrier2_rgr",
			"H_HelmetB",
			"G_Combat",
			"optic_SOS",
			"acc_flashlight",
			"NVGoggles",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "U_B_CombatUniform_mcam_worn";
		backpack = "B_Carryall_cbr";
	};

	////////////////////////////////////////////////////////////////////////////////////
	class GUER1
	{
		displayName = $STR_a3_mp_coop_04_cfgrespawninventory_light;
		show = "side group _this == resistance";
		weapons[] = {
			"arifle_Mk20C_F",
			"hgun_ACPC2_F",
			"Binocular"
		};
		magazines[] = {
			"30Rnd_556x45_Stanag",
			"30Rnd_556x45_Stanag",
			"30Rnd_556x45_Stanag",
			"30Rnd_556x45_Stanag",
			"16Rnd_9x21_Mag",
			"16Rnd_9x21_Mag",
			"SmokeShellGreen",
			"SmokeShellGreen",
			"SmokeShellGreen",
			"Chemlight_green",
			"Chemlight_green",
			"Chemlight_green",
			"HandGrenade",
			"HandGrenade"
		};
		items[] = {
			"FirstAidKit"
		};
		linkedItems[] = {
			"V_PlateCarrierIA1_dgtl",
			{"H_MilCap_dgtl","H_Cap_blk",""},
			"optic_ACO_grn",
			"acc_flashlight",
			{"G_Squares","G_Shades_Black","","",""},
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass[] = {"U_I_CombatUniform_shortsleeve"};
		backpack = "B_AssaultPack_ocamo";
	};
	class GUER2
	{
		displayName = $STR_a3_mp_coop_04_cfgrespawninventory_medium;
		show = "side group _this == resistance && missionnamespace getvariable ['BIS_fnc_moduleMPTypeDefense_tier',0] > 2";
		weapons[] = {
			"arifle_Mk20_GL_F",
			"hgun_ACPC2_F",
			"Binocular"
		};
		magazines[] = {
			"30Rnd_556x45_Stanag",
			"30Rnd_556x45_Stanag",
			"30Rnd_556x45_Stanag",
			"30Rnd_556x45_Stanag",
			"30Rnd_556x45_Stanag",
			"16Rnd_9x21_Mag",
			"16Rnd_9x21_Mag",
			"16Rnd_9x21_Mag",
			"1Rnd_HE_Grenade_shell",
			"1Rnd_HE_Grenade_shell",
			"UGL_FlareGreen_F",
			"UGL_FlareGreen_F",
			"UGL_FlareGreen_F",
			"UGL_FlareGreen_F",
			"SmokeShellGreen",
			"SmokeShellGreen",
			"SmokeShellGreen",
			"Chemlight_green",
			"Chemlight_green",
			"Chemlight_green",
			"HandGrenade",
			"HandGrenade"
		};
		items[] = {
			"FirstAidKit"
		};
		linkedItems[] = {
			"V_PlateCarrierIA1_dgtl",
			"H_HelmetIA",
			{"G_Tactical_Black",""},
			"optic_MRCO",
			"acc_flashlight",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass[] = {"U_I_CombatUniform"};
		backpack = "B_Kitbag_sgg";
	};
	class GUER3
	{
		displayName = $STR_a3_mp_coop_04_cfgrespawninventory_heavy;
		show = "side group _this == resistance && missionnamespace getvariable ['BIS_fnc_moduleMPTypeDefense_tier',0] > 4";
		weapons[] = {
			"srifle_EBR_F",
			"hgun_ACPC2_F",
			"Binocular"
		};
		magazines[] = {
			"20Rnd_762x51_Mag",
			"20Rnd_762x51_Mag",
			"20Rnd_762x51_Mag",
			"20Rnd_762x51_Mag",
			"20Rnd_762x51_Mag",
			"20Rnd_762x51_Mag",
			"20Rnd_762x51_Mag",
			"20Rnd_762x51_Mag",
			"20Rnd_762x51_Mag",
			"16Rnd_9x21_Mag",
			"16Rnd_9x21_Mag",
			"16Rnd_9x21_Mag",
			"16Rnd_9x21_Mag",
			"SmokeShellGreen",
			"SmokeShellGreen",
			"SmokeShellGreen",
			"Chemlight_green",
			"Chemlight_green",
			"Chemlight_green",
			"HandGrenade",
			"HandGrenade"
		};
		items[] = {
			"FirstAidKit"
		};
		linkedItems[] = {
			"V_PlateCarrierIA2_dgtl",
			"H_HelmetIA",
			"G_Combat",
			"optic_SOS",
			"acc_flashlight",
			"NVGoggles",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass[] = {"U_I_CombatUniform"};
		backpack = "B_Carryall_oli_Exp";
	};

};