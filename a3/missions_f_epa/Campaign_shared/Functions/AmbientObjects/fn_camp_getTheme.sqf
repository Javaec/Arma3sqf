/*
	Author: Jiri Wainar

	Description:
	Auto-selects the hub section / object theme.

	Example:

	_theme:string = _surfaceObject:object call BIS_fnc_camp_getTheme;
*/

private["_themeHelper","_proximity"];

_themeHelper = nearestObject [getPosATL _surfaceObject, "Sign_Arrow_Large_Yellow_F"];

if !(isNull _themeHelper) then
{
	//check proximity
	_proximity = 5;
	_distance  = [getPosASL _themeHelper, getPosASL _surfaceObject] call BIS_fnc_distance2D;

	if (_distance > _proximity) exitWith
	{
		_theme = "Default";
	};

	//get the section id
	_theme = _themeHelper getVariable ["BIS_HubSection","Default"];
}
else
{
	_theme = "Default";
};

_theme