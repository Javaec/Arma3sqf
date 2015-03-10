#include "\A3\Missions_F_EPA\Campaign_shared\cfgCharacters.hpp"

//osdLocation = "";
//osdSector = "";

class AmbientTalk
{
	shuffle = 1;

	class Default
	{
		//conversation container, usually same as the mission name
		container	= "A_hub";

		//player distance from participants
		distance 	= 6;

		//how many times the conversation can be played
		playCount	= 999;

		//classname of linked POI; empty string means no linked POI
		poi		= "";

		//condition to be met to trigger the conversation
		condStart 	= "";

		//condition for pausing the playback; checked before sentence is being played
		condPause	= "";

		//condition for ending the conversation; checked before sentence is being played
		condEnd		= "";

		//code executed when conversation is triggered
		codeStart 	= "";

		//code executed when playback is paused
		codePause	= "";

		//code executed when playback ends
		codeEnd 	= "";
	};

	class 070_ambient_talk_00:Default
	{
	};
	class 071_ambient_talk_01:Default
	{
	};
	class 072_ambient_talk_02:Default
	{
	};
	class 073_ambient_talk_03:Default
	{
	};
	class 074_ambient_talk_04:Default
	{
	};
	class 075_ambient_talk_05:Default
	{
	};
	class 076_ambient_talk_06:Default
	{
	};
	class 077_ambient_talk_07:Default
	{
	};
	class 078_ambient_talk_08:Default
	{
	};
	class 079_ambient_talk_09:Default
	{
	};
	class 080_ambient_talk_10:Default
	{
	};

	class 100_skirmish_talk_crashed_helicopter:Default
	{
		poi = "POI_CrashedHeli_03";
	};
	class 101_skirmish_talk_crashed_transport:Default
	{
		poi = "POI_AbandonedBattlefield_05";
	};
	class 104_skirmish_talk_lost_gear:Default
	{
		poi = "POI_AbandonedBattlefield_06";
	};
	class 103_skirmish_talk_firefight:Default
	{
		poi = "POI_AbandonedBattlefield_04";
	};

};

class Characters:TemplateCharacters
{
	class BIS_inf:Player
	{
		identity = "EPA_B_Kerry";
		appearance = "B_Story_Protagonist_F";
		loadout = "B_Soldier_SL_F";
	};

	class BIS_recon:Default
	{
		identity = "EPA_B_Miller";
		appearance = "B_Story_SF_Captain_F";

		primaryWeapon[] =
		{
			"none"
		};

		remove[] =
		{
			"weapons","headgear","nvgoggles"
		};
	};

	//mission giver #1
	class BIS_AlphaLead:Default
	{
		identity = "EPA_B_Conway";
		appearance = "B_soldier_TL_F";
	};

	//mission giver #2
	class BIS_BravoLead:Default
	{
		identity = "EPA_B_Lacey";
		appearance = "B_Soldier_F";

		add[] =
		{
			{"headgear", "H_Cap_blk"},
			{"uniform", "U_B_CombatUniform_mcam_tshirt"}
		};
	};

	//mission giver #3
	class BIS_CharlieLead:Default
	{
		identity = "EPA_B_Mitchell";
		appearance = "B_soldier_TL_F";
	};

	//mission giver #4 custom appearance
	class BIS_DeltaLead:Default
	{
		identity = "EPA_B_James";
		appearance = "B_CTRG_soldier_M_medic_F";
	};

	//armorer
	class BIS_Armory:Default
	{
		identity = "EPA_B_Armorer";
		appearance = "B_officer_F";

		add[] =
		{
			{"uniform","u_b_combatuniform_mcam"},
			{"vest","v_tacvest_khk"},
			{"headgear","h_bandanna_cbr"},
			{"goggles","g_squares"}
		};

		remove[] =
		{
			"weapons","nvgoggles"
		};
	};

	//CTRG guys
	class BIS_ctrgNorthgate:Default
	{
		identity = "EPA_B_Northgate";
		appearance = "B_CTRG_soldier_GL_LAT_F";
	};
	class BIS_ctrgHardy:Default
	{
		identity = "EPA_B_Hardy";
		appearance = "B_CTRG_soldier_engineer_exp_F";
	};
	/*
	class BIS_ctrgJames:Default
	{
		identity = "EPA_B_James";
		appearance = "B_CTRG_soldier_M_medic_F";
	};
	*/
	class BIS_ctrgMcKay:Default
	{
		identity = "EPA_B_McKay";
		appearance = "B_CTRG_soldier_AR_A_F";
	};

	//divers for A_m05 briefing scene
	class BIS_diver1:Default
	{
		identity = "EPA_B_A_m05_briefingDiver1";
		appearance = "B_CTRG_soldier_M_medic_F";

		remove[] =
		{
			"headgear",
			"NVGoggles"
		};

		add[] =
		{
			{"uniform", "U_B_Wetsuit"},
			{"vest", "V_RebreatherB"},
			{"goggles", "G_Diving"},
			{"backpack", "B_AssaultPack_blk"}
		};
	};
	class BIS_diver2:Default
	{
		identity = "EPA_B_A_m05_briefingDiver2";
		appearance = "B_medic_F";

		remove[] =
		{
			"headgear",
			"NVGoggles"
		};

		add[] =
		{
			{"uniform", "U_B_survival_uniform"},
			{"vest", "V_RebreatherB"},
			{"goggles", "G_Diving"},
			{"backpack", "B_AssaultPack_blk"}
		};
	};
};