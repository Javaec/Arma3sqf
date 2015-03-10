/*
	Author: Jiri Wainar

	Description:
	Returns all objects with surfaces that can be populated by the ambient objects and weapon holders.

	Example:
	[_obj1,_obj2,...] = [] call BIS_fnc_camp_getSurfaceObjects;
*/

private["_surfaceObjectTypes","_surfaceObjects","_surfaceObjectsCustom"];

//get surface objects according to their class
_surfaceObjectTypes = ["HubObjects","SurfaceObjects"] call BIS_fnc_getCfgSubClasses;
_surfaceObjectTypes = _surfaceObjectTypes - ["Default"];
_surfaceObjects     = [];

{
	_surfaceObjects = _surfaceObjects - (allMissionObjects _x);
	_surfaceObjects = _surfaceObjects + (allMissionObjects _x);
}
forEach _surfaceObjectTypes;

//get custom surface objects
_surfaceObjectsCustom = [];

{
	if ((_x getVariable ["BIS_SurfaceObject", ""]) != "") then
	{
		_surfaceObjectsCustom set [count _surfaceObjectsCustom, _x];
	};
}
forEach (allMissionObjects "all");

_surfaceObjects = _surfaceObjects - _surfaceObjectsCustom + _surfaceObjectsCustom - [objNull];

_surfaceObjects