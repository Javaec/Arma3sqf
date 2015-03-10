//
/*
	Author: Karel Moricky

	Description:
	Add class to Scripted Database.

	Parameter(s):
	_this select 0: ARRAY - Database array
	_this select 1: ARRAY - Path

	Returns:
	BOOLEAN - True if class was added
*/

private ["_db","_listPath","_return","_value","_item","_itemIndex","_itemId","_listPathTemp","_dbTemp"];
_db = _this select 0;
_listPath = _this select 1;
_return = false;

if (count _listPath == 0) exitwith {
	debuglog format ["Log: ERROR: BIS_fnc_dbClassSet: Path %1 is empty",_listPath];
	false
};

{
	_listPathTemp = +_listPath;
	_listPathTemp resize (_forEachIndex);
	_dbTemp = if (_forEachIndex == 0) then {
		_db
	} else {
		[_db,_listPathTemp] call BIS_fnc_dbClassReturn;
	};
	if (_forEachIndex == (count _listPath - 1)) then {

		//--- Add Item
		_item = _x call BIS_fnc_dbClassId;
		_itemIndex = _dbTemp find _item;
		_value = if (_itemIndex < 0) then {
			_itemIndex = count _dbTemp;
			[]
		} else {
			_dbTemp select (_itemIndex + 1);
		};
		_value = if (count _this > 2) then {_this select 2} else {_value};

		_dbTemp set [_itemIndex + 0,_item]; //--- ID
		_dbTemp set [_itemIndex + 1,_value]; //--- Array

		_return = true;
	} else {

		//--- Add category
		[_dbTemp,[_x]] call BIS_fnc_dbClassSet;
	};

} forEach _listPath;

_return