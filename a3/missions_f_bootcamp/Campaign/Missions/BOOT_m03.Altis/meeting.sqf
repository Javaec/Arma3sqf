// Play music
0 fadeMusic 0.4;
playMusic "EventTrack02a_F_EPA";

BIS_musicEH = addMusicEventHandler [
	"MusicStop",
	{
		removeMusicEventHandler ["MusicStop", BIS_musicEH];
		BIS_musicEH = nil;
		
		playMusic "EventTrack01a_F_EPA";
	}
];

3 fadeSound 0;
titleCut ["", "BLACK OUT", 3];

sleep 3;

// Add cinema borders
[0, 0, false, true] spawn BIS_fnc_cinemaBorder;

// Setup Conway
BIS_lacey enableSimulation false;
BIS_lacey enableMimics false;
BIS_lacey switchMove "HubSpectator_stand";
BIS_lacey setPos markerPos "BIS_lacey_pos";
BIS_lacey setDir markerDir "BIS_lacey_pos";
BIS_lacey setVelocity [0,0,0];

// Setup Adams
{BIS_adams disableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];
BIS_adams enableMimics false;
BIS_adams setBehaviour "CARELESS";
BIS_adams switchMove "HubSpectator_stand";
BIS_adams setPos markerPos "BIS_adams_pos";
BIS_adams setDir markerDir "BIS_adams_pos";
BIS_adams setVelocity [0,0,0];

// Setup AAF Idiot
{BIS_idiot1 disableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];
BIS_idiot1 enableMimics false;
BIS_idiot1 setBehaviour "CARELESS";
BIS_idiot1 switchMove "Acts_FarmIncident_Commander";

// Return control to the AAF Idiot when his animation finishes
private ["_animEH"];
_animEH = BIS_idiot1 addEventHandler [
	"AnimDone",
	{
		private ["_unit", "_anim"];
		_unit = _this select 0;
		_anim = _this select 1;

		if (_anim == "Acts_FarmIncident_Commander") then {
			// Remove eventhandler
			_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
			_unit setVariable ["BIS_animEH", nil];
			
			{_unit enableAI _x} forEach ["AUTOTARGET", "TARGET"];
			_unit enableMimics true;
			_unit setBehaviour "SAFE";
		};
	}
];

BIS_idiot1 setVariable ["BIS_animEH", _animEH];

// Setup team
{
	private ["_marker"];
	_marker = format ["%1_pos", _x];
	
	_x disableAI "MOVE";
	_x setBehaviour "AWARE";
	_x forceSpeed -1;
	_x switchMove "";
	
	_x setPos markerPos _marker;
	_x setDir markerDir _marker;
	_x setVelocity [0,0,0];
} forEach [BIS_team1, BIS_team2];

// Move the truck
BIS_truck setPos markerPos "BIS_truck_pos";
BIS_truck setDir markerDir "BIS_truck_pos";

sleep 3.5;

// Ensure player has a rifle
if (primaryWeapon BIS_lacey == "") then {
	BIS_lacey addWeapon "arifle_MX_F";
	BIS_lacey selectWeapon primaryWeapon BIS_lacey;
};

// Play Conway's animations
BIS_lacey enableSimulation true;
BIS_lacey setPos markerPos "BIS_lacey_pos";
BIS_lacey setDir markerDir "BIS_lacey_pos";
BIS_lacey switchMove "Acts_FarmIncident_Lacey1";

// Play Adams' animations
BIS_adams setPos markerPos "BIS_adams_pos";
BIS_adams setDir markerDir "BIS_adams_pos";
BIS_adams switchMove "Acts_FarmIncident_Adams1";

// Give the player control when cutscene ends
private ["_animEH"];
_animEH = BIS_lacey addEventHandler [
	"AnimDone",
	{
		private ["_unit", "_anim"];
		_unit = _this select 0;
		_anim = _this select 1;
		
		if (_anim == "Acts_FarmIncident_Lacey4") then {
			// Remove eventhandler
			_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
			_unit setVariable ["BIS_animEH", nil];
			
			_unit enableMimics true;
			
			// Register that it ended
			BIS_cutsceneEnded = true;
		};
	}
];

BIS_lacey setVariable ["BIS_animEH", _animEH];

// Return control to Adams when his animation finishes
private ["_animEH"];
_animEH = BIS_adams addEventHandler [
	"AnimDone",
	{
		private ["_unit", "_anim"];
		_unit = _this select 0;
		_anim = _this select 1;
		
		if (_anim == "Acts_FarmIncident_Adams3") then {
			// Remove eventhandler
			_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
			_unit setVariable ["BIS_animEH", nil];
			
			{_unit enableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];
			_unit enableMimics true;
			_unit setBehaviour "SAFE";
			
			// Watch AAF idiot
			_unit reveal BIS_idiot1;
			_unit doWatch BIS_idiot1;
		};
	}
];

BIS_adams setVariable ["BIS_animEH", _animEH];

sleep 1;

BIS_lacey setPos markerPos "BIS_lacey_pos";
BIS_lacey setDir markerDir "BIS_lacey_pos";
BIS_adams setPos markerPos "BIS_adams_pos";
BIS_adams setDir markerDir "BIS_adams_pos";

10 fadeMusic 0.1;
3 fadeSound 1;
titleCut ["", "BLACK IN", 3];

clearRadio;

sleep 3;

// Confrontation
"d01_Situation" spawn BIS_fnc_missionConversations;

// Wait for the player's animation to finish
waitUntil {BIS_cutsceneEnded};

// Let the others move
BIS_searching = true;
{_x enableAI "MOVE"} forEach [BIS_team1, BIS_team2];

// Remove cinema borders
[1, nil, false] spawn BIS_fnc_cinemaBorder;

// Unhide markers
{_x setMarkerAlpha 1} forEach ["BIS_cleared1", "BIS_cleared2", "BIS_cleared3", "BIS_stash1", "BIS_stash2", "BIS_stash3"];

// Add task
"BIS_search" call BIS_fnc_missionTasks;

// Start search control
[BIS_cleared, 0.29, 1.31, 4, "x60_Already_Cleared"] execFSM "searchControl.fsm";
[BIS_stash1, 2.95, 3.39, 2, "130_Clear_1", "BIS_stash1"] execFSM "searchControl.fsm";
[BIS_stash2, 0.15, 0.59, 2, "135_Clear_2", "BIS_stash2"] execFSM "searchControl.fsm";
[BIS_stash3, 0.29, 0.53, 1, "140_Clear_3", "BIS_stash3"] execFSM "searchControl.fsm";

sleep 2;

// Let the AAF move
BIS_idiot1 enableAI "MOVE";

sleep 4;

saveGame;