/*
	Author: Thomas Ryan, updated by Vaclav Oliva
	
	Description:
	Set the target of a live feed.
	
	Parameters:
		_this: OBJECT or ARRAY - Live feed target
                OR
                _this select 0: OBJECT or ARRAY - Live feed target
                _this select 1: NUMBER - Duration of transition
                	
	Returns:
	True if successful, false if not.
*/

// One does not simply run on a dedicated server
if (isDedicated) exitWith {"Not dedicated server compatible" call BIS_fnc_error; false};

// Cannot be run until the feed exists
if (isNil "BIS_liveFeed") exitWith {"No live feed exists" call BIS_fnc_error; false};

private ["_target","_duration"];
_target = [_this, 0, objNull, [objNull, []]] call BIS_fnc_param;
_duration = [_this, 1, 0] call BIS_fnc_param;

// Ensure a valid target is defined
if (typeName _target == typeName objNull) then {
	_target = [_target];
	{if (isNull _x) then {_target = _target - [_x]}} forEach _target;
};

if (count _target == 0 || count _target > 3) exitWith {"Invalid target defined" call BIS_fnc_error; false};
if (count _target == 1) then {_target = _target select 0};

// Set the live feed's target
BIS_liveFeed camPrepareTarget _target;
BIS_liveFeed camCommitPrepared _duration;

true