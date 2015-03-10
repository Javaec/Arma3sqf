#define M01_played			!isNil "BIS_A_m01"
#define M02_played			!isNil "BIS_A_m02"
#define M03_played			!isNil "BIS_A_m03"
#define M04_played			!isNil "BIS_A_m04"
#define M05_played			!isNil "BIS_A_m05"
#define MOut_played			!isNil "BIS_A_out"


//here we will create markers (areas, icons)
private  "_markerRef";
#include "\A3\Missions_F_EPA\Campaign_shared\Scripts\markers_for_A_hub.sqf";
//here we will create ORBAT markers
#include "\A3\Missions_F_EPA\Campaign_shared\Scripts\markers_ORBAT_for_A_hub.sqf";

//"Missions played:" call BIS_fnc_Log;
{
	 //["%1", _x ] call BIS_fnc_LogFormat;
}
forEach [M01_played, M02_played, M03_played, M04_played, M05_played, MOut_played];

// Change markers if necessary
// Markers are set black (empty) or green (AAF controlled) in dependence on ORBAT markers.
// ORBAT markers has its own condition of presence (see markers_ORBAT_for_A_hub.sqf)


// Camp Tempest
if (!(isNil "BIS_tempestORBAT")) then {
	BIS_tempestORBAT setPos markerPos "BIS_tempest";
} else {
	"BIS_tempest" setMarkerColor "ColorBlack";
};

// Girna
if (!(isNil "BIS_villageORBAT")) then {
	BIS_villageORBAT setPos markerPos "BIS_village";
} else {
	"BIS_village" setMarkerColor "ColorBlack";
};

// Air Station Mike-26
if (!(isNil "BIS_mike26ORBAT")) then {
	BIS_mike26ORBAT setPos markerPos "BIS_mike26";
} else {
	"BIS_mike26" setMarkerColor "ColorBlack";
};

if ( !M02_played && !M03_played && ( !M05_played || M05_played ) ) then
{	execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\frontline_A_m01.sqf"; };

if ( !M02_played && M03_played && !M05_played || ( !M02_played && M03_played && M05_played ) ) then
{	execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\frontline_A_m02-A_m03.sqf"; };

if ( ( M02_played && !M03_played && !M05_played ) ) then
{	execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\frontline_A_m03-A_m02.sqf"; };

if ( M02_played && !M03_played && M05_played) then
{	execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\frontline_A_m03-A_m02-A_m05.sqf"; };

if ( M02_played && M03_played && M05_played ) then
{	execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\frontline_A_m04.sqf"; };

if ( M02_played && M03_played && !M05_played ) then
{	execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\frontline_A_hub01_A_m02-A_m03.sqf"; };

//Camp Tempest
//show orbat if m02 and m05 werent played
/*
!(isNil "BIS_A_m02" || isNil "BIS_A_m05")

//Girna
//show orbat if Am02 wasnt played yet
isNil "BIS_A_m02"

//Mike 26
//show orbat if Am03 wasnt played
isNil "BIS_A_m03"
*/


{ _x setMarkerAlpha 0.25 } forEach [ "BIS_mrkUnknown01", "BIS_mrkUnknown02", "BIS_mrkUnknown03" ];
