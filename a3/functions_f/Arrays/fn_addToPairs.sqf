/*
	Author: Jiri Wainar

	Description:
	Adds given value to pair array, stored under unique key.

	If value is found:
	a) both values are scalars: values are added and stored as a single scalar
	b) one or both values are array: values are added and stored as a single array
	c) anything else: an array is created and both values are stored there

	Remarks:
	Function by default modifies the input array. This can be overrriden by setting '_copyArray' param to true.

	Syntax:
	_pairs:array = [_pairs:array,_key:string,_value:number,_copyArray:bool] call BIS_fnc_addToPairs;

	Example:
	[["apple",3],["pear",12]] = [[["apple",3],["pear",2]],"pear",10] call BIS_fnc_addToPairs;
	[["apple",1],["pear",2]] = [[["apple",3],["pear",2]],"apple",-2] call BIS_fnc_addToPairs;
	[["greetings",["Hello!","Hi!"]],["rudewords",""]] = [[["greetings","Hello!"],["rudewords",""]],"greetings","Hi!"] call BIS_fnc_addToPairs;
*/

#define SCALAR		(typeName 123)
#define ARRAY		(typeName [])

private ["_pairs","_key","_add","_copy","_index","_value","_tValue","_tAdd"];

_pairs	= [_this,0,[],[[]]] call bis_fnc_param;
_key 	= [_this,1,"",[""]] call bis_fnc_param;
_add	= [_this,2,1] call bis_fnc_param;
_copy	= [_this,3,false,[true]] call bis_fnc_param;
_index  = -1;

//create a copy of the array
if (_copy) then
{
	_pairs = +_pairs;
};

{
	if (typeName _x != typeName []) exitWith
	{
		["Every item in the pair array must be an array!"] call BIS_fnc_error;
		_index = -2;
	};
	if (count _x  != 2) exitWith
	{
		["Pair array must contain exactly 2 items, key and value!"] call BIS_fnc_error;
		_index = -2;
	};
	if (isNil{_x select 0}) exitWith
	{
		["Key cannot be nil!"] call BIS_fnc_error;
		_index = -2;
	};
	if (typeName(_x select 0) != typeName "") exitWith
	{
		["Key must be a string!"] call BIS_fnc_error;
		_index = -2;
	};
	if (isNil{_x select 1}) exitWith
	{
		["Value cannot be nil!"] call BIS_fnc_error;
		_index = -2;
	};
	if (_key == (_x select 0)) exitWith
	{
		_index = _forEachIndex;
		_value = _x select 1;
	};
}
forEach _pairs;

//error occured, exit
if (_index == -2) exitWith {_pairs};

//key not found, add the new entry
if (_index == -1) then
{
	_pairs set [count _pairs, [_key, _add]];
}
//key found, add the value to existing entry
else
{
	_tValue = typeName _value;
	_tAdd = typeName _add;

	switch (true) do
	{
		case (_tValue == SCALAR && _tAdd == SCALAR):
		{
			_pairs set [_index, [_key, _value + _add]];
		};
		case (_tValue == ARRAY && _tAdd == ARRAY):
		{
			_pairs set [_index, [_key, _value + _add]];
		};
		case (_tValue == ARRAY):
		{
			_pairs set [_index, [_key, _value + [_add]]];
		};
		case (_tAdd == ARRAY):
		{
			_pairs set [_index, [_key, _add + [_value]]];
		};

		//none of the items are of array, so create one and store them there
		default
		{
			_pairs set [_index, [_key, _value + [_add]]];
		};
	};
};

_pairs