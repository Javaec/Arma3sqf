/*
	Author: Josef Zemanek

	Description:
	Adds support types during a mission.

	Parameter(s):
	_this select 0: OBJECT - Requester unit
	_this select 1: OBJECT - Requester module
	_this select 2: OBJECT - Provider module

	Returns:
	nothing
*/

_reqUnit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_requester = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
_provider = [_this, 2, objNull, [objNull]] call BIS_fnc_param;

if (!((_reqUnit in synchronizedObjects _requester) && (_requester in synchronizedObjects _reqUnit))) then {
	_requester synchronizeObjectsAdd [_reqUnit];
	_reqUnit synchronizeObjectsAdd [_requester];
};

if (!((_provider in synchronizedObjects _requester) && (_requester in synchronizedObjects _provider))) then {
	_provider synchronizeObjectsAdd [_requester];
	_requester synchronizeObjectsAdd [_provider];
};

BIS_supp_refresh = TRUE; publicVariable "BIS_supp_refresh";

TRUE;