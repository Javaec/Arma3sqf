/*
	Author: Karel Moricky

	Description:
	Set relationship of competing Trident sides.
	When the value reaches threshold, side relationship will change.
	The value slowly decreases towards 0.

	Parameter(s):
		0: SIDE
		1: SIDE
		2: NUMBER - changed value
		3: BOOL - true to add the value, false to set the value

	Returns:
	NUMBER - relationship value after change
*/

private ["_sideA","_sideB","_value","_isRelative","_sideIDA","_sideIDB","_sideID","_relationshipVariable"];

_sideA = [_this,0,sideUnknown,[sideUnknown]] call bis_fnc_param;
_sideB = [_this,1,sideUnknown,[sideUnknown]] call bis_fnc_param;
_value = [_this,2,0,[0]] call bis_fnc_param;
_isRelative = [_this,3,true,[true]] call bis_fnc_param;

if (_sideA == _sideB) exitwith {["Cannot set relationship of %1 towards itself. Use two different sides.",_sideA] call bis_fnc_error; 0};

_sideIDA = _sideA call bis_fnc_sideID;
_sideIDB = _sideB call bis_fnc_sideID;
_sideID = _sideIDA * 2 + _sideIDB * 2;

_relationshipVariable = "BIS_fnc_trident_" + str _sideID;
if (_isRelative) then {
	_value = _value + (missionnamespace getvariable [_relationshipVariable,0]);
};

missionnamespace setvariable [_relationshipVariable,_value];
publicvariable _relationshipVariable;

_value