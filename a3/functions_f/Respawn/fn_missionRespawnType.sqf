/*
	Author: Karel Moricky

	Description:
	Return respawn type defined in Description.ext

	Parameter(s):
		0: NUMBER or STRING - defines type of returned value

	Returns:
	NUMBER or STRING - respawn type ID (e.g., 1) or name (e.g., "BIRD")
*/

private ["_returnType","_respawnNames","_respawn"];

_returnType = [_this,0,0,[0,""]] call bis_fnc_param;
_respawnNames = ["none","bird","instant","base","group","side"];
_respawn = [missionconfigfile,"respawn",0] call bis_fnc_returnconfigentry;
_respawn = [_this,1,_respawn,[0,""]] call bis_fnc_param;
switch (typename _respawn) do {
	case (typename 00): {
		if (typename _returnType == typename 00) then {_respawn} else {_respawnNames select (_respawn max 0 min 5)};
	};
	case (typename ""): {
		if (typename _returnType == typename 00) then {_respawnNames find (tolower _respawn)} else {_respawn};
	};
	default {
		if (typename _returnType == typename 00) then {0} else {"NONE"};
	};
};