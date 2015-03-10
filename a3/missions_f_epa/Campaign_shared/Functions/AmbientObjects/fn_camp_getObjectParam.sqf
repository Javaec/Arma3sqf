/*
	Author: Jiri Wainar

	Description:
	Returns parameter defined for the object. When parameter is not found, takes the value from the object group.

	Example:

	_value = [_object,_group,_attribute,_defaultValue] call BIS_fnc_camp_getObjectParam;
*/

private["_object","_group","_atrib","_default","_value"];

_object  = _this select 0;
_group 	 = _this select 1;
_atrib 	 = _this select 2;
_default = _this select 3;

_value = ["HubObjects","Objects",_object,_atrib] call BIS_fnc_getCfgData;

if !(isNil "_value") exitWith {_value};

_value = ["HubObjects","ObjectGroups",_group,_atrib] call BIS_fnc_getCfgData;

if !(isNil "_value") exitWith {_value};

_default