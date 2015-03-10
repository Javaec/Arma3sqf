/*
	Author: Karel Moricky

	Description:
	Get relationship of competing Trident sides.
	The value slowly decreases towards 0.

	Parameter(s):
		0: SIDE
		1: SIDE

	Returns:
	NUMBER - relationship value
*/


private ["_sideA","_sideB"];

_sideA = [_this,0,sideUnknown,[sideUnknown]] call bis_fnc_param;
_sideB = [_this,1,sideUnknown,[sideUnknown]] call bis_fnc_param;

if (_sideA == _sideB) exitwith {["Cannot set relationship of %1 towards itself. Use two different sides.",_sideA] call bis_fnc_error; 0};

[_sideA,_sideB,0,true] call bis_fnc_tridentSetRelationship;