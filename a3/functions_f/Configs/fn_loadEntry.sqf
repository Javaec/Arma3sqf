/*
	Author: Karel Moricky

	Description:
	Searches for config entry in mission, campaign and then in global config file.
	
	Parameter(s):
		0: ARRAY of STRINGs - path
		1: COFNIG - default path used in case when the original one is not found
	
	Returns:
	ARRAY or NUMBER or STRING
*/

private ["_path","_default","_result","_core"];

_path = [_this,0,[],[[]]] call bis_fnc_param;
_default = [_this,1,configfile,[configfile]] call bis_fnc_param;
_result = _default;

if (count _path == 0) exitwith {"Path not defined." call bis_fnc_error; _result};
{
	_core = _x;
	{_core = _core >> _x;} foreach _path;
	if (isarray _core || isnumber _core || istext _core) exitwith {_result = _core};
} foreach [
	missionconfigfile,
	campaignconfigfile,
	configfile
];
_result