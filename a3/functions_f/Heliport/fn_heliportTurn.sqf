//
/*
	Author: Karel Moricky

	Description:
	Returns number of current turn.

	Parameter(s):
	NOTHING

	Returns:
	NUMBER
*/
if (isnil "hsim_heliportDB") exitwith {-1}; //--- ToDo: Proper solution on BIS_fnc_dbValueReturn side
[hsim_heliportDB,["turn"],-1] call BIS_fnc_dbValueReturn