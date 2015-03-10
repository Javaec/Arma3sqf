/*
	Author: Thomas Ryan
	
	Description:
	Display a task hint.
	
	Parameters:
		_this select 0: STRING - Task name
		_this select 1: STRING - Task state
	
	Returns:
	True if successful, false if not.
*/

private ["_taskID","_taskVar","_taskReal"];
_taskID = [_this,0,"",[""]] call BIS_fnc_param;
_taskVar = _taskID call bis_fnc_taskVar;
_data = missionnamespace getvariable _taskVar;

if (isnil {_data}) exitwith {
	["Task '%1' does not exists.",_taskID] call bis_fnc_error;
	false;
};

_taskReal = _taskID call bis_fnc_taskReal;
if (_taskReal in simpletasks player) then {
	["task" + (_data select 4),_desc] call bis_fnc_shownotification;
};

true;
