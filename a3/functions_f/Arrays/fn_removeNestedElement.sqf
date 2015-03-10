
/*
	File: fn_removeNestedElement.sqf
	Author: Joris-Jan van 't Land

	Description:
	Function to remove an item in a nested array.
	
	Example:
	_array = [[1, 2], [3, 4]];
	_bool = [_array, 3] call BIS_fnc_removeNestedElement; //Expected result: [[0, 2], [4]]

	Parameter(s):
	_this select 0: Array
	_this select 1: new value (Any Value)
	
	Returns:
	Boolean success flag
*/

private ["_array", "_value"];
_array = _this select 0;
_value = _this select 1;

if ((typeName _array) != (typeName [])) exitWith {debugLog "Log: [removeNestedElement] Array (0) should be an Array!"; false};

private ["_path", "_subArray"];
//Find the value.
_path = [_array, _value] call BIS_fnc_findNestedElement;

//Find the array containing the value.
_path resize ((count _path) - 1);
_subArray = [_array, _path] call BIS_fnc_returnNestedElement;

//Remove the value from the array.
_subArray = _subArray - [_value];

//Place the updated array back inside its parent.
[_array, _path, _subArray] call BIS_fnc_setNestedElement;

true