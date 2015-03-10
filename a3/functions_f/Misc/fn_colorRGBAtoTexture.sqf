/*
	Author: Karel Moricky

	Description:
	Converts RGB color format to procedural texture.
	[0,0,0,1] becomes "#(argb,8,8,3)color(0,0,0,1)"

	Parameter(s):
	0: ARRAY - color in RGBA format

	Returns:
	String
*/

private ["_color"];
_color = [[_this],0,[0,0,0,0],[[]],4] call bis_fnc_param;

format [
	"#(argb,8,8,3)color(%1,%2,%3,%4)",
	(_color select 0) call bis_fnc_parsenumber,
	(_color select 1) call bis_fnc_parsenumber,
	(_color select 2) call bis_fnc_parsenumber,
	(_color select 3) call bis_fnc_parsenumber
]