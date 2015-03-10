/*
	Author: Jiri Wainar

	Description:
	Return array of class name of the missions that can be played as next. Works on hubs only after the mission is selected.

	Parameter(s):
	- none -

	Example:
	_nextMissions:array = [] call BIS_fnc_camp_nextMission;

	Returns:
	* Class name of the following mission.
	* An empty string is returned if there is no following mission or function is run from hub.
*/

private["_id","_stage","_pool","_next","_missionMeta","_isHub"];

_missionMeta	= [] call BIS_fnc_camp_getMissionMeta;
_isHub		= _missionMeta select 1;

if (_isHub) exitWith
{
	_next = missionNamespace getVariable ["BIS_selectedMission",""];

	if (_next == "") then
	{
		["Function cannot be executed from hubs before next mission is selected!"] call BIS_fnc_error;

		_next = [];
	}
	else
	{
		_next = [_next];
	};

	_next
};

_id 	= [_this,0,BIS_PER_phase,[123]] call bis_fnc_param;
_stage 	= ["stage"] call BIS_fnc_getCfgData;
_stage	= format["Stage%1",_stage];

_next 	= [] call BIS_fnc_camp_getLinkedMissions;

_next