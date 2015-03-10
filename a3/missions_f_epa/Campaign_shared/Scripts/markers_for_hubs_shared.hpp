/*--------------------------------------------------------------------------------------------------

	SKIRMISH VEHICLES

--------------------------------------------------------------------------------------------------*/
if !(isNil "BIS_SkirmishVehX") then
{
	_markerRef = createMarker ["BIS_mrkSkirmishVehX", getPos BIS_SkirmishVehX];
	_markerRef setMarkerColor "ColorBlue";
	_markerRef setMarkerSize [1,1];
	_markerRef setMarkerType "hd_start";
	_markerRef setMarkerDir 0;
	_markerRef setMarkerAlpha 1;
	_markerRef setMarkerBrush "DiagGrid";
	_markerRef setMarkerText "Patrol";
	_markerRef setMarkerShape "ICON";
};

if !(isNil "BIS_SkirmishVeh1") then
{
	_markerRef = createMarker ["BIS_mrkSkirmishVeh1", getPos BIS_SkirmishVeh1];
	_markerRef setMarkerColor "ColorBlue";
	_markerRef setMarkerSize [1,1];
	_markerRef setMarkerType "hd_start";
	_markerRef setMarkerDir 0;
	_markerRef setMarkerAlpha 1;
	_markerRef setMarkerBrush "DiagGrid";
	_markerRef setMarkerText "Patrol";
	_markerRef setMarkerShape "ICON";
};

/*--------------------------------------------------------------------------------------------------

	BASE

--------------------------------------------------------------------------------------------------*/
private["_hubCenter","_stage"];

_hubCenter = ["Hubs",missionName,"center"] call BIS_fnc_getCfgDataArray;
_stage = ["stage"] call BIS_fnc_getCfgData;

_markerRef = createMarker ["BIS_mrkHubCenter", _hubCenter];

if (_stage == "B") then
{
	_markerRef setMarkerType "flag_FIA";
}
else
{
	_markerRef setMarkerType "flag_NATO";
};

_markerRef setMarkerSize [1.5,1.5];
_markerRef setMarkerAlpha 0;