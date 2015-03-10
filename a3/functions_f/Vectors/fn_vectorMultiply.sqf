
/************************************************************
	Vector Multiply
	Author: From VBS1 Core

Operand types:
<vector1>: array
<scale>: number
<resultant vector>: array

Returns a unit vector that 'points' from <vector1> to <vector2>.
This is a very useful function, as it can be used with the velocity
command to move an object from one position to another.
(ie <vector1> to <vector2>) - ensure both positions are found using getposasl.

<resultant vector> = [<vector>,<scale>] call BIS_fnc_vectorMultiply
************************************************************/

private["_v","_scale","_i"];

_v = +(_this select 0);
_scale = _this select 1;
for "_i" from 0 to count _v - 1 do
{
	_v set [_i, (_v select _i) * _scale]
};
_v
