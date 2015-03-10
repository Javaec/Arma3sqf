/*
	Author: Karel Moricky

	Description:
	Round direction to nearest limit
	(used for determining cardinal direction)

	Parameter(s):
	_this select 0: NUMBER - direction
	_this select 1 (Optional): NUMBER - limit direction (default: 90)

	Returns:
	NUMBER - rounded direction
*/

private ["_dir","_section"];

_dir =		[_this,0,0,[0]] call bis_fnc_param;
_section =	[_this,1,90,[0]] call bis_fnc_param;

(round(_dir / _section)) * _section