BIS_insertion = compile preprocessFile "scenes\insertion.sqf";
BIS_town_defenders = [BIS_target, BIS_IA1, BIS_IA2, BIS_IA3, BIS_IA4, BIS_IA5, BIS_IA6, BIS_IA7, BIS_IA8, BIS_IA9, BIS_IA10, BIS_IA11, BIS_IA12, BIS_IA13, BIS_IA14, BIS_IA15, BIS_IA16];
{_x setCaptive true} forEach BIS_town_defenders;

// Replace HAMRs and MRCOs with collimators (scope reflection issues)
{
	private ["_unit", "_items"];
	_unit = _x;
	_items = primaryWeaponItems _unit;
	
	{
		if (_x == "optic_Hamr") then {_unit addPrimaryWeaponItem "optic_Aco"};
		if (_x == "optic_MRCO") then {_unit addPrimaryWeaponItem "optic_Aco_grn"};
	} forEach _items;
} forEach (allUnits - units group BIS_inf);

// Ensure all units have goggles (ToDo: remove when fixed)
{if (goggles _x != "G_Diving") then {_x addGoggles "G_Diving"}} forEach units group BIS_inf;

// Ensure player has necessary items (ToDo: remove when fixed)
{if (!(_x in assignedItems BIS_inf)) then {BIS_inf linkItem _x}} forEach ["ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"];

// Remove handgrenades from beach participants
{_x removeMagazines "HandGrenade"} forEach (units group BIS_inf + units BIS_IA_group1 - [BIS_inf]);

// Create plankton effect
BIS_plankton = "#particlesource" createVehicle [10,10,10];
BIS_plankton setParticleClass "PlanktonEffect";

// Handle plankton effect
[] spawn {
	scriptName "initMission.hpp: plankton effect control";
	
	while {true} do {
		private ["_vehicle"];
		_vehicle = vehicle BIS_inf;
		
		// Wait for the vehicle to be underwater or for the player's vehicle to change
		waitUntil {underwater _vehicle || vehicle BIS_inf != _vehicle};
		
		if (vehicle BIS_inf == _vehicle) then {
			// Attach effect to vehicle
			BIS_plankton attachTo [_vehicle, [0,2,1.3]];
			
			// Wait for the vehicle to be above water or for the player's vehicle to change
			waitUntil {!(underwater _vehicle) || vehicle BIS_inf != _vehicle};
			
			// Detach the effect
			detach BIS_plankton;
			BIS_plankton setPos [10,10,10];
		};
	};
};

// Prevent units from fleeing
{_x allowFleeing 0} forEach allUnits;

// Hide waypoints
{_x setWaypointVisible false} forEach waypoints group BIS_inf;

// Start captive control
execFSM "captiveControl.fsm";

// Track if the player fires
BIS_firedEH = BIS_inf addEventHandler [
	"Fired",
	{
		if (isNil "BIS_canShoot") then {
			// Stop previous countdown
			if (!(isNil "BIS_captiveDelay")) then {terminate BIS_captiveDelay};
			
			// Take the player off captive
			if (captive BIS_inf) then {BIS_inf setCaptive false};
			
			BIS_captiveDelay = [] spawn {
				scriptName "initMission.hpp: BIS_captiveDelay";
				
				// Keep the player off captive
				private ["_timeOut"];
				_timeOut = time + 10;
				waitUntil {time >= _timeOut || !(isNil "BIS_canShoot")};
				
				if (isNil "BIS_canShoot") then {
					// Move back to captive
					BIS_inf setCaptive true;
				};
			};
		};
	}
];

BIS_killedEH = {
	private ["_source"];
	_source = _this select 1;
	
	if (_source in [vehicle BIS_inf, BIS_inf]) then {BIS_courtMartial = true};
};

// Stop player killing important units
{
	private ["_killedEH"];
	_killedEH = _x addEventHandler ["Killed", {_this call BIS_killedEH}];
	_x setVariable ["BIS_killedEH", _killedEH];
} forEach (units group BIS_inf + units BIS_BLU_group1 - [BIS_inf]);

// Stop leader and Bravo Lead from dying
{
	_x addEventHandler [
		"HandleDamage",
		{
			private ["_damage", "_source"];
			_damage = _this select 2;
			_source = _this select 3;
			
			if (_source in [vehicle BIS_inf, BIS_inf]) then {_damage} else {0};
		}
	];
} forEach [BIS_BLU1, BIS_attackLead];

// Position officer when he's killed
BIS_target addEventHandler [
	"Killed",
	{
		private ["_unit", "_source"];
		_unit = _this select 0;
		_source = _this select 1;
		
		if (!(_source in [vehicle BIS_inf, BIS_inf])) then {
			_unit setDamage 1;
			
			_unit spawn {
				scriptName "initMission.hpp: officer positioning";
				
				private ["_unit"];
				_unit = _this;
				
				sleep 4;
				
				// Select a marker
				private ["_marker"];
				_marker = ["BIS_officer1", "BIS_officer2"] call BIS_fnc_selectRandom;
				
				_unit switchMove "KIA_gunner_static_low01";
				
				// Position
				_unit setPos markerPos _marker;
				_unit setDir markerDir _marker;
			};
		};
	}
];

// Prevent friendly fire
[] spawn {
	scriptName "initMission.hpp: friendly fire control";
	
	waitUntil {side BIS_inf == sideEnemy || !(isNil "BIS_courtMartial")};
	
	if (isNil "BIS_courtMartial") then {
		// Ensure player is court-martialed
		BIS_courtMartial = true;
		
		// Fail tasks
		{if (_x call BIS_fnc_taskExists) then {_x call BIS_fnc_missionTasks}} forEach ["BIS_insert", "BIS_position", "BIS_town", "BIS_identify", "BIS_extract"];
		
		["friendlyFire", false] call BIS_fnc_endMission;
	};
};

// Mission start
[] spawn {
	scriptName "initMission.hpp: mission start";
	
	sleep 1;
	
	// Ensure player's team have their diving equipment
	{
		private ["_unit"];
		_unit = _x;
		
		// Store equipment
		private ["_magazines", "_items"];
		_magazines = magazines _unit;
		_items = items _unit;
		
		// Remove remaining equipment
		{_unit removeMagazine _x} forEach _magazines;
		{_unit removeItem _x} forEach _items;
		
		private ["_uniform"];
		_uniform = "U_B_survival_uniform";
		if (_unit == BIS_BLU1) then {_uniform = "U_B_Wetsuit"};
		
		// Ensure they have the correct vest, uniform and goggles
		_unit addUniform _uniform;
		_unit addVest "V_RebreatherB";
		_unit addGoggles "G_Diving";
		
		// Add back the proper equipment
		{_unit addItem _x} forEach _items;
		{_unit addMagazine _x} forEach _magazines;
		
		_unit selectWeapon primaryWeapon _unit;
	} forEach [BIS_BLU1, BIS_BLU2, BIS_BLU3];
	
	sleep 1;
	
	enableSentences false;
	
	// Close the SDV doors
	{BIS_BLU_SDV1 animate [_x, 0]} forEach ["door_1_1", "door_1_2", "door_2_1", "door_2_2"];
	
	// Move player into periscope
	BIS_inf assignAsGunner BIS_BLU_SDV1;
	BIS_inf moveInGunner BIS_BLU_SDV1;
	
	// Move leader into driver seat
	BIS_BLU1 assignAsDriver BIS_BLU_SDV1;
	BIS_BLU1 moveInDriver BIS_BLU_SDV1;
	
	// Move the others into the cargo
	{
		_x assignAsCargo BIS_BLU_SDV1;
		_x moveInCargo BIS_BLU_SDV1;
	} forEach [BIS_BLU2, BIS_BLU3];
	
	if (!(isNil "BIS_missionScope")) then {
		// Play the quotation video
		["\A3\Missions_F_EPA\video\A_m05_quotation.ogv", "STR_A3_Campaign_Quote_12"] call BIS_fnc_quotations;
		
		waitUntil {BIS_fnc_quotations_playing || !(isNil "BIS_fnc_quotations_skip")};
		
		private ["_time"];
		_time = time + 9.5;
		
		0 fadeMusic 0.2;
		playMusic "BackgroundTrack01_F";
		
		waitUntil {BIS_fnc_quotations_sound || !(isNil "BIS_fnc_quotations_skip")};
		
		BIS_SDVSequence = [] spawn {
			scriptName "initMission.hpp: SDV sequence";
			
			// Play sequence
			private ["_sequence"];
			_sequence = [] spawn BIS_insertion;
			
			sleep 12;
			
			"BIS_diving" spawn BIS_fnc_missionConversations;
			
			sleep 12;
			
			"BIS_openHatches" spawn BIS_fnc_missionConversations;
			
			sleep 2;
			
			// Open SDV doors
			{BIS_BLU_SDV1 animate [_x, 1]} forEach ["door_1_1", "door_1_2", "door_2_1", "door_2_2"];
			
			sleep 12;
			
			"BIS_treasure" spawn BIS_fnc_missionConversations;
			
			sleep 24;
			
			"BIS_bigBoat" spawn BIS_fnc_missionConversations;
			
			sleep 20;
			
			"BIS_heads" spawn BIS_fnc_missionConversations;
			
			sleep 9;
			
			"BIS_mines" spawn BIS_fnc_missionConversations;
			
			sleep 1;
			
			// Reveal mines
			{WEST revealMine _x} forEach [BIS_mine1, BIS_mine2, BIS_mine3, BIS_mine4, BIS_mine5, BIS_mine6];
			
			sleep 4;
			
			"BIS_getOut" spawn BIS_fnc_missionConversations;
		};
		
		waitUntil {(!(BIS_fnc_quotations_playing) || !(isNil "BIS_fnc_quotations_skip")) && time >= _time};
			
		enableRadio true;
		(format ["%1_blackScreen", missionName]) call BIS_fnc_blackIn;
		showHUD false;
		format ["%1_disabledSave", missionName] call BIS_fnc_enableSaving;
		
		sleep 3;
		
		// Show freelook hint
		[["InfantryMovement", "BasicLook"]] call BIS_fnc_advHint;
		
		waitUntil {scriptDone BIS_SDVSequence};
	};
	
	showHUD true;
	
	// Allow player to shoot
	BIS_canShoot = true;
	
	// Unlock the SDV
	BIS_BLU_SDV1 lock false;
	
	if (!(isNil "BIS_missionScope")) then {
		{
			private ["_unit"];
			_unit = _x;
			
			// Take off captive
			_unit setCaptive false;
			
			if (_unit != BIS_inf) then {
				_unit removeEventHandler ["Killed", _unit getVariable "BIS_killedEH"];
			};
			
			// Ensure they can move
			{_unit enableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "MOVE", "TARGET"];
			
			unassignVehicle _unit;
		} forEach units group BIS_inf;
		
		// Make squad disembark
		commandGetOut units group BIS_inf;
		units group BIS_inf orderGetIn false;
		
		[] spawn {
			scriptName "initMission.hpp: disembark units";
			
			{
				// Force the unit out if it's still inside
				if (_x in BIS_BLU_SDV1) then {
					_x action ["Eject", BIS_BLU_SDV1];
					sleep 2;
				};
			} forEach units group BIS_inf;
		};
		
		[] spawn {
			scriptName "initMission.hpp: engine control";
			
			// Wait for the driver to disembark
			waitUntil {isNull driver BIS_BLU_SDV1};
			
			// Turn off the engine
			BIS_BLU_SDV1 engineOn false;
		};
		
		// Wait for player to get out
		waitUntil {!(BIS_inf in BIS_BLU_SDV1)};
		
		// Stop leader from getting stuck
		BIS_BLU1 setPosASL [1806.65,2876.52,-7.50309];
		BIS_BLU1 doMove getPosATL BIS_BLU1;
		
		group BIS_BLU1 leaveVehicle (assignedVehicle BIS_BLU1);
		unassignVehicle BIS_BLU1;
		doGetOut BIS_BLU1;
		[BIS_BLU1] orderGetIn false;
		
		// Lock the SDV
		BIS_BLU_SDV1 lock true;
		
		[["InfantryMovement", "BasicDive"]] call BIS_fnc_advHint;
		
		// Wait for all units to dismount
		waitUntil {{_x in BIS_BLU_SDV1} count units group BIS_inf == 0};
		
		sleep 1.5;
		
		saveGame;
		
		sleep 1;
		
		// Take beach guards off careless
		{_x setBehaviour "SAFE"} forEach units BIS_IA_group1;
		
		// Continue to the beach
		BIS_toBeach = true;
		
		waitUntil {BIS_BLU1 distance markerPos "BIS_insert" <= 135};
		
		0 fadeMusic 0.2;
		playMusic "EventTrack02a_F_EPA";
		
		sleep 4;
		
		"BIS_dontTouch" spawn BIS_fnc_missionConversations;
	};
};