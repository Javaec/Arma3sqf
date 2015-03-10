
/************************************************************
	Cross Product
	Author: Andrew Barron
	
Returns the cross product of two 3D vectors.
************************************************************/

private ["_v1","_v2"];

_v1 = _this select 0;
_v2 = _this select 1;

//definition of cross product:
//a x b = (a2b3 - a3b2)i + (a3b1 - a1b3)j + (a1b2 - a2b1)k 
[
	(_v1 select 1)*(_v2 select 2)-(_v1 select 2)*(_v2 select 1), //(a2b3 - a3b2)i
	(_v1 select 2)*(_v2 select 0)-(_v1 select 0)*(_v2 select 2), //(a3b1 - a1b3)j
	(_v1 select 0)*(_v2 select 1)-(_v1 select 1)*(_v2 select 0)  //(a1b2 - a2b1)k
]
