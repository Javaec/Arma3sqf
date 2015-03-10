/*
	Author: Thomas Ryan
	
	Description:
	Display a live feed via a module.
	
	Parameters:
		_this: OBJECT - Live Feed - Init module
*/

// Need not be run on dedicated servers
if (isDedicated) exitWith {true};

private ["_module"];
_module = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// Find player
private ["_units"];
_units = _module call BIS_fnc_moduleUnits;

if (player in _units) then {
	// Create the feed
	[player, player, player] call BIS_fnc_liveFeed;
};

true