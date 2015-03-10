sleep 1;

"30_In_Truck" call BIS_fnc_missionConversations;

// Let the truck drive
BIS_truckD enableAI "MOVE";

sleep 10;

setAccTime 1;
0 fadeMusic 0.6;
playMusic "LeadTrack01_F_EPC";

sleep 2;

5 fadeSound 0;
titleCut ["", "BLACK OUT", 5];

sleep 3;

// Spawn hospital scene
["BIS_hospital", true] call BIS_fnc_loadScene;

sleep 2;

// Delete fire
{deleteVehicle _x} forEach [BIS_fire1, BIS_fire2];

BIS_sequenceStarted = true;
enableEnvironment false;

// First driving sequence
[] spawn BIS_drive1;

[0, 0, false, true] spawn BIS_fnc_cinemaBorder;
setAccTime 1;

sleep 3;

titleCut ["", "BLACK IN", 3];

sleep 11;

titleCut ["", "BLACK OUT", 3];

sleep 3;

// Delete hospital, spawn route
["BIS_hospital", true] call BIS_fnc_deleteScene;
["BIS_route", true] call BIS_fnc_loadScene;

// Terminate first sequence
BIS_drive1_terminate = true;

sleep 1;

// Start next sequence
[] spawn BIS_drive2;

// Let truck drive
[BIS_driveby1, 0] call BIS_fnc_setHeight;

{
	_x hideObject false;
	_x enableSimulation true;
} forEach [BIS_driveby1, BIS_driveby1D];

{BIS_driveby1D enableAI _x} forEach ["ANIM", "AUTOTARGET", "MOVE", "TARGET"];

sleep 3;

titleCut ["", "BLACK IN", 3];

sleep 23;

titleCut ["", "BLACK OUT", 3];

sleep 3;

// Stop sequence
BIS_drive2_terminate = true;

[] spawn {
	scriptName "drive.sqf: player disembark";
	
	waitUntil {!(BIS_lacey in BIS_truck)};
	
	// Remove borders
	[1, 1, false] spawn BIS_fnc_cinemaBorder;
	
	sleep 1;
	
	"40_Orders" call BIS_fnc_missionConversations;
	"BIS_investigate" call BIS_fnc_missionTasks;
	
	// Register that the player is investigating
	BIS_investigating = true;
};

{
	_x spawn {
		private ["_unit"];
		_unit = _this;
		
		scriptName (format ["drive.sqf: force walk - [%1]", _unit]);
		
		waitUntil {vehicle _unit == _unit};
		
		// Force unit to walk
		_unit forceSpeed 1.5;
	};
} forEach [BIS_adams, BIS_truckD];

// Delete route, spawn incident
["BIS_route", true] call BIS_fnc_deleteScene;
["BIS_incident", true] call BIS_fnc_loadScene;

[BIS_IHQ, 0] call BIS_fnc_setHeight;
BIS_IHQ hideObject false;
BIS_IHQ allowDamage true;

sleep 1;

// Final driving sequence
[] spawn BIS_drive3;

sleep 3;

titleCut ["", "BLACK IN", 3];

sleep 6;

// Fade sound back
enableEnvironment true;
10 fadeSound 1;

sleep 7;

"35_Mess" call BIS_fnc_missionConversations;