enableEnvironment true;
3 fadeSound 1;
0 fadeMusic 0.4;
playMusic "LeadTrack01a_F_EPB";

sleep 1;

[
	[localize "STR_A3_BOOT_m04_SITREP_1", ""], ["", "<br/>"],
	[(localize "STR_A3_BOOT_m04_SITREP_2") + " ", "font = 'PuristaMedium'"],
	[localize "STR_A3_BOOT_m04_SITREP_3", ""]
] call BIS_fnc_SITREP;

sleep 2;

"01_Start" spawn BIS_fnc_missionConversations;

sleep 3;

// Switch player's entity
selectPlayer BIS_laceyFake;
vehicle BIS_lacey switchCamera "INTERNAL";
BIS_lacey setBehaviour "CARELESS";
{BIS_lacey disableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];

// Ensure player has a rifle
if (primaryWeapon BIS_lacey == "") then {
	BIS_lacey addWeapon "arifle_MX_F";
	BIS_lacey selectWeapon primaryWeapon BIS_lacey;
};

// Lacey's animations
BIS_lacey enableSimulation true;
BIS_lacey switchMove "Acts_welcomeOnHUB02_PlayerWalk";

private ["_animEH"];
_animEH = BIS_lacey addEventHandler [
	"AnimDone",
	{
		private ["_unit", "_anim"];
		_unit = _this select 0;
		_anim = _this select 1;
		
		if (_anim == "Acts_welcomeOnHUB02_PlayerWalk_3") then {
			// Remove eventhandler
			_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
			_unit setVariable ["BIS_animEH", nil];
			
			_unit switchMove "HubSpectator_stand";
		};
	}
];

BIS_lacey setVariable ["BIS_animEH", _animEH];

// MacKinnon's animations
BIS_BHQ switchMove "Acts_welcomeOnHUB02_AIWalk";

// Adams' animations
BIS_adams switchMove "Acts_welcomeOnHUB04_PlayerWalk_1";

sleep 5.5;

// Give player control again
selectPlayer BIS_lacey;
vehicle BIS_lacey switchCamera "INTERNAL";
BIS_lacey setBehaviour "AWARE";
{BIS_lacey enableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];
deleteVehicle BIS_laceyFake;

titleCut ["", "BLACK IN", 3];

sleep 3;

10 fadeSound 0.6;

// Start landing sequence
BIS_heli enableSimulation true;
[] spawn BIS_landing;

sleep 23;

20 fadeMusic 1;
titleCut ["", "BLACK OUT", 5];

sleep 3;

5 fadeSound 0;

sleep 2;

BIS_lacey enableSimulation false;

sleep 3;

clearRadio;
enableEnvironment false;

{
	private ["_unit"];
	_unit = _x;
	
	if (!(isNil {_unit getVariable "BIS_animEH"})) then {
		// Remove eventhandlers
		_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
		_unit setVariable ["BIS_animEH", nil];
	};
	
	{_unit enableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];
	_unit enableMimics true;
	_unit setBehaviour "AWARE";
} forEach [BIS_lacey, BIS_adams, BIS_BHQ];

// Move player into the heli
BIS_lacey assignAsCargoIndex [BIS_heli, 3];
BIS_lacey moveInCargo [BIS_heli, 3];
BIS_lacey enableSimulation true;

// Move Adams
BIS_adams assignAsCargoIndex [BIS_heli, 4];
BIS_adams moveInCargo [BIS_heli, 4];
"INIT" call BIS_heliAnims;

// Reposition MacKinnon
BIS_BHQ hideObject true;
BIS_BHQ enableSimulation false;
BIS_BHQ allowDamage false;
BIS_BHQ setCaptive true;
[BIS_BHQ, 1000] call BIS_fnc_setHeight;

// Start flight sequence
[] spawn BIS_flight;

// Delete start, create checkpoint
"BIS_start" call BIS_fnc_deleteScene;
["BIS_checkpoint", true] call BIS_fnc_loadScene;

// Register that the intro ended
BIS_introEnded = true;

// Disable existing borders
[1, 0, false] spawn BIS_fnc_cinemaBorder;

sleep 1;

// Add new ones
[0, 0, false, false] spawn BIS_fnc_cinemaBorder;

sleep 5;

enableEnvironment true;
10 fadeSound 0.6;

sleep 5;

titleCut ["", "BLACK IN", 5];