//
/*
	Author: Karel Moricky

	Description:
	Checks if string is value definition.

	Parameter(s):
	_this select 0: STRING

	Returns:
	BOOLEAN
*/

private ["_textArray"];
if (typename _this == typename "") then {
	_textArray = toarray _this;
	if (count _textArray > 0) then {
		(_textArray select 0) == (toarray (call BIS_fnc_dbSymbolValue) select 0)
	} else {
		false
	};
} else {
	false
};