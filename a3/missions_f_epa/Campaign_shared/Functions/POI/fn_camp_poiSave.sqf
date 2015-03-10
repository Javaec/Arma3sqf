/*
	Author: Jiri Wainar

	Description:
	Create or update global variable for the POI and add it to list of gvars to be saved on mission exit.

	Example:
	["POI_Checkpoint_01"] call BIS_fnc_camp_poiSave;
*/

private["_poi","_var"];

_poi	= [_this, 0, "", [""]] call BIS_fnc_param; if (_poi == "") exitWith {};
_var 	= _poi call BIS_fnc_camp_poiGetVar;

//save POI status
[_var] call BIS_fnc_camp_saveVar;