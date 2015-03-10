/*
	Author: Josef Zemanek

	Description:
	Removes support types during a mission.

	Parameter(s):
	_this select 0: OBJECT - Requester module
	_this select 1: OBJECT - Provider module

	Returns:
	nothing
*/

_requester = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_provider = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

_requester synchronizeObjectsRemove [_provider];
_provider synchronizeObjectsRemove [_requester];

BIS_supp_refresh = TRUE; publicVariable "BIS_supp_refresh";

TRUE;