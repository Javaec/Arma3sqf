/*
	Author: Karel Moricky

	Description:
	Animate a Strategic Map..

	Parameter(s):
		0: (Optional) CONFIG or ARRAY - either config path to target group, or absolute position in format [x,y,z] or [x,y].
		1: (Optional): NUMBER - commit time in seconds

	Returns:
	BOOL - true when animation is applied
*/

private ["_target","_commit","_display","_icons","_map","_position"];
disableserialization;
_target = [_this,0,[],[[],configfile]] call bis_fnc_param;
_commit = [_this,1,1,[0]] call bis_fnc_param;
_display = [_this,2,finddisplay 506,[displaynull]] call bis_fnc_param;
_icons = [_this,3,missionnamespace getvariable ["BIS_fnc_strategicMapOpen_ORBAT",[]],[[]]] call bis_fnc_param;

//--- Check if Strategic Map is opened
//_display = finddisplay 506;
if (isnull _display) exitwith {"Strategic Map is not open. Do it first by calling 'BIS_fnc_StrategicMapOpen' or 'BIS_fnc_StrategicMapModuleOpen' functions or byt activating 'Open Strategic Map' module." call (uinamespace getvariable "bis_fnc_error"); false};
_map = _display displayctrl 51;

//--- Calculate target position
if (typename _target == typename configfile) then {

	//--- Group
	_position = [];
	{
		_class = _x select 0;
		if (_class == _target) then {
			_iconParams = +(_x select 2);
			_position = _iconParams select 2;
		};
	} foreach _icons;
	if (count _position == 0) then {["Group '%1' not found on Strategic Map.",_target] call bis_fnc_error;};
} else {
	_position = _target call bis_fnc_position;
};

//--- Animate
if (count _position > 0) then {
	_map ctrlmapanimadd [_commit,ctrlmapscale _map,_position];
	ctrlmapanimcommit _map;
	waituntil {ctrlmapanimdone _map};
	true
} else {
	false
};