
/*
	File: fn_returnNestedElement.sqf
	Author: Joris-Jan van 't Land

	Description:
	Function to return an item at a path in an array.
	
	Example:
	_array = [[1, 2], [3, 4]];
	_value = [_array, [0, 1]] call BIS_fnc_returnNestedElement; //Expected result: 2

	Parameter(s):
	_this select 0: Array
	_this select 1: path to the element (Array)
	
	Returns:
	Any Value found element
*/

private ["_array", "_path"];
_array = _this select 0;
_path = _this select 1;

if ((typeName _array) != (typeName [])) exitWith {debugLog "Log: [returnNestedElement] Array (0) should be an Array!"};
if ((typeName _path) != (typeName [])) exitWith {debugLog "Log: [returnNestedElement] Path (1) should be an Array!"};

{
	if ((typeName _array) != (typeName [])) exitWith {_array = nil; debugLog "Log: [returnNestedElement] One of the elements in the given path is not an Array!"};
	if (_x > ((count _array) - 1)) exitWith {_array = nil; debugLog "Log: [returnNestedElement] One of the elements in the given path is outside the scope of its parent Array!"};
	_array = _array select _x;
} forEach _path;

_array