 // Vehicle at firing range should get it's ammo refilled every time a player leaves it
BIS_vehiclesFiringRange_vehicle_1 addEventHandler ["GetOut", {
	private ["_vehicle", "_player"];
	_vehicle 	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_player 	= [_this, 2, objNull, [objNull]] call BIS_fnc_param;
	
	// Refill ammunition, needs to run where vehicle is local
	[[[_vehicle], { (_this select 0) setVehicleAmmo 1; }], "BIS_fnc_spawn", _vehicle, false] call BIS_fnc_mp;
	
	// Log
	["%2 left %1, refilling %1 ammo", _vehicle, name _player] call BIS_fnc_logFormat;
}];

// Disable saving
enableSaving [false, false];

// Initial curator addons
BIS_curator addCuratorAddons [
	"a3_characters_f_blufor",
	"a3_characters_f",
	"a3_characters_f_civil",
	"a3_characters_f_common",
	"a3_characters_f_heads",
	"a3_characters_f_opfor",
	"a3_characters_f_proxies",
	"a3_characters_f_beta",
	"a3_characters_f_indep",
	"a3_characters_f_gamma",
	"a3_misc_f",
	"a3_misc_f_helpers",
	"a3_signs_f",
	"a3_signs_f_ad",
	"a3_soft_f",
	"a3_soft_f_mrap_01",
	"a3_soft_f_mrap_02",
	"a3_soft_f_offroad_01",
	"a3_soft_f_quadbike",
	"a3_soft_f_mrap_03",
	"a3_soft_f_beta_quadbike",
	"a3_soft_f_hemtt",
	"a3_soft_f_truckheavy",
	"a3_soft_f_car",
	"a3_soft_f_gamma_offroad",
	"a3_soft_f_gamma_quadbike",
	"a3_soft_f_suv",
	"a3_soft_f_gamma_hemtt",
	"a3_soft_f_gamma_truckheavy",
	"a3_soft_f_truck",
	"a3_weapons_f_acc",
	"a3_weapons_f_ammoboxes",
	"a3_weapons_f",
	"a3_weapons_f_dummyweapons",
	"a3_weapons_f_explosives",
	"a3_weapons_f_items",
	"a3_weapons_f_launchers_nlaw",
	"a3_weapons_f_launchers_law",
	"a3_weapons_f_ebr",
	"a3_weapons_f_longrangerifles_gm6",
	"a3_weapons_f_longrangerifles_m320",
	"a3_weapons_f_machineguns_m200",
	"a3_weapons_f_pistols_p07",
	"a3_weapons_f_pistols_rook40",
	"a3_weapons_f_rifles_khaybar",
	"a3_weapons_f_rifles_mx",
	"a3_weapons_f_rifles_sdar",
	"a3_weapons_f_rifles_trg20",
	"a3_weapons_f_beta_acc",
	"a3_weapons_f_beta_ammoboxes",
	"a3_weapons_f_beta",
	"a3_weapons_f_launchers_titan",
	"a3_weapons_f_beta_ebr",
	"a3_weapons_f_machineguns_zafir",
	"a3_weapons_f_pistols_acpc2",
	"a3_weapons_f_beta_rifles_khaybar",
	"a3_weapons_f_rifles_mk20",
	"a3_weapons_f_beta_rifles_mx",
	"a3_weapons_f_beta_rifles_trg20",
	"a3_weapons_f_rifles_vector",
	"a3_weapons_f_rifles_smg_02",
	"a3_weapons_f_gamma_acc",
	"a3_weapons_f_gamma_ammoboxes",
	"a3_weapons_f_gamma",
	"a3_weapons_f_pistols_pdw2000",
	"a3_weapons_f_nato",
	"a3_weapons_f_csat",
	"a3_weapons_f_aaf",
	"a3_weapons_f_fia",
	"a3_weapons_f_itemholders",
	"a3_weapons_f_headgear",
	"a3_weapons_f_uniforms",
	"a3_weapons_f_vests",
	"a3_characters_f_epa",
	"a3_music_f_epa",
	"a3_weapons_f_epa",
	"a3_weapons_f_epa_acc",
	"a3_weapons_f_epa_ammoboxes",
	"a3_weapons_f_epa_longrangerifles_dmr_01",
	"a3_weapons_f_epa_ebr",
	"a3_weapons_f_epa_longrangerifles_gm6",
	"a3_weapons_f_pistols_pistol_heavy_01",
	"a3_weapons_f_pistols_pistol_heavy_02",
	"a3_weapons_f_epa_rifles_mx",
	"a3_characters_f_epb",
	"a3_characters_f_epb_heads",
	"a3_modules_f_epb",
	"a3_modules_f_epb_misc",
	"a3_sounds_f_epb",
	"a3_weapons_f_epb",
	"a3_weapons_f_epb_acc",
	"a3_weapons_f_epb_ammoboxes",
	"a3_weapons_f_epb_longrangerifles_gm3",
	"a3_weapons_f_epb_longrangerifles_m320",
	"a3_weapons_f_epb_rifles_mx_black",
	"a3_characters_f_epc",
	"a3_soft_f_epc_truck_03",
	"a3_weapons_f_epc",
	"a3_modules_f_curator",
	"a3_modules_f_curator_animals",
	"a3_modules_f_curator_cas",
	"a3_modules_f_curator_curator",
	"a3_modules_f_curator_effects",
	"a3_modules_f_curator_environment",
	"a3_modules_f_curator_flares",
	"a3_modules_f_curator_chemlights",
	"a3_modules_f_curator_intel",
	"a3_modules_f_curator_lightning",
	"a3_modules_f_curator_mines",
	"a3_modules_f_curator_misc",
	"a3_modules_f_curator_multiplayer",
	"a3_modules_f_curator_objectives",
	"a3_modules_f_curator_ordnance",
	"a3_modules_f_curator_respawn",
	"a3_modules_f_curator_smokeshells",
	"a3_characters_f_kart",
	"a3_soft_f_kart_kart_01",
	"a3_modules_f_kart",
	"a3_modules_f_kart_timetrials",
	"a3_weapons_f_kart",
	"a3_weapons_f_kart_pistols_pistol_signal_f",
	"a3_modules_f_bootcamp",
	"a3_modules_f_bootcamp_misc",
	"a3_structures_f_bootcamp_training"
];

// Initial mission objects that should not be curator editable
private "_blacklistedMissionObjects";
_blacklistedMissionObjects = [
	BIS_vehiclesFiringRange_vehicle_1,
	BIS_static_1,
	BIS_static_2
];

// Make all initial mission objects to be editable by the Instructor
{
	// Make sure object is not already in editable objects and is not black listed
	if !(_x in curatorEditableObjects BIS_curator) then {
		BIS_curator addCuratorEditableObjects [[_x], false];
	};
} forEach playableUnits + switchableUnits + allMissionObjects "LandVehicle" + allMissionObjects "Box_NATO_Grenades_F" + allMissionObjects "Box_NATO_Ammo_F" + allMissionObjects "Box_NATO_Wps_F" - _blacklistedMissionObjects;

// Objects that cannot die
{
	_x addEventHandler ["HandleDamage", { 0; }];
} forEach allMissionObjects "TargetBootcampHumanSimple_F" + _blacklistedMissionObjects;

// When a player joins the server and is a Recruit, we add his character to the Instructor editable objects
["BIS_onPlayerConnected_editablePlayers", "onPlayerConnected", {
	// We use the player UID in order to retrieve the character
	_uid spawn {
		private "_uid";
		_uid = _this;
		
		// The time threshold, if player character cannot be retrieved in this time, it will be skipped
		private ["_timeAvailable", "_timeThreshold"];
		_timeAvailable = 20;
		_timeThreshold = time + _timeAvailable;
		
		// The loop
		waitUntil { time > _timeThreshold || { !isNull ([_uid] call BIS_fnc_getUnitByUid) } };
		
		// The unit, if found
		private "_unit";
		_unit = [_uid] call BIS_fnc_getUnitByUid;
		
		// Make a last check on whether the unit was found and it is not already in the editable objects
		if (!isNull _unit && { !(_unit in curatorEditableObjects BIS_curator) }) then {
			BIS_curator addCuratorEditableObjects [[_unit], false];
		};
	};
}] call BIS_fnc_addStackedEventHandler;

// When a player leaves the server, we check whether there are Instructors and/or Recruits in game, if not, we stop the current Stage
["BIS_onPlayerDisconnected_stageHalt", "onPlayerDisconnected", {
	[] spawn {
		sleep 1;
		if (["isStageSelected"] call BIS_fnc_flow) then {
			if (!(["instructorExists"] call BIS_fnc_flow) || !(["recruitExists"] call BIS_fnc_flow)) then {
				["setCurrentStage", [""]] call BIS_fnc_flow;
			};
		};
	};
}] call BIS_fnc_addStackedEventHandler;

// Wait for recruits task handling
[] spawn {
	scriptName "MP_Bootcamp_01: Server 'WaitForRecruit' task handling";
	
	// If dedicated have some delay before task is added, if not, wait for intro to finish
	if (isDedicated) then {
		sleep 60;
	} else {
		waitUntil {
			!isNil { BIS_introFinished }
		};
	};
	
	// Create task
	["BIS_waitForRecruit", ["create", [WEST, nil, true]]] call BIS_fnc_missionTasks;
	
	// The loop
	while { true } do {
		// Whether there is at least one Instructor in game
		private "_recruitExists";
		_recruitExists = ["recruitExists"] call BIS_fnc_flow;
		
		// In case we don't have a Stage selected, we show a screen message
		if (!_recruitExists) then {
			["BIS_waitForRecruit", ["setState", ["ASSIGNED"]]] call BIS_fnc_missionTasks;
		} else {
			["BIS_waitForRecruit", ["setState", ["SUCCEEDED"]]] call BIS_fnc_missionTasks;
		};
		
		sleep 5;
	};
};

// Event handler that monitors variable that changes locality of given objects to new owner or object owner
"BIS_changeObjectsLocality" addPublicVariableEventHandler {
	private ["_variable", "_value"];
	_variable 	= [_this, 0, "", [""]] call BIS_fnc_param;
	_value 		= [_this, 1, [], [[]]] call BIS_fnc_param;
	
	private ["_newOwner", "_objects"];
	_newOwner 	= [_value, 0, objNull, [objNull, 0]] call BIS_fnc_param;
	_objects	= [_value, 1, [], [[]]] call BIS_fnc_param;
	
	private "_owner";
	_owner = if (typeName _newOwner == typeName objNull) then { owner _newOwner } else { _newOwner };
	
	{
		_x setOwner _owner;
	} forEach _objects;
};

//Ambient flyby's
[] spawn {
	while { true } do {
		//Flyby type
		private "_type";
		_type = [
			[150, "FULL", "B_Plane_CAS_01_F"],
			[40, "NORMAL", "B_Heli_Light_01_F"],
			[60, "NORMAL", "B_Heli_Transport_01_F"]
		] call BIS_fnc_selectRandom;
		
		//Parameters
		private ["_height", "_speed", "_class", "_distance"];
		_height	= _type select 0;
		_speed	= _type select 1;
		_class	= _type select 2;
		
		//The direction, start and end positions
		private ["_distance", "_direction", "_position", "_positionStart", "_positionEnd"];
		_distance	= 5000;
		_direction	= random 360;
		_position	= getMarkerPos "BIS_bootcampCenter";
		_positionStart	= [_position, _distance, _direction] call BIS_fnc_relPos;
		_positionEnd	= [_position, _distance, _direction + 180] call BIS_fnc_relPos;
		
		//The ambient flyby
		[_positionStart, _positionEnd, _height, _speed, _class, WEST] call BIS_fnc_ambientFlyBy;
		
		//The delay between each flyby
		sleep 300 + random 150;
	};
};

// Score boards
{
	// Reset vectors
	[_x, 0, 0] call BIS_fnc_setPitchBank;
	
	// Disable simulation
	if (isMultiplayer) then {
		_x enableSimulationGlobal false;
	} else {
		_x enableSimulation false;
	};
} forEach [
	BIS_weaponsFiringRange_board,
	BIS_grenadesFiringRange_board,
	BIS_infantryObstacleCourse_board,
	BIS_karts_board,
	BIS_vehiclesFiringRange_board,
	BIS_vehiclesObstacleCourse_board
];

// Groups
group BIS_leader enableAttack false;
group BIS_leader setBehaviour "CARELESS";
group BIS_leader setCombatMode "BLUE";

// Units
{
	_x setCaptive true;
	_x disableAi "MOVE";
	_x disableAi "FSM";
	_x disableAi "TARGET";
	_x disableAi "AUTOTARGET";
	_x addEventHandler ["HandleDamage", { 0; }];
} forEach units group BIS_leader;

// Competitors
{
	_x disableAi "ANIM";
	[[[_x], { (_this select 0) switchMove "HubBriefing_lookAround1"; }], "BIS_fnc_spawn", nil, true] call BIS_fnc_mp;
} forEach [
	BIS_competitor_1,
	BIS_competitor_2,
	BIS_competitor_3,
	BIS_competitor_4,
	BIS_competitor_5,
	BIS_competitor_6
];

// Vehicles Loadouts
{
	clearItemCargoGlobal _x;
	clearMagazineCargoGlobal _x;
	clearWeaponCargoGlobal _x;
} forEach (allMissionObjects "Air" + allMissionObjects "LandVehicle");

// Initialize stages
["initialize", [[
	// Infantry
	[
		"infantry",
		localize "STR_A3_MP_Bootcamp_Stage_Infantry_Title",
		localize "STR_A3_MP_Bootcamp_Stage_Infantry_Description",
		[
			[
				"infantry",
				"infantry_1",
				localize "STR_A3_MP_Bootcamp_Stage_Infantry_Challenge_1_Title",
				localize "STR_A3_MP_Bootcamp_Stage_Infantry_Challenge_1_Description",
				"stages\infantry\infantry_1.sqf"
			],
			[
				"infantry",
				"infantry_2",
				localize "STR_A3_MP_Bootcamp_Stage_Infantry_Challenge_2_Title",
				localize "STR_A3_MP_Bootcamp_Stage_Infantry_Challenge_2_Description",
				"stages\infantry\infantry_2.sqf"
			],
			[
				"infantry",
				"infantry_3",
				localize "STR_A3_MP_Bootcamp_Stage_Infantry_Challenge_3_Title",
				localize "STR_A3_MP_Bootcamp_Stage_Infantry_Challenge_3_Description",
				"stages\infantry\infantry_3.sqf"
			],
			[
				"infantry",
				"infantry_4",
				localize "STR_A3_MP_Bootcamp_Stage_Infantry_Challenge_4_Title",
				localize "STR_A3_MP_Bootcamp_Stage_Infantry_Challenge_4_Description",
				"stages\infantry\infantry_4.sqf"
			],
			[
				"infantry",
				"infantry_5",
				localize "STR_A3_MP_Bootcamp_Stage_Infantry_Challenge_5_Title",
				localize "STR_A3_MP_Bootcamp_Stage_Infantry_Challenge_5_Description",
				"stages\infantry\infantry_5.sqf"
			],
			[
				"infantry",
				"infantry_6",
				localize "STR_A3_MP_Bootcamp_Stage_Infantry_Challenge_6_Title",
				localize "STR_A3_MP_Bootcamp_Stage_Infantry_Challenge_6_Description",
				"stages\infantry\infantry_6.sqf"
			],
			[
				"infantry",
				"infantry_7",
				localize "STR_A3_MP_Bootcamp_Stage_Infantry_Challenge_7_Title",
				localize "STR_A3_MP_Bootcamp_Stage_Infantry_Challenge_7_Description",
				"stages\infantry\infantry_7.sqf"
			],
			[
				"infantry",
				"infantry_8",
				localize "STR_A3_MP_Bootcamp_Stage_Infantry_Challenge_8_Title",
				localize "STR_A3_MP_Bootcamp_Stage_Infantry_Challenge_8_Description",
				"stages\infantry\infantry_8.sqf"
			],
			[
				"infantry",
				"infantry_9",
				localize "STR_A3_MP_Bootcamp_Stage_Infantry_Challenge_9_Title",
				localize "STR_A3_MP_Bootcamp_Stage_Infantry_Challenge_9_Description",
				"stages\infantry\infantry_9.sqf"
			],
			[
				"infantry",
				"infantry_10",
				localize "STR_A3_MP_Bootcamp_Stage_Infantry_Challenge_10_Title",
				localize "STR_A3_MP_Bootcamp_Stage_Infantry_Challenge_10_Description",
				"stages\infantry\infantry_10.sqf"
			],
			[
				"infantry",
				"infantry_11",
				localize "STR_A3_MP_Bootcamp_Stage_Infantry_Challenge_11_Title",
				localize "STR_A3_MP_Bootcamp_Stage_Infantry_Challenge_11_Description",
				"stages\infantry\infantry_11.sqf"
			],
			[
				"infantry",
				"infantry_12",
				localize "STR_A3_MP_Bootcamp_Stage_Infantry_Challenge_12_Title",
				localize "STR_A3_MP_Bootcamp_Stage_Infantry_Challenge_12_Description",
				"stages\infantry\infantry_12.sqf"
			]
		]
	],
	// Motorized vehicles
	[
		"motorized",
		localize "STR_A3_MP_Bootcamp_Stage_Vehicles_Title",
		localize "STR_A3_MP_Bootcamp_Stage_Vehicles_Description",
		[
			[
				"motorized",
				"motorized_1",
				localize "STR_A3_MP_Bootcamp_Stage_Vehicles_Challenge_1_Title",
				localize "STR_A3_MP_Bootcamp_Stage_Vehicles_Challenge_1_Description",
				"stages\motorized\motorized_1.sqf"
			],
			[
				"motorized",
				"motorized_2",
				localize "STR_A3_MP_Bootcamp_Stage_Vehicles_Challenge_2_Title",
				localize "STR_A3_MP_Bootcamp_Stage_Vehicles_Challenge_2_Description",
				"stages\motorized\motorized_2.sqf"
			],
			[
				"motorized",
				"motorized_3",
				localize "STR_A3_MP_Bootcamp_Stage_Vehicles_Challenge_3_Title",
				localize "STR_A3_MP_Bootcamp_Stage_Vehicles_Challenge_3_Description",
				"stages\motorized\motorized_3.sqf"
			],
			[
				"motorized",
				"motorized_4",
				localize "STR_A3_MP_Bootcamp_Stage_Vehicles_Challenge_4_Title",
				localize "STR_A3_MP_Bootcamp_Stage_Vehicles_Challenge_4_Description",
				"stages\motorized\motorized_4.sqf"
			],
			[
				"motorized",
				"motorized_5",
				localize "STR_A3_MP_Bootcamp_Stage_Vehicles_Challenge_5_Title",
				localize "STR_A3_MP_Bootcamp_Stage_Vehicles_Challenge_5_Description",
				"stages\motorized\motorized_5.sqf"
			],
			[
				"motorized",
				"motorized_6",
				localize "STR_A3_MP_Bootcamp_Stage_Vehicles_Challenge_6_Title",
				localize "STR_A3_MP_Bootcamp_Stage_Vehicles_Challenge_6_Description",
				"stages\motorized\motorized_6.sqf"
			],
			[
				"motorized",
				"motorized_7",
				localize "STR_A3_MP_Bootcamp_Stage_Vehicles_Challenge_7_Title",
				localize "STR_A3_MP_Bootcamp_Stage_Vehicles_Challenge_7_Description",
				"stages\motorized\motorized_7.sqf"
			],
			[
				"motorized",
				"motorized_8",
				localize "STR_A3_MP_Bootcamp_Stage_Vehicles_Challenge_8_Title",
				localize "STR_A3_MP_Bootcamp_Stage_Vehicles_Challenge_8_Description",
				"stages\motorized\motorized_8.sqf"
			],
			[
				"motorized",
				"motorized_9",
				localize "STR_A3_MP_Bootcamp_Stage_Vehicles_Challenge_9_Title",
				localize "STR_A3_MP_Bootcamp_Stage_Vehicles_Challenge_9_Description",
				"stages\motorized\motorized_9.sqf"
			]
		]
	]
]]] call BIS_fnc_flow;
