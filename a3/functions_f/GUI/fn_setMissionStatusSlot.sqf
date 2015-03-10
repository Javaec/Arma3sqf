/*
	Author: Karel Moricky

	Description:
	Set  a slot for mission status with sectors, respawn tickets, etc.

	Parameter(s):
		0: NUMBER - slot ID. Use -1 to assign it automatically
		1: STRING - text
		2: STRING - icon path
		3: ARRAY - color in RGBA format
		4: NUMBER - slot fade, 0 is fully visible, 0 hidden
		5: ARRAY in Position format - position top which camera moves after clicking on the slot
		6: NUMBER - slot progress bar height in range <0;1>

	Returns:
	NUMBER - slot ID
*/

private ["_id","_text","_texture","_color","_fade","_position","_barHeight","_icons"];
_id = [_this,0,-1,[0]] call bis_fnc_param;
_text = [_this,1,"",["",false]] call bis_fnc_param;
_texture = [_this,2,"",[""]] call bis_fnc_param;
_color = [_this,3,[0,0,0,0],[[]],4] call bis_fnc_param;
_fade = [_this,4,0,[0]] call bis_fnc_param;
_position = [_this,5,[],[[]]] call bis_fnc_param;
_barHeight = [_this,6,0,[0]] call bis_fnc_param;

_icons = missionnamespace getvariable ["RscMissionStatus_icons",[]];
if (_id < 0) then {_id = count _icons;};

if (typename _text == typename "") then {
	//--- Add
	_icons set [_id,[_text,_texture,_color,_fade,_position,_barHeight]];
} else {
	//--- Remove
	_icons set [_id,nil];
};

missionnamespace setvariable ["RscMissionStatus_icons",_icons];
_id