/*
	Author: Jiri Wainar

	Description:
	Detects all anchor points on given surface object and tries to populate them by appropriate ambient objects.

	Remarks:
	* Most of the data stored in: "\A3\Missions_F_EPA\Campaign_shared\cfgHubObjects.hpp"

	Returns:
	_array select 0: 		object created by the function
	_array select 1 (optional): 	class of the object in the weapon holder, if weapon holder was created

	Example:

	[_createdObject:object,_weaponHolderContent:string] = [_surfaceObject:object] call BIS_fnc_camp_setupSurfaceObject;
*/

private["_surfaceObject","_theme","_coreGroup","_coreClass","_anchors","_anchor","_objectsAtAnchor","_objectsAll"];

_surfaceObject 	= [_this,0,objNull,[objNull]] call BIS_fnc_param;
_theme 		= [_this,1,"",[""]] call BIS_fnc_param;
_coreGroup	= [_this,2,"",[""]] call BIS_fnc_param;
_coreClass	= [_this,3,"",[""]] call BIS_fnc_param;

if (isNull _surfaceObject) exitWith
{
	["Function '%1' failed, surface object cannot be null!","setupSurfaceObject"] call BIS_fnc_error;

	objNull
};

//auto-select theme, if not specified
if (_theme == "") then
{
	_theme = _surfaceObject call BIS_fnc_camp_getTheme;
};

//get all available anchors on the surface object
_anchors = _surfaceObject call BIS_fnc_camp_getAnchors;

_objectsAll = [];

//get the composition content for every anchor
{
	_anchor = _x + [_coreGroup,_coreClass];

	//adjust the anchor for solider presence and animation state and check probability
	_anchor = [_anchor,_theme] call BIS_fnc_camp_adjustAnchor;

	//generate the composition data and merge them into anchor data
	if (count _anchor > 0) then
	{
		_anchor = [_anchor,_theme] call BIS_fnc_camp_getCompositionData;
	};

	//create the composition
	if (count _anchor > 0) then
	{
		_objectsAtAnchor = _anchor call BIS_fnc_camp_createObjectsAtAnchor;
		_objectsAll set [count _objectsAll,_objectsAtAnchor];
	};
}
forEach _anchors;

_objectsAll