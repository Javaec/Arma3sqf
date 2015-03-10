/*
	Author: Jiri Wainar

	Description:
	Return 'available missions' data about specific timeline phase.

	Parameter(s):
	_this select 0: string (optional) 	- mission class (default: current mission class)

	or

	_this select 0: number 			- timeline id
	_this select 1: string (optional) 	- mission class (default: current mission class), used only in edgecases for x-campaign/stage reference

	Example:
	[mission0,mission1..missionN] = [missionName:string] call BIS_fnc_camp_getTimelinePhaseMissions;

	or

	[mission0,mission1..missionN] = [timelineID:number] call BIS_fnc_camp_getTimelinePhaseMissions;

	Returns:
	Array in format [mission0,mission1..missionN]
*/

private["_timelineData"];

_timelineData = _this call BIS_fnc_camp_getTimelineMeta;

if (count _timelineData < 3) exitwith
{
	["[!] Timeline phase 'available missions' data cannot be retrieved!"] call BIS_fnc_logFormat;
	[]
};

(_timelineData select 3)