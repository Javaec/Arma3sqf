/*
	File: credits.sqf
	Author: Karel Moricky

	Description:
	Dynamic opening credits

	Parameter(s):
	_this select 0: Text
	_this select 1: (Optional) X coordinates
	_this select 2: (Optional) Y coordinates
	_this select 3: (Optional) Duration
	_this select 4: (Optional) Fadein time
	_this select 5: (Optional) Delta Y
	_this select 6: (Optional) Resource layer
*/
disableserialization;

_text = _this select 0;
_x = if (count _this > 1) then {_this select 1} else {-1};
_y = if (count _this > 2) then {_this select 2} else {-1};
_w = -1;
_h = -1;
_delay = if (count _this > 3) then {_this select 3} else {4};
_fade = if (count _this > 4) then {_this select 4} else {1};
_moveY = if (count _this > 5) then {_this select 5} else {0};
_layer = if (count _this > 6) then {_this select 6} else {[] call bis_fnc_rscLayer};
if (_delay < 0) then {_delay = 4};
if (_fade < 0) then {_fade = 1};

//--- Width and Height
if (typename _x == typename []) then {
	_array = _x;
	_x = _array select 0;
	_w = _array select 1;
};
if (typename _y == typename []) then {
	_array = _y;
	_y = _array select 0;
	_h = _array select 1;
};

_layer cutrsc ["rscDynamicText","plain"];

_display = uinamespace getvariable "BIS_dynamicText";
_control = _display displayctrl 9999;
_control ctrlsetfade 1;
_control ctrlcommit 0;
_pos = ctrlposition _control;
if (_x != -1) then {_pos set [0,_x]};
if (_y != -1) then {_pos set [1,_y]};
if (_w != -1) then {_pos set [2,_w]};
if (_h != -1) then {_pos set [3,_h]};
_control ctrlsetposition _pos;

if (typeName _text == typeName "") then
{
	_control ctrlsetstructuredtext parseText _text;
}
else
{
	_control ctrlsetstructuredtext _text;
};
_control ctrlcommit 0;

_control ctrlsetfade 0;
_control ctrlcommit _fade;
waituntil {ctrlcommitted _control};

if (_moveY != 0) then {
	_y = _pos select 1;
	_pos set [1,_y + _moveY];
	_control ctrlsetposition _pos;
	_control ctrlcommit _delay;
};

//if (_layer != 789) exitwith {};

_spawn = missionnamespace getvariable format ["bis_dynamicText_spawn_%1",_layer];
if (!isnil "_spawn") then  {terminate _spawn};
_spawn = [_control,_delay,_fade,_moveY,_layer] spawn {
	disableserialization;
	_control = _this select 0;
	_delay = _this select 1;
	_fade = _this select 2;
	_moveY = _this select 3;
	_layer = _this select 4;

	if (_moveY != 0) then {waituntil {ctrlcommitted _control}} else {sleep _delay};

	_control ctrlsetfade 1;
	_control ctrlcommit 1;
	waituntil {ctrlcommitted _control};

	_layer cuttext ["","plain"];
};
missionnamespace setvariable [format ["bis_dynamicText_spawn_%1",_layer],_spawn];
waituntil {scriptdone _spawn};