#include "initBriefing.hpp"
#include "initMission.hpp"

BIS_quiet = TRUE;

_plankton = "#particlesource" createVehicleLocal (position BIS_player);
_plankton setParticleClass "PlanktonEffect";
_plankton attachto [BIS_player,[0,2,1.3]];

[] execFSM "mines.fsm";

([4359.725,3892.813,0.000] nearestObject "Land_Radar_F") setDamage 1; 	// Mike-26 radar dome should be destroyed at this point

BIS_disableShip = BIS_ship addAction [localize "STR_A3_Showcase_SCUBA_userAction_1", "sabotage.sqf", [], 10, TRUE, TRUE, "", "_this distance _target < 7 && speed _target < 1 && (getPosASL _this select 2 < -1)"];

[] spawn {
	waitUntil {!canMove BIS_ship};
	if (("BIS_objSabotage" call BIS_fnc_taskState) != "Succeeded") then {
		["BIS_objSabotage", "Succeeded"] call BIS_fnc_missionTasks;
	};
	BIS_ship removeAction BIS_disableShip;
};

waitUntil {!isNil "BIS_missionStarted"};

execFSM "hints.fsm";

0 fadeMusic 0.25;
playMusic "Track05_Underwater2";
"start" spawn BIS_fnc_missionConversations;