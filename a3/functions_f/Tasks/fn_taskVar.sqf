/*
	Author: Karel Moricky
	
	Description:
	Return task variable
	
	Parameters:
		0: STRING - task ID
	
	Returns:
	STRING
*/

private ["_taskID"];
_taskID = [_this,0,"",[""]] call bis_fnc_param;
"BIS_fnc_taskVar_" + _taskID