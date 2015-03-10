scriptName "Showcase_Night\scripts\reinforcements.sqf";

/**************************
	Attack Chopper
**************************/
//The spawn position of the chopper
private "_start";
_start = getMarkerPos "BIS_markerAirbase";

//The patrol position of the chopper
private "_end";
_end = getMarkerPos "BIS_markerAreaOfOperation";

//The start direction of the chopper
private "_direction";
_direction = [_start, _end] call BIS_fnc_dirTo;

//Spawn chopper
private ["_container", "_chopper", "_crew", "_group"];
_container 	= [_start, _direction, "O_Heli_Light_02_F", EAST] call BIS_fnc_spawnVehicle;
_chopper 	= _container select 0;
_crew 		= _container select 1;
_group 		= _container select 2;

//Make them move to the player extraction position
private "_wp";
_wp = _group addWaypoint [_end, 0];
_wp setWaypointSpeed "FULL";
_wp setWaypointBehaviour "AWARE";
_wp setWaypointCombatMode "RED";
_wp setWaypointType "LOITER";

/**************************
	Motorized
**************************/
//We spawn a motorized group per enemy site
{
	//The position of the enemy infantry group
	private "_start";
	_start = [getMarkerPos "BIS_reinforcementsSpawnPosition", 0, 250, 5, 0, 10, 0, [], [getMarkerPos "BIS_reinforcementsSpawnPosition"]] call BIS_fnc_findSafePos;

	//The end position, we use the current enemy site
	private "_end";
	_end = position _x;
	
	//The start direction of the car
	private "_direction";
	_direction = [_start, _end] call BIS_fnc_dirTo;
	
	//The vehicle class
	private "_class";
	_class = ["O_MRAP_02_hmg_F", "O_MRAP_02_GMG_F"] call BIS_fnc_selectRandom;
	
	//Spawn car
	private ["_container", "_chopper", "_crew", "_group"];
	_container 	= [_start, _direction, _class, EAST] call BIS_fnc_spawnVehicle;
	_chopper 	= _container select 0;
	_crew 		= _container select 1;
	_group 		= _container select 2;
	
	//Make them move to the player extraction position
	private "_wp";
	_wp = _group addWaypoint [_end, 0];
	_wp setWaypointSpeed "FULL";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointCombatMode "RED";
	_wp setWaypointType "MOVE";
} forEach BIS_sites;

/**************************
	Infantry
**************************/
//We spawn a infantry group per enemy site
{
	//The position of the enemy infantry group
	private "_start";
	_start = [getMarkerPos "BIS_reinforcementsSpawnPosition", 0, 250, 5, 0, 10, 0, [], [getMarkerPos "BIS_reinforcementsSpawnPosition"]] call BIS_fnc_findSafePos;

	//The end position, we use the current enemy site
	private "_end";
	_end = position _x;

	//Infantry group
	private "_group";
	_group = [_start, EAST, configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam"] call BIS_fnc_spawnGroup;
	
	//Init group
	[_group] call BIS_fnc_sn_initGroup;

	//Make them move to the player extraction position
	private "_wp";
	_wp = _group addWaypoint [_end, 0];
	_wp setWaypointSpeed "FULL";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointCombatMode "RED";
	_wp setWaypointType "MOVE";
} forEach BIS_sites;

//Log
"Showcase_Night\scripts\reinforcements.sqf" call BIS_fnc_log;
