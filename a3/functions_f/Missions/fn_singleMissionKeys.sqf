/*
	Author: Karel Moricky

	Description:
	Activate mission related keys

	Parameter(s):
	NOTHING

	Returns:
	ARRRAY - list of activated keys
*/
private ["_activate","_doneKeys","_missionConfig"];
_activate = [_this,0,true,[true]] call bis_fnc_param;

//--- Mission config
_doneKeys = getarray (missionconfigfile >> "donekeys");

//--- Global config
_missionConfig = [] call bis_fnc_singlemissionconfig;
if !(isnil "_missionconfig") then {
	_doneKeys = _doneKeys + getarray (_missionConfig >> "donekeys");
};

//--- Activate
if (_activate) then {
	{
		activatekey _x;
	} foreach _doneKeys;
};

_doneKeys