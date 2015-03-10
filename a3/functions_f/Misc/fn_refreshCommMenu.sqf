/*
	Author: Karel Moricky

	Description:
	Refresh the communication menu variable

	Parameter(s): None

	Returns:
	BOOL
*/
private ["_menu","_menuIndexed","_text","_submenu","_expression","_enable","_cursor","_icon"];

_menu = player getvariable ["BIS_fnc_addCommMenuItem_menu",[]];
_menuIndexed = [];
{
	_text = _x select 1;
	_submenu = _x select 2;
	_expression = _x select 3;
	_enable = _x select 4;
	_cursor = _x select 5;
	_icon = _x select 6;
	_menuIndexed set [count _menuIndexed,[_text,[_foreachindex + 2],_submenu,-5,[["expression",_expression]],"1",_enable,_cursor]];
} foreach _menu;
missionnamespace setvariable [
	"BIS_fnc_addCommMenuItem_menu",
	[[localize "STR_rscMenu.hppRscGroupRootMenu_Items_Communication0",false]] + _menuIndexed
];

("BIS_fnc_addCommMenuItem" call bis_fnc_rscLayer) cutrsc ["RscCommMenuItems","plain"];

true