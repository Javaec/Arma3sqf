/*
	Author: Thomas Ryan
	
	Description:
	Create Task module function
*/

private [
	"_logic",
	"_units",
	"_ID",
	"_title",
	"_desc",
	"_marker"
];

_logic = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_units = [_this, 1, [], [[]]] call BIS_fnc_param;

_ID = _logic getVariable ["ID", "taskDefault"];
_logic setVariable ["Task", _ID];

_title = _logic getVariable ["Title", ""];
_desc = _logic getVariable ["Description", ""];
_marker = _logic getVariable ["Marker", ""];

[
	_units,
	_ID,
	[
		_desc,
		_title,
		_marker
	]
] call BIS_fnc_taskCreate;