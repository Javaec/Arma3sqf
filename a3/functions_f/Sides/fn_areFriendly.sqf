/*
	Author: Karel Moricky

	Description:
	Compares two sides and returns if they are allied

	Parameter(s):
	_this select 0: SIDE
	_this select 1: SIDE

	Returns:
	Bool - true if allies
*/

private ["_sideA","_sideB"];

_sideA = [_this,0,sideUnknown,[sideUnknown]] call bis_fnc_param;
_sideB = [_this,1,sideUnknown,[sideUnknown]] call bis_fnc_param;

if (_sideA in [civilian,sidelogic] || _sideB in [civilian,sidelogic]) then {
	true //--- BFF with civilians
} else {
	private ["_conflictLimit"];
	_conflictLimit = 0.6;

	_sideA getfriend _sideB >= _conflictLimit
	&&
	_sideB getfriend _sideA >= _conflictLimit
};