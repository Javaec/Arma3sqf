/*
	Author: Karel Moricky

	Description:
	Converts config color format to RGBA array of numbers.
	["0.5 + 0.25",0,0,1] becomes [0.75,0,0,1]

	Parameter(s):
	0: ARRAY - color in RGBA format

	Returns:
	ARRAY
*/

private ["_color","_continue"];
_color = [[_this],0,[0,0,0,0],[[],configfile],4] call bis_fnc_param;
_continue = if (typename _color == typename configfile) then {
	if (isarray _color) then {_color = getarray _color; true} else {false};
} else {
	true
};
if !(_continue) exitwith {["Config param %1 is not array or does not exist.",_color] call bis_fnc_error; [0,0,0,0]};
_color = [[_color],0,[0,0,0,0],[[]],4] call bis_fnc_param;
[
	(_color select 0) call bis_fnc_parsenumber,
	(_color select 1) call bis_fnc_parsenumber,
	(_color select 2) call bis_fnc_parsenumber,
	(_color select 3) call bis_fnc_parsenumber
]