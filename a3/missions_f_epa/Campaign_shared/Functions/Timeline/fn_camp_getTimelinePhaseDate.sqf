/*
	Author: Jiri Wainar

	Description:
	Return 'date' data about specific timeline phase.

	Parameter(s):
	_this select 0: string (optional) 	- mission class (default: current mission class)

	or

	_this select 0: number 			- timeline id
	_this select 1: string (optional) 	- mission class (default: current mission class), used only in edgecases for x-campaign/stage reference

	Example:
	[_year,_month,_day,_hour,_min] = [missionName:string] call BIS_fnc_camp_getTimelinePhaseDate;

	or

	[_year,_month,_day,_hour,_min] = [timelineID:number] call BIS_fnc_camp_getTimelinePhaseDate;

	Returns:
	Array in format [_year,_month,_day,_hour,_min]
*/

private["_timelineData"];

_timelineData = _this call BIS_fnc_camp_getTimelineMeta;

if (count _timelineData == 0) exitwith
{
	["[!] Timeline phase 'date' data cannot be retrieved!"] call BIS_fnc_logFormat;
	[]
};

(_timelineData select 0)