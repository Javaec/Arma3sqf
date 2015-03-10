//
/*
	Author: Karel Moricky

	Description:
	Returns content of given class.

	Parameter(s):
	_this select 0: ARRAY - Database array
	_this select 1: ARRAY - Path

	Returns:
	ARRAY - Class content
*/

private ["_db","_listPath","_return","_itemId"];
_db =		[_this,0,[],[[]]] call bis_fnc_param;
_listPath =	[_this,1,[],[[]]] call bis_fnc_param;

if (count _listPath == 0) exitwith {
	_db
};

_return = [];
{
	_itemId = _db find (_x call BIS_fnc_dbClassId);
	if (_itemId < 0) exitwith {_return = nil};
	_db = _db select (_itemId + 1);
	_return = _db;
} foreach _listPath;

if (isnil "_return") then {
	if (count _this > 2) then {_this select 2} else {nil}
} else {
	_return
}