/*
	Author: Jiri Wainar

	Description:
	Search timeline and return phase of the 1st mission occurance.

	Parameter(s):
	_this select 0: string (optional) 	- mission class (default: current mission class)

	Example:
	[_phase:number] = [missionName:string] call BIS_fnc_camp_getTimelinePhase;

	Returns:
	Timeline phase of the 1st mission occurance or -1 if not found.
*/

private["_mission","_stage","_timelinePool","_phase","_missions"];

_mission 	= [_this,0,missionname,[""]] call bis_fnc_param;

_stage 	 	= ["stage"] call BIS_fnc_getCfgData;
_stage	 	= format["Stage%1",_stage];

_timelinePool 	= ["Timeline",_stage] call BIS_fnc_getCfgDataPool;
_phase 		= -1;

{
	_missions = _x select 3;

	if (_mission in _missions) exitWith
	{
		_phase = _forEachIndex;
	};
}
forEach _timelinePool;

if (_phase == -1) then
{
	["[!] Phase for mission '%1' cannot be retrieved from timeline!",_mission] call BIS_fnc_logFormat;
};

_phase