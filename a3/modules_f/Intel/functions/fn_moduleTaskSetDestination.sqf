/*
	Author: Thomas Ryan
	
	Description:
	Set Task Destination module function
*/

private [
	"_logic",
	"_modules",
	"_module",
	"_task",
	"_destType",
	"_dest"
];

_logic = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_units = [_this, 1, [], [[]]] call BIS_fnc_param;
_activated = [_this,2,true,[true]] call bis_fnc_param;

if (_activated) then {

	// Find the synchronized module
	_modules = _logic call BIS_fnc_moduleModules;
	_module = objNull;

	{if (typeOf _x == "ModuleTaskCreate_F") exitWith {_module = _x}} forEach _modules;

	// Exit if no module is found
	if (isNull _module) exitWith {false};

	_task = _module getVariable ["ID", ""];

	// Exit if no task is found
	if (_task == "") exitWith {false};

	_destType = call compile (_logic getVariable "Destination");

	// Exit if no synchronized units were provided
	if (_destType == 1 && count _units == 0) exitWith {false};

	if (_destType == 0) then {
		// Module position
		_dest = position _logic;
	} else {
		// Synchronized unit
		_dest = [_units select 0, true];
	};

	[_task, _dest] call BIS_fnc_taskSetDestination;
};