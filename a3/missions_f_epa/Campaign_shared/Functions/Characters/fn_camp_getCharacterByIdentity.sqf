/*
	Author: Jiri Wainar

	Description:
	Search character definition by identity. Character class (often unitVarName) is returned if search is successful.

	Returns:
	Unit character class as STRING or "" if match is not found.

	Example:
	_character:string = [_identity:string(,_mission:string)] call BIS_fnc_camp_getCharacterByIdentity;
*/

private ["_identity","_mission","_cfg","_characters","_character","_xIdentity"];

_identity = [_this,0,"",[""]] call bis_fnc_param;
_mission  = [_this,1,missionName,[""]] call bis_fnc_param;

if (_identity == "") exitWith {""};

_characters = [_mission] call BIS_fnc_camp_getCharacters;
_cfg 	    = [_mission] call BIS_fnc_camp_getMissionDesc;
_character  = "";

{
	_xIdentity = [_cfg,"Characters",_x,"identity"] call BIS_fnc_getCfgData;

	if (_identity == _xIdentity) exitWith
	{
		_character = _x;
	};
}
forEach _characters;

_character