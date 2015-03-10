/*
	Author: Jiri Wainar

	Description:
	Scans the map for objects defined in the world objects config (\A3\Missions_F_EPA\Campaign_shared\cfgWorldObjects.hpp) and stores the destroyed objects in the persistent array.

	Returns:
	-

	Example:
	[] call BIS_fnc_camp_saveWorldObjects;
*/

#define STRING		typeName ""
#define ARRAY		typeName []

private["_cfgWorldObjects","_defined","_island","_classes","_object"];

_island		 = worldName;
_cfgWorldObjects = missionconfigfile >> "WorldObjects";
_defined 	 = (_cfgWorldObjects >> _island) call Bis_fnc_getCfgIsClass;

if !(_defined) exitWith
{
	["Definition of *World Objects* not found for %1 island!",_island] call BIS_fnc_logFormat;
};

_classes = ["WorldObjects",_island] call BIS_fnc_getCfgSubClasses;
_classes = _classes - ["Default"];

{
	_object = [_x,true] call BIS_fnc_camp_getWorldObject;

	if !(isNull _object) then
	{
		BIS_PER_destroyedWorldObjects = BIS_PER_destroyedWorldObjects - [_x];
		BIS_PER_destroyedWorldObjects = BIS_PER_destroyedWorldObjects + [_x];
	};
}
forEach _classes;