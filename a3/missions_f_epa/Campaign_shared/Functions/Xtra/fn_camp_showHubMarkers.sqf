/*
	Author: Zozo

	Description:
	Shows detail HUB markers only if map is zoomed enough


	Parameter(s):
	- none -

	Returns:
	- none -

*/

private [ "_prefix", "_marker", "_zoom" ];
BIS_fnc_showHubMarkers_zoom = [ _this, 0, [ 0.001, 0.0208046 ], [ [] ] ] call BIS_fnc_param;

"BIS_mrkHUB_10" setMarkerAlpha 0.0;
BIS_fnc_showHubMarkers_markersAreHidden = true;
_prefix = "BIS_mrkHUB_";
BIS_fnc_showHubMarkers_markersonhub = [];
for "i" from 1 to 1000 do
{
	_marker = call compile format[ "'%1%2'", _prefix, i];
	if( markerPos _marker select 0 != 0 ) then
	{
		BIS_fnc_showHubMarkers_markersonhub = BIS_fnc_showHubMarkers_markersonhub + [_marker];
	};
};

BIS_fnc_showHubMarkers_markersonhub = BIS_fnc_showHubMarkers_markersonhub - ["BIS_mrkHUB_10"] + ["BIS_mrkSkirmishVeh1","BIS_mrkSkirmishVehX"];

//HIDE by default
[ "hide", BIS_fnc_showHubMarkers_markersonhub ] spawn BIS_fnc_ShowMarkers;

BIS_fnc_showHubMarkers_mapHandler = ((finddisplay 12) displayctrl 51) ctrlAddEventHandler
[
	"draw",
	"
		private [ ""_isinside"", ""_isInZoom"" ];
		_isinside = [ markerPos ""BIS_mrkHUB_10"", markersize ""BIS_mrkHUB_10"", ((finddisplay 12) displayctrl 51) ctrlMapScreenToWorld [0.5,0.5]] call BIS_fnc_IsInsideArea;
		_isInZoom = [ BIS_fnc_showHubMarkers_zoom ] call BIS_fnc_IsInZoom;
		if(_isinside && _isInZoom) then
		{
			if( BIS_fnc_showHubMarkers_markersAreHidden ) then
			{
				[ ""show"", BIS_fnc_showHubMarkers_markersonhub ] spawn BIS_fnc_ShowMarkers;
				[ ""hide"", [""BIS_maxwell""] ] spawn BIS_fnc_ShowMarkers;
				""BIS_maxwell"" setMarkerColor ""ColorRED"";
				BIS_fnc_showHubMarkers_markersAreHidden = false;
			};
		}
		else
		{
			if( !BIS_fnc_showHubMarkers_markersAreHidden ) then
			{
				[ ""hide"", BIS_fnc_showHubMarkers_markersonhub ] spawn BIS_fnc_ShowMarkers;
				[ ""show"", [""BIS_maxwell""] ] spawn BIS_fnc_ShowMarkers;
				""BIS_maxwell"" setMarkerColor ""ColorBLUFOR"";
				BIS_fnc_showHubMarkers_markersAreHidden = true;
			};
		};
	"
];