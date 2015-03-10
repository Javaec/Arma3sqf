/*
	Author: Karel Moricky

	Description:
	Checks if given key name exists in ingame localisation database.

	Parameter(s):
	_this: STRING

	Returns:
	BOOL
*/

private ["_string","_stringName"];
_stringName = [_this,0,"",[""]] call bis_fnc_param;
islocalized _stringName

//--- Obsolete variant before isLocalized command was introduced
//_string = localize _stringName;
//_string != "" && _string != "!!! MISSING STRING"