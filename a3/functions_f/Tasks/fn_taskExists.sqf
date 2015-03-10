/*
	Author: Thomas Ryan & Karel Moricky
	
	Description:
	Return if a task exists.
	
	Parameters:
		0: STRING - Task name
	
	Returns:
	True if the task exists, false if not.
*/

private ["_taskID","_taskVar"];
_taskID = [_this,0,"",[""]] call BIS_fnc_param;
_taskVar = _taskID call bis_fnc_taskVar;
_data = missionnamespace getvariable _taskVar;

!isnil {_data}