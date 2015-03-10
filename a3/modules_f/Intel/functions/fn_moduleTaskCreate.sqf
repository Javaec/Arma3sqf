/*
	Author: Thomas Ryan
	
	Description:
	Create Task module function
*/

private [
	"_logic",
	"_units",
	"_activated",
	"_owner",
	"_taskOwner",
	"_ID",
	"_title",
	"_desc",
	"_marker",
	"_destination"
];

_logic = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_units = [_this, 1, [], [[]]] call BIS_fnc_param;
_activated = [_this,2,true,[true]] call bis_fnc_param;

if (_activated) then {

	_owner = _logic getVariable ["Owner", 0];
	_ID = _logic getVariable ["ID", "taskDefault"];
	_logic setVariable ["Task", _ID];

	_taskOwner = [];
	switch _owner do {
		case 0: {
			_taskOwner = _units;
		};
		case 1: {
			{
				_xGroup = group _x;
				if !(_xGroup in _taskOwner) then {_taskOwner set [count _taskOwner,_xGroup];};
			} foreach _units;
		};
		case 2: {
			{
				_xSide = side _x;
				if !(_xSide in _taskOwner) then {_taskOwner set [count _taskOwner,_xSide];};
			} foreach _units;
		};
		case 3: {
			_taskOwner = true
		};
		case 4: {_taskOwner = west;};
		case 5: {_taskOwner = east;};
		case 6: {_taskOwner = resistance;};
		case 7: {_taskOwner = civilian;};
	};

	_title = _logic getVariable ["Title", ""];
	_desc = _logic getVariable ["Description", ""];
	_marker = _logic getVariable ["Marker", ""];
	_destination = _logic getVariable ["Destination", 0];
	_state = _logic getVariable ["State", "CREATED"];

	[
		_taskOwner,
		_ID,
		[
			_desc,
			_title,
			_marker
		],
		if (_destination > 0) then {getposatl _logic} else {nil},
		_state
	] call BIS_fnc_taskCreate;
};