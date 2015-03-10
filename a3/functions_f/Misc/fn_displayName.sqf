/*
	Author: Karel Moricky

	Description:
	Return displayName of given class. Return class if displayName not defined.

	Parameter(s):
	_this: CONFIG

	Returns:
	STRING
*/

private ["_config","_displayName"];
_config =	[_this,0,configfile,[configfile]] call bis_fnc_param;
_displayName = gettext (_config >> "displayName");
if (_displayName == "") then {_displayName = configname _config};
_displayName