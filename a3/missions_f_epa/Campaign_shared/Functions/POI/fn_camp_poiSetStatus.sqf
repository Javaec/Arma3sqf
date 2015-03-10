/*
	Author: Jiri Wainar

	Description:
	Create or update global variable for the POI and add it to list of gvars to be saved on mission exit.

	Example:
	["POI_Checkpoint_01",0] call BIS_fnc_camp_poiSetStatus;
*/

private["_poi","_var","_status"];

_poi	= [_this, 0, "", [""]] call BIS_fnc_param; if (_poi == "") exitWith {};
_status	= [_this, 1, -1, [123]] call BIS_fnc_param;
_var 	= _poi call BIS_fnc_camp_poiGetVar;

//cretes & sets the global variable
missionNamespace setVariable [_var,_status];

//mark at variable as "to be saved on mission exit"
if (isNil "BIS_poiToSave") then
{
	BIS_poiToSave = []
};

BIS_poiToSave = BIS_poiToSave - [_poi] + [_poi];