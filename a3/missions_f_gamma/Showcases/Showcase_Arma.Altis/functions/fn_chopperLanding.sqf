//Parameters
private ["_positionSpawn", "_positionLand"];
_positionSpawn	= [_this, 0, [0,0,0], [[]]] call BIS_fnc_param;
_positionLand	= [_this, 1, [0,0,0], [[]]] call BIS_fnc_param;

private "_direction";
_direction = [_positionSpawn, _positionLand] call BIS_fnc_dirTo;

private ["_container", "_chopper", "_group"];
_container	= [_positionSpawn, _direction, "B_Heli_Transport_01_F", WEST] call BIS_fnc_spawnVehicle;
_chopper	= _container select 0;
_group		= _container select 2;

//Lock the chopper
_chopper lock 2;

//The chopper waypoint
private "_waypoint";
_waypoint = [_group, _positionLand, "MOVE", "CARELESS", "BLUE", "FULL", "FILE", 0, ["true", "vehicle this land 'LAND';"], true] call BIS_fnc_saa_addWaypoint;

//Create smokeshell
private ["_color", "_smoke"];
_color	= ["Blue", "Red", "Green", "Yellow", "Orange"] call BIS_fnc_selectRandom;
_smoke	= createVehicle ["SmokeShell" + _color, _positionLand, [], 0, "CAN_COLLIDE"];

//Friendly Fire
private "_module";
_module = ["AddUnits", [crew _chopper]] call BIS_fnc_moduleFriendlyFire;

//Log
["Ambient chopper (%1) created", _chopper] call BIS_fnc_logFormat;

//Return
_chopper;
