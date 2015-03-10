

//------------------
// Author: Philipp Pilhofer (raedor)
// Purpose: This function checks if two arrays are containing the same elements in the same order
// Arguments: [array1, array2]
// Return: boolean
//
// Revision History:
// 24/11/06 0.1 - First cut
// 8 Feb 08 - [Andrew] Deprecated this function; it has been superceded by BIS_fnc_areEqual
//            which can compare ALL data types (this one fails with certain types)
//------------------

_this call BIS_fnc_areEqual;

/*
private["_a1","_a2","_r","_i"];
_a1 = _this select 0;
_a2 = _this select 1;
_r=true;
if(count _a1!=count _a2)then
{
	_r=false
}
else
{
	_i=0;
	while{_i<count _a1 && _r}do
	{
		if (typename (_a1 select _i) != typename (_a2 select _i)) exitWith
		{
			_r=false;
		};
		if (typename (_a1 select _i) == "ARRAY") then
		{
			if (!([(_a1 select _i),(_a2 select _i)] call BIS_fnc_arrayCompare)) exitWith
			{
				_r=false
			}
		}
		else
		{
			if((_a1 select _i)!=(_a2 select _i))exitWith
			{
				_r=false
			}
		};
		_i = _i + 1;
	};
};
_r
*/