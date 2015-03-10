/*
	Author: Karel Moricky

	Description:
	Add communication menu item to the given unit.
	The item will be available in the Communication menu and visualized in comm menu icon area.

	Parameter(s):
		0: OBJECT - object to which the item belongs to
		1: STRING - CfgCommunicationMenu class
		2 (Optional): ANY - text arguments
		3 (Optional): ANY - expression arguments
		4 (Optional): STRING - notification class from CfgNotifications. Empty string will disabled the notification.

	Returns:
	NUMBER - item ID, used in BIS_fnc_removeCommMenuItem
*/
private ["_unit","_class","_argsText","_argsExpression","_notificationClass","_cfgDefault","_cfg","_text","_submenu","_expression","_icon","_cursor","_enable","_itemID","_removeAfterExpressionCall","_menu","_isDuplicate"];

_unit = [_this,0,player,[objnull]] call bis_fnc_param;
_class = [_this,1,"",[""]] call bis_fnc_param;
_argsText = [_this,2,[]] call bis_fnc_param;
_argsExpression = [_this,3,[]] call bis_fnc_param;
_notificationClass = [_this,4,"CommunicationMenuItemAdded",[""]] call bis_fnc_param;

if (typename _argsText != typename []) then {_argsText = [_argsText];};
if (typename _argsExpression != typename []) then {_argsExpression = [_argsExpression];};

//--- Load params from config
_cfgDefault = configfile >> "CfgCommunicationMenu" >> "Default";
_cfg = [["CfgCommunicationMenu",_class],_cfgDefault] call bis_fnc_loadClass;
if (_cfg == _cfgDefault) exitwith {["Class '%1' not found in CfgCommunicationMenu",_class] call bis_fnc_error; -1};

_text = gettext (_cfg >> "text");
_text = format ([_text] + _argsText);
_submenu = gettext (_cfg >> "submenu");
_expression = gettext (_cfg >> "expression");
_expression = format ([_expression] + _argsExpression);
_icon = gettext (_cfg >> "icon");
_iconText = gettext (_cfg >> "iconText");
_cursor = gettext (_cfg >> "cursor");
_enable = gettext (_cfg >> "enable");
_removeAfterExpressionCall = getnumber (_cfg >> "removeAfterExpressionCall");

//--- Terminate when the menu is full
_menu = _unit getvariable ["BIS_fnc_addCommMenuItem_menu",[]];
if (count _menu >= 10) exitwith {"Cannot add comm menu item, the menu is full. Maximum number of 10 items is allowed." call bis_fnc_error; -1};

//--- Get a unique item ID
_itemID = ["BIS_fnc_addCommMenuItem_counter",1] call bis_fnc_counter;

//--- Terminate when the item is already in the menu
_isDuplicate = false;
{
	if ((_x select 0) == _itemID) exitwith {_isDuplicate = true;};
} foreach _menu;
if (_isDuplicate) exitwith {["Class '%1' already registered in the communication menu",_class] call bis_fnc_error; -1};

//--- Compose expression arguments
_var = _unit call bis_fnc_objectVar;
_expression = format ["_this = [%1,_pos,_target,_is3D,%2];",_var,_itemID] + _expression;

//--- Add a code to remove the item upon calling
if (_removeAfterExpressionCall > 0) then {
	_expression = format ["[%1,%2] call bis_fnc_removeCommMenuItem;",_var,_itemID] + _expression;
};

//--- Register the item
_menu set [
	count _menu,
	[
		_itemID,
		_text,
		_submenu,
		_expression,
		_enable,
		_cursor,
		_icon,
		_iconText
	]
];
_unit setvariable ["BIS_fnc_addCommMenuItem_menu",_menu];

//--- Execute constant loop for refreshing the menu when player object changed (e.g., upon team switch)
if (isnil {BIS_fnc_addCommMenuItem_loop}) then {
	BIS_fnc_addCommMenuItem_loop = [] spawn {
		scriptname "BIS_fnc_addCommMenuItem_loop";
		_player = objnull;
		while {true} do {
			waituntil {
				sleep 0.1;
				player != _player
			};
			[] call bis_fnc_refreshCommMenu;
			_player = player;
		};
	};
};

//--- Restore the icons upon game load
if (isnil {BIS_fnc_addCommMenuItem_load}) then {
	BIS_fnc_addCommMenuItem_load = addmissioneventhandler ["loaded",{[] call bis_fnc_refreshCommMenu;}];
};

if (_unit == player) then {
	//--- Refresh the menu and icons
	[] call bis_fnc_refreshCommMenu;

	//--- Notify
	if (_notificationClass != "") then {
		[_notificationClass,[_text,_icon,_iconText]] call bis_fnc_showNotification;
	};

	//--- Close the menu when opened
	if (commandingmenu == "#User:BIS_fnc_addCommMenuItem_menu") then {showcommandingmenu "";};
};

_itemID