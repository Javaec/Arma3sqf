// Keep screen black
0 fadeSound 0;
titleCut ["", "BLACK FADED", 10e10];

[] spawn {
	waitUntil {time > 0};
	enableEnvironment false;
};

// Post process
//"EastWind" call BIS_fnc_setPPEffectTemplate;

// Mission variables
BIS_introEnded = false;
BIS_markerCount = 0;
BIS_startMarker = "";
BIS_townMarker = "";
BIS_hillMarker = "";
BIS_locationMarker = "";
BIS_stopTracking = false;
BIS_playerOut = false;
BIS_cutsceneEnded = false;
BIS_searching = false;
BIS_stashFound = false;

// Set up the mission
#include "setup\briefing.hpp"
#include "setup\characters.hpp"
#include "setup\comps.hpp"
#include "setup\anims.hpp"

// Build the stashes accordingly
BIS_stash = [BIS_stash1, BIS_stash2, BIS_stash3] call BIS_fnc_selectRandom;

{
	private ["_var", "_trigger"];
	_var = "BIS_stash" + str _x;
	_trigger = missionNamespace getVariable _var;
	
	if (_trigger == BIS_stash) then {
		// Spawn the stash
		private ["_stash"];
		_stash = "setup\comps\House_0" + str _x + "_stash.sqf";
		execVM _stash;
	} else {
		// Spawn regular furniture
		private ["_furniture"];
		_furniture = "setup\comps\House_0" + str _x + "_furniture.sqf";
		execVM _furniture;
	};
} forEach [1,2,3];

// Open gate
private ["_gate"];
_gate = [7489.36,18340.5,0.00418091] nearestObject "Land_Stone_Gate_F";
[_gate, "Door_1_rot", "Door_Handle_1_rot_1", "Door_Handle_1_rot_2"] execVM "\A3\Structures_F\scripts\Door_open.sqf";
[_gate, "Door_2_rot"] execVM "\A3\Structures_F\scripts\DoorNoHandle_open.sqf";

// Open house doors
private ["_building"];
_building = [7514.06,18319.1,-0.487091] nearestObject "Land_i_Stone_HouseSmall_V2_F";
[_building, "Door_1_rot"] execVM "\A3\Structures_F\scripts\DoorNoHandle_open.sqf";
[_building, "Door_2_rot"] execVM "\A3\Structures_F\scripts\DoorNoHandle_open.sqf";
[_building, "Door_3_rot"] execVM "\A3\Structures_F\scripts\DoorNoHandle_open.sqf";

// Set laptop texture
BIS_laptop setObjectTexture [0, "A3\Missions_F_Bootcamp\data\img\laptop\Electronics_screens_laptop_targetactivated_CO.paa"];

// Laptop animation
_z = [] spawn 
{ 
	while{true} do 
	{
		BIS_laptop1 setObjectTexture [0, "a3\Missions_F_Bootcamp\data\img\laptop\Electronics_screens_laptop_simulationterminated1_CO.paa"]; 
		Sleep 0.5;  
		BIS_laptop1 setObjectTexture [0, "a3\Missions_F_Bootcamp\data\img\laptop\Electronics_screens_laptop_simulationterminated2_CO.paa"]; 
		Sleep 0.5;
	};
};

// Detect if the truck is destroyed
[] spawn {
	scriptName "init.sqf: truck move check";
	
	waitUntil {!(canMove BIS_truck)};
	
	[[missionName, 1], false] call BIS_fnc_endMission;
};

// Make the civilian play the right animation when he dies
BIS_wounded addEventHandler [
	"Killed",
	{
		private ["_unit"];
		_unit = _this select 0;
		_unit switchMove "Acts_SittingWounded_out";
	}
];

// Prevent the civilian from being healed
[] spawn {
	scriptName "init.sqf: civilian damage control";
	
	while {alive BIS_wounded} do {
		waitUntil {damage BIS_wounded < 0.5 || !(alive BIS_wounded)};
		
		if (alive BIS_wounded) then {
			BIS_wounded setDamage 0.5;
			{BIS_wounded setHitPointDamage [_x, 0]} forEach ["HitLegs", "HitHands"];
		};
	};
};