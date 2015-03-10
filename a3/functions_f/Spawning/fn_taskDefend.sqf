
/*
	File: taskDefend.sqf
	Author: Joris-Jan van 't Land

	Description:
	Group will man nearby static defenses and guard the position.

	Parameter(s):
	_this select 0: group (Group)
	_this select 1: defense position (Array)
	
	Returns:
	Boolean - success flag
*/

//Validate parameter count
if ((count _this) < 2) exitWith {debugLog "Log: [taskDefend] Function requires at least 2 parameters!"; false};

private ["_grp", "_pos"];
_grp = _this select 0;
_pos = _this select 1;

//Validate parameters
if ((typeName _grp) != (typeName grpNull)) exitWith {debugLog "Log: [taskDefend] Group (0) must be a Group!"; false};
if ((typeName _pos) != (typeName [])) exitWith {debugLog "Log: [taskDefend] Position (1) must be an Array!"; false};

_grp setBehaviour "SAFE";

private ["_list", "_units"];
_list = _pos nearObjects ["StaticWeapon", 100];
_units = (units _grp) - [leader _grp]; //The leader should not man defenses
_staticWeapons = [];

//Find all nearby static defenses without a gunner
{
	if ((_x emptyPositions "gunner") > 0) then 
	{
		_staticWeapons = _staticWeapons + [_x];	
	};
} forEach _list;

//Have the group man most empty static defenses
{
	//Are there still units available?
	if ((count _units) > 0) then 
	{
		//Big random chance
		if ((random 1) > 0.2) then 
		{
			private ["_unit"];
			_unit = (_units select ((count _units) - 1));
			
			_unit assignAsGunner _x;
			[_unit] orderGetIn true;
			
			_units resize ((count _units) - 1);
		};
	};
} forEach _staticWeapons;

//Give the rest a guard WP.
private ["_wp"];
_wp = _grp addWaypoint [_pos, 10];
_wp setWaypointType "GUARD";

private ["_handle"];
_handle = _units spawn 
{
	sleep 5;
	
	//Make some of the remaining unit sit down.
	{
		if ((random 1) > 0.4) then 
		{
			doStop _x;
			
			sleep 0.5;
			
			_x action ["SitDown", _x];	
		};	
	} forEach _this;
};

true