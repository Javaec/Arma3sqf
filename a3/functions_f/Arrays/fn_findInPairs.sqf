/*
	Author: Jiri Wainar

	Description:
	Searches the associative array for the 1st occurance of the key string and returns it's index.

	Syntax:
	_index:number = [_associativeArray:array,_key:string] call BIS_fnc_findInPairs;

	Example:
	0 = [[["apple",3],["pear",2]],"apple"] call BIS_fnc_findInPairs;

	Returns:
	* if found: index (starting from 0)
	* if not found: -1
*/

private ["_pairs","_key","_index"];

_pairs 	 = [_this,0,[],[[]]] call bis_fnc_param;
_key 	 = [_this,1,"",[""]] call bis_fnc_param;

_index	 = -1;


{
	if (typeName _x != typeName []) exitWith
	{
		["Every item in the pair array must be an array!"] call BIS_fnc_error;
	};
	if (count _x  != 2) exitWith
	{
		["Pair array must contain exactly 2 items, key and value!"] call BIS_fnc_error;
	};
	if (isNil{_x select 0}) exitWith
	{
		["Key cannot be nil!"] call BIS_fnc_error;
	};
	if (typeName(_x select 0) != typeName "") exitWith
	{
		["Key must be a string!"] call BIS_fnc_error;
	};
	if (isNil{_x select 1}) exitWith
	{
		["Value cannot be nil!"] call BIS_fnc_error;
	};


	if (_key == (_x select 0)) exitwith
	{
		_index = _forEachIndex;
	};
}
forEach _pairs;

_index