
/************************************************************
	Conditional Select
	Author: Andrew Barron

Parameters: [array, {condition}]

This returns a sub-array of elements that satisfy a specific condition.
The originally passed array is NOT modified!

The function takes, in order, every element of the passed array,
evaluates it in the condition, and, if the condition is true, adds
it to the return array.

In the condition, the currently tested element is assigned to
the variable "_x".

Care must be taken that the condition won't cause errors. For
example, if your condition assumes all elements are numbers,
errors will occur if your array includes strings.

This function is similar to the "count" command, only it returns
the elements of the array that satisfy the condition, rather
than simply returning the count.

Example: [[10,0,8,2,6,4], {_x > 5}] call BIS_fnc_conditionalSelect
Returns: [10,8,6]

Example: [[10,true,8,player], {typename _x == "STRING"}] call BIS_fnc_conditionalSelect
Returns: []

************************************************************/

private ["_cond","_ret","_x"];

_cond = _this select 1;
_ret = []; //to be filled with return array

{
	//just call the condition directly
	//note the current element is already assigned to _x, and will be accessible in the condition
	if(call _cond) then {[_ret, _x] call BIS_fnc_arrayPush};
} foreach (_this select 0);

_ret












