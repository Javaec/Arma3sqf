
/************************************************************
	Vector Difference
	Author: From VBS1 Core, modified by Vilem (arbitrary no of dimensions dimensions)

<difference> = [<vector1>,<vector2>] call BIS_fnc_vectorDiff

Operand types:
<difference>: array
<vector1>: array
<vector2>: array

Returns a vector that is the difference between <vector1> and <vector2>.

************************************************************/

private["_p1","_p2","_return"];

_p1 = _this select 0;
_p2 = _this select 1;

if ((count _p1) != (count _p2)) then {textLogFormat ["BIS_FNC Error: vectors not of same size"]};

_return = [];

{
  _return = _return + [(_p2 select _forEachIndex) - _x];
}
forEach _p1;

_return
