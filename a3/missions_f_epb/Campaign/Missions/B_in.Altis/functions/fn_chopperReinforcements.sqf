//Parameters
private ["_positionSpawn", "_positionDrop", "_vehicleClass", "_groupConfig", "_side"];
_positionSpawn	= [_this, 0, [0,0,0], [[]]] call BIS_fnc_param;
_positionDrop	= [_this, 1, [0,0,0], [[]]] call BIS_fnc_param;
_vehicleClass	= [_this, 2, "O_Heli_Light_02_F", [""]] call BIS_fnc_param;
_groupConfig	= [_this, 3, configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam", [configFile]] call BIS_fnc_param;
_side		= [_this, 4, EAST, [EAST]] call BIS_fnc_param;

//The heliH
private "_heliH";
_heliH = createVehicle ["Land_HelipadEmpty_F", _positionDrop, [], 0, "NONE"];

//Direction
private "_directionSpawn";
_directionSpawn = [_positionSpawn, _positionDrop] call BIS_fnc_dirTo;

//Spawn the chopper
private ["_container", "_chopper", "_chopperCrew", "_chopperGroup"];
_container 	= [_positionSpawn, _directionSpawn, _vehicleClass, EAST] call BIS_fnc_spawnVehicle;
_chopper	= _container select 0;
_chopperCrew	= _container select 1;
_chopperGroup	= _container select 2;

//Chopper should not flee or attack
_chopperGroup allowFleeing 0;
_chopperGroup enableAttack false;

//Spawn the group to transport
private ["_infantryGroup", "_infantryUnits"];
_infantryGroup 	= [_positionSpawn, _side, _groupConfig] call BIS_fnc_spawnGroup;
_infantryUnits	= units _infantryGroup;

//The available seats in the chopper
private "_chopperAvailableSeats";
_chopperAvailableSeats = _chopper emptyPositions "CARGO";

//In case the chopper doesn't have enough seats, we resize the units array
if (_chopperAvailableSeats < count _infantryUnits) then {
	_infantryUnits resize _chopperAvailableSeats;
};

//Units that cannot fit the chopper need to be deleted


//Make infantry units board the chopper
{
	_x assignAsCargo _chopper;
	_x moveInCargo _chopper;
} forEach _infantryUnits;

//Add waypoints to chopper
private ["_chopperWaypoint_1", "_chopperWaypoint_2", "_chopperWaypoint_3"];
_chopperWaypoint_1 = _chopperGroup addWaypoint [_positionDrop, 0];
_chopperWaypoint_2 = _chopperGroup addWaypoint [_positionDrop, 0];
_chopperWaypoint_3 = _chopperGroup addWaypoint [_positionSpawn, 0];

//Set chopper waypoint types
_chopperWaypoint_1 setWaypointType "MOVE";
_chopperWaypoint_2 setWaypointType "TR UNLOAD";
_chopperWaypoint_3 setWaypointType "MOVE";

//Set chopper waypoint statements
_chopperWaypoint_1 setWaypointStatements ["true", "this land 'Get Out';"];
_chopperWaypoint_2 setWaypointStatements ["true", ""];
_chopperWaypoint_3 setWaypointStatements ["true", "_group = group this; _chopper = vehicle this; _units = crew _chopper; { deleteVehicle _x; } forEach _units; deleteVehicle _chopper; deleteGroup _group;"];

//Add waypoints to infantry
private ["_infantryWaypoint_1"];
_infantryWaypoint_1 = _infantryGroup addWaypoint [_positionDrop, 0];
_infantryWaypoint_1 setWaypointType "UNLOAD";
_infantryWaypoint_1 setWaypointStatements ["true", "[group this, position this, 150] call BIS_fnc_taskPatrol;"];

//Remove radio from all units
{
	_x unassignItem "itemRadio";
	_x removeItem "itemRadio";
} forEach units _infantryGroup + units _chopperGroup;

//Log
["Chopper (%1) dropping troops (%2)", _chopper, _infantryUnits] call BIS_fnc_logFormat;

//Return
true;
