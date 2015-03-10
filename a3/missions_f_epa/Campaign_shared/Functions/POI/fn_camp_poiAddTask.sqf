/*
	Author: Jiri Wainar

	Description:
	Create POI task.

	Example:
	["POI_Checkpoint_01",true] call BIS_fnc_camp_poiAddTask;
*/

private["_poi","_showNotification","_title","_desc"];

_poi 	          = [_this, 0, missionName, [""]] call BIS_fnc_param;
_showNotification = [_this, 2, true, [true]] call BIS_fnc_param;

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

_currentVehicle = ["Missions",BIS_skirmishMission,"Vehicles","Player","name"] call BIS_fnc_getCfgDataObject;

//sub-task
private["_isHub","_vehicle"];

_isHub = [missionName] call BIS_fnc_camp_getMissionMeta select 1;
_vehicle = objNull;

if (_isHub) then
{
	{
		_vehicle = ["Missions",BIS_skirmishMission,"Vehicles",_x,"name"] call BIS_fnc_getCfgDataObject;

		if !(isNull _vehicle) exitWith {_vehicle = [_vehicle,true];};
	}
	forEach ["Squad","Player"];
};


[player,[format["BIS_%1",_poi],"BIS_Patrol"],
[
	_desc,
	_title,
	toUpper(localize "STR_A3_UserAction_StartPatrol")
],
_vehicle,0,nil,_showNotification] call BIS_fnc_taskCreate;