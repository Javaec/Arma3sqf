//
/*
	Author: Karel Moricky

	Description:
	Returns all classes withing class.

	Parameter(s):
	_this select 0: ARRAY - Database array
	_this select 1: ARRAY - Path

	Returns:
	ARRAY - List of classnames
*/

private ["_listClass","_listResult"];
_listClass = _this call BIS_fnc_dbClassReturn;
_listResult = [];
if (isnil "_listClass") exitwith {_listResult};
{
	if (_x call BIS_fnc_dbIsClass) then {
		_listResult = _listResult + [[_x] call BIS_fnc_dbClassId];
	};
} foreach _listClass;
_listResult