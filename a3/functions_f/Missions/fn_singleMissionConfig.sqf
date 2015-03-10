/*
	Author: Karel Moricky

	Description:
	Returns config of current single mission

	Parameter(s):
	_this select 0 (Optional): STRING - Mission class

	Returns:
	CONFIG - config path to mission
	NIL - no returned value when mission was not found
*/


private ["_missionname","_cfgMissions","_config","_category"];


_missionName = [_this,0,[] call bis_fnc_singlemissionname,[""]] call bis_fnc_param;
_cfgMissions = configfile >> "cfgmissions";

for "_c" from 0 to (count _cfgMissions - 1) do {

	_category = _cfgMissions select _c;
	if (isclass _category) then {

		if (isclass (_category >> _missionName)) exitwith {_config = _category >> _missionName};

	};
};

if (isnil "_config") then {nil} else {_config};