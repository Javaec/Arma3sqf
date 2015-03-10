/*
	Author: Muf

	Description:
		* Fills first passed control with game type and version number.
		* Positions both controls according to game type.

	Parameter(s):
		0: CONTROL - Control for indication of game type (Stable/Dev) and version number (RscText).
		1: CONTROL - Control for indication of modded game (RscActiveText).

	Returns:
	NOTHING
*/


#include "\A3\ui_f\hpp\defineCommonGrids.inc"

private ["_versionCtrl","_trafficLight","_productVersionArray","_developmentBuildStr","_versionNr"];

_versionCtrl = [_this,0,controlnull,[controlnull]] call bis_fnc_param;
_trafficLight = [_this,1,controlnull,[controlnull]] call bis_fnc_param;
_productVersionArray = productVersion;
_developmentBuildStr = "";

//Game version number (copied from Main Menu display)
_versionNr = ctrltext ((finddisplay 0) displayctrl 118);

if(_productVersionArray select 4 == "Development") then
{
	_developmentBuildStr = localize "STR_A3_RSCDISPLAY_LOADING_DEV";
};

_versionCtrl ctrlSetText (format["%1 %2", _developmentBuildStr, _versionNr]);

if(_productVersionArray select 5) then
{
	//Modded game
	_versionCtrl ctrlSetPosition [SafezoneX + SafezoneW - 13.8 * GUI_GRID_W, 23 * GUI_GRID_H + GUI_GRID_Y];
	_versionCtrl ctrlCommit 0;
	_trafficLight ctrlShow true;
};
