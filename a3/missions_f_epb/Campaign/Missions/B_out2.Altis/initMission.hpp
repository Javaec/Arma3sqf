execVM "functions.sqf";

// creating compositions

_compositions = BIS_inf execVM "Compositions\Composition.sqf";

// Build array of lamps in the town
BIS_lamps = nearestObjects [
	markerPos "BIS_poliakko",
	[
		"Land_LampShabby_F",
		"Land_LampStreet_small_F",
		"Land_PowerPoleWooden_L_F",
		"Land_LampDecor_F",
		"Land_LampSolar_F"
	],
	300
];

// Define area guards
BIS_artyGuards = [BIS_artyGuard1, BIS_artyGuard2, BIS_artyGuard3, BIS_artyGuard4, BIS_artyGuard5, BIS_artyGuard6];
BIS_commandGuards = [BIS_commandGuard1, BIS_commandGuard2, BIS_commandGuard3, BIS_commandGuard4, BIS_commandGuard5, BIS_commandGuard6, BIS_commandGuard7, BIS_artyReinf1, BIS_artyReinf2];

// Have them defend their areas
{[_x, "BIS_arty"] execFSM "defend.fsm"} forEach BIS_artyGuards;
{[_x, "BIS_command"] execFSM "defend.fsm"} forEach BIS_commandGuards;

// Define groups of units
BIS_SFTeam = units BIS_SFGroup1 + units BIS_SFGroup2;
BIS_crashUnits = units BIS_crashGroup1 + units BIS_crashGroup2;
BIS_heli2Team = [BIS_heli2S1, BIS_heli2S2, BIS_heli2S3, BIS_heli2S4];
BIS_endUnits = ([BIS_air, BIS_inf, BIS_crashHeli, BIS_crashHeliG, BIS_officerHeli, BIS_BHQ, BIS_BHQ_fake, BIS_crashTruck1, BIS_crashTruck2, BIS_heli2, BIS_dummyCargo, BIS_ambHeli1, BIS_ambHeli2] + units group BIS_officerHeliD + units group BIS_heli2D + BIS_heli2Team + units group BIS_ambHeli1D + units group BIS_ambHeli2D);

BIS_reinfPlayer = {
	// Register the player got his reinforcements
	BIS_reinfJoined = true;
	
	private ["_units"];
	_units = [];
	{if (alive _x) then {_units = _units + [_x]}} forEach units BIS_reinfGroup2;
	
	if (count _units > 0) then {
		BIS_guerA = _units select 0;
		
		{
			_x setCaptive false;
			_x setCombatMode "YELLOW";
			_x setBehaviour "AWARE";
			_x setSpeedMode "NORMAL";
			
			// Remove killed eventhandlers
			if (!(isNil {_x getVariable "BIS_killedEH"})) then {
				_x removeEventHandler ["Killed", _x getVariable "BIS_killedEH"];
			};
		} forEach _units;
		
		// Join reinforcements to player
		_units joinSilent BIS_inf;
		{unassignVehicle _x} forEach _units;
		doGetOut _units;
	};
};

// Track if either of the helicopters fire
{
	private ["_firedEH"];
	_firedEH = _x addEventHandler [
		"Fired",
		{
			private ["_unit"];
			_unit = _this select 0;
			
			_unit removeEventHandler ["Fired", _unit getVariable "BIS_firedEH"];
			BIS_NATOFired = true;
		}
	];
	
	_x setVariable ["BIS_firedEH", _firedEH];
} forEach [BIS_crashHeli, BIS_ambientHeli];

// Stop pilot from taking damage from anyone other than the player
BIS_air addEventHandler [
	"HandleDamage",
	{
		private ["_damage", "_source"];
		_damage = _this select 2;
		_source = _this select 3;
		
		if (_source in [vehicle BIS_inf, BIS_inf]) then {_damage} else {0};
	}
];

// Ensure pilot has unlimited ammo
BIS_air addEventHandler [
	"Fired",
	{
		private ["_unit"];
		_unit = _this select 0;
		
		removeAllWeapons _unit;
		_unit addMagazines ["30Rnd_65x39_caseless_mag", 8];
		_unit addWeapon "arifle_MXC_Holo_F";
		_unit selectWeapon primaryWeapon _unit;
	}
];

// Limit damage taken by attackers from pilot
{
	_x addEventHandler [
		"HandleDamage",
		{
			private ["_damage", "_source"];
			_damage = _this select 2;
			_source = _this select 3;
			
			if (_source == BIS_air) then {_damage * 0.75} else {_damage};
		}
	];
} forEach BIS_crashUnits;

// Fail mission if pilot is killed
BIS_air addEventHandler ["Killed", {BIS_courtMartial = true}];

// Fail mission if player kills any of Gamma
{
	private ["_killedEH"];
	_killedEH = _x addEventHandler [
		"Killed",
		{
			private ["_source"];
			_source = _this select 1;
			
			if (_source in [vehicle BIS_inf, BIS_inf]) then {BIS_courtMartial = true};
		}
	];
	
	_x setVariable ["BIS_killedEH", _killedEH];
} forEach units BIS_reinfGroup2;

{
	private ["_unit"];
	_unit = _x;
	
	// Prevent units from fleeing
	_unit allowFleeing 0;
	
	private ["_handgun"];
	_handgun = handgunWeapon _unit;
	
	// Remove pistols
	if (_handgun != "") then {
		private ["_magazines"];
		_magazines = getArray (configFile >> "CfgWeapons" >> _handgun >> "magazines");
		{_unit removeMagazines _x} forEach _magazines;
		_unit removeWeapon _handgun;
	};
	
	// Remove rifle silencers (ToDo: remove when fixed?)
	{
		private ["_type"];
		_type = getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "type");
		if (_type == 101) then {_unit removePrimaryWeaponItem _x};
	} forEach primaryWeaponItems _unit;
} forEach (allUnits - [BIS_inf]);

// Make artillery blow up after detonation
BIS_arty addEventHandler [
	"HandleDamage",
	{
		private ["_damage", "_projectile"];
		_damage = _this select 2;
		_projectile = _this select 4;
		
		if (_projectile == "DemoCharge_Remote_Ammo") then {1} else {_damage};
	}
];

// Fake camera shake as it fires
BIS_arty addEventHandler [
	"Fired",
	{
		private ["_arty", "_weapon"];
		_arty = _this select 0;
		_weapon = _this select 1;
		
		// Only shake the camera if appropriate
		if (_weapon == "mortar_155mm_AMOS" && vehicle BIS_inf distance _arty <= 200) then {
			addCamShake [10, 0.8, 20];
		};
	}
];

// Switch player's squad to hold fire
private ["_units", "_groups"];
_units = units group BIS_inf - [BIS_inf];
_groups = [];

{
	private ["_group"];
	_group = createGroup WEST;
	_groups = _groups + [_group];
	
	[_x] joinSilent _group;
	_x setCombatMode "GREEN";
} forEach _units;

_units joinSilent BIS_inf;
{deleteGroup _x} forEach _groups;

// Mission start
[] spawn {
	scriptName "initMission.hpp: mission start";
	
	if (!(isNil "BIS_missionScope")) then {
		sleep 1;
	};
	
	BIS_engineFailure = compile preprocessFile "scenes\engineFailure.sqf";
	BIS_landing = compile preprocessFile "scenes\landing.sqf";
	
	if (!(isNil "BIS_missionScope")) then {
		sleep 1;
		
		// Show quotation
		["\A3\Missions_F_EPB\video\B_out2_quotation.ogv", "STR_A3_Campaign_Quote_37"] call BIS_fnc_quotations;
		
		waitUntil {BIS_fnc_quotations_playing || !(isNil "BIS_fnc_quotations_skip")};
		
		30 fadeMusic 0.1;
		playMusic "LeadTrack02a_F_EPB";
		
		waitUntil {!(BIS_fnc_quotations_playing) || !(isNil "BIS_fnc_quotations_skip")};
		
		sleep 1;
		
		enableRadio true;
		BIS_inf enableSimulation true;
		(format ["%1_blackScreen", missionName]) call BIS_fnc_blackIn;
		(format ["%1_disabledSave", missionName]) call BIS_fnc_enableSaving;
		
		sleep 3;
	};
	
	// Spawn ambient explosions
	[] spawn {
		scriptName "initMission.hpp: ambient explosions";
		
		while {isNil "BIS_NATOInbound"} do {
			// Determine number of rounds
			private ["_rounds"];
			_rounds = 5 + random 5;
			
			for "_i" from 0 to _rounds do {
				// Create the explosion
				createVehicle ["M_Mo_120mm_AT", markerPos "BIS_ambientExplosions", [], 200, "NONE"];
				sleep (0.1 + random 0.1);
			};
			
			sleep (5 + random 5);
		};
	};
	
	if (!(isNil "BIS_missionScope")) then {
		sleep 1;
	};
	
	// Play fake sound
	playSound ["BattlefieldExplosions4_3D", true];
	
	if (!(isNil "BIS_missionScope")) then {
		[] spawn {
			scriptName "initMission.hpp: start conversations";
			
			"01_Start" call BIS_fnc_missionConversations;
			
			// Add Instructor Figure
			["AddTopic", ["i01_Surprise_Attack", "B_out2", localize "STR_A3_B_out2_Instructor_Surprise_Attack"]] call BIS_fnc_InstructorFigure;
			
			// Wait for it to no longer be applicable
			waitUntil {{!(isNil _x)} count ["BIS_artyDefend", "BIS_commandDefend", "BIS_artyDead", "BIS_commandClear"] > 0};
			
			// Remove Instructor Figure
			["RemoveTopic", ["i01_Surprise_Attack"]] call BIS_fnc_InstructorFigure;
		};
		
		sleep 3;
	};
	
	// Start tracers
	BIS_tracers = true;
	
	if (!(isNil "BIS_missionScope")) then {
		sleep 1;
		
		// Ambient jets
		[] spawn {
			scriptName "initMission.hpp: ambient jets";
			
			playSound "BattlefieldJet2_3D";
			sleep 6;
			playSound "BattlefieldJet1_3D";
		};
		
		sleep 1;
	};
	
	// Artillery fire
	[] spawn {
		scriptName "initMission.hpp: artillery fire";
		
		private ["_arty", "_center"];
		_arty = BIS_arty;
		_center = markerPos "BIS_artyTarget";
		
		while {canFire _arty && canMove _arty} do {
			_arty setVehicleAmmo 1;
			
			_arty commandArtilleryFire [
				_center,
				getArtilleryAmmo [_arty] select 0,
				1
			];
			
			sleep (20 + random 10);
		};
	};
	
	if (!(isNil "BIS_missionScope")) then {
		sleep 5;
	};
	
	// Ambient combat
	[{!(isNil "BIS_ending")}] call BIS_fnc_camp_ambientCombatSounds;
};