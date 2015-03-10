

//------------------
// Author: Philipp Pilhofer (raedor)
// Purpose: This function searches an element in an array and returns the first occurence
// Arguments: [array, element]
// Return: anything
//
// Revision History:
// 24/11/06 0.1 - First cut
//------------------


private["_c","_i","_r","_v","_a"];
_a=_this select 0;
_v=_this select 1;
_r=-1;

_i=0; _c=count _a;
while {_i<_c && _r in [-1]} do
{
	if (typeName _a == "ARRAY") then
	{
		if (str _v == str (_a select _i)) then
		{
			_r=[_i];
		}else{
			_i=_i+1;
		};
	}else{
		_r=[_a select _i,_v] call BIS_fnc_arrayFindDeep;
		if !(_r in [-1]) then
		{
			_r=[_i]+_r;
		}else{
			_i=_i+1;
		};
	};
};

_r