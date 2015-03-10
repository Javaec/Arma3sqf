
/*
	File: taskAttack.sqf
	Author: Joris-Jan van 't Land

	Description:
	Group will attack the position.

	Parameter(s):
	_this select 0: group (Group)
	_this select 1: attack position (Array)
	
	Returns:
	Boolean - success flag
*/

//Validate parameter count
if ((count _this) < 2) exitWith {debugLog "Log: [taskAttack] Function requires at least 2 parameters!"; false};

private ["_grp", "_pos"];
_grp = _this select 0;
_pos = _this select 1;

//Validate parameters
if ((typeName _grp) != (typeName grpNull)) exitWith {debugLog "Log: [taskAttack] Group (0) must be a Group!"; false};
if ((typeName _pos) != (typeName [])) exitWith {debugLog "Log: [taskAttack] Position (1) must be an Array!"; false};

//Create the waypoint.
private ["_wp"];
_wp = _grp addWaypoint [_pos, 0];
_wp setWaypointType "SAD";
_wp setWaypointCompletionRadius 20;

//Set group properties.
_grp setBehaviour "AWARE";

true