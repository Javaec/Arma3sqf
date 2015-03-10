/*
	Author: Jiri Wainar

	Description:
	Complete POI task.

	Example:
	["POI_Checkpoint_01",true] call BIS_fnc_camp_poiCompleteTask;
*/

private["_poi","_showNotification","_title","_desc"];

_poi 	          = [_this, 0, missionName, [""]] call BIS_fnc_param;
_showNotification = [_this, 1, true, [true]] call BIS_fnc_param;

_title = ["POIs",_poi,"Task","title"] call BIS_fnc_getCfgData;
_desc  = ["POIs",_poi,"Task","description"] call BIS_fnc_getCfgData;

//parent
[player,"BIS_Patrol",
[
	["Hubs","DefHubB","Tasks","BIS_Patrol","desc"] call BIS_fnc_getCfgData,
	["Hubs","DefHubB","Tasks","BIS_Patrol","title"] call BIS_fnc_getCfgData,
	["Hubs","DefHubB","Tasks","BIS_Patrol","marker"] call BIS_fnc_getCfgData
],
objNull,0,nil,false] call BIS_fnc_taskCreate;

//sub-task
[player,[format["BIS_%1",_poi],"BIS_Patrol"],
[
	_desc,
	_title,
	""
],
objNull,0,nil,_showNotification] call BIS_fnc_taskCreate;

//complete task
[format["BIS_%1",_poi],"Succeeded",_showNotification] call BIS_fnc_taskSetState;