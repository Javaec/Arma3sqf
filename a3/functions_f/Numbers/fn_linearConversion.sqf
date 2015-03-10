/*
	File: fn_linearConversion.sqf
	Author: Joris-Jan van 't Land

	Description:
	Linear conversion of a value from one set to another.

	Parameter(s):
	_this select 0: Array (originalSet)
		Note: should be two elements [minimumValue, maximumValue]
	_this select 1: Scalar (originalValue)
	_this select 2: Array (newSet)
		Note: should be two elements [minimumValue, maximumValue]
	
	Returns:
	Scalar (newValue)
*/

private ["_orgSet", "_orgValue", "_newSet"];
_orgSet = _this select 0;
_orgValue = _this select 1;
_newSet = _this select 2;

private ["_orgRange", "_newRange"];
_orgRange = (_orgSet select 1) - (_orgSet select 0);
_newRange = (_newSet select 1) - (_newSet select 0);

(((_orgValue - (_orgSet select 0)) * _newRange) / _orgRange) + (_newSet select 0)