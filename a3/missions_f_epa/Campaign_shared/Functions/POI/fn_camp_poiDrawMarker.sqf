/*
	Author: Jiri Wainar

	Description:
	Draw marker(s) for given POI.

	Example:
	[_poiClass:string] call BIS_fnc_camp_poiDrawMarker;
*/

private["_poi","_name","_position","_size","_dir","_icon","_markerZone","_markerBorder","_markerText","_status","_color","_alpha"];

_poi  	  = [_this, 0, "", [""]] call BIS_fnc_param; if (_poi == "") exitWith {};
_name     = ["POIs",_poi,"Task","title"] call BIS_fnc_getCfgData;
_position = ["POIs",_poi,"Zone","position"] call BIS_fnc_getCfgData;
_size 	  = ["POIs",_poi,"Zone","proportions"] call BIS_fnc_getCfgData;
_dir 	  = ["POIs",_poi,"Zone","dir"] call BIS_fnc_getCfgData;
_icon 	  = ["POIs",_poi,"Zone","icon"] call BIS_fnc_getCfgData;

//check the POI status
_status   = [_poi] call BIS_fnc_camp_poiGetStatus;

["Executed for POI [%1] | status: [%2]!",_poi,_status] call BIS_fnc_logFormat;

if (_status == -1) exitWith {};

//POI is known?
if (_status == 0) then
{
	_color = "ColorBrown";
	_alpha = 1;
}
else
{
	_color = "ColorBlack";
	_alpha = 0.5;
};

_markerZone   = format["%1_zone",_poi];
_markerBorder = format["%1_border",_poi];
_markerText   = format["%1_text",_poi];

if (count _size != 0) then
{
	if (markerType _markerZone == "") then
	{
		createMarker [_markerZone, _position];
	};
	_markerZone setMarkerShape "ELLIPSE";
	_markerZone setMarkerBrush "FDiagonal";
	_markerZone setMarkerColor _color;
	_markerZone setMarkerSize _size;
	_markerZone setMarkerDir _dir;
	_markerZone setMarkerAlpha _alpha;

	if (markerType _markerBorder == "") then
	{
		createMarker [_markerBorder, _position];
	};
	_markerBorder setMarkerShape "ELLIPSE";
	_markerBorder setMarkerBrush "Border";
	_markerBorder setMarkerColor _color;
	_markerBorder setMarkerSize _size;
	_markerBorder setMarkerDir _dir;
	_markerBorder setMarkerAlpha _alpha;
};

if (markerType _markerText == "") then
{
	createMarker [_markerText, _position];
};
_markerText setMarkerType _icon;
_markerText setMarkerText format[" %1",_name];
_markerText setMarkerColor _color;
_markerText setMarkerAlpha _alpha;