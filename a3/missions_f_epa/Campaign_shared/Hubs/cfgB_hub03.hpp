#include "\A3\Missions_F_EPA\Campaign_shared\cfgCharacters.hpp"

//osdLocation = "";
//osdSector = "";

class AmbientTalk
{
	shuffle = 1;

	class Default
	{
		//conversation container, usually same as the mission name
		container	= "B_hub";

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
/*
	class 071_B_HUB_ambient_talk:Default
	{
	};
	class 072_B_HUB_ambient_talk:Default
	{
	};
	class 073_B_HUB_ambient_talk:Default
	{
	};
	class 074_B_HUB_ambient_talk:Default
	{
	};
	class 075_B_HUB_ambient_talk:Default
	{
	};
	class 076_B_HUB_ambient_talk:Default
	{
	};
	class 077_B_HUB_ambient_talk:Default
	{
	};
	class 078_B_HUB_ambient_talk:Default
	{
	};
	class 079_B_HUB_ambient_talk:Default
	{
	};
	class 080_B_HUB_ambient_talk:Default
	{
	};
	class 081_B_HUB_ambient_talk:Default
	{
	};
	class 082_B_HUB_ambient_talk:Default
	{
	};
*/
	class 200_POI_AbandonedBattlefield_01:Default
	{
		poi = "POI_AbandonedBattlefield_01";
	};
	class 201_POI_AbandonedBattlefield_02:Default
	{
		poi = "POI_AbandonedBattlefield_02";
	};
	class 202_POI_AbandonedBattlefield_03:Default
	{
		poi = "POI_AbandonedBattlefield_03";
	};
	class 203_POI_Checkpoint_01:Default
	{
		poi = "POI_Checkpoint_01";
	};
	class 204_POI_Checkpoint_02:Default
	{
		poi = "POI_Checkpoint_02";
	};
	class 205_POI_Checkpoint_03:Default
	{
		poi = "POI_Checkpoint_03";
	};
	class 206_POI_Crashed_Helicopter_01:Default
	{
		poi = "POI_CrashedHeli_01";
	};
	class 207_POI_Crashed_Helicopter_02:Default
	{
		poi = "POI_CrashedHeli_02";
	};
	class 208_POI_Crashed_Plane_01:Default
	{
		poi = "POI_CrashedPlane_01";
	};
	class 209_POI_First_Aid_01:Default
	{
		poi = "POI_FirstAid_01";
	};
	class 210_POI_First_Aid_02:Default
	{
		poi = "POI_FirstAid_02";
	};
	class 211_POI_Immobile_Armor_01:Default
	{
		poi = "POI_ImmobileArmor_01";
	};
	class 212_POI_Immobile_Armor_02:Default
	{
		poi = "POI_ImmobileArmor_02";
	};
	class 213_POI_Mysterious_Cache_01:Default
	{
		poi = "POI_MysteriousCache_01";
	};
	class 214_POI_Pilots_01:Default
	{
		poi = "POI_Pilots_01";
	};
	class 215_POI_Sniper_01:Default
	{
		poi = "POI_Sniper_01";
	};
	class 216_POI_Special_Forces_01:Default
	{
		poi = "POI_SpecialForces_01";
	};
	class 217_POI_UAV_01:Default
	{
		poi = "POI_UAV_01";
	};
	class 218_POI_Weapon_Smugglers_01:Default
	{
		poi = "POI_WeaponSmugglers_01";
	};
	class 219_POI_Weapon_Smugglers_02:Default
	{
		poi = "POI_WeaponSmugglers_02";
	};
};

class Characters:TemplateCharacters
{
	#include "\A3\Missions_F_EPA\Campaign_shared\Hubs\cfgB_hubXX_CTRG.hpp"
	#include "\A3\Missions_F_EPA\Campaign_shared\Hubs\cfgB_skirmish03.hpp"

	class BIS_Inf:Player
	{
		identity = "EPB_B_Kerry";
		appearance = "I_G_Story_Protagonist_F";
	};

	class BIS_GuerLeader:Default
	{
		identity = "EPB_I_Stavrou";
		appearance = "I_G_resistanceLeader_F";
	};

	class BIS_Nikos:Default
	{
		identity = "EPB_I_Nikos";
		appearance = "B_G_Soldier_SL_F";

		primaryWeapon[] =
		{
			{"arifle_TRG20_ACO_F", "30Rnd_556x45_Stanag", 4}
		};

		remove[] =
		{
			"weapons",
			"items",
			"goggles",
			"vest",
			"headgear"
		};

		add[] =
		{
			{"uniform", "U_BG_Guerilla3_1"},
			{"item", "FirstAidKit"}
		};
	};

	class BIS_Armory:Default
	{
		identity = "EPB_I_Armory03";
		appearance = "B_G_Soldier_exp_F";

		remove[] =
		{
			"weapons",
			"backpack",
			"headgear",
			"NVGoggles"
		};

		primaryWeapon[] =
		{
			{"LMG_Zafir_F", "150Rnd_762x51_Box_Tracer", 2}
		};

		add[] =
		{
			{"uniform", "U_IG_leader"},
			{"vest", "V_HarnessOGL_brn"},
			{"goggles", "G_Shades_Blue"},
			{"item","FirstAidKit",1,"uniform"}
		};

	};

	class BIS_HUB_Medic:Default
	{
		identity = "EPB_I_HUB_Medic";
		appearance = "B_G_medic_F";

		remove[] =
		{
			"weapons",
			"backpack",
			"goggles"
		};


		primaryWeapon[] =
		{
			{"hgun_PDW2000_F", "30Rnd_9x21_Mag", 6}
		};

		add[] = {
			{"uniform", "U_BG_Guerilla2_2"},
			{"vest", "V_BandollierB_oli"},
			{"headgear", "H_Bandanna_sgg"},
			{"item","FirstAidKit",1,"uniform"}
		};
	};

	class BIS_HUB_Officer:Default
	{
		identity = "EPB_I_HUB_Officer";
		appearance = "B_G_officer_F";

		remove[] =
		{
			"weapons",
			"goggles"
		};

		primaryWeapon[] =
		{
			{"SMG_02_ACO_F", "30Rnd_9x21_Mag", 4}
		};

		add[] =
		{
			{"uniform", "U_IG_leader"},
			{"headgear", "H_Watchcap_blk"},
			{"vest", "V_Rangemaster_belt"},
			{"item","FirstAidKit",1,"uniform"}
		};

	};

	class BIS_HUB_RepairSpecialist:Default
	{
		identity = "EPB_I_HUB_RepairSpecialist";
		appearance = "B_soldier_repair_F";

		remove[] =
		{
			"weapons",
			"backpack",
			"NVGoggles"
		};

		primaryWeapon[] =
		{
			{"SMG_02_F", "30Rnd_9x21_Mag", 4}
		};

		add[] =
		{
			{"uniform", "U_C_WorkerCoveralls"},
			{"vest", "V_BandollierB_rgr"},
			{"goggles", "G_Lowprofile"},
			{"headgear", "H_Cap_headphones"},
			{"item","FirstAidKit",1,"uniform"}
		};
	};

	class BIS_HUB_Sniper:Default
	{
		identity = "EPB_I_HUB_Sniper";
		appearance = "B_sniper_F";

		remove[] =
		{
			"weapons",
			"backpack",
			"goggles",
			"NvGoggles"
		};

		primaryWeapon[] =
		{
			{"srifle_LRR_LRPS_F", "7Rnd_408_Mag", 6}
		};

		add[] =
		{
			{"uniform", "U_IG_Guerilla2_3"},
			{"vest", "V_PlateCarrier1_blk"},
			{"headgear", "H_Watchcap_blk"},
			{"item","FirstAidKit",1,"uniform"},
			{"backpack", "B_AssaultPack_blk"}
		};
	};

	//BIS_HUB_AT
	class BIS_FullStart_B_out:Default
	{
		identity = "EPB_I_HUB_AT";
		appearance = "B_G_Soldier_LAT_F";

		remove[] =
		{
			"weapons",
			"backpack",
			"goggles",
			"headgear"
		};

		primaryWeapon[] =
		{
			{"arifle_Mk20C_ACO_F", "30Rnd_556x45_Stanag", 4}
		};

		add[] =
		{
			{"uniform", "U_BG_Guerilla1_1"},
			{"vest", "V_PlateCarrierIA1_dgtl"},
			{"item","FirstAidKit",1,"uniform"},
			{"weapon","launch_NLAW_F",1},
			{"magazines","NLAW_F",1}
		};
	};
};