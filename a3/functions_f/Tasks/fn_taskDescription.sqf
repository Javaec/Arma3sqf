/*
	Author: Thomas Ryan
	
	Description:
	Return a task's description.
	
	Parameters:
		_this: STRING - Task name
	
	Returns:
	ARRAY -  task's description in the format ["description", "title", "marker"]
*/

private ["_taskID","_taskVar"];
_taskID = [_this,0,"",[""]] call BIS_fnc_param;
_taskVar = _taskID call bis_fnc_taskVar;
_data = missionnamespace getvariable _taskVar;

if (isnil {_data}) then {
	["Task '%1' does not exists.",_taskID] call bis_fnc_error;
	[];
} else {
	_data select 2;
};