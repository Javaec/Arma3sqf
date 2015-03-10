
/************************************************************
	Sort Numbers
	Author: Andrew Barron

Sorts an array of numbers from lowest (left) to highest (right).
The passed array is modified by reference.

This function uses the quick sort algorithm.
************************************************************/


//set up a function for recursion
private "_sort";
_sort =
{
	private ["_h","_i","_j","_a","_lo","_hi","_x"];

	_a = _this select 0; //array to be sorted
	if ((count _a) == 0) exitWith {};
	
	_lo = _this select 1;//lower index to sort from
	_hi = _this select 2;//upper index to sort to
	_h = nil;            //used to make a do-while loop below
	_i = _lo;
	_j = _hi;
	_x = _a select ((_lo+_hi)/2);


	//  partition

	while {isnil "_h" || _i <= _j} do
	{
		//find first and last elements within bound that are greater / lower than _x
		while {(_a select _i) < _x} do {_i=_i+1};
		while {(_a select _j) > _x} do {_j=_j-1};

		if (_i<=_j) then
		{
			//swap elements _i and _j
			_h = _a select _i;
			_a set [_i, _a select _j];
			_a set [_j, _h];

			_i=_i+1; _j=_j-1;
		};
	};


	//  recursion

	if (_lo<_j) then {[_a, _lo, _j] call _sort};
	if (_i<_hi) then {[_a, _i, _hi] call _sort};
};


//and start it off
[_this, 0, (count _this)-1] call _sort;

//array is already modified by reference, but return the modified array anyway
_this