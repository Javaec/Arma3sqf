class POIs
{
	/*--------------------------------------------------------------------------------------------------

		TEMPLATES

	--------------------------------------------------------------------------------------------------*/

	templates[] = {"POI","POI_AbandonedBattlefield","POI_Checkpoint", "POI_CrashedHeli", "POI_CrashedPlane", "POI_FirstAid", "POI_ImmobileArmor", "POI_MysteriousCache", "POI_Pilots", "POI_Sniper", "POI_SpecialForces", "POI_UAV", "POI_WeaponSmugglers"};

	class POI
	{
		center = "auto";	//poi center, auto: <poi_classname>_center
		size = 100;		//poi size (radius from poi center)
		detection = 300;	//poi detection distance (radius from poi center)

		player = "auto";	//poi observer, auto: <poi_classname>_player; will be deleted
		linked[] = {};

		type = "Unknown";

		doneConv = "";		//short conversation played when poi is completed
		doneCond = "false";	//condition to complete the poi

		class Zone
		{
			position[] = {100,100};
			proportions[] = {100,200};
			dir = 45;
			icon = "hd_unknown";			//use "hd_unknown","hd_objective"
		};

		class Task
		{
			title = "TASK_TITLE";
			description = "TASK_DESCRIPTION";
		};
	};

	class POI_AbandonedBattlefield:POI
	{
		type = "AbandonedBattlefield";

		class Zone:Zone
		{
			icon = "hd_objective";
			proportions[] = {};
		};

		class Task:Task
		{
		};
	};

	class POI_Checkpoint:POI
	{
		type = "Checkpoint";
		doneCond = "{alive _x} count _enemies == 0";

		class Zone:Zone
		{
			icon = "hd_objective";
			proportions[] = {};
		};

		class Task:Task
		{
		};
	};

	class POI_CrashedHeli:POI
	{
		type = "CrashedHeli";

		class Zone:Zone
		{
			icon = "hd_objective";
			proportions[] = {};
		};

		class Task:Task
		{
		};
	};

	class POI_CrashedPlane:POI
	{
		type = "CrashedPlane";

		class Zone:Zone
		{
			icon = "hd_objective";
			proportions[] = {};
		};

		class Task:Task
		{
		};
	};

	class POI_FirstAid:POI
	{
		type = "FirstAid";

		class Zone:Zone
		{
			icon = "hd_unknown";
			proportions[] = {};
		};

		class Task:Task
		{
		};
	};

	class POI_ImmobileArmor:POI
	{
		type = "ImmobileArmor";

		class Zone:Zone
		{
			icon = "hd_objective";
			proportions[] = {};
		};

		class Task:Task
		{
		};
	};

	class POI_MysteriousCache:POI
	{
		type = "MysteriousCache";

		class Zone:Zone
		{
			icon = "hd_objective";
			proportions[] = {};
		};

		class Task:Task
		{
		};
	};

	class POI_Pilots:POI
	{
		type = "Pilots";

		class Zone:Zone
		{
			icon = "hd_objective";
			proportions[] = {};
		};

		class Task:Task
		{
		};
	};

	class POI_Sniper:POI
	{
		type = "Sniper";

		class Zone:Zone
		{
			icon = "hd_objective";
			proportions[] = {};
		};

		class Task:Task
		{
		};
	};

	class POI_SpecialForces:POI
	{
		type = "SpecialForces";

		class Zone:Zone
		{
			icon = "hd_objective";
			proportions[] = {};
		};

		class Task:Task
		{
		};
	};

	class POI_UAV:POI
	{
		type = "UAV";

		class Zone:Zone
		{
			icon = "hd_objective";
			proportions[] = {};
		};

		class Task:Task
		{
		};
	};

	class POI_WeaponSmugglers:POI
	{
		type = "WeaponSmugglers";

		class Zone:Zone
		{
			icon = "hd_objective";
			proportions[] = {};
		};

		class Task:Task
		{
		};
	};

	/*--------------------------------------------------------------------------------------------------

		POI: ABANDONED BATTLEFIELD

	--------------------------------------------------------------------------------------------------*/

	class POI_AbandonedBattlefield_01:POI_AbandonedBattlefield
	{
		linked[] = {"B_hub01","B_skirmish01"};

		size = 750;
		detection = 125;

		doneConv = "300_POI_Abandoned_Battlefield_01_Player";
		doneCond = "BIS_inf distance BIS_POI_AbandonedBattlefield_01_center < 75";

		class Zone
		{
			position[] = {2874,19975};
			proportions[] = {100,100};
			dir = 0;
			icon = "hd_objective";
		};

		class Task
		{
			title = $STR_A3_POI_Abandoned_Battlefield_01_Task_name;
			description = $STR_A3_POI_Abandoned_Battlefield_01_Task_desc;
		};
	};

	class POI_AbandonedBattlefield_02:POI_AbandonedBattlefield
	{
		linked[] = {"B_hub01","B_skirmish01"};

		size = 350;
		detection = 125;

		doneConv = "301_POI_Abandoned_Battlefield_02_Player";
		doneCond = "BIS_inf distance BIS_POI_AbandonedBattlefield_02_center < 25";

		class Zone
		{
			position[] = {5833,20084};
			proportions[] = {75,75};
			dir = 0;
			icon = "hd_objective";
		};

		class Task
		{
			title = $STR_A3_POI_Abandoned_Battlefield_02_Task_name;
			description = $STR_A3_POI_Abandoned_Battlefield_02_Task_desc;
		};
	};

	class POI_AbandonedBattlefield_03:POI_AbandonedBattlefield
	{
		linked[] = {"B_hub02","B_skirmish02"};

		size = 275;
		detection = 150;

		doneConv = "302_POI_Abandoned_Battlefield_03_Player";
		doneCond = "(BIS_inf distance BIS_POI_AbandonedBattlefield_03_Marid < 50)";

		class Zone
		{
			position[] = {3764,17700};
			proportions[] = {75,75};
			dir = 0;
			icon = "hd_objective";
		};

		class Task
		{
			title = $STR_A3_POI_Abandoned_Battlefield_03_Task_name;
			description = $STR_A3_POI_Abandoned_Battlefield_03_Task_desc;
		};
	};

	class POI_AbandonedBattlefield_04:POI_AbandonedBattlefield
	{
		linked[] = {"A_hub01","A_skirmish01"};

		size = 200;
		detection = 350;

		doneConv[] = {"319_POI_Weapon_Smugglers_02_Player","B"};
		doneCond = "((BIS_inf distance BIS_POI_AbandonedBattlefield_04_center < 25) and ({alive _x} count _enemies == 0))";

		class Zone
		{
			position[] = {4213,2699};
			proportions[] = {75,75};
			dir = 0;
			icon = "mil_unknown";
		};

		class Task
		{
			title = $STR_A3_POI_Abandoned_Battlefield_04_Task_name;
			description = $STR_A3_POI_Abandoned_Battlefield_04_Task_desc;
		};
	};

	class POI_AbandonedBattlefield_05:POI_AbandonedBattlefield
	{
		linked[] = {"A_hub01","A_skirmish01"};

		size = 100;
		detection = 250;

		doneConv[] = {"316_POI_Special_Forces_01_Player","B"};
		doneCond = "((BIS_inf distance BIS_POI_AbandonedBattlefield_05_center < 25) and ({alive _x} count _enemies == 0))";

		class Zone
		{
			position[] = {3345,4430};
			proportions[] = {15,15};
			dir = 0;
			icon = "mil_objective";
		};

		class Task
		{
			title = $STR_A3_POI_Abandoned_Battlefield_05_Task_name;
			description = $STR_A3_POI_Abandoned_Battlefield_05_Task_desc;
		};
	};

	class POI_AbandonedBattlefield_06:POI_AbandonedBattlefield
	{
		linked[] = {"A_hub02","A_skirmish02"};

		size = 200;
		detection = 450;

		doneConv[] = {"306_POI_Crashed_Helicopter_01_Player","B"};
		doneCond = "(BIS_inf distance BIS_POI_AbandonedBattlefield_06_center < 50) and ({alive _x} count _enemies == 0)";

		class Zone
		{
			position[] = {4359,3803};
			proportions[] = {50,50};
			dir = 0;
			icon = "mil_objective";
		};

		class Task
		{
			title = $STR_A3_POI_Abandoned_Battlefield_06_Task_name;
			description = $STR_A3_POI_Abandoned_Battlefield_06_Task_desc;
		};
	};

	/*--------------------------------------------------------------------------------------------------

		POI: CHECKPOINT

	--------------------------------------------------------------------------------------------------*/

	class POI_Checkpoint_01:POI_Checkpoint
	{
		linked[] = {"B_hub01","B_skirmish01"};

		size = 175;
		detection = 400;

		doneConv = "303_POI_Checkpoint_01_Player";

		class Zone
		{
			position[] = {6870,22179};
			proportions[] = {25,25};
			dir = 0;
			icon = "hd_objective";
		};

		class Task
		{
			title = $STR_A3_POI_Checkpoint_01_Task_name;
			description = $STR_A3_POI_Checkpoint_01_Task_desc;
		};
	};

	class POI_Checkpoint_02:POI_Checkpoint
	{
		linked[] = {"B_hub02","B_skirmish02"};

		size = 150;
		detection = 500;

		doneConv = "304_POI_Checkpoint_02_Player";

		class Zone
		{
			position[] = {4314,16569};
			proportions[] = {60,60};
			dir = 0;
			icon = "hd_objective";
		};

		class Task
		{
			title = $STR_A3_POI_Checkpoint_02_Task_name;
			description = $STR_A3_POI_Checkpoint_02_Task_desc;
		};
	};

	class POI_Checkpoint_03:POI_Checkpoint
	{
		linked[] = {"B_hub02","B_skirmish02"};

		size = 375;
		detection = 300;

		doneConv = "305_POI_Checkpoint_03_Player";

		class Zone
		{
			position[] = {7271,17836};
			proportions[] = {40,40};
			dir = 0;
			icon = "hd_objective";
		};

		class Task
		{
			title = $STR_A3_POI_Checkpoint_03_Task_name;
			description = $STR_A3_POI_Checkpoint_03_Task_desc;
		};
	};

	/*--------------------------------------------------------------------------------------------------

		POI: CRASHED HELI

	--------------------------------------------------------------------------------------------------*/

	class POI_CrashedHeli_01:POI_CrashedHeli
	{
		linked[] = {"B_hub02","B_skirmish02"};

		size = 800;
		detection = 50;

		doneConv = "306_POI_Crashed_Helicopter_01_Player";
		doneCond = "(BIS_inf distance BIS_POI_CrashedHeli_01_Hellcat < 25)";

		class Zone
		{
			position[] = {10429,17725};
			proportions[] = {750,750};
			dir = 0;
			icon = "hd_unknown";
		};

		class Task
		{
			title = $STR_A3_POI_Crashed_Heli_01_Task_name;
			description = $STR_A3_POI_Crashed_Heli_01_Task_desc;
		};
	};

	class POI_CrashedHeli_02:POI_CrashedHeli
	{
		linked[] = {"B_hub02","B_skirmish02"};

		size = 700;
		detection = 40;

		doneConv = "307_POI_Crashed_Helicopter_02_Player";
		doneCond = "(BIS_inf distance BIS_POI_CrashedHeli_02_Kajman < 20)";

		class Zone
		{
			position[] = {7710,20034};
			proportions[] = {500,500};
			dir = 0;
			icon = "hd_unknown";
		};

		class Task
		{
			title = $STR_A3_POI_Crashed_Heli_02_Task_name;
			description = $STR_A3_POI_Crashed_Heli_02_Task_desc;
		};
	};

	class POI_CrashedHeli_03:POI_CrashedHeli
	{
		linked[] = {"A_hub01","A_skirmish01"};

		size = 150;
		detection = 250;

		doneConv[] = {"311_POI_Immobile_Armor_01_Player","B"};
		doneCond = "((BIS_inf distance BIS_POI_CrashedHeli_03_Mohawk < 25) and ({alive _x} count _enemies == 0))";

		class Zone
		{
			position[] = {3079,4173};
			proportions[] = {200,200};
			dir = 0;
			icon = "mil_unknown";
		};

		class Task
		{
			title = $STR_A3_POI_Crashed_Heli_03_Task_name;
			description = $STR_A3_POI_Crashed_Heli_03_Task_desc;
		};
	};

	/*--------------------------------------------------------------------------------------------------

		POI: CRASHED PLANE

	--------------------------------------------------------------------------------------------------*/

	class POI_CrashedPlane_01:POI_CrashedPlane
	{
		linked[] = {"B_hub01","B_skirmish01"};

		size = 700;
		detection = 10;

		doneConv = "308_POI_Crashed_Plane_01_Player";
		doneCond = "(BIS_inf distance BIS_POI_CrashedPlane_01_Pilot < 10)";

		class Zone
		{
			position[] = {5051,19547};
			proportions[] = {500,500};
			dir = 0;
			icon = "hd_unknown";
		};

		class Task
		{
			title = $STR_A3_POI_Crashed_Plane_01_Task_name;
			description = $STR_A3_POI_Crashed_Plane_01_Task_desc;
		};
	};

	/*--------------------------------------------------------------------------------------------------

		POI: FIRST AID

	--------------------------------------------------------------------------------------------------*/

	class POI_FirstAid_01:POI_FirstAid
	{
		linked[] = {"B_hub01","B_skirmish01"};

		size = 200;
		detection = 100;

		doneConv = "309_POI_First_Aid_01_Player";
		doneCond = "({_x == 'medikit'} count _items > 0 || {_x == 'firstaidkit'} count _items > 6) and (BIS_inf distance BIS_POI_FirstAid_01_center < 25)";

		class Zone
		{
			position[] = {4579,21389};
			proportions[] = {100,100};
			dir = 0;
			icon = "hd_unknown";
		};

		class Task
		{
			title = $STR_A3_POI_First_Aid_01_Task_name;
			description = $STR_A3_POI_First_Aid_01_Task_desc;
		};
	};

	class POI_FirstAid_02:POI_FirstAid
	{
		linked[] = {"B_hub02","B_skirmish02"};

		size = 675;
		detection = 100;

		doneConv = "310_POI_First_Aid_02_Player";
		doneCond = "({_x == 'medikit'} count _items > 0 || {_x == 'firstaidkit'} count _items > 6) and (BIS_inf distance BIS_POI_FirstAid_02_center < 10)";

		class Zone
		{
			position[] = {2957,18525};
			proportions[] = {15,15};
			dir = 0;
			icon = "hd_objective";
		};

		class Task
		{
			title = $STR_A3_POI_First_Aid_02_Task_name;
			description = $STR_A3_POI_First_Aid_02_Task_desc;
		};
	};

	/*--------------------------------------------------------------------------------------------------

		POI: IMMOBILE ARMOR

	--------------------------------------------------------------------------------------------------*/

	class POI_ImmobileArmor_01:POI_ImmobileArmor
	{
		linked[] = {"B_hub02","B_skirmish02"};

		size = 150;
		detection = 350;

		doneConv = "311_POI_Immobile_Armor_01_Player";
		doneCond = "{alive _x} count [BIS_POI_ImmobileArmor_01_Crew_01, BIS_POI_ImmobileArmor_01_Crew_02, BIS_POI_ImmobileArmor_01_Crew_03] == 0";

		class Zone
		{
			position[] = {7393,17166};
			proportions[] = {40,40};
			dir = 0;
			icon = "hd_objective";
		};

		class Task
		{
			title = $STR_A3_POI_Immobilized_Armor_01_Task_name;
			description = $STR_A3_POI_Immobilized_Armor_01_Task_desc;
		};
	};

	class POI_ImmobileArmor_02:POI_ImmobileArmor
	{
		linked[] = {"B_hub02","B_skirmish02"};

		size = 150;
		detection = 250;

		doneConv = "312_POI_Immobile_Armor_02_Player";
		doneCond = "{alive _x} count [BIS_POI_ImmobileArmor_02_Crew_01, BIS_POI_ImmobileArmor_02_Crew_02, BIS_POI_ImmobileArmor_02_Crew_03] == 0";

		class Zone
		{
			position[] = {10825,18963};
			proportions[] = {40,40};
			dir = 0;
			icon = "hd_objective";
		};

		class Task
		{
			title = $STR_A3_POI_Immobilized_Armor_02_Task_name;
			description = $STR_A3_POI_Immobilized_Armor_02_Task_desc;
		};
	};

	/*--------------------------------------------------------------------------------------------------

		POI: MYSTERIOUS CACHE

	--------------------------------------------------------------------------------------------------*/

	class POI_MysteriousCache_01:POI_MysteriousCache
	{
		linked[] = {"B_hub03","B_skirmish03"};

		size = 2000;
		detection = 30;

		doneConv = "313_POI_Mysterious_Cache_01_Player";
		doneCond = "BIS_inf distance BIS_POI_MysteriousCache_01_BoxLaunchers < 5";

		class Zone
		{
			position[] = {13474,12012};
			proportions[] = {600,200};
			dir = 305;
			icon = "hd_unknown";
		};

		class Task
		{
			title = $STR_A3_POI_Mysterious_Cache_01_Task_name;
			description = $STR_A3_POI_Mysterious_Cache_01_Task_desc;
		};
	};

	/*--------------------------------------------------------------------------------------------------

		POI: PILOTS

	--------------------------------------------------------------------------------------------------*/

	class POI_Pilots_01:POI_Pilots
	{
		linked[] = {"B_hub03","B_skirmish03"};

		size = 1000;
		detection = 100;

		doneConv = "314_POI_Pilots_01_Player";
		doneCond = "{alive _x} count [BIS_POI_Pilots_01_Pilot_01, BIS_POI_Pilots_01_Pilot_02, BIS_POI_Pilots_01_Pilot_03] == 0";

		class Zone
		{
			position[] = {3602,11568};
			proportions[] = {35,35};
			dir = 0;
			icon = "hd_objective";
		};

		class Task
		{
			title = $STR_A3_POI_Pilots_01_Task_name;
			description = $STR_A3_POI_Pilots_01_Task_desc;
		};
	};

	/*--------------------------------------------------------------------------------------------------

		POI: SNIPER

	--------------------------------------------------------------------------------------------------*/

	class POI_Sniper_01:POI_Sniper
	{
		linked[] = {"B_hub02","B_skirmish02"};

		size = 350;
		detection = 325;

		doneConv = "315_POI_Sniper_01_Player";
		doneCond = "{alive _x} count [BIS_POI_Sniper_01_Sniper_01, BIS_POI_Sniper_01_Sniper_02, BIS_POI_Sniper_01_Sniper_03, BIS_POI_Sniper_01_Sniper_04] == 0";

		class Zone
		{
			position[] = {6178,16244};
			proportions[] = {275,150};
			dir = 0;
			icon = "hd_unknown";
		};

		class Task
		{
			title = $STR_A3_POI_Sniper_01_Task_name;
			description = $STR_A3_POI_Sniper_01_Task_desc;
		};
	};

	/*--------------------------------------------------------------------------------------------------

		POI: SPECIAL FORCES

	--------------------------------------------------------------------------------------------------*/

	class POI_SpecialForces_01:POI_SpecialForces
	{
		linked[] = {"B_hub02","B_skirmish02"};

		size = 500;
		detection = 350;

		doneConv = "316_POI_Special_Forces_01_Player";
		doneCond = "{alive _x} count [BIS_POI_SpecialForces_01_SF_01_01, BIS_POI_SpecialForces_01_SF_01_02, BIS_POI_SpecialForces_01_SF_02_01, BIS_POI_SpecialForces_01_SF_02_02, BIS_POI_SpecialForces_01_SF_03_01, BIS_POI_SpecialForces_01_SF_03_02, BIS_POI_SpecialForces_01_SF_04_01, BIS_POI_SpecialForces_01_SF_04_02, BIS_POI_SpecialForces_01_SF_05_01, BIS_POI_SpecialForces_01_SF_05_02, BIS_POI_SpecialForces_01_SF_06_01, BIS_POI_SpecialForces_01_SF_06_02] == 0";

		class Zone
		{
			position[] = {8616,18250};
			proportions[] = {300,300};
			dir = 0;
			icon = "hd_unknown";
		};

		class Task
		{
			title = $STR_A3_POI_Special_Forces_01_Task_name;
			description = $STR_A3_POI_Special_Forces_01_Task_desc;
		};
	};

	/*--------------------------------------------------------------------------------------------------

		POI: UAV

	--------------------------------------------------------------------------------------------------*/

	class POI_UAV_01:POI_UAV
	{
		linked[] = {"B_hub02","B_skirmish02"};

		size = 125;
		detection = 200;

		doneConv = "317_POI_UAV_01_Player";
		doneCond = "{alive _x} count [BIS_POI_UAV_01_SF_01, BIS_POI_UAV_01_SF_02, BIS_POI_UAV_01_SF_03, BIS_POI_UAV_01_SF_04] == 0";

		class Zone
		{
			position[] = {5863,16906};
			proportions[] = {325,325};
			dir = 0;
			icon = "hd_unknown";
		};

		class Task
		{
			title = $STR_A3_POI_UAV_01_Task_name;
			description = $STR_A3_POI_UAV_01_Task_desc;
		};
	};

	/*--------------------------------------------------------------------------------------------------

		POI: WEAPON SMUGGLERS

	--------------------------------------------------------------------------------------------------*/

	class POI_WeaponSmugglers_01:POI_WeaponSmugglers
	{
		linked[] = {"B_hub02","B_skirmish02"};

		size = 150;
		detection = 150;

		doneConv = "318_POI_Weapon_Smugglers_01_Player";
		doneCond = "{alive _x} count [BIS_POI_WeaponSmugglers_01_Smuggler_01, BIS_POI_WeaponSmugglers_01_Smuggler_02, BIS_POI_WeaponSmugglers_01_Smuggler_03, BIS_POI_WeaponSmugglers_01_Smuggler_04, BIS_POI_WeaponSmugglers_01_Smuggler_05, BIS_POI_WeaponSmugglers_01_Smuggler_06, BIS_POI_WeaponSmugglers_01_Smuggler_07] == 0";

		class Zone
		{
			position[] = {7435,18735};
			proportions[] = {600,600};
			dir = 0;
			icon = "hd_unknown";
		};

		class Task
		{
			title = $STR_A3_POI_Weapon_Smugglers_01_Task_name;
			description = $STR_A3_POI_Weapon_Smugglers_01_Task_desc;
		};
	};

	class POI_WeaponSmugglers_02:POI_WeaponSmugglers
	{
		linked[] = {"B_hub03","B_skirmish03"};

		size = 1400;
		detection = 200;

		doneConv = "319_POI_Weapon_Smugglers_02_Player";
		doneCond = "{alive _x} count [BIS_POI_WeaponSmugglers_02_Smuggler_01, BIS_POI_WeaponSmugglers_02_Smuggler_02, BIS_POI_WeaponSmugglers_02_Smuggler_03, BIS_POI_WeaponSmugglers_02_Smuggler_04, BIS_POI_WeaponSmugglers_02_Smuggler_05, BIS_POI_WeaponSmugglers_02_Smuggler_06, BIS_POI_WeaponSmugglers_02_Smuggler_07, BIS_POI_WeaponSmugglers_02_Smuggler_08, BIS_POI_WeaponSmugglers_02_Smuggler_09] == 0";

		class Zone
		{
			position[] = {6741,10784};
			proportions[] = {1200,750};
			dir = 345;
			icon = "hd_unknown";
		};

		class Task
		{
			title = $STR_A3_POI_Weapon_Smugglers_02_Task_name;
			description = $STR_A3_POI_Weapon_Smugglers_02_Task_desc;
		};
	};
};