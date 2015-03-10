/*
	Author: Karel Moricky

	Description:
	Returns list of all parent classes
	
	Parameter(s):
	_this select 0: starting config class (Config)
	_this select 1: true if you want to return only classnames (Boolean)
	
	Returns:
	Array - List of all classes (including starting one)
*/
private ["_entry","_returnString","_parents","_element"];

_entry = [_this,0,configfile,[configfile]] call bis_fnc_param;
_returnString = [_this,1,false,[false]] call bis_fnc_param;
_parents = [];

while {isclass _entry} do {
	_element = if (_returnString) then {configname _entry} else {_entry};
	_parents set [count _parents,_element];
	_entry = inheritsfrom _entry;
};

_parents