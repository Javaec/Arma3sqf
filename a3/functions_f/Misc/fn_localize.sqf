/*
	Author: Karel Moricky

	Description:
	Checks if text is localization key and if so, return the localized text.

	Parameter(s):
	_this: STRING

	Returns:
	STRING
*/


private ["_text"];
_text = [_this,0,"",[""]] call bis_fnc_param;
if (_text call bis_fnc_islocalized) then {localize _text} else {_text};