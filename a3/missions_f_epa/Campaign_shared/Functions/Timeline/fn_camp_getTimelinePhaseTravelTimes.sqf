/*
	Author: Jiri Wainar

	Description:
	Return 'travel-times' data about specific timeline phase.

	Parameter(s):
	_this select 0: string (optional) 	- mission class (default: current mission class)

	or

	_this select 0: number 			- timeline id
	_this select 1: string (optional) 	- mission class (default: current mission class), used only in edgecases for x-campaign/stage reference

	Example:
	[travelIn:number,travelOut:number] = [missionName:string] call BIS_fnc_camp_getTimelinePhaseTravelTimes;

	or

	[travelIn:number,travelOut:number] = [timelineID:number] call BIS_fnc_camp_getTimelinePhaseTravelTimes;

	Returns:
	Array in format [travelIn:number,travelOut:number]
*/

private["_timelineData"];

_timelineData = _this call BIS_fnc_camp_getTimelineMeta;

if (count _timelineData < 1) exitwith
{
	["[!] Timeline phase 'travel-times' data cannot be retrieved!"] call BIS_fnc_logFormat;
	[]
};

(_timelineData select 1)