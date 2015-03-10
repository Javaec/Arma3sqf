// Force light shafts (ToDo: remove when made default)
"GodRays" ppEffectEnable true;
"GodRays" ppEffectAdjust [0.02, 0.7, 0.15, 0.85];

{_x disableAI "MOVE"} forEach (units group BIS_inf + units BIS_IA_group1 - [BIS_inf]);

{_x setWaypointVisible false} forEach waypoints group BIS_inf;

[] spawn {
	scriptName "initMission.hpp: delete waypoints control";
	
	waitUntil {{alive _x} count (units group BIS_inf - [BIS_inf]) == 0 && !(alive BIS_BLU1)};
	
	while {count waypoints group BIS_inf > 0} do {
		deleteWaypoint (waypoints group BIS_inf select 0)
	};
};

BIS_townDefenders = (units BIS_IA_group1 + units BIS_IA_group2 + units BIS_IA_group4 + units BIS_IA_group5 + units BIS_IA_group6 + units BIS_IA_group7);
BIS_spotters = [BIS_IA1, BIS_IA2];

// Temporary workaround for conversations (ToDo: remove when no longer needed)
BIS_player = BIS_inf;
BIS_papaBear = BIS_recon;

// Create pointman
private ["_grp"];
_grp = createGroup WEST;

BIS_BLU2 = _grp createUnit [
	if (random 1 < 0.5) then {"B_soldier_M_F"} else {"B_soldier_AR_F"},
	[10,10,10],
	[],
	0,
	"NONE"
];

// Set up the pointman
BIS_BLU2 attachTo [BIS_logic1, [0,0,0]];
BIS_BLU2 setCaptive true;
{BIS_BLU2 disableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "MOVE", "TARGET"];
BIS_BLU2 setIdentity "Jackson";
BIS_BLU2 setGroupID [localize "STR_A3_Group_AlphaPoint"];

private ["_cutter"];
_cutter = "Land_ClutterCutter_medium_F" createVehicle position BIS_BLU2;
_cutter setPos position BIS_BLU2;

[] spawn {
	waitUntil {time > 0};
	
	BIS_BLU2 switchMove "Acts_LyingWounded_loop2";
	
	private ["_animEH"];
	_animEH = BIS_BLU2 addEventHandler ["AnimDone", {(_this select 0) switchMove (_this select 1)}];
	BIS_BLU2 setVariable ["BIS_animEH", _animEH];
	BIS_BLU2 addEventHandler ["Killed", {BIS_BLU2 removeEventHandler ["AnimDone", BIS_BLU2 getVariable "BIS_animEH"]}];
};

// Choose random ridgeline fireteam route
private ["_route", "_wp"];
_route = ["BIS_route1", "BIS_route2", "BIS_route3"] call BIS_fnc_selectRandom;
_wp = BIS_IA_group2 addWaypoint [markerPos _route, 0];
_wp setWaypointType "MOVE";

{
	private ["_wp"];
	_wp = BIS_IA_group2 addWaypoint [markerPos _x, 0];
	
	private ["_wpType"];
	_wpType = if (_x == "BIS_route_1") then {"MOVE"} else {"SAD"};
	_wp setWaypointType _wpType;
} forEach ["BIS_route_1", "BIS_route_2"];

{
	private ["_unit"];
	_unit = _x;
	
	// Stop units from fleeing
	_unit allowFleeing 0;
	
	// Change scopes from long range to short range
	if (!(_unit in (units group BIS_inf + units BIS_BLU_group1))) then {
		// Uncaptive so side registers correctly
		private ["_captive"];
		if (captive _unit) then {
			_captive = true;
			_unit setCaptive false;
		};
		
		private ["_items"];
		_items = primaryWeaponItems _unit;
		
		{
			// Find the item's type
			private ["_item", "_type"];
			_item = _x;
			_type = getNumber (configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "type");
			
			// Change the scope
			if (_type == 201) then {
				private ["_scope"];
				_scope = if (side _unit == WEST) then {"optic_Aco"} else {"optic_ACO_grn"};
				_unit addPrimaryWeaponItem _scope;
			};
		} forEach _items;
		
		// Reset as captive
		if (!(isNil "_captive")) then {_unit setCaptive true};
	};
} forEach allUnits;

// Prevent friendly fire
private ["_killedEH"];
_killedEH = BIS_BLU1 addEventHandler ["Killed", {if (_this select 1 == BIS_inf) then {BIS_medicDead = true}}];
BIS_BLU1 setVariable ["BIS_killedEH", _killedEH];

// Stop medic and Bravo Lead from being killed by anyone other than the player
{
	private ["_damageEH"];
	_damageEH = _x addEventHandler [
		"HandleDamage",
		{
			private ["_damage", "_source"];
			_damage = _this select 2;
			_source = _this select 3;
			
			if (_source in [vehicle BIS_inf, BIS_inf]) then {_damage} else {0};
		}
	];
	
	_x setVariable ["BIS_damageEH", _damageEH];
} forEach [BIS_BLU1, BIS_BLU8];

// Randomly position UAV operator
private ["_marker"];
_marker = format ["BIS_UAV%1", round (1 + random 3)];
BIS_operator setPos markerPos _marker;
BIS_operator setDir markerDir _marker;

// Determine when player assembles UAV
private ["_assembledEH"];
_assembledEH = BIS_inf addEventHandler [
	"WeaponAssembled",
	{
		private ["_unit", "_weapon"];
		_unit = _this select 0;
		_weapon = _this select 1;
		
		if (typeOf _weapon == "B_UAV_01_F") then {
			// Remove eventhandler
			_unit removeEventHandler ["WeaponAssembled", _unit getVariable "BIS_assembledEH"];
			BIS_UAV = _weapon;
			execFSM "UAVControl.fsm";
		};
	}
];

BIS_inf setVariable ["BIS_assembledEH", _assembledEH];

// Prevent Charlie from being killed
{
	private ["_damageEH"];
	_damageEH = _x addEventHandler ["HandleDamage", {if ((_this select 3) == BIS_inf) then {_this select 2} else {0}}];
	_x setVariable ["BIS_damageEH", _damageEH];
} forEach units BIS_BLU_group1;

// Make spotters die when shot by Charlie
/*{
	_x addEventHandler [
		"HandleDamage",
		{
			private ["_damage", "_source"];
			_damage = _this select 2;
			_source = _this select 3;
			
			if (_source in (units BIS_BLU_group1)) then {1} else {_damage};
		}
	];
} forEach BIS_spotters;*/

// Mission start
[] spawn {
	scriptName "initMission.hpp: mission start";
	
	if (!(isNil "BIS_missionScope")) then {
		sleep 1;
	};
	
	BIS_planeFlyover = compile preprocessFile "scenes\planeFlyover.sqf";
	BIS_bombingRun = compile preprocessFile "scenes\bombingRun.sqf";
	
	// Build array of buildings
	BIS_buildings = [];
	{BIS_buildings = BIS_buildings + [_x]} forEach [
		[2077.706,2747.152,0.000] nearestObject "Land_i_Stone_Shed_V1_F",
		[2044.161,2737.542,0.000] nearestObject "Land_i_Stone_Shed_V1_F",
		[2042.714,2723.036,0.000] nearestObject "Land_i_Stone_HouseSmall_V1_F",
		[2035.023,2713.804,0.000] nearestObject "Land_Slum_House03_F",
		[2040.271,2704.476,0.000] nearestObject "Land_i_Stone_HouseBig_V1_F"
	];
	
	// Initialize Instructor Figure
	["Init"] call BIS_fnc_InstructorFigure;
	
	if (!(isNil "BIS_missionScope")) then {
		sleep 1;
	};
	
	if (!(isNil "BIS_missionScope")) then {
		// Play quotation
		["\A3\Missions_F_EPA\video\A_m02_quotation.ogv", "STR_A3_Campaign_Quote_0"] call BIS_fnc_quotations;
		
		waitUntil {BIS_fnc_quotations_playing || !(isNil "BIS_fnc_quotations_skip")};
		
		playMusic "LeadTrack04_F";
		
		private ["_time"];
		_time = time + 6;
		
		waitUntil {time >= _time || !(isNil "BIS_fnc_quotations_skip")};
	
		// Let the player's squad move
		{_x enableAI "MOVE"} forEach (units group BIS_inf + units BIS_IA_group1 - [BIS_inf]);
		
		private ["_time"];
		_time = time + 1.5;
		
		waitUntil {(!(BIS_fnc_quotations_playing) || !(isNil "BIS_fnc_quotations_skip")) && time >= _time};
		
		BIS_inf enableSimulation true;
		
		enableRadio true;
		(format ["%1_blackScreen", missionName]) call BIS_fnc_blackIn;
		format ["%1_disabledSave", missionName] call BIS_fnc_enableSaving;
		
		[] spawn {
			scriptName "initMission.hpp: plane control";
			
			sleep 11;
			
			// Unhide plane
			{
				_x hideObject false;
				_x enableSimulation true;
				_x allowDamage true;
			} forEach [BIS_IA_plane2d, BIS_IA_plane2];
			
			{BIS_IA_plane2d enableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "MOVE", "TARGET"];
		};
		
		sleep 3;
	};
	
	"BIS_start" call BIS_fnc_missionConversations;
	"BIS_report" call BIS_fnc_missionConversations;
	"BIS_report2" call BIS_fnc_missionConversations;
	"BIS_letsGo" call BIS_fnc_missionConversations;
	
	// Make attackers fire a round
	private ["_leader"];
	_leader = leader BIS_IA_group1;
	_leader fire primaryWeapon _leader;
	
	sleep 1;
	
	"BIS_pointManHit" call BIS_fnc_missionConversations;
	
	// Kill the point man
	BIS_BLU2 setDamage 1;
	
	"BIS_medicPos" setMarkerType "Empty";
	{_x call BIS_fnc_missionTasks} forEach ["BIS_overwatch", "BIS_pointMan"];
	
	"BIS_pointManDivert" call BIS_fnc_missionConversations;
};