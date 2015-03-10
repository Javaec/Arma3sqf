//
/*
	Author: Karel Moricky

	Description:
	Returns indexes leading to given class.

	Parameter(s):
	_this select 0: ARRAY - Database array
	_this select 1: ARRAY - Path

	Returns:
	ARRAY - List of index values
*/

private ["_db","_listPath","_return","_itemId"];
_db = _this select 0;
_listPath = _this select 1;
_return = [];

if (count _listPath == 0) exitwith {
	debuglog format ["Log: ERROR: BIS_fnc_dbValueReturn: Path %1 is empty",_listPath];
	[]
};

_return = [];
{
	_itemId = _db find (_x call BIS_fnc_dbClassId);
	if (_itemId < 0) exitwith {0};
	_db = _db select (_itemId + 1);
	_return = _return + [_itemId];
} foreach _listPath;

_return