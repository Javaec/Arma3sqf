//
/*
	Author: Karel Moricky

	Description:
	Check if class exists Scripted Database.

	Parameter(s):
	_this select 0: ARRAY - Database array
	_this select 1: ARRAY - Path

	Returns:
	BOOLEAN - True if class exists
*/

!isnil {_this call bis_fnc_dbClassReturn};