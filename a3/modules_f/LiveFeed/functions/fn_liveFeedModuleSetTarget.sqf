/*
	Author: Thomas Ryan
	
	Description:
	Set a live feed's target via a module.
	
	Parameters:
		_this: OBJECT - Live Feed - Set Target module
*/

// On dedicated servers, player is not you
if (isDedicated) exitWith {true};

// Wait for a live feed to exist
waitUntil {!(isNil "BIS_liveFeed")};
waitUntil {camCommitted BIS_liveFeed};

private ["_module"];
_module = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// Find synchronized units
private ["_units"];
_units = _module call BIS_fnc_moduleUnits;

// Determine target type
private ["_type"];
_type = parseNumber (_module getVariable "TargetType");
if (_type == 0 && count _units == 0) exitWith {"No synchronized units found" call BIS_fnc_error; false};

// Set target
private ["_target"];
_target = if (_type == 0) then {_units select 0} else {position _module};
_target call BIS_fnc_liveFeedSetTarget;

true