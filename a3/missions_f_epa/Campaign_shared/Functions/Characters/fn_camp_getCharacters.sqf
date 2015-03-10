/*
	Author: Jiøí Wainar

	Description:
	Returns an array of all units that use the weapon pool mechanics.

	Remarks:
	* Units need to be defined in the mission's description.ext, in class Characters.

	Example:
	_characters:array = [_mission:string] call BIS_fnc_camp_getCharacters;
	_characters:array = ["A_hub01"] call BIS_fnc_camp_getCharacters;
*/

private ["_mission","_toLower","_cfg","_characters","_templates"];

_mission 	= [_this,0,missionname,[""]] call bis_fnc_param;
_toLower 	= [_this,1,true,[true]] call bis_fnc_param;
_cfg 		= [_mission] call BIS_fnc_camp_getMissionDesc;

_characters 	= (_cfg >> "Characters") call BIS_fnc_getCfgSubClasses;
_templates	= (_cfg >> "Characters" >> "templates") call BIS_fnc_getCfgData;

{
	_characters set [_forEachIndex, toLower _x];
}
forEach _characters;

_characters 	= _characters - _templates;

_characters