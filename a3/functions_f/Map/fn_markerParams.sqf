/*
	Author: Karel Moricky

	Description:
	Returns marker params in format compatible with BIS_fnc_markerCreate

	Parameter(s):
	_this: STRING - marker name

	Returns:
	ARRAY - marker params
*/

private ["_marker"];
_marker = [_this,0,"",[""]] call bis_fnc_param;
[
	[_marker],
	markerpos _marker,
	markersize _marker,
	markercolor _marker,
	markertype _marker,
	markerbrush _marker,
	markershape _marker,
	markeralpha _marker,
	markertext _marker
]