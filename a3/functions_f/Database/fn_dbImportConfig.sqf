//
/*
	Author: Karel Moricky

	Description:
	Copy config classes and adds them to Scripted Database.

	Parameter(s):
	_this select 0: ARRAY - Database array
	_this select 1: ARRAY - Path
	_this select 2: CONFIG - Config path

	Returns:
	BOOLEAN - True if copied
*/

private ["_db","_listPath","_config","_current"];
_db = _this select 0;
_listPath = _this select 1;
_config = _this select 2;

for "_i" from 0 to (count _config - 1) do {
	_current = _config select _i;
	if (isclass _current) then {
		[_db,_listPath + [configname _current]] call BIS_fnc_dbClassSet;
	};
};
true