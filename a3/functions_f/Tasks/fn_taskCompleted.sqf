/*
	Author: Thomas Ryan & Karel Moricky
	
	Description:
	Return if a task has been completed.
	
	Parameters:
		0: STRING - Task name
	
	Returns:
	BOOL - True if the task has been completed, false if not.
*/

private ["_taskID","_taskVar"];
_taskID = [_this,0,"",[""]] call BIS_fnc_param;
_taskVar = _taskID call bis_fnc_taskVar;
_data = missionnamespace getvariable _taskVar;
if (isnil {_data}) exitwith {["Task '%1' does not exists.",_taskID] call bis_fnc_error; false};

(toupper (_data select 4)) in ["SUCCEEDED", "FAILED", "CANCELED"]