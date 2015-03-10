/*
	Author: Thomas Ryan
	
	Description:
	Set Task State module function
*/

private [
	"_logic",
	"_modules",
	"_module",
	"_task",
	"_state"
];

_logic = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// Find the synchronized module
_modules = _logic call BIS_fnc_moduleModules;
_module = objNull;

{if (typeOf _x == "ModuleEventTaskCreate_F") exitWith {_module = _x}} forEach _modules;

// Exit if no module is found
if (isNull _module) exitWith {false};

_task = _module getVariable ["Task", ""];

// Exit if no task is found
if (_task == "") exitWith {false};

_state = _logic getVariable "State";

if (_state == "ASSIGNED") then {
	_task call BIS_fnc_taskSetCurrent;
} else {
	[_task, _state] call BIS_fnc_taskSetState;
};