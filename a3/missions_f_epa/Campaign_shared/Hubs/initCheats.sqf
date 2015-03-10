scriptName "initCheats.sqf";

/*--------------------------------------------------------------------------------------------------

	ENDMISSION CAMPAIGN FLOW FIX

	Loads next hub if ENDMISSION cheat moved player into wrong hub.

--------------------------------------------------------------------------------------------------*/

if (true) then
{
	private["_hubs","_missions","_iCurrent","_iNext","_nextHub"];

	_missions = [[],["isSkirmish"]] call BIS_fnc_camp_getLinkedMissions;

	//terminate fix, there are still some campaign missions to do
	if (count _missions > 0) exitWith {};

	_hubs = ["Hubs"] call BIS_fnc_getCfgSubClasses;

	_iCurrent = _hubs find missionName;

	//exit if hub not found or we are on the last hub
	if (_iCurrent == -1 || _iCurrent == count _hubs) exitWith
	{
		["No valid hub available! Current hub id = %1.",_iCurrent] call BIS_fnc_logFormat;
	};

	//go into the next hub
	_iNext = _iCurrent + 1;
	_nextHub = _hubs select _iNext;

	["No non-skirmish missions detected, loading next hub! (%1)",_this] call BIS_fnc_logFormat;

	[_nextHub,true,0] call BIS_fnc_endMission;
};