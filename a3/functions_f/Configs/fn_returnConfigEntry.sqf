/*
	Author: Joris-Jan van 't Land, optimized by Karel Moricky

	Description:
	Explores parent classes in the run-time config for the value of a config entry.
	
	Parameter(s):
	_this select 0: starting config class (Config)
	_this select 1: queried entry name (String)
	_this select 2 (Optional): default value returned in case the entry does not exist
	
	Returns:
	Number / String - value of the found entry
*/

private ["_config", "_entryName"];
_config = [_this,0,configfile,[configfile]] call bis_fnc_param;
_entryName = [_this,1,"",[""]] call bis_fnc_param;

private ["_entry", "_value"];
_entry = if (_entryName == "") then {_config} else {_config >> _entryName};
_value = switch (true) do {
	case (isNumber _entry): {getNumber _entry};
	case (isArray _entry): {getArray _entry};
	case (isText _entry): {getText _entry};
	default {nil};
};

//Make sure returning 'nil' works.
if (isNil {_value}) exitwith {
	if (count _this > 2) then {_this select 2} else {nil};
};

_value