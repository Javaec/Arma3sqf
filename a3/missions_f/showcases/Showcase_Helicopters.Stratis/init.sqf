//global toggles
Bis_MissionAborted 	= false;

//mission toggles: air base
Bis_RoadIsClear  	= false;
Bis_RoadIsClear2 	= false;

//mission toggles: mike26 mortars
Bis_MortarsDetected	= false;
Bis_BombardmentRunning = false;
Bis_CarsNearM26 = false;
Bis_LandedAtMike26 = false;
Bis_AtHome = false;

Bis_SendToRessuply = false;			//sent to resupply be the mission flow
Bis_Resupplied = false;				//the 'core' ressuply (dictated by mission flow) finished
Bis_LandedAtRogainPlayed = false;	//true when conversation finishes & resupply mechanics can start


//debug toggle
Bis_DebugMode = false;

if (Bis_DebugMode) then
{
	BIS_MissionStarted = true;

	player setCaptive true;
	player allowDamage false;

	Bis_Heli allowDamage false;

	//player setPos [3977.25,3530.92,0.00178528];
	//player setDir 293.962;
};

//link my functions
#include "functions.sqf"

//link core mission files
#include "initBriefing.hpp"
#include "initMission.hpp"

//set the init done toggle
BIS_InitFinished = true;

//create compositions
private["_compositions"];

_compositions =
[
	[] execVM "compositions\mortar_site.sqf",
	[] execVM "compositions\mortar_site_kamino.sqf"
];

waitUntil
{
	{!(scriptDone _x)} count _compositions == 0
};

//add the 3d composition units
Bis_Units_Mike26MortarsArea = nearestObjects [Bis_Mortars,["B_Soldier_base_F"],40];
Bis_Units_KaminoMortarsArea = nearestObjects [Bis_KaminoMortars,["B_Soldier_base_F"],100];

Bis_Units_Mike26Area = Bis_Units_Mike26Area + Bis_Units_Mike26MortarsArea;
Bis_Units_KaminoArea = Bis_Units_KaminoArea + Bis_Units_KaminoMortarsArea;

[Bis_Units_Mike26MortarsArea,Bis_Units_KaminoMortarsArea] call Bis_disableUnit;