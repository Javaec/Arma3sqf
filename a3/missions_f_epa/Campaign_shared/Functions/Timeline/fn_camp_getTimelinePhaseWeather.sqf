/*
	Author: Jiri Wainar

	Description:
	Return 'weather' data about specific timeline phase.

	Parameter(s):
	_this select 0: string (optional) 	- mission class (default: current mission class)

	or

	_this select 0: number 			- timeline id
	_this select 1: string (optional) 	- mission class (default: current mission class), used only in edgecases for x-campaign/stage reference

	Example:
	[_overcast,_fog] = [missionName:string] call BIS_fnc_camp_getTimelinePhaseWeather;

	or

	[_overcast,_fog] = [timelineID:number] call BIS_fnc_camp_getTimelinePhaseWeather;

	Returns:
	Array in format [_overcast,_fog]
*/

private["_timelineData"];

_timelineData = _this call BIS_fnc_camp_getTimelineMeta;

if (count _timelineData < 2) exitwith
{
	["[!] Timeline phase 'weather' data cannot be retrieved!"] call BIS_fnc_logFormat;
	[]
};

(_timelineData select 2)