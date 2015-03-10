
/************************************************************
	Random Integer
	Author: Andrew Barron

Parameters: [bound 1, bound 2]

Returns a random integer between the two passed numbers (inclusive).

Example: [1,3] BIS_fnc_randomInt OR [3,1] call BIS_fnc_randomInt
Returns: 1, 2, or 3
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
_result = ((random 1) * (1 + _upperL - _lowerL)) + _lowerL; //will return a decimal number between lower bound (inclusive) and upper bound + 1 (not inclusive)
_result = floor _result;
_result