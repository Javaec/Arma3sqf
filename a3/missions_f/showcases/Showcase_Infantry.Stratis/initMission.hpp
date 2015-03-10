[] spawn {
	scriptName "initMission.hpp: mission start";

	["a3\missions_f\video\infantry.ogv","STR_A3_SHOWCASE_INFANTRY_TITLECARD"] spawn BIS_fnc_titlecard;
	waitUntil {!(isNil "BIS_fnc_titlecard_finished")};

	// Start establishing shot
	private ["_colorWest", "_colorEast"];
	_colorWest = WEST call BIS_fnc_sideColor;
	_colorEast = EAST call BIS_fnc_sideColor;
	{_x set [3, 0.33]} forEach [_colorWest, _colorEast];

	[
		[2384.990,2820.696,0],					// Target position
		localize "STR_A3_Showcase_Infantry_SITREP_text",	// SITREP text
		500,							// 500m altitude
		200,							// 200m radius
		0,							// 0 degrees viewing angle
		1,							// Clockwise movement
		[
			["\a3\ui_f\data\map\markers\nato\b_inf.paa", _colorWest, markerPos "BIS_alpha", 1, 1, 0, localize "STR_A3_Showcase_Infantry_Marker_BIS_alpha", 0],
			["\a3\ui_f\data\map\markers\nato\b_recon.paa", _colorWest, markerPos "BIS_pointManPos", 1, 1, 0, "", 0],
			["\a3\ui_f\data\map\markers\nato\b_inf.paa", _colorWest, markerPos "BIS_charlie", 1, 1, 0, localize "STR_A3_Showcase_Infantry_Marker_BIS_charlie", 0],
			["\a3\ui_f\data\map\markers\nato\o_inf.paa", _colorEast, markerPos "BIS_village_area", 1, 1, 0, "", 0],
			["\a3\ui_f\data\map\markers\nato\o_inf.paa", _colorEast, markerPos "BIS_tempest_area", 1, 1, 0, "", 0]
		]
	] spawn BIS_fnc_establishingShot;
};

{_x setWaypointVisible false} forEach waypoints group BIS_player;

[] spawn {
	scriptName "initMission.hpp: delete waypoints control";

	waitUntil {alive BIS_player && {alive _x} count units group BIS_player == 1 && !(alive BIS_BLU1)};

	while {count waypoints group BIS_player > 0} do {
		deleteWaypoint (waypoints group BIS_player select 0)
	};
};

BIS_player enableSimulation false;
{_x disableAI "MOVE"} forEach (units group BIS_player + units BIS_OP_group1 - [BIS_player]);

// Create pointman
private ["_grp"];
_grp = createGroup WEST;

BIS_BLU2 = _grp createUnit [
	if (random 1 < 0.5) then {"B_soldier_M_F"} else {"B_soldier_AR_F"},
	markerPos "BIS_pointManPos",
	[],
	0,
	"NONE"
];

// Set up the pointman
BIS_BLU2 setCaptive true;
{BIS_BLU2 disableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "MOVE", "TARGET"];
BIS_BLU2 setDir markerDir "BIS_pointManPos";
BIS_BLU2 setIdentity "Jackson";
BIS_BLU2 setGroupID ["Alpha Point"];

[] spawn {
	waitUntil {time > 0};
	BIS_BLU2 switchMove "kia_gunner_standup01";
};

// Choose random ridgeline fireteam route
private ["_route", "_wp"];
_route = ["BIS_route1", "BIS_route2", "BIS_route3"] call BIS_fnc_selectRandom;
_wp = BIS_OP_group2 addWaypoint [markerPos _route, 0];
_wp setWaypointType "MOVE";

{
	private ["_wp"];
	_wp = BIS_OP_group2 addWaypoint [markerPos _x, 0];

	private ["_wpType"];
	_wpType = if (_x == "BIS_route_1") then {"MOVE"} else {"SAD"};
	_wp setWaypointType _wpType;
} forEach ["BIS_route_1", "BIS_route_2"];

// Change scopes from long range to short range
{
	private ["_unit"];
	_unit = _x;

	// Uncaptive so side registers correctly
	private ["_captive"];
	if (captive _unit) then {
		_captive = true;
		_unit setCaptive false;
	};

	private ["_scope"];
	_scope = if (side _unit == WEST) then {"optic_Aco"} else {"optic_ACO_grn"};
	_unit addPrimaryWeaponItem _scope;

	// Reset as captive
	if (!(isNil "_captive")) then {_unit setCaptive true};
} forEach (allUnits - [BIS_player, BIS_BLU2]);

// Prevent friendly fire
private ["_killedEH"];
_killedEH = BIS_BLU1 addEventHandler ["Killed", {if (_this select 1 == BIS_player) then {BIS_medicDead = true}}];
BIS_BLU1 setVariable ["BIS_killedEH", _killedEH];

// Stop medic from being killed by anyone other than the player
private ["_damageEH"];
_damageEH = BIS_BLU1 addEventHandler ["HandleDamage", {if ((_this select 3) == BIS_player) then {_this select 2} else {0}}];
BIS_BLU1 setVariable ["BIS_damageEH", _damageEH];

[] spawn {
	scriptName "initMission.hpp: friendly fire control";

	// Wait for the player to become a renegade
	waitUntil {side BIS_player == sideEnemy || !(isNil "BIS_medicDead")};

	BIS_courtMartial = true;

	// Stop player from moving
	{
		_x setCaptive true;
		_x allowDamage false;
		_x enableSimulation false;
	} forEach [vehicle BIS_player, BIS_player];

	titleText [localize "STR_A3_Mission_Failed_Friendly_Fire", "PLAIN"];

	sleep 2;

	titleCut ["", "BLACK OUT", 1];

	sleep 4;

	[[missionName, 2], false, 0] call BIS_fnc_endMission;
};