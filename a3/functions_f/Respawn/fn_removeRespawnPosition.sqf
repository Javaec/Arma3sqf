/*
	Author: Karel Moricky

	Description:
	Remove a respawn point

	Parameter(s):
		0:
			NAMESPACE
			SIDE
			GROUP
			OBJECT
		1: NUMBER - id
	(both parameters were returned by BIS_fnc_addRespawnPosition)

	Returns:
	BOOL
*/

private ["_target","_positionID"];

_target = [_this,0,missionnamespace,[missionnamespace,sideunknown,grpnull,objnull]] call bis_fnc_param;
_positionID = [_this,1,-1,[0]] call bis_fnc_param;

[_target,"","",_positionID] call bis_fnc_addRespawnPosition;

true