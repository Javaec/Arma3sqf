/*
	Author: Karel Moricky

	Description:
	Returns list of campaign missions

	Parameter(s):
	_this select 0:
		ARRAY - returns list of finished missions
		STRING - returns list of current missions for given world (current world is used if "" is used)
		BOOL - returns list of all missions

	Returns:
	ARRAY
*/

private ["_param"];
_param =	[_this,0,[],[[],"",true]] call bis_fnc_param;

if (typename _param == typename []) then {

	//--- Completed missions
	BIS_heliportMissionsCompleted
} else {
	if (typename _param == typename "") then {

		//--- Current missions
		BIS_heliportMissionsAvailable
	} else {

		//--- All missions
		BIS_heliportMissions
	};
};