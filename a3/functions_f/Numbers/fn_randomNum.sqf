
/************************************************************
	Random Number
	Author: Andrew Barron

Parameters: [bound 1, bound 2]

Returns a random number between the two passed numbers (inclusive).

Example: [1,3] BIS_fnc_randomNum OR [3,1] call BIS_fnc_randomNum
Returns: a number between 1 and 3
************************************************************/

private ["_upperL","_lowerL","_result"];

_lowerL = _this select 0;   //lower limiting number
_upperL = _this select 1;   //upper limiting number

//swap inputs if they are out of order
if (_lowerL > _upperL) then {_lowerL = _this select 1; _upperL = _this select 0};

//round the inputs in case they aren't integers
_lowerL = round _lowerL;
_upperL = round _upperL;

//get the random number
_result = random (_upperL - _lowerL) + _lowerL;
_result;