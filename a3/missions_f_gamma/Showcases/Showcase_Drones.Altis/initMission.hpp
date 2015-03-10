// {_x allowFleeing 0} forEach allUnits;

BIS_UGVMove = compile preprocessFile "scenes\UGVMove.sqf";

enableTeamSwitch false;


// start Jukebox
BIS_missionScope execFSM "Jukebox.fsm";


// Commander and AA random compositions - variable HVT_Position01/02 - to detect which vehicle and direction he should use to escape
If (BIS_CommanderIfrit01 distance BIS_Commander > 100) Then {deletevehicle BIS_CommanderIfrit01; {deleteVehicle _x} forEach (units BIS_grpCommandersGuard01); BIS_missionScope setVariable ["HVT_position","Position02"]} Else {deletevehicle BIS_CommanderIfrit02; {deleteVehicle _x} forEach (units BIS_grpCommandersGuard02); BIS_missionScope setVariable ["HVT_position","Position01"]};
If (BIS_AA01 distance (leader BIS_grpAA01Guards01) > 100) Then {{deleteVehicle _x} forEach (units BIS_grpAA01Guards01)} Else {{deleteVehicle _x} forEach (units BIS_grpAA01Guards02)};
If (BIS_AA02 distance (leader BIS_grpAA02Guards01) > 100) Then {{deleteVehicle _x} forEach (units BIS_grpAA02Guards01)} Else {{deleteVehicle _x} forEach (units BIS_grpAA02Guards02)};


// Variables - HVT (Alive, Killed, Escaped)
BIS_missionScope setVariable ["HVT","Alive"];


// Weather
// If (viewDistance > 1500) Then {setViewDistance 1500};
0 setFog [0.25,0.225,10];

// Define AA vehicles
BIS_AA = [BIS_AA01, BIS_AA02];

[] spawn {
	scriptName "initMission.hpp: basic connection hint control";
	
	// Wait for the player to approach one of the unmanned vehicles
	waitUntil {{vehicle BIS_player distance _x <= 10} count [BIS_UAV, BIS_UGV] > 0};
	
	[["UAV", "Connection"]] call BIS_fnc_advHint;
};

[] spawn {
	scriptName "missionFlow.fsm: quadrotor control";
	
	// Wait to be in control of the quadrotor
	waitUntil {cameraOn == BIS_UAV};
	
	{
		private ["_unit"];
		_unit = _x;
		
		// Allow it to move
		_unit setCaptive false;
		{_unit enableAI _x} forEach ["AUTOTARGET", "FSM", "MOVE", "TARGET"];
		
		// Allow it to engage
		_unit setBehaviour "AWARE";
		_unit setCombatMode "YELLOW"
	} forEach units group BIS_UAVd;
	
	// Show hint
	[["UAV", "PilotingQuadrotor"]] call BIS_fnc_advHint;
};

[] spawn {
	scriptName "missionFlow.fsm: UGV control";
	
	// Wait to be in control of the UGV
	waitUntil {cameraOn == BIS_UGV};
	
	{
		private ["_unit"];
		_unit = _x;
		
		// Allow it to move
		_unit setCaptive false;
		{_unit enableAI _x} forEach ["AUTOTARGET", "FSM", "MOVE", "TARGET"];
		
		// Allow it to engage
		_unit setCombatMode "YELLOW";
	} forEach units group BIS_UGVd;
	
	// Show hint
	[["UAV", "DrivingGround"]] call BIS_fnc_advHint;
};

[] spawn {
	scriptName "missionFlow.fsm: mortar hint control";
	
	// Wait for the player to get in the mortar
	waitUntil {gunner BIS_Mortar == BIS_player};
	
	// Show hint
	[["Tactics", "Ballistic"]] call BIS_fnc_advHint;
};

// Stop player killing friendlies
{
	_x addEventHandler [
		"Killed",
		{
			private ["_source"];
			_source = _this select 1;
			if (_source in [vehicle BIS_player, BIS_player, BIS_UAV, BIS_UGV, BIS_Mortar]) then {BIS_courtMartial = true};
		}
	];
} forEach [BIS_Soldier01, BIS_Soldier02, BIS_Soldier03, BIS_rook];

// Mission start
[] spawn {
	scriptName "initMission.hpp: mission start";
	
	// Titlecard
	["a3\missions_f_gamma\video\drones.ogv", "STR_A3_SHOWCASE_DRONES_TITLECARD"] spawn BIS_fnc_titlecard;
	waitUntil {!(isNil "BIS_fnc_titlecard_finished")};
	
	// Temporarily separate player from his group
	private ["_units"];
	_units = (units group BIS_player) - [BIS_player];
	
	{
		private ["_unit"];
		_unit = _x;
		{_unit disableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "MOVE", "TARGET"];
	} forEach _units;
	
	_units joinSilent grpNull;
	{_x setCombatMode "BLUE"} forEach _units;
	
	// Establishing shot
	private ["_colorWest", "_colorEast"];
	_colorWest = WEST call BIS_fnc_sideColor;
	_colorEast = EAST call BIS_fnc_sideColor;
	{_x set [3, 0.33]} forEach [_colorWest, _colorEast];
	
	[
		[12512,14388.2],					// Target position
		localize "STR_A3_Showcase_Drones_SITREP_text",		// SITREP text
		600,							// 600m altitude
		150,							// 150m radius
		0,							// 0 degrees viewing angle
		1							// Clockwise movement
	] spawn BIS_fnc_establishingShot;
	
	waitUntil {!(isNil "BIS_missionStarted")};
	
	// Join units back to the player's group
	{
		private ["_unit"];
		_unit = _x;
		{_unit enableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "MOVE", "TARGET"];
		
		_unit setCombatMode "GREEN";
		_unit joinAsSilent [BIS_player, (_units find _unit) + 2];
	} forEach _units;
};