BIS_survivors = [BIS_exp, BIS_survivor1, BIS_survivor2, BIS_survivor3];
BIS_forestUnits = (units BIS_forestGrp1 + units BIS_forestGrp2);
BIS_RVTeam = [BIS_RVLead, BIS_RV1, BIS_RV2, BIS_RV3];

BIS_AA1Guard = [];
BIS_AA2Guard = [];
BIS_LZ2Guard = [];
BIS_stationGuard = ([BIS_stationTruck1] + units group BIS_stationTruck1C);
BIS_patrol1Guard = [];
BIS_patrol2Guard = [];
BIS_patrol3Guard = [];

{
	private ["_i", "_variable", "_array"];
	_i = 1;
	_variable = _x;
	_array = missionNamespace getVariable _variable;
	
	while {!(isNil {missionNamespace getVariable format ["%1%2", _variable, _i]})} do {
		// Determine the unit
		private ["_unit"];
		_unit = missionNamespace getVariable format ["%1%2", _variable, _i];
		
		// Add to array
		_array set [count _array, _unit];
		
		_i = _i + 1;
	};
} forEach ["BIS_AA1Guard", "BIS_AA2Guard", "BIS_LZ2Guard", "BIS_stationGuard", "BIS_patrol1Guard", "BIS_patrol2Guard", "BIS_patrol3Guard"];

BIS_joinSurvivors = {
	{
		private ["_unit"];
		_unit = _x;
		
		{_unit enableAI _x} forEach ["ANIM", "MOVE"];
		
		_unit setBehaviour "AWARE";
		_unit setCombatMode "YELLOW";
		_unit setUnitPos "AUTO";
		_unit setSpeedMode "NORMAL";
		
		_unit playMoveNow "AmovPercMstpSrasWrflDnon";
		
		if (_unit != BIS_exp) then {
			// Remove killed eventhandlers
			_unit removeEventHandler ["Killed", _unit getVariable "BIS_killedEH"];
		};
	} forEach BIS_survivors;
	
	// Join survivors to leader
	[BIS_survivor1, BIS_survivor2, BIS_survivor3] joinSilent BIS_exp;
};

BIS_planeDone1 = false;
BIS_planeDone2 = false;
BIS_planeDone3 = false;

//BIS_leaderDead = true;

if (!(isNil "BIS_leaderDead")) then {
	// Delete leader unit and waypoints
	deleteVehicle BIS_leader;
	while {count waypoints group BIS_inf > 0} do {deleteWaypoint (waypoints group BIS_inf select 0)};
	
	// Set group ID
	BIS_inf setGroupID [localize "STR_A3_CFGIDENTITIES_KERRY0"];
} else {
	if (!(isNil "BIS_missionScope")) then {
		// Fake cinema borders
		[0, 0, false] spawn BIS_fnc_cinemaBorder;
	};
	
	// Hide waypoints
	{_x setWaypointVisible false} forEach waypoints group BIS_inf;
	
	// Stop the player killing his leader
	BIS_leader addEventHandler [
		"Killed",
		{
			private ["_source"];
			_source = _this select 1;
			if (_source in [vehicle BIS_inf, BIS_inf]) then {BIS_courtMartial = true};
		}
	];
	
	// Ensure the mine kills the leader
	private ["_damageEH"];
	_damageEH = BIS_leader addEventHandler [
		"HandleDamage",
		{
			private ["_damage", "_source"];
			_damage = _this select 2;
			_source = _this select 3;
			
			if (!(isNull _source)) then {
				_damage
			} else {
				if (isNil "BIS_mine1") then {
					_damage
				} else {
					if (alive BIS_mine1) then {
						_damage
					} else {
						BIS_leader removeEventHandler ["HandleDamage", BIS_leader getVariable "BIS_damageEH"];
						
						// Ensure the topic is removed if it wasn't already
						if (BIS_leader kbHasTopic "A_in2_20_Trust") then {
							BIS_leader kbRemoveTopic "A_in2_20_Trust";
						};
						
						BIS_mineExploded = true;
						
						[] spawn {
							scriptName "initMission.hpp: leader's death conversation";
							
							"BIS_dead" call BIS_fnc_missionConversations;
							
							// Move leader into his own group (prevents KIA message)
							private ["_group"];
							_group = createGroup WEST;
							[BIS_leader] joinSilent _group;
							
							// Change the player's group ID
							BIS_inf setGroupID [localize "STR_A3_CFGIDENTITIES_KERRY0"];
							
							BIS_leader setDamage 1;
						};
					};
				};
			};
		}
	];
	
	BIS_leader setVariable ["BIS_damageEH", _damageEH];
};

{
	private ["_unit"];
	_unit = _x;
	
	if (_unit != BIS_inf) then {
		// Prevent units from fleeing
		_unit allowFleeing 0;
		
		// Remove pistols (ToDo: remove when fixed?)
		{
			private ["_type"];
			_type = getNumber (configFile >> "CfgWeapons" >> _x >> "type");
			
			if (_type == 2) then {
				{_unit removeMagazines _x} forEach (getArray (configFile >> "CfgWeapons" >> _x >> "magazines"));
				_unit removeWeapon _x;
			};
		} forEach weapons _unit;
		
		{
			private ["_type"];
			_type = getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "type");
			
			// Remove rifle silencers (ToDo: remove when fixed?)
			if (_type == 101) then {_unit removePrimaryWeaponItem _x};
		} forEach primaryWeaponItems _unit;
		
		// Set all necessary enemies to captive
		if (side _unit == RESISTANCE && !(_unit in BIS_forestUnits)) then {_unit setCaptive true};
	};
} forEach allUnits;

// Stop survivor lead from taking damage from anyone other than the player
BIS_exp addEventHandler [
	"HandleDamage",
	{
		private ["_damage", "_source"];
		_damage = _this select 2;
		_source = _this select 3;
		
		if (_source in [vehicle BIS_inf, BIS_inf]) then {_damage} else {0};
	}
];

// Stop player killing friendlies
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
} forEach (BIS_survivors + BIS_RVTeam);

// Mission start
[] spawn {
	scriptName "initMission.hpp: mission start";
	
	if (!(isNil "BIS_missionScope")) then {
		sleep 1;
	};
	
	// Destroy tower
	([3496.171,4916.087,0.000] nearestObject "Land_TTowerBig_2_F") setDamage 1;
	
	// Initialize Instructor Figure
	["Init"] call BIS_fnc_InstructorFigure;
	
	// Position the helicopter wreck
	[] spawn {
		scriptName "initMission.hpp: position helicopter wreck";
		
		sleep 2;
		
		BIS_heliWreck setPos markerPos "BIS_heliWreckPos";
		BIS_heliWreck setDir markerDir "BIS_heliWreckPos";
	};
	
	// Keep marksman targeting logic
	[] spawn {
		scriptName "initMission.hpp: marksman targeting";
		
		private ["_unit", "_target"];
		_unit = BIS_RV1;
		_target = BIS_target1;
		
		while {alive _unit && isNil "BIS_RVJoin"} do {
			_unit reveal _target;
			sleep 2;
		};
	};
	
	// Ambient planes
	[] spawn {
		scriptName "initMission.hpp: ambient planes";
		
		private ["_routes"];
		_routes = [1,2,3];
		
		sleep 45;
		
		while {true} do {
			// Ensure the pool resets if necessary
			_routes = if (count _routes == 0) then {[1,2,3]} else {_routes};
			
			// Select a route
			private ["_route"];
			_route = _routes call BIS_fnc_selectRandom;
			_routes = _routes - [_route];
			
			// Determine position, direction, waypoints and variable
			private ["_pos", "_dir", "_wps", "_var"];
			_pos = format ["BIS_planePos%1", _route];
			_dir = format ["BIS_planeDir%1", _route];
			_wps = format ["BIS_planeWPs%1", _route];
			_var = format ["BIS_planeDone%1", _route];
			
			// Spawn plane
			private ["_array"];
			_array = [
				missionNamespace getVariable _pos,
				missionNamespace getVariable _dir,
				"I_Plane_Fighter_03_CAS_F",
				RESISTANCE
			] call BIS_fnc_spawnVehicle;
			
			private ["_plane", "_pilot", "_group"];
			_plane = _array select 0;
			_pilot = (_array select 1) select 0;
			_group = _array select 2;
			
			{_x setCaptive true} forEach [_plane, _pilot];
			_group copyWaypoints (missionNamespace getVariable _wps);
			
			waitUntil {missionNamespace getVariable _var};
			
			// Delete the plane
			{deleteVehicle _x} forEach [_plane, _pilot];
			deleteGroup _group;
			
			missionNamespace setVariable [_var, false];
			
			sleep (30 + random 270);
		};
	};
	
	// Handle areas getting alerted
	private ["_alert"];
	_alert = {
		private ["_units", "_variable"];
		_units = _this select 0;
		_variable = _this select 1;
		
		scriptName format ["initMission.hpp: alert control - [%1, %2]", _units, _variable];
		
		waitUntil {{!(alive _x) || behaviour _x == "COMBAT"} count _units > 0 || !(isNil {missionNamespace getVariable _variable})};
		
		{_x setBehaviour "COMBAT"} forEach _units;
		missionNamespace setVariable [_variable, true];
	};
	
	[BIS_AA1Guard, "BIS_AA1Alerted"] spawn _alert;
	[BIS_AA2Guard, "BIS_AA2Alerted"] spawn _alert;
	[BIS_LZ2Guard, "BIS_LZ2Alerted"] spawn _alert;
	[BIS_stationGuard, "BIS_stationAlerted"] spawn _alert;
	[BIS_patrol1Guard, "BIS_patrol1Alerted"] spawn _alert;
	[BIS_patrol2Guard, "BIS_patrol2Alerted"] spawn _alert;
	[BIS_patrol3Guard, "BIS_patrol3Alerted"] spawn _alert;
	
	// Ambient combat sounds
	[] call BIS_fnc_camp_ambientCombatSounds;
	
	if (!(isNil "BIS_missionScope")) then {
		sleep 1;
		
		// Play quotation
		["\A3\Missions_F_EPA\video\A_in2_quotation.ogv", "STR_A3_Campaign_Quote"] call BIS_fnc_quotations;
		
		waitUntil {BIS_fnc_quotations_playing || !(isNil "BIS_fnc_quotations_skip")};
		
		playMusic "AmbientTrack03_F";
		
		waitUntil {!(BIS_fnc_quotations_playing) || !(isNil "BIS_fnc_quotations_skip")};
		
		60 fadeMusic 0.2;
	};
	
	// Let the helicopter move
	BIS_heliPatrol1Move = true;
	
	// Give player a weapon if they doesn't have one
	if (primaryWeapon BIS_inf == "") then {
		BIS_inf addMagazines ["30Rnd_556x45_Stanag", 4];
		BIS_inf addWeapon "arifle_Mk20_F";
		BIS_inf selectWeapon primaryWeapon BIS_inf;
	};
	
	// Start player crouching
	BIS_inf switchMove "Acts_PknlMstpSlowWrflDnon";
	BIS_inf enableSimulation true;
	
	if (!(isNil "BIS_missionScope")) then {
		enableRadio true;
		(format ["%1_blackScreen", missionName]) call BIS_fnc_blackIn;
		showHUD false;
		
		sleep 4;
		
		if (isNil "BIS_leaderDead") then {
			// Make leader gesture to stay low
			BIS_leader disableAI "ANIM";
			BIS_leader switchMove "Acts_CrouchGetLowGesture";
			
			private ["_animEH"];
			_animEH = BIS_leader addEventHandler [
				"AnimDone",
				{
					BIS_leader removeEventHandler ["AnimDone", BIS_leader getVariable "BIS_animEH"];
					
					// Make leader watch helicopter
					{BIS_leader enableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "TARGET"];
					BIS_leader reveal BIS_heliPatrol;
					BIS_leader doWatch BIS_heliPatrol;
				}
			];
			
			BIS_leader setVariable ["BIS_animEH", _animEH];
			
			sleep 0.5;
			
			"BIS_stayLow" spawn BIS_fnc_missionConversations;
			
			sleep 16;
		};
	};
	
	if (isNil "BIS_leaderDead") then {
		// Move out
		BIS_leader doWatch objNull;
		BIS_leader playMove "AmovPercMstpSrasWrflDnon";
		BIS_leader setUnitPos "AUTO";
		BIS_leader enableAI "MOVE";
	};
	
	BIS_inf playMoveNow "AmovPknlMstpSlowWrflDnon";
	
	if (isNil "BIS_missionScope") then {
		// Set the proper group ID
		BIS_survivorGrp setGroupID [localize "STR_A3_CFGIDENTITIES_LACEY0"];
	} else {
		// Remove fake cinema borders
		[1, nil, false] spawn BIS_fnc_cinemaBorder;
		format ["%1_disabledSave", missionName] call BIS_fnc_enableSaving;
		showHUD true;
		
		"BIS_moveOut" call BIS_fnc_missionConversations;
		sleep 4;
		
		"BIS_survivors" call BIS_fnc_missionConversations;
	};
	
	// Unhide marker, add task
	"BIS_survivors" setMarkerAlpha 1;
	"BIS_survivors" call BIS_fnc_missionTasks;
	
	if (!(isNil "BIS_missionScope")) then {
		"BIS_rendezvous" call BIS_fnc_missionConversations;
	};
	
	if (!(isNil "BIS_leaderDead")) then {
		// Signal that the player is moving out
		BIS_movingOut = true;
	} else {
		if (!(isNil "BIS_missionScope")) then {
			"BIS_trust" call BIS_fnc_missionConversations;
		};
	};
};