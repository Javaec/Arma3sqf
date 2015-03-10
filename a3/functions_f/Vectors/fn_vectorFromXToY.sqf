
/************************************************************
	Vector From X to Y
	Author: From VBS1 Core

<resultant vector> = [<vector1>,<vector2>] call BIS_fnc_vectorFromXToY

Operand types:
<vector1>: array
<vector2>: array
<resultant vector>: array

Returns a unit vector that 'points' from <vector1> to <vector2>.
This is a very useful function, as it can be used with the velocity
command to move an object from one position to another
(ie <vector1> to <vector2>) - ensure both positions are found using getposasl.
************************************************************/

([_this select 0,_this select 1] call BIS_fnc_vectorDiff) call BIS_fnc_unitVector