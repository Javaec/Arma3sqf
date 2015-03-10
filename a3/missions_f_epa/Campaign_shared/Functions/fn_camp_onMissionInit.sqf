/*
	Author: Jiri Wainar

	Description:
	* Initialize Hub systems.
	* Trigger loading persistent stuff.
	* Handle timeflow.
*/

BIS_printPerVariables =
{
	{
		["[i] %1: %2",_x,missionNamespace getVariable [_x,"*** NOT DEFINED ***"]] call BIS_fnc_logFormat;
	}
	forEach
	[
		"bis_per_intel",
		"bis_per_prevmission",
		"bis_per_phase",
		"bis_per_step",
		"bis_per_destroyedworldobjects",
		"bis_per_missionsdone",
		"bis_per_missionsque",
		"bis_per_ident_main",
		"bis_per_ident_killed",
		"bis_per_ident_survived",
		"bis_per_ident_return",
		"bis_per_ident_freenamesvo",
		"bis_per_ident_freenames",
		"bis_per_pool_magazine",
		"bis_per_pool_attachment",
		"bis_per_pool_item",
		"bis_per_pool_uniform",
		"bis_per_pool_vest",
		"bis_per_pool_backpack",
		"bis_per_pool_headgear",
		"bis_per_pool_goggles",
		"bis_per_pool_weapon",
		"bis_per_skirmish_squadpool",
		"bis_per_skirmish_vehicle",
		"bis_per_skirmish_pos",
		"bis_per_skirmish_dir",
		"bis_per_skirmish_crew"
	];
};

private["_isCampaingMission"];

_isCampaingMission = getNumber (missionconfigfile >> "enableCampaignSystems");

if (isNil "_isCampaingMission") exitWith
{
	["[!] Mission '%1' is not allowed for campaign systems!",missionName] call BIS_fnc_logFormat;
};
if (_isCampaingMission != 1) exitWith
{
	["[!] Mission '%1' is not allowed for campaign systems!",missionName] call BIS_fnc_logFormat;
};

if (isMultiplayer) exitWith
{
	["Hub systems are not multiplayer compatible!"] call BIS_fnc_error;
};

BIS_fnc_camp_onMissionInit_completed = false;


/*--------------------------------------------------------------------------------------------------

	SET IMPLICIT VALUES FOR PERSISTENT VARIABLES

--------------------------------------------------------------------------------------------------*/
{
	[_x] call BIS_fnc_camp_loadVar;
}
forEach
[
	"bis_per_intel",
	"bis_per_prevmission",
	"bis_per_phase",
	"bis_per_step",
	"bis_per_destroyedworldobjects",
	"bis_per_missionsdone",
	"bis_per_missionsque",
	"bis_per_ident_main",
	"bis_per_ident_killed",
	"bis_per_ident_survived",
	"bis_per_ident_return",
	"bis_per_ident_freenamesvo",
	"bis_per_ident_freenames",
	"bis_per_pool_magazine",
	"bis_per_pool_attachment",
	"bis_per_pool_item",
	"bis_per_pool_uniform",
	"bis_per_pool_vest",
	"bis_per_pool_backpack",
	"bis_per_pool_headgear",
	"bis_per_pool_goggles",
	"bis_per_pool_weapon",
	"bis_per_skirmish_squadpool",
	"bis_per_skirmish_vehicle",
	"bis_per_skirmish_pos",
	"bis_per_skirmish_dir",
	"bis_per_skirmish_crew"
];

[] spawn
{
	scriptName "BIS_fnc_camp_onMissionInit";

	waituntil
	{
		!(isNull player) || ((isNull player) && !(isNull cameraOn))
	};

	//player returns null in intros/outros
	if ((isNull player) && !(isNull cameraOn)) exitWith
	{
		"[!] Starting a mission intro -> campaign systems terminated!" call BIS_fnc_log;
	};

	private ["_missionMeta","_isHub","_isSkirmish","_isCampaign"];

	_missionMeta	= [] call BIS_fnc_camp_getMissionMeta;
	_isHub		= _missionMeta select 1;
	_isSkirmish	= _missionMeta select 2;
	_isCampaign	= [] call BIS_fnc_isCampaign;

	/*--------------------------------------------------------------------------------------------------

		INIT TIMELINE & MISSION FLOW VARS

	--------------------------------------------------------------------------------------------------*/

	//check for persistent data corruption
	if !(["BIS_PER_phase"] call BIS_fnc_camp_hasImplicitValue) then
	{
		private["_missions"];

		_missions = [BIS_PER_phase] call BIS_fnc_camp_getTimelinePhaseMissions;

		//data are corrupted == profile was changed or saves were deleted while game was running!
		if ({missionName == _x} count _missions == 0) then
		{
			["[x] Persistent data were corrupted and will be re-initialized!"] call BIS_fnc_logFormat;

			[
				[
					"bis_per_intel",
					"bis_per_prevmission",
					"bis_per_phase",
					"bis_per_step",
					"bis_per_destroyedworldobjects",
					"bis_per_missionsdone",
					"bis_per_missionsque",
					"bis_per_ident_main",
					"bis_per_ident_killed",
					"bis_per_ident_survived",
					"bis_per_ident_return",
					"bis_per_ident_freenamesvo",
					"bis_per_ident_freenames",
					"bis_per_pool_magazine",
					"bis_per_pool_attachment",
					"bis_per_pool_item",
					"bis_per_pool_uniform",
					"bis_per_pool_vest",
					"bis_per_pool_backpack",
					"bis_per_pool_headgear",
					"bis_per_pool_goggles",
					"bis_per_pool_weapon",
					"bis_per_skirmish_squadpool",
					"bis_per_skirmish_vehicle",
					"bis_per_skirmish_pos",
					"bis_per_skirmish_dir",
					"bis_per_skirmish_crew"
				]
			]
			call BIS_fnc_camp_setImplicitValue;
		};
	};

	//initialize timeline phase
	if (["BIS_PER_phase"] call BIS_fnc_camp_hasImplicitValue) then
	{
		if (_isCampaign) then
		{
			["[!] Mission started from campaign!"] call BIS_fnc_logFormat;
		}
		else
		{
			["[!] Mission started from outside campaign."] call BIS_fnc_logFormat;
		};

		BIS_PER_phase = [] call BIS_fnc_camp_getTimelinePhase;

		if (BIS_PER_phase == -1) then
		{
			["[!] Phase and time/weather conditions CANNOT be retrieved from timeline!",BIS_PER_phase] call BIS_fnc_logFormat;
		}
		else
		{
			["[!] Phase and time/weather conditions retrieved from timeline: %1!",BIS_PER_phase] call BIS_fnc_logFormat;
		};
	};

	if (["BIS_PER_step"] call BIS_fnc_camp_hasImplicitValue) then
	{
		BIS_PER_step = BIS_PER_phase;
	};

	//register the pool of completed campaign missions
	if ((["BIS_PER_missionsDone"] call BIS_fnc_camp_hasImplicitValue) && _isCampaign) then {BIS_PER_missionsDone = [];};

	/*--------------------------------------------------------------------------------------------------

		PERSISTENT: LOCATION / TIME & DATE / WEATHER

	--------------------------------------------------------------------------------------------------*/

	//set weather & daytime
	if (BIS_PER_phase != -1) then
	{
		[] call BIS_fnc_camp_loadMissionIntel;
	}
	else
	{
		BIS_PER_phase = 0;
		BIS_PER_step  = 0;
	};

	/*--------------------------------------------------------------------------------------------------

		REPLACE IMPLICITE VALUES FOR DEFAULTS
		- for some variables only

	--------------------------------------------------------------------------------------------------*/

	{
		if ([_x] call BIS_fnc_camp_hasImplicitValue) then
		{
			missionNamespace setVariable [_x, []];
		};
	}
	forEach
	[
		"bis_per_destroyedworldobjects",
		"bis_per_missionsdone",
		"bis_per_missionsque",
		"bis_per_ident_main",
		"bis_per_ident_killed",
		"bis_per_ident_survived",
		"bis_per_ident_return"
	];

	/*--------------------------------------------------------------------------------------------------

		PERSISTENT: INDENTITIES

	--------------------------------------------------------------------------------------------------*/

	//init persistent arrays for persistent indentity magic
	[] call BIS_fnc_camp_setIdentityInit;

	/*--------------------------------------------------------------------------------------------------

		PERSISTENT: EQUIPMENT POOL

	--------------------------------------------------------------------------------------------------*/

	//check 4 non-initialized pools
	private["_initialize","_pool","_toAdd"];

	_initialize = [];

	{
		_pool = format["BIS_PER_POOL_%1",_x];

		if ([_pool] call BIS_fnc_camp_hasImplicitValue) then
		{
			missionNamespace setVariable [_pool, []];

			_initialize set [count _initialize, _x];
		};
	}
	forEach ["weapon","magazine","attachment","item","uniform","vest","backpack","headgear","goggles"];

	//define the starting equipment per stage
	private["_stage"];

	_stage = ["stage"] call BIS_fnc_getCfgData;

	_toAdd = switch (_stage) do
	{
		case "A":
		{
		[
			['weapon','hgun_p07_f',2],
			['weapon','arifle_mxc_f',2],
			['weapon','arifle_mx_f',5],
			['magazine','16rnd_9x21_mag',15],
			['magazine','30rnd_65x39_caseless_mag',32],
			['magazine','30rnd_65x39_caseless_mag_tracer',7],
			['magazine','100rnd_65x39_caseless_mag',12],
			['magazine','100rnd_65x39_caseless_mag_tracer',3],
			['magazine','1rnd_smoke_grenade_shell',9],
			['magazine','1rnd_he_grenade_shell',12],
			['magazine','handgrenade',12],
			['magazine','minigrenade',8],
			['magazine','smokeshell',11],
			['magazine','smokeshellgreen',6],
			['magazine','chemlight_green',17],
			['attachment','acc_flashlight',7],
			['attachment','acc_pointer_ir',3],
			['attachment','optic_aco',5],
			['item','nvgoggles',2],
			['item','minedetector',1],
			['item','toolkit',1],
			['item','medikit',2],
			['item','firstaidkit',7],
			['item','map',3],
			['item','radio',3],
			['item','watch',3],
			['item','compass',3],
			['uniform','u_b_combatuniform_mcam',2],
			['uniform','u_b_combatuniform_mcam_vest',1],
			['vest','v_platecarrier2_rgr',2],
			['vest','v_chestrig_rgr',2],
			['vest','v_tacvest_oli',1],
			['backpack','b_assaultpack_rgr',1],
			['headgear','h_beret_blk',1],
			['headgear','h_booniehat_mcamo',2],
			['headgear','h_helmetb_grass',3],
			['headgear','h_milcap_mcamo',1],
			['goggles','g_combat',2],
			['goggles','g_lowprofile',1],
			['goggles','g_shades_red',1]
		]
		};

		case "B":
		{
		[
			['weapon','hgun_acpc2_f',3],
			['weapon','smg_02_f',2],
			['weapon','arifle_trg21_f',3],
			['weapon','arifle_trg21_gl_f',1],
			['weapon','arifle_mk20_f',2],
			['weapon','arifle_mk20_gl_f',1],
			['weapon','arifle_katiba_f',2],
			['weapon','srifle_ebr_f',1],
			['weapon','lmg_mk200_f',1],
			['weapon','launch_rpg32_f',1],
			['weapon','binocular',2],
			['magazine','9rnd_45acp_mag',14],
			['magazine','30rnd_9x21_mag',13],
			['magazine','30rnd_556x45_stanag',31],
			['magazine','30rnd_65x39_caseless_green',12],
			['magazine','200rnd_65x39_cased_box',3],
			['magazine','20rnd_762x51_mag',4],
			['magazine','smokeshell',10],
			['magazine','chemlight_blue',15],
			['magazine','ugl_flarewhite_f',11],
			['magazine','1rnd_he_grenade_shell',7],
			['magazine','1rnd_smoke_grenade_shell',6],
			['magazine','minigrenade',8],
			['magazine','handgrenade',12],
			['magazine','aperstripmine_wire_mag',3],
			['magazine','claymoredirectionalmine_remote_mag',2],
			['magazine','rpg32_f',3],
			['magazine','rpg32_he_f',2],
			['attachment','acc_flashlight',3],
			['attachment','optic_aco_grn_smg',1],
			['attachment','optic_aco',1],
			['attachment','optic_aco_grn',3],
			['attachment','muzzle_snds_l',1],
			['attachment','muzzle_snds_acp',1],
			['item','nvgoggles',2],
			['item','toolkit',1],
			['item','firstaidkit',3],
			['item','map',3],
			['item','radio',3],
			['item','watch',3],
			['item','compass',3],
			['uniform','u_bg_guerilla1_1',1],
			['uniform','u_bg_guerilla3_1',1],
			['vest','v_chestrig_blk',2],
			['vest','v_chestrig_oli',3],
			['vest','v_tacvest_camo',2],
			['vest','v_tacvest_blk',2],
			['vest','v_tacvest_blk_police',1],
			['vest','v_tacvest_oli',1],
			['backpack','b_fieldpack_khk',1],
			['headgear','h_bandanna_khk',2],
			['headgear','h_beret_blk_police',1],
			['headgear','h_cap_blk',2],
			['headgear','h_cap_blk_ion',1],
			['headgear','h_cap_grn_bi',1],
			['headgear','h_shemag_olive',3],
			['headgear','h_booniehat_dgtl',1],
			['goggles','g_aviator',1],
			['goggles','g_lowprofile',1],
			['goggles','g_shades_blue',2],
			['goggles','g_shades_green',1],
			['goggles','G_Balaclava_oli',1],
			['goggles','G_Bandanna_blk',2],
			['goggles','G_Bandanna_oli',1]
		]
		};

		case "C":
		{
		[
			['weapon','hgun_p07_f',3],
			['weapon','hgun_pistol_heavy_01_f',1],
			['weapon','arifle_mx_f',6],
			['weapon','arifle_mx_gl_f',3],
			['weapon','arifle_mx_sw_f',2],
			['weapon','arifle_mxm_f',2],
			['weapon','srifle_ebr_f',1],
			['weapon','launch_nlaw_f',1],
			['weapon','rangefinder',2],
			['magazine','16rnd_9x21_mag',16],
			['magazine','11rnd_45acp_mag',12],
			['magazine','30rnd_65x39_caseless_mag',40],
			['magazine','30rnd_65x39_caseless_mag_tracer',10],
			['magazine','100rnd_65x39_caseless_mag',16],
			['magazine','100rnd_65x39_caseless_mag_tracer',4],
			['magazine','20rnd_762x51_mag',20],
			['magazine','smokeshell',10],
			['magazine','handgrenade',12],
			['magazine','minigrenade',10],
			['magazine','b_ir_grenade',5],
			['magazine','chemlight_green',10],
			['magazine','chemlight_blue',10],
			['magazine','1rnd_he_grenade_shell',15],
			['magazine','1rnd_smoke_grenade_shell',10],
			['magazine','nlaw_f',5],
			['magazine','claymoredirectionalmine_remote_mag',5],
			['magazine','slamdirectionalmine_wire_mag',5],
			['magazine','apersboundingmine_range_mag',12],
			['attachment','acc_flashlight',5],
			['attachment','acc_pointer_ir',2],
			['attachment','optic_aco',8],
			['attachment','optic_hamr',5],
			['attachment','optic_dms',1],
			['attachment','optic_nvs',3],
			['item','nvgoggles',2],
			['item','minedetector',1],
			['item','toolkit',1],
			['item','medikit',1],
			['item','firstaidkit',10],
			['item','itemgps',2],
			['item','map',3],
			['item','radio',3],
			['item','watch',3],
			['item','compass',3],
			['uniform','u_b_combatuniform_mcam',2],
			['uniform','u_b_combatuniform_mcam_vest',1],
			['vest','v_platecarrier2_rgr',4],
			['vest','v_platecarriergl_rgr',1],
			['vest','v_tacvest_oli',1],
			['backpack','b_kitbag_rgr',1],
			['headgear','h_booniehat_mcamo',2],
			['headgear','h_helmetb_grass',3],
			['headgear','h_helmetb_plain_mcamo',2],
			['goggles','g_combat',2],
			['goggles','g_tactical_clear',1],
			['goggles','g_shades_green',1]
		]
		};
	};

	//add equipment to pool
	{
		if ((_x select 0) in _initialize) then
		{
			_x call BIS_fnc_camp_poolAdd;
		};
	}
	forEach _toAdd;


	//replace the special backpacks in pool for backpacks without the baked-in cargo
	private["_class","_count","_classFixed"];

	{
		_class = _x select 0;
		_count = _x select 1;

		_classFixed = _class call BIS_fnc_basicBackpack;

		if (_classFixed != "" && _classFixed != _class) then
		{
			["[!][POOL] Backpack [%1] replaced for [%2]!",_class,_classFixed] call BIS_fnc_logFormat;

			BIS_PER_POOL_backpack set [_forEachIndex, [_classFixed,_count]];
		};
	}
	forEach BIS_PER_POOL_backpack;

	//load unit equipment (and create survivors for hubs)
	[missionName,nil,true] call BIS_fnc_camp_loadCharacters;

	//speacial treatment for hubs
	if (_isHub) then
	{
		private["_unit","_group"];

		_units = allMissionObjects "Man";

		{
			if ((count units group _x) > 1) then
			{
				_group = createGroup (side _x);
				[_x] join _group;
			};
		}
		forEach _units;
	};

	/*--------------------------------------------------------------------------------------------------

		PERSISTENT: WORLD OBJECTS

	--------------------------------------------------------------------------------------------------*/

	[] call BIS_fnc_camp_loadWorldObjects;

	/*--------------------------------------------------------------------------------------------------

		DISABLE VEHICLE AND UNIT RANDOMIZATION

	--------------------------------------------------------------------------------------------------*/
	if (_isHub || _isSkirmish) then
	{
		{
			_x setVariable ["BIS_enableRandomization",false];
		}
		forEach ((allMissionObjects "Man") + (allMissionObjects "Car"));
	};

	player setVariable ["BIS_enableRandomization",false];

	/*--------------------------------------------------------------------------------------------------

		AMBIENT STUFF

	--------------------------------------------------------------------------------------------------*/

	if !(_isHub) then
	{
		private["_stage"];

		_stage = ["stage"] call BIS_fnc_getCfgData;

		if (_stage == "B") then
		{
			#include "\a3\Missions_F_EPA\Campaign_shared\Scripts\SetSituationMarkersStageB.sqf";
		};
	};

	/*--------------------------------------------------------------------------------------------------

		INITIALIZE SKIRMISH VARIABLES

	--------------------------------------------------------------------------------------------------*/

	if (_isHub || _isSkirmish) then
	{
		private["_hub","_skirmish"];

		if (_isHub) then
		{
			_hub 	  = missionName;
			_skirmish = [["isSkirmish"]] call BIS_fnc_camp_getLinkedMissions;

			if (count _skirmish == 0) then
			{
				_skirmish = "";
			}
			else
			{
				_skirmish = _skirmish select 0;
			};
		}
		else
		{
			_hub 	  = [["isHub"]] call BIS_fnc_camp_getLinkedMissions;
			_skirmish = missionName;

			if (count _hub == 0) then
			{
				_hub = "";
			}
			else
			{
				_hub = _hub select 0;
			};
		};

		BIS_skirmishMission = _skirmish;
		BIS_hubMission 	    = _hub;

		//reset persistent variables if hub has changed
		if !(_hub in BIS_PER_missionsQue) then
		{
			{
				[_x] call BIS_fnc_camp_setImplicitValue;
			}
			forEach
			[
				"bis_per_skirmish_squadpool",
				"bis_per_skirmish_vehicle",
				"bis_per_skirmish_pos",
				"bis_per_skirmish_dir",
				"bis_per_skirmish_crew"
			];
		};

		//do not initialize skirmish variables if hub or skirmish mission is not linked to skirmish, resp. hub
		if (_skirmish == "" || _hub == "") exitWith {};

		//wipe info about skirmish starting location if not on skirmish
		if (_isHub) then
		{
			["bis_per_skirmish_pos"] call BIS_fnc_camp_setImplicitValue;
			["bis_per_skirmish_dir"] call BIS_fnc_camp_setImplicitValue;
		};
		//wipe info about skirmish vehicle if not on skirmish or on hub
		if (!_isHub && !_isSkirmish) then
		{
			["bis_per_skirmish_vehicle"] call BIS_fnc_camp_setImplicitValue;
		};

		//initialize skirmish squad
		if (["BIS_PER_SKIRMISH_squadPool"] call BIS_fnc_camp_hasImplicitValue) then
		{
			private["_squadPool","_isSquadMember"];

			_squadPool = [missionName] call BIS_fnc_camp_getCharacters;

			{
				_isSquadMember = ["Characters",_x,"skirmish"] call BIS_fnc_getCfgDataBool;

				if !(_isSquadMember) then
				{
					_squadPool set [_forEachIndex, ""];
				};
			}
			forEach _squadPool; _squadPool = _squadPool - [""];

			BIS_PER_SKIRMISH_squadPool =+ _squadPool;
		};

		//initialize player's car classname ("" = without car)
		if (["BIS_PER_SKIRMISH_vehicle"] call BIS_fnc_camp_hasImplicitValue) then
		{
			BIS_PER_SKIRMISH_vehicle = [];
		};

		//initialize player's skirmish crew ([] = no crew, player is alone)
		if (["BIS_PER_SKIRMISH_crew"] call BIS_fnc_camp_hasImplicitValue) then
		{
			BIS_PER_SKIRMISH_crew = [];
		};

		private["_spawnpoints","_spawnpoint","_dir","_pos"];

		_spawnpoints = ["Missions",_skirmish,"spawnpoints"] call BIS_fnc_getCfgDataArray;

		if (count _spawnpoints == 0) then
		{
			["[x] Skirmish mission [%1] has no spawnpoints defined!",_skirmish] call BIS_fnc_logFormat;

			_spawnpoints = [[[100,100,0],0]];
		};

		_spawnpoint = _spawnpoints select 0;
		_pos 	    = _spawnpoint select 0;
		_dir 	    = _spawnpoint select 1;

		//initialize starting position (used in skirmish mission)
		if ((["BIS_PER_SKIRMISH_pos"] call BIS_fnc_camp_hasImplicitValue) && (_isSkirmish)) then
		{
			BIS_PER_SKIRMISH_pos = _pos;
		};
		if ((["BIS_PER_SKIRMISH_dir"] call BIS_fnc_camp_hasImplicitValue) && (_isSkirmish)) then
		{
			BIS_PER_SKIRMISH_dir = _dir;
		};
	};

	BIS_fnc_camp_onMissionInit_completed = true;

	/*--------------------------------------------------------------------------------------------------

		SETUP MISSION END SCRIPT

	--------------------------------------------------------------------------------------------------*/
	sleep 0.01;

	addMissionEventHandler
	[
		"Ended", BIS_fnc_camp_onMissionExit
	];
};