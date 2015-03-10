/*
	Author: Karel Moricky

	Description:
	Return representative faction of the given side.
	Faction of the first detected player is used.

	Parameter(s):
	0: SIDE

	Returns:
	STRING - CfgFactionClasses class
*/

private ["_side","_sideVar","_faction"];
_side = [_this,0,sideunknown,[sideunknown]] call bis_fnc_param;
_sideVar = _fnc_scriptname + str _side;
_faction = missionnamespace getvariable _sideVar;
if (isnil "_faction") then {
	_faction = "";
	{
		if ((_x call bis_fnc_objectside) == _side) exitwith {
			_faction = faction _x;
			missionnamespace setvariable [_sideVar,_faction];
		};
	} foreach (playableunits + switchableunits);
};
_faction