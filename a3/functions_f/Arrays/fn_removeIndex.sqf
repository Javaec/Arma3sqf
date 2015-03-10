
/************************************************************
	Remove Index
	Author: Andrew Barron

Parameters: [array, index, <end index>] OR [array, [indexes]]

Takes an array, and returns a new array with the specified index(es)
removed.

This takes the array passed in the first parameter, and returns
an array that has the index number in the second parameter removed.

If a third parameter is passed, then a range of indexes will be removed.

Alternatively, you can pass an array of indexes to remove in the
second parameter.

This function doesn't touch the original array (that is passed as a parameter).

	Examples:

_array = [1,["b"],"c",[4],"d"];

[_array, 2]       call BIS_fnc_removeIndex; //returns: [1,["b"],[4],"d"]
[_array, [0,1,3]] call BIS_fnc_removeIndex; //returns: ["c","d"]
[_array, 2, 3]    call BIS_fnc_removeIndex; //returns: [1,["b"],"d"]
************************************************************/

private ["_idx", "_Array", "_i", "_NewArray"];

_Array = _this select 0;  //array to cut from
_idx = _this select 1;    //index(es) to remove

//convert input to an array, if only a single number was passed
if(typeName _idx != "ARRAY") then
{
	_idx = [_idx];

	//if the optional third parameter was passed, then add those indexes to the blacklist
	if (count _this > 2) then
	{
		for "_i" from (_this select 1) to (_this select 2) do
		{
			[_idx, _i] call BIS_fnc_arrayPush;
		};
	};
};

_NewArray = [];           //our new array is constructed here

//loop thru old array, copy everything over into new array
//EXCEPT for the indexes we want to remove / are blacklisting
for "_i" from 0 to (count _array - 1) do
{
	if (!(_i in _idx)) then
	{
		_NewArray set [count _NewArray, _Array select _i];
	};
};

_NewArray
