BIS_immobile = FALSE;
BIS_heliGo = FALSE;
BIS_quiet = TRUE;

BIS_tower = [3064.610,6189.301,0.000] nearestObject "Land_TTowerBig_1_F";
BIS_tower setDamage 0.9;

0 setFog [0.15, 0.12, 22];

#include "initBriefing.hpp"
#include "initMission.hpp"

/*BIS_towerHandle = BIS_tower addEventHandler ["HandleDamage", {
	debuglog str (_this select 2);
	debuglog str ((_this select 2) / 15);
	((_this select 2) / 12) + damage (_this select 0)
}];*/

/*_hldr = "WeaponHolder" createVehicle markerPos "out";
_hldr setPos markerPos "out";

_hldr addItemCargo ["V_rebreatherIR", 1];
_hldr addItemCargo ["U_O_Wetsuit", 1];*/

waitUntil {!isNil "BIS_missionStarted"};

0 fadeMusic 0.25;
playMusic "Track05_Underwater2";

"start" spawn BIS_fnc_missionConversations;

execFSM "hints.fsm";