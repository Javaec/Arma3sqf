// Make EAST friendly to WEST for the purposes of ambient WEST units (prevent cease fire messages)
createCenter EAST;
createCenter CIVILIAN;
EAST setFriend [WEST, 1];
WEST setFriend [EAST, 1];
EAST setFriend [CIVILIAN, 0];

if (isNil "BIS_missionScope") then {
	// Helicopter should be already landed
	BIS_heli setPosATL [2986.87,1871.28,0.00624084];
	BIS_heli setDir 207.009;
} else {
	// Fake cinema borders
	[0, 0, false] spawn BIS_fnc_cinemaBorder;
};

BIS_credits =  {
	_this spawn {
		disableSerialization;
		scriptName "initMission.hpp: credits";
		
		private ["_credits"];
		_credits = _this select 0;
		
		private ["_layer"];
		_layer = "BIS_layerCredits" call BIS_fnc_rscLayer;
		_layer cutRsc ["RscDynamicText", "PLAIN"];
		
		private ["_display", "_ctrl"];
		_display = uiNamespace getVariable "BIS_dynamicText";
		_ctrl = _display displayCtrl 9999;
		
		_ctrl ctrlSetFade 1;
		_ctrl ctrlCommit 0;
		
		// Store parsed strings
		private ["_parsed"];
		_parsed = [];
		
		// Compose strings
		{
			private ["_params"];
			_params = _x;
			if (typeName _params == typeName "") then {_params = [_params]};
			
			// Determine if it's a heading
			private ["_heading"];
			if (count _params == 1) then {
				// Single lines are always headings
				_heading = true;
			} else {
				if (typeName (_params select (count _params - 1)) != typeName true) then {
					// Not a heading if undefined
					_heading = false;
				} else {
					// Uses defined bool
					_heading = _params select (count _params - 1);
					
					// Remove from array to prevent confusion
					_params set [count _params - 1, -1];
					_params = _params - [-1];
				};
			};
			
			private ["_strings"];
			_strings = _params;
			
			// Compose string
			private ["_string"];
			_string = "";
			
			if (_heading) then {
				// Center screen
				_string = _string + "<t align = 'center'>";
				
				{
					if (_forEachIndex == 0) then {
						_string = _string + "<t size = '1.25' font = 'PuristaBold'>";
					} else {
						_string = _string + "<t size = '0.75'>";
					};
					
					_string = _string + toUpper _x + "</t>";
					
					// Add line breaks if necessary
					if (_forEachIndex < (count _strings - 1)) then {
						_string = _string + "<br/>";
					};
				} forEach _strings;
				
				_string = _string + "</t>";
				
				// Add to parsed strings
				private ["_text"];
				_text = parseText _string;
				_parsed = _parsed + [[_text, [0, 0.5]]];
			} else {
				// Choose mode
				private ["_mode"];
				_mode = if (!(isNil "BIS_creditsLastMode")) then {
					(["left", "right"] - BIS_creditsLastMode) select 0
				} else {
					["left", "right"] call BIS_fnc_selectRandom
				};
				
				// Ensure it doesn't show on the same side twice
				BIS_creditsLastMode = [_mode];
				
				// Set multipliers immediately if possible
				private ["_multipliers"];
				if (_mode == "left") then {_multipliers = [0.01, 0.15]};
				
				// Position on screen
				_string = _string + "<t align = '" + _mode + "'>";
				
				{
					if (_forEachIndex == 0) then {
						// Department name
						_string = _string + "<t size = '0.5'>" + toUpper _x + "</t><br/>";
					} else {
						private ["_members"];
						_members = _x;
						if (typeName _members == typeName "") then {_members = [_members]};
						
						// Determine multipliers for right side of screen
						if (_mode == "right") then {
							_multipliers = if (count _members == 1) then {
								[-0.01, 0.8]
							} else {
								[-0.01, 0.8 - (0.025 * (count _members - 1))]
							};
						};
						
						// Department members
						_string = _string + "<t size = '0.6'>";
						
						{
							_string = _string + toUpper _x;
							
							// Add line breaks if necessary
							if (_forEachIndex < (count _members - 1)) then {
								_string = _string + "<br/>";
							};
						} forEach _members;
						
						_string = _string + "</t>";
					};
				} forEach _strings;
				
				_string = _string + "</t>";
				
				// Add to parsed strings
				private ["_text"];
				_text = parseText _string;
				_parsed = _parsed + [[_text, _multipliers]];
			};
		} forEach _credits;
		
		BIS_creditsLastMode = nil;
		
		// Wait to show credits
		waitUntil {!(isNil "BIS_creditsShow")};
		
		// Show credits
		{
			private ["_text", "_multipliers"];
			_text = _x select 0;
			_multipliers = _x select 1;
			
			_ctrl ctrlSetPosition [
				(_multipliers select 0) * safeZoneW + safeZoneX,
				(_multipliers select 1) * safeZoneH + safeZoneY,
				safeZoneW,
				safeZoneH
			];
			
			// Add text
			_ctrl ctrlSetStructuredText _text;
			_ctrl ctrlCommit 0;
			
			// Show text
			_ctrl ctrlSetFade 0;
			_ctrl ctrlCommit 1;
			
			sleep 4;
			
			// Hide text
			_ctrl ctrlSetFade 1;
			_ctrl ctrlCommit 1;
			
			sleep 4;
		} forEach _parsed;
	};
};

BIS_crashSite = {
	// Kill driver and commander
	{_x setDamage 1} forEach [BIS_officer, BIS_offTruckD];
	
	// Set up truck
	BIS_offTruck setPos [5690.8989,5313.7993,-0.5];
	BIS_offTruck setDir 125;
	BIS_offTruck engineOn false;
	
	[] spawn {
		scriptName "initMission.hpp: BIS_crashSite";
		
		// Move the truck into position
		sleep 2;
		
		BIS_offTruck enableSimulation false;
		BIS_offTruck setPos [5690.8989,5313.7993,-0.5];
		BIS_offTruck setDir 125;
		[BIS_offTruck, 5, 265] call BIS_fnc_setPitchBank;
		BIS_offTruck setDamage 0.7;
		{BIS_offTruck setHitPointDamage [_x, 1]} forEach ["HitRFWheel", "HitRF2Wheel", "HitLF2Wheel"];
		BIS_offTruck allowDamage false;
		BIS_offTruck engineOn false;
	};
	
	// Add engine smoke
	BIS_truckSmoke = "#particlesource" createVehicle [10,10,10];
	BIS_truckSmoke setParticleClass "WreckSmokeSmall";
	BIS_truckSmoke attachTo [BIS_logic2, [-1.4,-0.4,1.6]];
	
	// Add smoke sound
	BIS_truckSmokeSound = createSoundSource ["Sound_SmokeWreck1", [10,10,10], [], 0];
	BIS_truckSmokeSound attachTo [BIS_logic2, [-1.4,-0.4,1.6]];
	
	// Unhide commander
	BIS_officer hideObject false;
	BIS_officer enableSimulation true;
	
	// Create mine
	BIS_truckMine = "ATMine_Range_Ammo" createVehicle [5680.392,5314.729,0.000];
};

BIS_campSetup = {
	// Move logistics dude
	BIS_logistics hideObject true;
	BIS_logistics enableSimulation false;
	BIS_logistics allowDamage false;
	BIS_logistics setCaptive true;
	
	{BIS_logistics disableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "MOVE", "TARGET"];
	
	BIS_logistics setPos [
		position BIS_logistics select 0,
		position BIS_logistics select 1,
		1000
	];
	
	// Delete unused stuff
	{deleteVehicle _x} forEach ([BIS_invisibleWall1, BIS_invisibleWall2, BIS_futureLead, BIS_charlieLead, BIS_futureMedic, BIS_exp, BIS_guide, BIS_logic1, BIS_campCrew1, BIS_campCrew2, BIS_campCrew3, BIS_campTruck1, BIS_campDriver1, BIS_campGuard1, BIS_campGuard2] + BIS_goat);
	
	BIS_truckSec setPos markerPos "BIS_truckSecPos";
	BIS_truckSec setDir markerDir "BIS_truckSecPos";
	
	{_x setDamage 1} forEach [BIS_truckSec, BIS_campTank1];
	
	// Unhide attackers
	BIS_enemyTruck1 setPosATL (BIS_enemyTruck1 getVariable ["BIS_pos", getPosATL BIS_enemyTruck1]);
	BIS_enemyTruck1 setDir (BIS_enemyTruck1 getVariable ["BIS_dir", direction BIS_enemyTruck1]);
	
	BIS_enemyTruck1 enableSimulation true;
	BIS_enemyTruck1 hideObject false;
	BIS_enemyTruck1 allowDamage true;
	
	{
		private ["_unit"];
		_unit = _x;
		
		if (vehicle _unit == _unit) then {
			_unit setPosATL (_unit getVariable ["BIS_pos", getPosATL _unit]);
			_unit setDir (_unit getVariable ["BIS_dir", direction _unit]);
		};
		
		{_unit enableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "MOVE", "TARGET"];
		
		_unit enableSimulation true;
		_unit hideObject false;
		_unit setCaptive false;
		_unit allowDamage true;
	} forEach [BIS_campAmbient1, BIS_campAmbient2, BIS_campAmbient6, BIS_campAmbient8];
	
	// Create smoke
	"test_EmptyObjectForSmoke" createVehicle [4967.898,5899.229,0.000];
	
	private ["_setup"];
	_setup = {
		private ["_unit", "_marker"];
		_unit = _this select 0;
		_marker = _this select 1;
		
		scriptName format ["initMission.hpp: BIS_campSetup - [%1, %2]", _unit, _marker];
		
		if (alive _unit) then {
			// Remove eventhandlers
			if (!(isNil {_unit getVariable "BIS_animEH"})) then {_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"]};
			if (!(isNil {_unit getVariable "BIS_killedEH"})) then {_unit removeEventHandler ["Killed", _unit getVariable "BIS_killedEH"]};
			
			{_unit enableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "MOVE", "TARGET"];
			_unit switchMove "";
			
			private ["_pos", "_dir"];
			_pos = markerPos _marker;
			_dir = markerDir _marker;
			
			while {position _unit distance _pos > 1 && round (direction _unit) != round _dir} do {
				sleep 0.5;
				
				// Reposition
				_unit setPos _pos;
				_unit setVelocity [0,0,0];
				
				// Set azimuth
				_unit setDir _dir;
			};
			
			_unit setBehaviour "AWARE";
			_unit enableAI "MOVE";
			_unit setCaptive false;
			
			if (side _unit == WEST) then {
				private ["_group"];
				_group = createGroup EAST;
				_group copyWaypoints group _unit;
				while {count waypoints _group > 1} do {sleep 0.5; deleteWaypoint (waypoints _group select 0)};
				
				[_unit] joinSilent _group;
				_unit allowFleeing 0;
			};
		};
	};
	
	[BIS_campAmbient1, "BIS_campPos1"] spawn _setup;
	[BIS_campAmbient2, "BIS_campPos2"] spawn _setup;
	[BIS_campAmbient3, "BIS_campPos3"] spawn _setup;
	[BIS_campAmbient4, "BIS_campPos4"] spawn _setup;
	[BIS_campAmbient5, "BIS_campPos5"] spawn _setup;
	[BIS_campAmbient6, "BIS_campPos6"] spawn _setup;
	[BIS_campAmbient7, "BIS_campPos7"] spawn _setup;
	[BIS_campAmbient8, "BIS_campPos8"] spawn _setup;
	
	// Start fight
	BIS_campFight = true;
};

BIS_AA1Setup = {
	// Damage AA and truck
	{_x setDamage 0.7} forEach [BIS_AA1, BIS_AA1Truck];
	
	// Make the truck have a flat tire
	BIS_AA1Truck setHitPointDamage ["HitLFWheel", 1];
	{_x allowDamage false} forEach [BIS_AA1, BIS_AA1Truck];
	
	private ["_setup"];
	_setup = {
		private ["_unit", "_marker"];
		_unit = _this select 0;
		_marker = _this select 1;
		
		scriptName format ["initMission.hpp: BIS_AA1Setup - [%1, %2]", _unit, _marker];
		
		if (alive _unit) then {
			// Remove eventhandlers
			if (!(isNil {_unit getVariable "BIS_animEH"})) then {_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"]};
			if (!(isNil {_unit getVariable "BIS_killedEH"})) then {_unit removeEventHandler ["Killed", _unit getVariable "BIS_killedEH"]};
			
			{_unit enableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "MOVE", "TARGET"];
			_unit switchMove "";
			
			private ["_pos", "_dir"];
			_pos = markerPos _marker;
			_dir = markerDir _marker;
			
			private ["_anim"];
			_anim = _this select 2;
			
			// Kill the unit
			_unit setDamage 1;
			
			while {position _unit distance _pos > 1 && round (direction _unit) != round _dir && animationState _unit != _anim} do {
				sleep 0.5;
				
				// Reposition
				_unit setPos _pos;
				_unit setVelocity [0,0,0];
				
				// Set azimuth
				_unit setDir _dir;
				
				// Set animation
				_unit switchMove _anim;
			};
		};
	};
	
	[BIS_AA1Ambient1, "BIS_AA1Pos1", "KIA_gunner_static_low01"] spawn _setup;
	[BIS_AA1Ambient2, "BIS_AA1Pos2", "KIA_driver_boat01"] spawn _setup;
	[BIS_AA1Ambient3, "BIS_AA1Pos3", "KIA_driver_sdv"] spawn _setup;
	[BIS_AA1Ambient4, "BIS_AA1Pos4", "KIA_gunner_standup01"] spawn _setup;
	[BIS_AA1Ambient5, "BIS_AA1Pos5", "KIA_passenger_boat_holdleft"] spawn _setup;
};

BIS_AA2Setup = {
	// Spawn fire
	private ["_fire"];
	_fire = createVehicle ["test_EmptyObjectForFireBig", position BIS_AA2, [], 0, "NONE"];
	_fire setPos position BIS_AA2;
	
	// Delete obsolete stuff
	{deleteVehicle _x} forEach [BIS_AA2C, BIS_AA2G, BIS_AA2D, BIS_AA2, BIS_AA2Crate];
	
	private ["_setup"];
	_setup = {
		private ["_unit", "_marker"];
		_unit = _this select 0;
		_marker = _this select 1;
		
		scriptName format ["initMission.hpp: BIS_AA2Setup - [%1, %2]", _unit, _marker];
		
		if (alive _unit) then {
			// Remove eventhandlers
			if (!(isNil {_unit getVariable "BIS_animEH"})) then {_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"]};
			if (!(isNil {_unit getVariable "BIS_killedEH"})) then {_unit removeEventHandler ["Killed", _unit getVariable "BIS_killedEH"]};
			
			{_unit enableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "MOVE", "TARGET"];
			_unit switchMove "";
			
			private ["_pos", "_dir"];
			_pos = markerPos _marker;
			_dir = markerDir _marker;
			
			while {position _unit distance _pos > 1 && round (direction _unit) != round _dir} do {
				sleep 0.5;
				
				// Reposition
				_unit setPos _pos;
				_unit setVelocity [0,0,0];
				
				// Set azimuth
				_unit setDir _dir;
			};
			
			_unit setBehaviour "AWARE";
			_unit enableAI "MOVE";
			_unit setCaptive false;
			
			if (side _unit == WEST) then {
				private ["_group"];
				_group = createGroup EAST;
				_group copyWaypoints group _unit;
				while {count waypoints _group > 1} do {sleep 0.5; deleteWaypoint (waypoints _group select 0)};
				
				[_unit] joinSilent _group;
				_unit allowFleeing 0;
			};
		};
	};
	
	[BIS_AA2Ambient1, "BIS_AA2Pos1"] spawn _setup;
	[BIS_AA2Ambient2, "BIS_AA2Pos2"] spawn _setup;
	[BIS_AA2Ambient3, "BIS_AA2Pos3"] spawn _setup;
	[BIS_AA2Ambient4, "BIS_AA2Pos4"] spawn _setup;
	
	// Start fight
	BIS_AA2Fight = true;
};

// Build arrays of ambient units
BIS_LZ1Ambient = [];
BIS_rangeAmbient = [];
BIS_campAmbient = [];
BIS_AA2Ambient = [];
BIS_goat = [BIS_goatHerder, BIS_goatWatcher];

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
} forEach ["BIS_LZ1Ambient", "BIS_rangeAmbient", "BIS_campAmbient", "BIS_AA2Ambient", "BIS_goat"];

// Stop ambient units from killing each other
{
	private ["_variable", "_array"];
	_variable = _x;
	_array = missionNamespace getVariable _variable;
	
	{
		_x addEventHandler [
			"HandleDamage",
			format [
				"
					private ['_damage', '_source'];
					_damage = _this select 2;
					_source = _this select 3;
					
					if (!(_source in %1)) then {_damage} else {0};
				",
				_array
			]
		];
	} forEach _array;
} forEach ["BIS_rangeAmbient", "BIS_campAmbient", "BIS_AA2Ambient"];

BIS_evacTeam = [BIS_evac1, BIS_evac2, BIS_evac3, BIS_evac4];
BIS_evacAttack = (units BIS_evacAttack1 + units BIS_evacAttack2 + units BIS_evacDefend1 + units BIS_evacDefend2);

BIS_evacRestrict1 = (units BIS_evacDefend1 + units BIS_evacDefend2);
BIS_evacRestrict2 = (units BIS_evacAttack1 + units BIS_evacAttack2);

// Stop enemy fighting ambient units dying from friendly ambient units
{
	_x addEventHandler [
		"HandleDamage",
		{
			private ["_damage", "_source"];
			_damage = _this select 2;
			_source = _this select 3;
			
			if (!(_source in BIS_evacRestrict1)) then {_damage} else {0};
		}
	];
} forEach BIS_evacRestrict2;

// Make friendly fighting units take less damage
{
	_x addEventHandler [
		"HandleDamage",
		{
			private ["_damage", "_source"];
			_damage = _this select 2;
			_source = _this select 3;
			
			if (_source in BIS_evacRestrict2) then {_damage / 2} else {_damage};
		}
	];
} forEach units BIS_evacDefend1;

// Make first group die with one hit
{
	_x addEventHandler [
		"HandleDamage",
		{
			private ["_damage", "_source"];
			_damage = _this select 2;
			_source = _this select 3;
			
			if (_source in BIS_evacRestrict2) then {1} else {_damage};
		}
	];
} forEach units BIS_evacDefend2;

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
	};
} forEach allUnits;

// Stop leader from taking damage from anyone other than the player
private ["_animEH"];
_animEH = BIS_leader addEventHandler [
	"HandleDamage",
	{
		private ["_damage", "_source"];
		_damage = _this select 2;
		_source = _this select 3;
		
		if (_source in [vehicle BIS_inf, BIS_inf]) then {_damage} else {0};
	}
];

BIS_leader setVariable ["BIS_animEH", _animEH];

// Make leader take damage if the player dies
BIS_inf addEventHandler ["Killed", {BIS_leader removeEventHandler ["HandleDamage", BIS_leader getVariable "BIS_animEH"]}];

// Punish the player for friendly fire
{
	_x addEventHandler [
		"Killed",
		{
			private ["_unit""_source"];
			_unit = _this select 0;
			_source = _this select 1;
			
			detach _unit;
			
			if (_source in [vehicle BIS_inf, BIS_inf]) then {
				if (isNil "BIS_toCamp" || _unit == BIS_leader) then {
					BIS_courtMartial = true;
				};
			};
		}
	];
} forEach (allUnits - [BIS_inf]);

// Punish the player for damaging the helicopter
{
	_x addEventHandler [
		"HandleDamage",
		{
			private ["_unit", "_damage", "_source"];
			_unit = _this select 0;
			_damage = _this select 2;
			_source = _this select 3;
			
			if (_source in [vehicle BIS_inf, BIS_inf]) then {
				if (damage _unit > 0.1 || !(canMove _unit)) then {
					BIS_courtMartial = true;
				};
			};
			
			_damage
		}
	];
} forEach ([BIS_heli] + units group BIS_heliD);

[] spawn {
	scriptName "missionFlow.fsm: helicopter damage control";
	
	waitUntil {
		{!(canMove _x) || !(alive _x)} count ([BIS_heli] + units group BIS_heliD) > 0
		||
		!(isNil "BIS_heliBack")
	};
	
	if (isNil "BIS_heliBack") then {BIS_courtMartial = true};
};

// Punish the player from damaging the checkpoint
{
	_x addEventHandler [
		"HandleDamage",
		{
			private ["_damage", "_source"];
			_damage = _this select 2;
			_source = _this select 3;
			
			if (_source in [vehicle BIS_inf, BIS_inf]) then {BIS_checkDamaged = true};
			_damage
		}
	];
} forEach units group BIS_checkOff;

// Punish the player for damaging the dudes at the T-junction or after the checkpoint
{
	private ["_damageEH"];
	_damageEH = _x addEventHandler [
		"HandleDamage",
		{
			private ["_damage", "_source"];
			_damage = _this select 2;
			_source = _this select 3;
			
			if (_source in [vehicle BIS_inf, BIS_inf]) then {BIS_courtMartial = true};
			_damage
		}
	];
	
	_x setVariable ["BIS_damageEH", _damageEH];
} forEach ([BIS_goatHerder, BIS_goatWatcher] + units BIS_forestGroup);

// Hide waypoints
{_x setWaypointVisible false} forEach waypoints group BIS_leader;

// Hide planes
{
	_x allowDamage false;
	_x setCaptive true;
	_x enableSimulation false;
	_x hideObject true;
} forEach [BIS_plane1, BIS_plane2, BIS_bomber, BIS_plane3];

// Hide other vehicles
{
	_x allowDamage false;
	_x setCaptive true;
	_x enableSimulation false;
	_x hideObject true;
	
	// Store position and azimuth
	_x setVariable ["BIS_pos", getPosATL _x];
	_x setVariable ["BIS_dir", direction _x];
	
	// Move way into the air
	_x setPos [position _x select 0, position _x select 1, 1000];
} forEach [BIS_enemyHeli1, BIS_enemyTruck1, BIS_enemyHeli2, BIS_enemyHeli3];

// Hide units
{
	private ["_unit"];
	_unit = _x;
	
	if (!(_unit in BIS_rangeAmbient)) then {_unit hideObject true} else {_unit switchMove "AmovPercMstpSlowWrflDnon"};
	
	_unit allowDamage false;
	_unit setCaptive true;
	_unit enableSimulation false;
	
	{_unit disableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "MOVE", "TARGET"];
	
	if (vehicle _unit == _unit && !(_unit in BIS_rangeAmbient)) then {
		// Store position and azimuth
		_unit setVariable ["BIS_pos", getPosATL _unit];
		_unit setVariable ["BIS_dir", direction _unit];
		
		// Move way itno the air
		_unit setPos [position _unit select 0, position _unit select 1, 1000];
	};
} forEach ([BIS_campAmbient1, BIS_campAmbient2, BIS_campAmbient6, BIS_campAmbient8, BIS_plane1D, BIS_plane2D, BIS_bomberD, BIS_plane3D] + units group BIS_enemyHeli1D + BIS_rangeAmbient + units group BIS_enemyHeli2D + units BIS_AA1Group1 + units BIS_AA1Group2 + units BIS_rangeAttackGrp + BIS_evacAttack + BIS_evacTeam + units BIS_retreatGrp1 + units group BIS_enemyHeli3D + units BIS_retreatGrp2);

[] spawn {
	scriptName "initMission.hpp: mission start";
	
	// Compile UnitCapture data
	BIS_landing = compile preprocessFile "scenes\landing.sqf";
	BIS_flight = compile preprocessFile "scenes\flight.sqf";
	BIS_truckMove = compile preprocessFile "scenes\truckMove.sqf";
	BIS_distantBombing = compile preprocessFile "scenes\distantBombing.sqf";
	BIS_planeAttack = compile preprocessFile "scenes\planeAttack.sqf";
	
	if (!(isNil "BIS_missionScope")) then {
		sleep 1;
	};
	
	private ["_cutter"];
	_cutter = "Land_ClutterCutter_medium_F" createVehicle position BIS_LZ1Ambient8;
	_cutter setPos position BIS_LZ1Ambient8;
	
	// Initialize Instructor Figure
	["Init"] call BIS_fnc_InstructorFigure;
	
	[] spawn {
		scriptName "initMission.hpp: first aid hint";
		
		// Wait for the player to receive the action
		waitUntil {
			damage BIS_inf > 0.25
			&&
			"FirstAidKit" in items BIS_inf
			&&
			vehicle BIS_inf == BIS_inf
		};
		
		sleep 0.25;
		
		if (alive BIS_inf) then {
			// Show hint
			[["Damage", "FAK"]] call BIS_fnc_advHint;
		};
	};
	
	// Ambient chatter
	private ["_ambientChatter"];
	_ambientChatter = {
		private ["_conv", "_container", "_distance", "_condition", "_terminate", "_code"];
		_conv = _this select 0;
		_container = _this select 1;
		_distance = _this select 2;
		_condition = _this select 3;
		_terminate = _this select 4;
		_code = _this select 5;
		
		scriptName format ["initMission.hpp: ambient chatter - [%1, %2, %3, %4, %5, %6]", _conv, _container, _distance, _condition, _terminate, _code];
		
		// Find actors
		private ["_sentences", "_actors"];
		_sentences = configFile >> "CfgSentences" >> _container >> _conv >> "Sentences";
		_actors = [];
		
		for "_i" from 0 to (count _sentences - 1) do {
			private ["_sentence", "_actorName", "_actor"];
			_sentence = _sentences >> (configName (_sentences select _i));
			_actorName = getText (_sentence >> "actor");
			_actor = missionNamespace getVariable [_actorName, objNull];
			
			if (!(isNull _actor) && !(_actor in _actors)) then {
				_actors = _actors + [_actor];
			};
		};
		
		waitUntil {({vehicle BIS_inf distance _x <= _distance} count _actors > 0 && _condition) || _terminate};
		
		if (!(call _terminate)) then {
			// Play chatter
			[_conv, _container, nil, "DIRECT", nil, nil, 1] call BIS_fnc_kbTell;
			enableSentences false;
			
			// Execute code
			call _code;
		};
	};
	
	// LZ Connor
	["090_ambient_special_00", "A_hub", 5, true, {{!(isNil _x)} count ["BIS_inHeli", "BIS_courtMartial"] > 0}, {sleep 5; BIS_ambientChat1 = true}] spawn _ambientChatter;
	["091_ambient_special_01", "A_hub", 5, {!(isNil "BIS_ambientChat1")}, {{!(isNil _x)} count ["BIS_inHeli", "BIS_courtMartial"] > 0}, {}] spawn _ambientChatter;
	
	// Camp Rogain
	["092_ambient_special_02", "A_hub", 10, {!(isNil "BIS_atCamp")}, {{!(isNil _x)} count ["BIS_reported", "BIS_courtMartial"] > 0}, {}] spawn _ambientChatter;
	["093_ambient_special_03", "A_hub", 5, {!(isNil "BIS_receivedOrders")}, {{!(isNil _x)} count ["BIS_playerInTruck", "BIS_courtMartial"] > 0}, {}] spawn _ambientChatter;
	
	// Prepare credits
	[[
		[localize "STR_A3_Bohemia_Interactive", localize "STR_MAINTITLES_02", true],
		localize "STR_A3_CfgMods_A30"
	]] call BIS_credits;
	
	if (!(isNil "BIS_missionScope")) then {
		sleep 1;
		
		// Start landing sequence
		[] spawn BIS_landing;
	};
	
	if (isNil "BIS_missionScope") then {
		BIS_musicStopped = true;
		
		BIS_inf setPosATL [2962.3,1857.7,0.00140381];
		BIS_inf setDir 84.5189;
	} else {
		// Show quotation
		["\A3\Missions_F_EPA\video\A_in_quotation.ogv", "STR_A3_Campaign_Quote_11"] call BIS_fnc_quotations;
		
		waitUntil {BIS_fnc_quotations_playing || !(isNil "BIS_fnc_quotations_skip")};
		
		0 fadeMusic 1;
		playMusic "LeadTrack01_F_EPA";
		
		// Play second track after the first ends
		BIS_musicEH = addMusicEventHandler [
			"MusicStop",
			{
				removeMusicEventHandler ["MusicStop", BIS_musicEH];
				BIS_musicStopped = true;
			}
		];
		
		waitUntil {BIS_fnc_quotations_sound || !(isNil "BIS_fnc_quotations_skip")};
		
		private ["_time"];
		_time = time + 9;
		
		BIS_inf switchMove "Acts_PercMwlkSlowWrflDf2";
		BIS_inf enableSimulation true;
		
		sleep 1;
		
		// Let units move
		{_x enableAI "MOVE"} forEach [BIS_LZ1Ambient5, BIS_LZ1Ambient6];
		
		waitUntil {(!(BIS_fnc_quotations_playing) || !(isNil "BIS_fnc_quotations_skip")) && time >= _time};
		
		showHUD false;
		(format ["%1_blackScreen", missionName]) call BIS_fnc_blackIn;
		
		waitUntil {BIS_inf distance BIS_leader <= 35};
		
		// Make leader wave
		BIS_leader disableAI "ANIM";
		BIS_leader playMove "Acts_PercMstpSlowWrflDnon_handup1";
		
		private ["_animEH"];
		_animEH = BIS_leader addEventHandler [
			"AnimDone",
			{
				if (_this select 1 == "Acts_PercMstpSlowWrflDnon_handup1") then {
					BIS_leader removeEventHandler ["AnimDone", BIS_leader getVariable "BIS_animEH"];
					BIS_leader enableAI "ANIM";
				};
			}
		];
		
		BIS_leader setVariable ["BIS_animEH", _animEH];
		
		"BIS_wave" spawn BIS_fnc_missionConversations;
		
		sleep 1;
	};
	
	// Add Binoculars to player
	BIS_inf addWeapon "Binocular";
	
	if (!(isNil "BIS_missionScope")) then {
		// Remove fake cinema borders
		[1, nil, false] spawn BIS_fnc_cinemaBorder;
		showHUD true;
	};
	
	// Add first task
	//"BIS_CO" call BIS_fnc_missionTasks;
	
	if (!(isNil "BIS_missionScope")) then {
		// Show hint
		//[["Navigation", "Tasks"]] call BIS_fnc_advHint;
		
		BIS_inf playMove "AmovPercMstpSlowWrflDnon";
		
		sleep 2;
	} else {
		waitUntil {BIS_inf distance BIS_heli <= 23 && vehicle BIS_inf == BIS_inf};
	};
	
	// Get in the helicopter
	BIS_loadUp = true;
};