/*
	Author: Karel Moricky

	Description:
	Remove class from Scripted Database.

	Parameter(s):
	_this select 0: ARRAY - Database array
	_this select 1: ARRAY - Path

	Returns:
	BOOLEAN - True if class was removed
*/

private ["_db","_listPath","_container","_item","_itemId"];
_db = [_this,0,[],[[]]] call bis_fnc_param;
_listPath = [_this,1,[],[[]]] call bis_fnc_param;

if (count _listPath == 0) exitwith {
	["Path %1 is empty",_listPath] call bis_fnc_error;
	false
};

_index = _this call BIS_fnc_dbClassIndex;
_listParent = if (count _index == 1) then {
	_db
} else {
	_listPathResized = +_listPath;
	_listPathResized resize (count _listPathResized - 1);
	[_db,_listPathResized] call BIS_fnc_dbClassReturn;
};

_item = _listPath select (count _listPath - 1);
_itemId = _listParent find (_item call BIS_fnc_dbClassId);
if (_itemId < 0) exitwith {
	["Item %1 does not exist",_item] call bis_fnc_error;
	false
};

_listParentNew = +_listParent;
_listParentNew set [_itemId + 0,-1];
_listParentNew set [_itemId + 1,-1];
_listParentNew = _listParentNew - [-1];
_listParent resize 0;
{
	_listParent set [_forEachIndex,_x];
} forEach _listParentNew;
true