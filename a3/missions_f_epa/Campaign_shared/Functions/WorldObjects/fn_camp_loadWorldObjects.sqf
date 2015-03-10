/*
	Author: Jiri Wainar

	Description:
	Loads info about destroyed world objects from persistent array and destroys those objects.

	Returns:
	-

	Example:
	[] call BIS_fnc_camp_loadWorldObjects;
*/

#define STRING		typeName ""
#define ARRAY		typeName []

private["_cfgWorldObjects","_defined","_island","_classes"];

_cfgWorldObjects = missionconfigfile >> "WorldObjects";
_defined 	 = _cfgWorldObjects call Bis_fnc_getCfgIsClass;
_island		 = worldName;

if !(_defined) exitWith
{
	["Definition of *World Objects* not found."] call BIS_fnc_logFormat;
};

_classes 	= ["WorldObjects",_island] call BIS_fnc_getCfgSubClasses;
_classes 	= _classes - ["Default"];

{
	if (_x in _classes) then
	{
		[_x] call BIS_fnc_camp_destroyWorldObject;
	};
}
forEach BIS_PER_destroyedWorldObjects;