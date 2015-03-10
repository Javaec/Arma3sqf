/*
	Author: Karel Moricky

	Description:
	Returns side name

	Parameter(s):
	0: SIDE or NUMBER - either side or side ID

	Returns:
	STRING
*/

private ["_sideID","_sideName"];
_sideID = [_this,0,sidelogic,[sidelogic,0]] call bis_fnc_param;
if (typename _sideID != typename 0) then {_sideID = _sideID call bis_fnc_sideID;};

if (_sideID < 0 || _sideID > 10) exitwith {""};

_sideName = [
	"STR_EAST",
	"STR_WEST",
	"STR_GUERRILA",
	"STR_CIVILIAN",
	"STR_DN_UNKNOWN",
	"STR_DISP_CAMPAIGN_ENEMY",
	"STR_DISP_CAMPAIGN_FRIENDLY",
	"STR_LOGIC",
	"STR_EMPTY",
	"STR_AMBIENT_LIFE"
] select _sideID;
localize _sideName;