
/************************************************************
	Array Insert
	Author: Andrew Barron

Parameters: [base array, insert array, index]
Returs: [array]

Inserts the elements of one array into another, at a specified
index.

Neither arrays are touched by reference, a new array is returned.

Example: [[0,1,2,3,4], ["a","b","c"], 1] call BIS_fnc_arrayInsert
Returns: [0,"a","b","c",1,2,3,4]
************************************************************/

//extract parameters
private ["_baseArray","_toInsert","_index","_ret"];
_baseArray = _this select 0;
_toInsert = _this select 1;
_index = _this select 2;


//special processing needed unless we are "inserting" at the beginning of the array
if(_index > 0) then
{
	//select left part of base array, before the insertion index
	_ret = [_baseArray, 0, _index-1] call BIS_fnc_subSelect;

	//push in the elements to be inserted
	[_ret, _toInsert] call BIS_fnc_arrayPushStack;
}
else
{
	_ret = _toInsert;
};

//push in the remaining elements from the base array
[_ret, [_baseArray, _index] call BIS_fnc_subSelect] call BIS_fnc_arrayPushStack;

//return new array
_ret