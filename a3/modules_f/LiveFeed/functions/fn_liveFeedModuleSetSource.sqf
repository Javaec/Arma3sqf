/*
	Author: Thomas Ryan
	
	Description:
	Set a live feed's source via a module.
	
	Parameters:
		_this: OBJECT - Live Feed - Set Source module
*/

// <insert smart comment about dedicated servers here>
if (isDedicated) exitWith {true};

// Wait for a live feed to exist
waitUntil {!(isNil "BIS_liveFeed")};
waitUntil {camCommitted BIS_liveFeed};

private ["_module"];
_module = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// Find synchronized units
private ["_units"];
_units = _module call BIS_fnc_moduleUnits;
if (count _units == 0) exitWith {"No synchronized units found" call BIS_fnc_error; false};

// Set the live feed's source
[[_units select 0, [0, 0, 2]]] call BIS_fnc_liveFeedSetSource;

true