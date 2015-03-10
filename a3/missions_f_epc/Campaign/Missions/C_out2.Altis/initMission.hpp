BIS_skipStart = false;
execVM "functions.sqf";
execVM "researchBase.sqf";

BIS_landing = compile preprocessFile "scenes\landing.sqf";
{_x allowFleeing 0} forEach allUnits;

// Code to fail tasks
BIS_failTasks = {
	BIS_courtMartial = true;
	{if (_x call BIS_fnc_taskExists) then {_x call BIS_fnc_missionTasks}} forEach ["BIS_NATO", "BIS_CTRG", "BIS_regroup", "BIS_destroy", "BIS_device", "BIS_miller"];
};

// Define sets of units
BIS_mashers = [BIS_mash1, BIS_mash2, BIS_mash3, BIS_mash4, BIS_mash5];
BIS_conversers = [BIS_BHQ, BIS_planeFake, BIS_tankFake, BIS_bravo];
BIS_CTRGEndUnits = [BIS_inf, BIS_recon, BIS_recon_fake, BIS_CTRG1, BIS_CTRG2, BIS_endPlane1D, BIS_endPlane2D];
BIS_CTRGEndVehicles = [BIS_device, BIS_endPlane1, BIS_endPlane2];
BIS_CTRGEndObjects = [BIS_sub, BIS_obj1, BIS_obj2, BIS_obj3, BIS_obj4, BIS_obj5, BIS_obj6, BIS_obj7, BIS_obj8];
BIS_CTRGEnd = (BIS_CTRGEndUnits + BIS_CTRGEndVehicles + BIS_CTRGEndObjects);
BIS_reUnits = [BIS_reUnit1, BIS_reUnit2, BIS_reUnit3, BIS_reUnit4, BIS_reUnit5];
BIS_joinUnits = [BIS_join1, BIS_join2, BIS_join3];
BIS_arty = ([BIS_arty1, BIS_arty2, BIS_arty3, BIS_arty4] + units group BIS_arty1C + units group BIS_arty2C + units group BIS_arty3C + units group BIS_arty4G);
BIS_armor = ([BIS_armor1, BIS_armor2, BIS_armor3, BIS_armor4] + units group BIS_armor1C);
BIS_roamers = ([BIS_roam1, BIS_roam2, BIS_roam3, BIS_roam4] + units BIS_roamGroup1);
BIS_FOUnits = [BIS_FO1, BIS_FO2, BIS_FO3];
BIS_retGroups = [BIS_retGroup1, BIS_retGroup2, BIS_retGroup3, group BIS_retTank1C, group BIS_retAPC1C, group BIS_retAPC2C, group BIS_retAPC3C, group BIS_retTruck1C];
BIS_retUnits = []; {BIS_retUnits = BIS_retUnits + (units _x)} forEach BIS_retGroups;
BIS_retVehicles = [BIS_retTank1, BIS_retTank2, BIS_retTank3, BIS_retTank4, BIS_retAPC1, BIS_retAPC2, BIS_retAPC3, BIS_retTruck1, BIS_retTruck2];

// Execute FSMs
execFSM "reControl.fsm";
execFSM "FOControl.fsm";
{_x execFSM "retControl.fsm"} forEach BIS_retGroups;

// Control Crossroads' animations
[] spawn {
	scriptName "initMission.hpp: Crossroads animations";
	
	waitUntil {time > 0};
	
	// Play animation
	BIS_BHQ switchMove "HubBriefing_loop";
	
	// Ensure it loops
	private ["_animEH"];
	_animEH = BIS_BHQ addEventHandler [
		"AnimDone",
		{
			private ["_unit"];
			_unit = _this select 0;
			_unit switchMove "HubBriefing_loop";
		}
	];
	
	BIS_BHQ setVariable ["BIS_animEH", _animEH];
	
	// Handle if he's killed while playing an animation
	BIS_BHQ addEventHandler [
		"Killed",
		{
			private ["_unit"];
			_unit = _this select 0;
			
			// Stop animation loop
			if (!(isNil {_unit getVariable "BIS_animEH"})) then {
				_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
				_unit setVariable ["BIS_animEH", nil];
				_unit switchMove "";
			};
		}
	];
};

// Only let artillery engage when asked to support
{
	_x spawn {
		private ["_unit"];
		_unit = _this;
		
		scriptName (format ["initMission.hpp: support control - [%1]", _unit]);
		
		while {alive _unit} do {
			// Wait for unit to be supporting
			waitUntil {_unit getVariable "BIS_SUPP_supporting" || !(alive _unit)};
			
			if (alive _unit) then {
				// Let them engage
				{_x setCombatMode "YELLOW"} forEach units group _unit;
				
				// Wait for them to finish
				waitUntil {!(_unit getVariable "BIS_SUPP_supporting") || !(alive _unit)};
				
				if (alive _unit) then {
					// Stop them from engaging
					{_x setCombatMode "BLUE"} forEach units group _unit;
				};
			};
		};
	};
} forEach [BIS_arty1C, BIS_arty2C, BIS_arty3C, BIS_arty4G];

// Handle detection of running out of support ammo
{
	private ["_firedEH"];
	_firedEH = _x addEventHandler [
		"Fired",
		{
			private ["_vehicle", "_projectile"];
			_vehicle = _this select 0;
			_projectile = _this select 6;
			
			if (_vehicle ammo (currentWeapon _vehicle) == 0) then {
				// Register that it's out of ammo
				_vehicle removeEventHandler ["Fired", _vehicle getVariable "BIS_firedEH"];
				_vehicle setVariable ["BIS_outOfAmmo", true];
			};
			
			if ({!(_x getVariable ["BIS_outOfAmmo", false])} count [BIS_arty1, BIS_arty2, BIS_arty3, BIS_arty4] == 0) then {
				// Track final shot
				_projectile spawn {
					private ["_projectile"];
					_projectile = _this;
					
					scriptName (format ["initMission.hpp: final shot check - [%1]", _projectile]);
					
					waitUntil {!(alive _projectile)};
					
					sleep 2;
					
					// Register that the final shot hit
					BIS_finalHit = true;
				};
			};
		}
	];
	
	_x setVariable ["BIS_firedEH", _firedEH];
} forEach [BIS_arty1, BIS_arty2, BIS_arty3, BIS_arty4];

// Hide the HQ unit
BIS_hideHQ = {
	private ["_unit"];
	_unit = BIS_BHQ;
	
	_unit hideObject true;
	_unit enableSimulation false;
	_unit allowDamage false;
	[_unit, 1000] call BIS_fnc_setHeight;
	
	if (!(isNil {_unit getVariable "BIS_animEH"})) then {
		_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
		_unit setVariable ["BIS_animEH", nil];
		_unit switchMove "";
	};
};

// Code to start the NATO attack
BIS_NATOAttack = {
	// Register the attack
	BIS_NATOAttacking = true;
	
	// Ensure all are off of captive
	{_x setCaptive false} forEach (BIS_armor + BIS_roamers + BIS_FOUnits + BIS_retUnits + BIS_retVehicles);
	
	// Let all units engage
	{_x setCombatMode "RED"} forEach units group BIS_armor1C;
	
	// Let them move
	BIS_armor1D enableAI "MOVE";
};

// Code to make units surrender
BIS_surrender = {
	private ["_unit"];
	_unit = _this;
	
	scriptName (format ["retControl.fsm: surrender control - [%1]", _unit]);
	
	if (alive _unit) then {
		// Stop unit from reacting
		{_unit disableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];
		
		// Stop unit from engaging and being engaged
		_unit setCombatMode "BLUE";
		_unit setCaptive true;
		
		if (vehicle _unit != _unit) then {
			// Disembark from vehicle
			doGetOut _unit;
			waitUntil {vehicle _unit == _unit};
		};
		
		// Surrender
		_unit playMove "AmovPercMstpSsurWnonDnon";
		
		private ["_animEH"];
		_animEH = _unit addEventHandler [
			"AnimChanged",
			{
				private ["_unit", "_anim"];
				_unit = _this select 0;
				_anim = _this select 1;
				
				if (_anim == "AmovPercMstpSnonWnonDnon") then {
					// Remove eventhandler
					_unit removeEventHandler ["AnimChanged", _unit getVariable "BIS_animEH"];
					_unit setVariable ["BIS_animEH", nil];
					
					// Prevent the unit from changing animation
					_unit disableAI "ANIM";
				};
			}
		];
		
		_unit setVariable ["BIS_animEH", _animEH];
	};
};

// Destroy research base buildings
{
	private ["_position", "_class", "_wreck"];
	_position = _x select 0;
	_class = _x select 1;
	_wreck = _x select 2;
	
	private ["_building"];
	_building = _position nearestObject _class;
	_building hideObject true;
	
	private ["_ruin"];
	_ruin = createVehicle [_wreck, _position, [], 0, "NONE"];
	_ruin setPosATL getPosATL _building;
	_ruin setDir direction _building;
} forEach [
	[[21049.9,19295.3,0.0485229], "Land_Cargo_Tower_V1_F", "Land_Cargo_Tower_V1_ruins_F"],
	[[21004,19288.2,1.90735e-006], "Land_Cargo_Patrol_V1_F", "Land_Cargo_Patrol_V1_ruins_F"],
	[[21068,19313,-0.081049], "Land_Cargo_Patrol_V1_F", "Land_Cargo_Patrol_V1_ruins_F"]
];

// Open the Dome's door
private ["_dome"];
_dome = [20894.1,19226.7,1.90735e-006] nearestObject "Land_Dome_Big_F";
[_dome, "Door_3_rot"] execVM "\A3\Structures_F\scripts\DoorNoHandle_open.sqf";

// Ensure James plays the right animation when killed
private ["_killedEH"];
_killedEH = BIS_james addEventHandler [
	"Killed",
	{
		private ["_unit"];
		_unit = _this select 0;
		_unit switchMove "Acts_SittingWounded_out";
		
		if (!(isNil {_unit getVariable "BIS_posEH"})) then {
			removeMissionEventHandler ["Draw3D", _unit getVariable "BIS_posEH"];
			_unit setVariable ["BIS_posEH", nil];
		};
	}
];

BIS_james setVariable ["BIS_killedEH", _killedEH];

// Ensure James stays injured
[] spawn {
	scriptName "initMission.hpp: James injury failsafe";
	
	while {alive BIS_james} do {
		waitUntil {damage BIS_james < 0.75 || !(alive BIS_james)};
		
		if (alive BIS_james) then {
			BIS_james setDamage 0.75;
			BIS_james setHitPointDamage ["HitHead", 0];
			{BIS_james setHitPointDamage [_x, 0.75]} forEach ["HitBody", "HitLegs", "HitHand"];
		};
	};
};

// Ensure James cannot be moved
BIS_jamesPos = getPosATL BIS_james;
BIS_jamesDir = direction BIS_james;

private ["_posEH"];
_posEH = addMissionEventHandler ["Draw3D", {BIS_james setPosATL BIS_jamesPos; BIS_james setDir BIS_jamesDir}];
BIS_james setVariable ["BIS_posEH", _posEH];

// Ensure the mission fails if the player kills important units
{
	private ["_friendlyFireEH"];
	_friendlyFireEH = _x addEventHandler [
		"Killed",
		{
			private ["_source"];
			_source = _this select 1;
			if (_source in [vehicle BIS_inf, BIS_inf]) then {BIS_courtMartial = true};
		}
	];
	
	_x setVariable ["BIS_friendlyFireEH", _friendlyFireEH];
} forEach ([BIS_guide, BIS_crouch1, BIS_tiger1, BIS_james, BIS_BHQ, BIS_ambTruck1D] + BIS_mashers + BIS_joinUnits + BIS_arty + units group BIS_ambAPC1C + units group BIS_guardTank1C + units group BIS_guardAPC1C + units group BIS_ambHeli1D + units group BIS_ambHeli2D);

// Ensure the mission fails if friendlies are killed by the artillery
{
	if ((_x call BIS_fnc_objectSide) == WEST) then {
		_x addEventHandler [
			"Killed",
			{
				private ["_source"];
				_source = _this select 1;
				if (_source in BIS_arty) then {BIS_courtMartial = true};
			}
		];
	};
} forEach (allUnits - [BIS_inf]);

// Make artillery platforms aim upwards
BIS_aimUp = {
	private ["_arty", "_gunner"];
	_arty = _this;
	_gunner = gunner _arty;
	
	private ["_target"];
	_target = [_arty, 100, direction _arty] call BIS_fnc_relPos;
	_target set [2, 500];
	_gunner doWatch _target
};

{_x call BIS_aimUp} forEach [BIS_arty1, BIS_arty2, BIS_arty3];

// Mission start
[] spawn {
	scriptName "initMission.hpp: mission start";
	
	if (!(BIS_skipStart)) then {
		sleep 2;
		
		// Send helicopter
		[] spawn BIS_landing;
		
		["\A3\Missions_F_EPC\video\C_out2_sometime_later.ogv", "STR_A3_B_in2_sometime_hours_later"] call BIS_fnc_quotations;
		
		waitUntil {BIS_fnc_quotations_playing || !(isNil "BIS_fnc_quotations_skip")};
		
		0 fadeMusic 0.4;
		playMusic "LeadTrack06_F";
		
		sleep 10;
		
		// Let the ambient units move
		BIS_ambHelisMove = true;
		BIS_mash5 enableAI "MOVE";
		
		waitUntil {!(BIS_fnc_quotations_playing) || !(isNil "BIS_fnc_quotations_skip")};
	};
	
	BIS_inf enableSimulation true;
	
	if (!(BIS_skipStart)) then {
		10 fadeMusic 0.15;
	};
	
	(format ["BIS_%1_blackScreen", missionName]) call BIS_fnc_blackIn;
	(format ["BIS_%1_disabledSave", missionName]) call BIS_fnc_enableSaving;
	
	// Lower weapon
	BIS_inf action ["WeaponOnBack", BIS_inf];
	
	if (!(BIS_skipStart)) then {
		sleep 1;
		
		4 spawn BIS_fnc_earthquake;
		
		[] spawn {
			scriptName "initMission.hpp: helicopter guide";
			
			sleep 1;
			
			// Wave off the helicopter
			BIS_guide switchMove "Acts_PercMstpSlowWrflDnon_handup2";
			
			private ["_animEH"];
			_animEH = BIS_guide addEventHandler [
				"AnimDone",
				{
					private ["_unit", "_anim"];
					_unit = _this select 0;
					_anim = _this select 1;
					
					switch (toLower _anim) do {
						case "acts_percmstpslowwrfldnon_handup2": {
							// Crouch
							_unit setUnitPos "MIDDLE";
							_unit switchMove "AmovPercMstpSlowWrflDnon_AmovPknlMstpSlowWrflDnon";
						};
						
						case "amovpercmstpslowwrfldnon_amovpknlmstpslowwrfldnon": {
							// Remove eventhandler
							_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
							_unit setVariable ["BIS_animEH", nil];
							
							// Resume normal behavior
							_unit enableAI "ANIM";
						};
					};
				}
			];
			
			BIS_guide setVariable ["BIS_animEH", _animEH];
			
			// Handle if he's killed
			BIS_guide addEventHandler [
				"Killed",
				{
					private ["_unit"];
					_unit = _this select 0;
					
					// Stop animation loop
					if (!(isNil {_unit getVariable "BIS_animEH"})) then {
						_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
						_unit setVariable ["BIS_animEH", nil];
						_unit switchMove "";
					};
				}
			];
			
			// Wait for the earthquake to stop
			waitUntil {!(BIS_fnc_earthquake_inprogress)};
			
			// Make him stand up
			BIS_guide setUnitPos "AUTO";
			BIS_guide playMove "AmovPknlMstpSlowWrflDnon_AmovPercMstpSlowWrflDnon";
			
			private ["_animEH"];
			_animEH = BIS_guide addEventHandler [
				"AnimDone",
				{
					private ["_unit", "_anim"];
					_unit = _this select 0;
					_anim = _this select 1;
					
					if (_anim == "AmovPknlMstpSlowWrflDnon_AmovPercMstpSlowWrflDnon") then {
						// Remove eventhandler
						_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
						_unit setVariable ["BIS_animEH", nil];
						
						// Move into position
						BIS_guide enableAI "MOVE";
					};
				}
			];
			
			BIS_guide setVariable ["BIS_animEH", _animEH];
			
			// Wait for him to be in position
			waitUntil {!(isNil "BIS_guideReady")};
			
			{BIS_guide disableAI _x} forEach ["ANIM", "MOVE"];
			
			// Wait for the helicopter to approach
			waitUntil {!(isNil "BIS_startWaving")};
			
			// Start guiding the helicopter
			BIS_guide switchMove "Acts_NavigatingChopper_In";
			
			private ["_animEH"];
			_animEH = BIS_guide addEventHandler [
				"AnimDone",
				{
					private ["_unit", "_anim"];
					_unit = _this select 0;
					_anim = _this select 1;
					
					if (_anim == "Acts_NavigatingChopper_In") then {
						// Remove eventhandler
						_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
						_unit setVariable ["BIS_animEH", nil];
						
						// Keep guiding the helicopter
						_unit switchMove "Acts_NavigatingChopper_Loop";
					};
				}
			];
			
			BIS_guide setVariable ["BIS_animEH", _animEH];
			
			// Wait for helicopter to land
			waitUntil {isTouchingGround BIS_landingHeli};
			
			// Stop guiding
			BIS_guide playMoveNow "Acts_NavigatingChopper_Out";
			
			private ["_animEH"];
			_animEH = BIS_guide addEventHandler [
				"AnimDone",
				{
					private ["_unit", "_anim"];
					_unit = _this select 0;
					_anim = _this select 1;
					
					if (_anim == "Acts_NavigatingChopper_Out") then {
						// Remove eventhandler
						_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
						_unit setVariable ["BIS_animEH", nil];
						
						// Resume normal behavior
						{_unit enableAI _x} forEach ["ANIM", "MOVE"];
					};
				}
			];
			
			BIS_guide setVariable ["BIS_animEH", _animEH];
			
			// Wait for him to be ready to idle
			waitUntil {!(isNil "BIS_guideIdle")};
			
			sleep 3;
			
			// Play idle animation
			BIS_guide playMove "HubStanding_idle2";
			
			private ["_animEH"];
			_animEH = BIS_guide addEventHandler [
				"AnimDone",
				{
					private ["_unit", "_anim"];
					_unit = _this select 0;
					_anim = _this select 1;
					
					if (_anim == "HubStanding_idle2") then {
						// Play animation again
						_unit switchMove "HubStanding_idle2";
					};
				}
			];
			
			BIS_guide setVariable ["BIS_animEH", _animEH];
		};
		
		[] spawn {
			scriptName "initMission.hpp: crouching guide";
			
			sleep 0.5;
			
			// Make him crouch
			BIS_crouch1 setUnitPos "MIDDLE";
			BIS_crouch1 switchMove "AmovPercMstpSlowWrflDnon_AmovPknlMstpSlowWrflDnon";
			
			private ["_animEH"];
			_animEH = BIS_crouch1 addEventHandler [
				"AnimDone",
				{
					private ["_unit", "_anim"];
					_unit = _this select 0;
					_anim = _this select 1;
					
					switch (toLower _anim) do {
						case "amovpercmstpslowwrfldnon_amovpknlmstpslowwrfldnon": {
							// Tell other guy to get down
							_unit switchMove "Acts_CrouchGetLowGesture";
							
							// Make the unit get down
							BIS_tiger1 setUnitPos "MIDDLE";
						};
						
						case "acts_crouchgetlowgesture": {
							// Remove eventhandler
							_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
							_unit setVariable ["BIS_animEH", nil];
							
							// Resume normal behavior
							_unit enableAI "ANIM";
						};
					};
				}
			];
			
			BIS_crouch1 setVariable ["BIS_animEH", _animEH];
		};
		
		// Make units crouch
		{	
			_x spawn {
				private ["_unit"];
				_unit = _this;
				
				scriptName (format ["initMission.hpp: crouch control - [%1]", _unit]);
				
				sleep (random 5);
				
				_unit disableAI "MOVE";
				_unit setUnitPos "MIDDLE";
				_unit playMove "AmovPercMstpSlowWrflDnon_AmovPknlMstpSlowWrflDnon";
			};
		} forEach BIS_mashers;
		
		[] spawn {
			scriptName "initMission.hpp: post-quake";
			
			// Wait for the earthquake to stop
			waitUntil {!(BIS_fnc_earthquake_inprogress)};
			
			// Let vehicles move
			{_x enableAI "MOVE"} forEach [BIS_ambAPC1D, BIS_arty4D, BIS_ambTruck1D];
			
			// Make units stand up
			{	
				_x spawn {
					private ["_unit"];
					_unit = _this;
					
					scriptName (format ["initMission.hpp: stand up control - [%1]", _unit]);
					
					sleep (random 5);
					
					_unit enableAI "MOVE";
					_unit setUnitPos "AUTO";
					_unit playMove "AmovPknlMstpSlowWrflDnon_AmovPercMstpSlowWrflDnon";
				};
			} forEach (BIS_mashers + [BIS_crouch1, BIS_tiger1]);
			
			sleep 10;
			
			// Play idle animations on units
			{
				if (!(isNil {_x getVariable "BIS_idleAnim"})) then {
					_x spawn {
						private ["_unit"];
						_unit = _this;
						
						scriptName (format ["initMission.hpp: idle animations - [%1]", _unit]);
						
						sleep (random 10);
						
						// Play animation
						private ["_idleAnim"];
						_idleAnim = _unit getVariable "BIS_idleAnim";
						_unit playMove _idleAnim;
						
						// Loop animation
						private ["_animEH"];
						_animEH = _unit addEventHandler [
							"AnimDone",
							{
								private ["_unit", "_anim", "_idleAnim"];
								_unit = _this select 0;
								_anim = _this select 1;
								_idleAnim = _unit getVariable "BIS_idleAnim";
								
								if (_anim == _idleAnim) then {
									// Play the animation again
									_unit switchMove _idleAnim;
								};
							}
						];
						
						_unit setVariable ["BIS_animEH", _animEH];
						
						// Handle if he is killed
						_unit addEventHandler [
							"Killed",
							{
								private ["_unit"];
								_unit = _this select 0;
								
								// Stop animation loop
								if (!(isNil {_unit getVariable "BIS_animEH"})) then {
									_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
									_unit setVariable ["BIS_animEH", nil];
									_unit switchMove "";
								};
							}
						];
					};
				};
			} forEach (BIS_mashers + [BIS_crouch1, BIS_tiger1]);
		};
		
		sleep 4;
		
		"01_Start" call BIS_fnc_missionConversations;
		
		saveGame;
		
		sleep 1;
	};
	
	// Reveal marker
	"BIS_CTRG" setMarkerAlpha 1;
	
	// Add tasks
	{_x call BIS_fnc_missionTasks} forEach ["BIS_NATO", "BIS_CTRG"];
};