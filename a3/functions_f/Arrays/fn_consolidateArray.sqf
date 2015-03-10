/*
	Author: Jiri Wainar

	Description:
	Finds duplicities in array of strings and consolidates it to the array of sub-arrays, where:
	id 0: string
	id 1: occurrence count

	Syntax:
	_cosolidated:array = _strings:array call BIS_fnc_consolidateArray;

	Example:
	[["apple",3],["pear",2]] = ["apple","apple","pear","pear","apple"] call BIS_fnc_consolidateArray;
*/

private ["_output","_input","_string","_count"];

_input 	= _this;
_output = [];

if (typeName _input != typeName []) exitWith
{
	["Input must be an array of strings!"] call BIS_fnc_error;
	[]
};

while {count _input > 0} do
{
	_string = _input select 0;

	if (typeName _string != typeName "") exitWith
	{
		["Every item in the input array must be a string!"] call BIS_fnc_error;
		_output = [];
	};

	_count 	= {_x == _string} count _input;

	//store the string and the occurance count
	_output set [count _output,[_string,_count]];

	//remove the processed strings
	_input = _input - [_string];
};

_output