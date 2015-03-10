/*
	Author: Karel Moricky

	Description:
	Remove an item from the communication menu

	Parameter(s):
		0: OBJECT - object to which the item belongs to
		1: NUMBER - item ID returned by BIS_fnc_addCommMenuItem command

	Returns:
	BOOL - true when the item was removed
*/
private ["_unit","_itemID","_itemFound","_menu","_xID"];

_unit = [_this,0,player,[objnull]] call bis_fnc_param;
_itemID = [_this,1,-1,[0]] call bis_fnc_param;
_itemFound = false;

_menu = _unit getvariable ["BIS_fnc_addCommMenuItem_menu",[]];
{
	_xID = _x select 0;
	if (_xID == _itemID) exitwith {_menu set [_foreachindex,-1]; _itemFound = true;};
} foreach _menu;
_menu = _menu - [-1];

if (_itemFound) then {
	_unit setvariable ["BIS_fnc_addCommMenuItem_menu",_menu];
	[] call bis_fnc_refreshCommMenu;

	if (count _menu == 0) then {
		terminate BIS_fnc_addCommMenuItem_loop;
		removemissioneventhandler ["loaded",BIS_fnc_addCommMenuItem_load];

		BIS_fnc_addCommMenuItem_loop = nil;
		BIS_fnc_addCommMenuItem_load = nil;
	};
	true
} else {
	["Item %1 not found in the comm menu.",_itemID] call bis_fnc_error;
	false
};