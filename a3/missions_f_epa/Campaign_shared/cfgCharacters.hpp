class TemplateCharacters
{
	templates[] = {"Default","Player","PlayerC_PersistentGear","PlayerC_DefaultGear","Squad","OtherSquad","Joined","JoinedNP","UnJoined","Skirmish"};

	//parent template class, used as template for other templates
	//local, mission specific, non-pooled units; gear set according to the config & NOT stored
	//used for mission/hub specific ambient/story units, not transfering between missions
	class Default
	{
		identity 		= "";			//"EPA_B_Kerry"
		appearance 		= "B_diver_F";		//uniform, vest, headgear, goggles
		loadout 		= "appearance";		//everything minus appearance (see above)

		skirmish 		= 0;			//is it a skirmish squad member?
		refreshIdentity		= 0;			//identity is not auto-refreshed on mission start

		adjustMagazines 	= 0;
		adjustArmory		= 0;			//used in hub intros to control if unit's gear should be present in armory composition or not

		class GearMission
		{
			loadGear   	= 4;			//load from description.ext, but don't touch the pool
			saveGear   	= 0;			//don't save
		};
		class GearHub
		{
			loadGear   	= 4;			//load from description.ext, but don't touch the pool
			saveGear        = 0;            	//don't save
		};

		class HubPresence
		{
			briefing 	= 0;			//1 = present on mission briefing
			assemble 	= 0;			//1 = present on hub -> mission exfil (walking to assembly point)
			return   	= 0;			//1 = present on mission intro (walking to hub)
		};

		//primary weapon priorities
		primaryWeapon[] =
		{
			"default"				//{"arifle_MX_Hamr_pointer_F","30Rnd_65x39_caseless_mag",8},...
		};

		//secondary weapon priorities
		secondaryWeapon[] =
		{
			"default"
		};

		//handgun priorities
		handgun[] =
		{
			"default"
		};



		/*----------------------------------------------------------------------------------

			Remove definition examples:
			---------------------------
			"weapons", 	- removes all weapons
			"items", 	- removel all items

			"map","compass","watch","radio","nvgoggles","gps","firstaidkit",
			"binocular",
			"uniform","vest","backpack","headgear","goggles"
			{"magazine","apersboundingmine_range_mag",3},
			{"magazine","handgrenade",9}

		------------------------------------------------------------------------------------*/
		remove[] =
		{
		};



		/*----------------------------------------------------------------------------------

			Add definition examples:
			------------------------
			"map","compass","watch","radio","nvgoggles","gps",		//itemclass
			{"uniform","u_b_combatuniform_mcam_vest"},
			{"vest","v_platecarrier1_cbr"},
			{"backpack","b_fieldpack_oucamo"},
			{"headgear","h_helmetb"},
			{"goggles","g_shades_black"},
			{"magazine","apersboundingmine_range_mag",3,"backpack"},	//[itemType,itemClass,itemCount(default:1),container(default:first available)]

			{"backpack","b_fieldpack_oucamo"},
			{"item","radio",1,"backpack"},
			{"magazine","satchel",{3,5},"backpack"},
			{"magazine","handgrenade",{0,4}}

			{"magazine","30rnd_65x39_caseless_mag",20,"backpack"},
			{"uniform","u_b_combatuniform_mcam_vest"},
			{"backpack","b_fieldpack_oucamo"},
			{"weapon","arifle_mx_aco_pointer_f",3,"backpack"},
			{"item","radio",20,"backpack"},
			{"item","map",7,""},
			{"uniform","u_b_combatuniform_mcam_vest",2,""},
			{"headgear","h_helmetb",7,"backpack"},
			{"vest","v_platecarrier1_cbr"},
			{"backpack","b_fieldpack_oucamo"},
			{"magazine","handgrenade",2}

		------------------------------------------------------------------------------------*/
		add[] =
		{
		};

		required[] =
		{
		};
	};

	//player
	class Player:Default
	{
		adjustMagazines = 1;
		adjustArmory	= 1;

		class GearMission
		{
			loadGear   	= 2;		//loadStatus, but don't touch the pool
			saveGear   	= 1;		//saveStatus & add gear to pool
		};
		class GearHub
		{
			loadGear   	= 2;		//loadStatus, but don't touch the pool
			saveGear        = 2;            //saveStatus & remove gear from pool
		};

		class HubPresence
		{
			briefing 	= 1;
			assemble 	= 1;
			return   	= 1;
		};
	};

	//player's squad; gear is pooled
	//eg.: player's squad in stage B
	class Squad:Default
	{
		adjustMagazines 	= 1;
		adjustArmory		= 0;

		class GearMission
		{
			loadGear   	= 2;		//loadStatus, but don't touch the pool
			saveGear   	= 1;		//saveStatus & add gear to pool
		};
		class GearHub
		{
			loadGear   	= 2;		//loadStatus, but don't touch the pool
			saveGear        = 2;            //saveStatus & remove gear from pool
		};

		class HubPresence
		{
			briefing 	= 1;
			assemble 	= 1;
			return   	= 1;
		};
	};

	class Skirmish:Default
	{
		adjustMagazines 	= 1;
		adjustArmory		= 0;

		skirmish 		= 1;

		class GearMission
		{
			loadGear   	= 3;		//load from description.ext and subtract from the pool
			saveGear   	= 3;		//add gear to pool
		};
		class GearHub
		{
			loadGear   	= 4;		//load from description.ext, but don't touch the pool
			saveGear        = 0;            //don't save
		};

		class HubPresence
		{
			briefing 	= 0;
			assemble 	= 0;
			return   	= 0;
		};
	};

	//non-pooled units; gear set according to the config & stored only via saveStatus
	//eg.: other squads going to mission or player's squad in stage A
	class OtherSquad:Default
	{
		adjustMagazines = 0;
		adjustArmory	= 0;

		class GearMission
		{
			loadGear   	= 4;		//load from description.ext, but don't touch the pool
			saveGear   	= 5;		//saveStatus (only)
		};
		class GearHub
		{
			loadGear   	= 2;		//loadStatus, but don't touch the pool
			saveGear        = 0;            //don't save
		};

		class HubPresence
		{
			briefing 	= 1;
			assemble 	= 1;
			return   	= 1;
		};
	};

	//units that are NOT on hub, but later in the mission join-in
	class Joined:Default
	{
		adjustMagazines = 0;
		adjustArmory	= 0;
		refreshIdentity	= 1;			//identity is auto-refreshed on mission start

		class GearMission
		{
			loadGear   	= 4;		//load from description.ext, but don't touch the pool
			saveGear   	= 1;		//saveStatus & add gear to pool
		};
		class GearHub
		{
			loadGear   	= 2;		//loadStatus, but don't touch the pool
			saveGear        = 0;            //don't save
		};

		class HubPresence
		{
			briefing 	= 0;
			assemble 	= 0;
			return   	= 1;
		};
	};
	class JoinedNP:Joined
	{
		class GearMission
		{
			loadGear   	= 4;		//load from description.ext, but don't touch the pool
			saveGear   	= 5;		//saveStatus (only)
		};
		class GearHub
		{
			loadGear   	= 2;		//loadStatus, but don't touch the pool
			saveGear        = 0;            //don't save
		};
	};

	//units that are on hub and start with player, but do not return
	class UnJoined:Default
	{
		adjustMagazines = 0;
		adjustArmory	= 0;

		class GearMission
		{
			loadGear   	= 2;		//loadStatus, but don't touch the pool
			saveGear   	= 5;            //saveStatus (only)
		};
		class GearHub
		{
			loadGear   	= 2;		//loadStatus, but don't touch the pool
			saveGear        = 5;            //saveStatus (only)
		};

		class HubPresence
		{
			briefing 	= 1;
			assemble 	= 1;
			return   	= 0;
		};
	};

	/*----------------------------------------------------------------------------------------------------------------------------------

		STAGE C SPECIFIC TEMPLATES

	----------------------------------------------------------------------------------------------------------------------------------*/

	//player starts with the gear from previous mission
	class PlayerC_PersistentGear:Player
	{
		adjustMagazines = 0;

		class GearMission
		{
			loadGear   	= 2;		//loadStatus (only)
			saveGear   	= 5;		//saveStatus (only)
		};
		class GearHub
		{
			loadGear   	= 2;		//loadStatus (only)
			saveGear        = 5;            //saveStatus (only)
		};

		class HubPresence
		{
			briefing 	= 1;
			assemble 	= 1;
			return   	= 1;
		};

		add[] = {
			{"uniform", "U_B_CombatUniform_mcam_vest"},
			{"backpack", "B_AssaultPack_Kerry"}
		};
	};

	//player's gear get reset to given mission default
	class PlayerC_DefaultGear:Player
	{
		adjustMagazines = 0;

		class GearMission
		{
			loadGear   	= 3;		//load from description.ext & subtract from the pool
			saveGear   	= 1;		//saveStatus & add gear to pool
		};
		class GearHub
		{
			loadGear   	= 2;		//loadStatus (only)
			saveGear        = 5;            //saveStatus (only)
		};

		class HubPresence
		{
			briefing 	= 1;
			assemble 	= 1;
			return   	= 1;
		};

		add[] = {
			{"uniform", "U_B_CombatUniform_mcam_vest"},
			{"backpack", "B_AssaultPack_Kerry"}
		};
	};

	//player for stage C
	class PlayerC:Player
	{
		adjustMagazines = 1;
		adjustArmory	= 1;

		class GearMission
		{
			loadGear   	= 2;		//loadStatus, but don't touch the pool
			saveGear   	= 1;		//saveStatus & add gear to pool
		};
		class GearHub
		{
			loadGear   	= 2;		//loadStatus, but don't touch the pool
			saveGear        = 2;            //saveStatus & remove gear from pool
		};

		class HubPresence
		{
			briefing 	= 1;
			assemble 	= 1;
			return   	= 1;
		};

		add[] = {
			{"uniform", "U_B_CombatUniform_mcam_vest"},
			{"backpack", "B_AssaultPack_Kerry"}
		};
	};
};