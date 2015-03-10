// Define participants of each part
BIS_range_attackers = ([BIS_BLU2, BIS_BLU3, BIS_BLU4, BIS_BLU5] + units group BIS_inf);
BIS_range_defenders = ([BIS_IA1, BIS_IA2, BIS_IA3, BIS_IA4, BIS_IA5, BIS_IA6, BIS_IA7, BIS_IA8] + units BIS_IA_group3);
BIS_town_defenders = ([BIS_IA9, BIS_IA10] + units BIS_IA_group4 + units BIS_IA_group5 + units BIS_IA_group6);
BIS_extraction_vehicles = [BIS_BLU_boat1, BIS_BLU_boat2];
BIS_extraction_units = [BIS_recon, BIS_BLU_boat1c, BIS_BLU_boat1g, BIS_BLU_boat1d, BIS_CTRG1, BIS_BLU_boat2d];

BIS_paratroopers = {
	private ["_heliName", "_groupName"];
	_heliName = _this select 0;
	_groupName = _this select 1;
	
	scriptName format ["initMission.hpp: BIS_paratroopers - [%1, %2]", _heliName, _groupName];
	
	// Determine helicopter, group and paradrop variable
	private ["_heli", "_group", "_variable"];
	_heli = missionNamespace getVariable _heliName;
	_group = missionNamespace getVariable _groupName;
	_variable = format ["%1_ready", _heliName];
	
	// Wait for the helicopter to be ready to drop
	waitUntil {!(isNil {missionNamespace getVariable _variable})};
	
	if (isNil "BIS_parasSpotted") then {
		// Register that the paratroopers were spotted
		BIS_parasSpotted = true;
	};
	
	for "_i" from 0 to (count units _group - 1) do {
		private ["_unit"];
		_unit = units _group select _i;
		
		// Make the unit eject
		_unit action ["Eject", _heli];
		unassignVehicle _unit;
		
		waitUntil {!(_unit in _heli)};
		
		// Determine his parachute
		private ["_para"];
		_para = missionNamespace getVariable format ["%1_para%2", _groupName, _i + 1];
		
		// Unhide parachute
		_para hideObject false;
		_para enableSimulation true;
		//_para allowDamage true;	(ToDo: re-enable when parachutes no longer burst into flames)
		_para setPos getPosATL _unit;
		_para setDir direction _unit;
		_para setVelocity velocity _unit;
		
		// Move him into the parachute
		_unit moveInDriver _para;
		
		[_unit, _para] spawn {
			private ["_unit", "_para"];
			_unit = _this select 0;
			_para = _this select 1;
			
			scriptName format ["BIS_paratroopers: captive control - [%1, %2]", _unit, _para];
			
			// Wait for the unit to land
			waitUntil {_unit in _para};
			waitUntil {!(_unit in _para)};
			
			_unit setCaptive false;
			{_x reveal _unit} forEach units group BIS_inf;
		};
		
		sleep 0.5;
	};
};

BIS_resetCrew = {
	// Delete old crew
	{
		private ["_boat"];
		_boat = _x;
		
		{
			BIS_extraction_units = BIS_extraction_units - [_x];
			deleteVehicle _x;
		} forEach [commander _boat, gunner _boat, driver _boat];
	} forEach [BIS_BLU_boat1, BIS_BLU_boat2];
	
	// Spawn new crew
	{
		private ["_group"];
		_group = createGroup WEST;
		
		if (_forEachIndex == 0) then {
			// Other boat
			for "_i" from 1 to 3 do {
				switch (_i) do {
					case 1: {
						// Commander (Northgate)
						BIS_BLU_boat1c = _group createUnit ["B_CTRG_soldier_GL_LAT_F", [10,10,10], [], 0, "NONE"];
						BIS_BLU_boat1c setRank "SERGEANT";
						BIS_BLU_boat1c setSkill 1;
						BIS_BLU_boat1c setBehaviour "CARELESS";
						BIS_BLU_boat1c doWatch markerPos "BIS_boatsTarget";
						BIS_BLU_boat1c assignAsCommander BIS_BLU_boat1;
						BIS_BLU_boat1c moveInCommander BIS_BLU_boat1;
						
						BIS_BLU_boat1c setIdentity "EPA_B_Northgate";
						removeGoggles BIS_BLU_boat1c;
						
						BIS_extraction_units = BIS_extraction_units + [BIS_BLU_boat1c];
					};
					
					case 2: {
						// Gunner (McKay)
						BIS_BLU_boat1g = _group createUnit ["B_CTRG_soldier_AR_A_F", [10,10,10], [], 0, "NONE"];
						BIS_BLU_boat1g setRank "SERGEANT";
						BIS_BLU_boat1g setSkill 1;
						BIS_BLU_boat1g doWatch markerPos "BIS_boatsTarget";
						BIS_BLU_boat1g assignAsGunner BIS_BLU_boat1;
						BIS_BLU_boat1g moveInGunner BIS_BLU_boat1;
						
						BIS_BLU_boat1g setIdentity "EPA_B_McKay";
						
						BIS_extraction_units = BIS_extraction_units + [BIS_BLU_boat1g];
					};
					
					case 3: {
						// Driver
						BIS_BLU_boat1d = _group createUnit ["B_Soldier_F", [10,10,10], [], 0, "NONE"];
						BIS_BLU_boat1d setRank "PRIVATE";
						BIS_BLU_boat1d disableAI "MOVE";
						BIS_BLU_boat1d assignAsDriver BIS_BLU_boat1;
						BIS_BLU_boat1d moveInDriver BIS_BLU_boat1;
						
						BIS_extraction_units = BIS_extraction_units + [BIS_BLU_boat1d];
					};
				};
			};
		} else {
			// Miller's boat
			for "_i" from 1 to 3 do {
				switch (_i) do {
					case 1: {
						// Gunner (Miller)
						BIS_recon = _group createUnit ["B_Story_SF_Captain_F", [10,10,10], [], 0, "NONE"];
						BIS_recon setRank "CAPTAIN";
						BIS_recon setSkill 1;
						BIS_recon setBehaviour "CARELESS";
						BIS_recon doWatch markerPos "BIS_boatsTarget";
						BIS_recon assignAsGunner BIS_BLU_boat2;
						BIS_recon moveInGunner BIS_BLU_boat2;
						
						BIS_recon setIdentity "EPA_B_Miller";
						BIS_recon setGroupID [localize "STR_A3_Group_Delta"];
						removeGoggles BIS_recon;
						
						BIS_extraction_units = BIS_extraction_units + [BIS_recon];
					};
					
					case 2: {
						// Commander (James)
						BIS_CTRG1 = _group createUnit ["B_CTRG_soldier_M_medic_F", [10,10,10], [], 0, "NONE"];
						BIS_CTRG1 setRank "LIEUTENANT";
						BIS_CTRG1 setSkill 1;
						BIS_CTRG1 doWatch markerPos "BIS_boatsTarget";
						BIS_CTRG1 assignAsCommander BIS_BLU_boat2;
						BIS_CTRG1 moveInCommander BIS_BLU_boat2;
						
						BIS_CTRG1 setIdentity "EPA_B_James";
						BIS_CTRG1 unassignItem "NVGoggles";
						
						BIS_extraction_units = BIS_extraction_units + [BIS_CTRG1];
					};
					
					case 3: {
						// Driver (Hardy)
						BIS_BLU_boat2d = _group createUnit ["B_CTRG_soldier_engineer_exp_F", [10,10,10], [], 0, "NONE"];
						BIS_BLU_boat2d setRank "SERGEANT";
						BIS_BLU_boat2d disableAI "MOVE";
						BIS_BLU_boat2d assignAsDriver BIS_BLU_boat2;
						BIS_BLU_boat2d moveInDriver BIS_BLU_boat2;
						
						BIS_BLU_boat2d setIdentity "EPA_B_Hardy";
						BIS_BLU_boat2d unassignItem "NVGoggles";
						
						BIS_extraction_units = BIS_extraction_units + [BIS_BLU_boat2d];
					};
				};
			};
		};
		
		// Waypoints
		private ["_wp"];
		_wp = _group addWaypoint [[10,10,10], 0];
		
		// Initial retreat
		if (_forEachIndex == 0) then {
			// Other boat
			_wp setWaypointPosition [[1483.425,7468.161,0.000], 0];
		} else {
			// Miller's boat
			_wp setWaypointPosition [[1497.795,7492.097,0.000], 0];
		};
		
		_wp setWaypointSpeed "FULL";
		_wp setWaypointType "MOVE";
		_group setCurrentWaypoint _wp;
	} forEach [BIS_BLU_boat1, BIS_BLU_boat2];
};

{
	_x allowFleeing 0;
	_x setCaptive true;
} forEach allUnits;

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
} forEach (BIS_range_attackers + BIS_extraction_units - [BIS_inf]);

// Prevent friendly fire
[] spawn {
	scriptName "initMission.hpp: friendly fire control";
	
	waitUntil {side BIS_inf == sideEnemy || !(isNil "BIS_courtMartial")};
	
	// Ensure player is court-martialed
	BIS_courtMartial = true;
	{if (_x call BIS_fnc_taskExists) then {_x call BIS_fnc_missionTasks}} forEach ["BIS_bravo", "BIS_range", "BIS_town", "BIS_retreat", "BIS_boats"];
	
	["friendlyFire", false] call BIS_fnc_endMission;
};

// Track if the player fires
BIS_firedEH = BIS_inf addEventHandler [
	"Fired",
	{
		// Stop previous countdown
		if (!(isNil "BIS_captiveDelay")) then {terminate BIS_captiveDelay};
		
		// Take the player off captive
		if (captive BIS_inf) then {BIS_inf setCaptive false};
		
		BIS_captiveDelay = [] spawn {
			scriptName "initMission.hpp: BIS_captiveDelay";
			
			// Keep the player off captive
			private ["_timeOut"];
			_timeOut = time + 10;
			waitUntil {time >= _timeOut || !(isNil "BIS_spotted")};
			
			if (isNil "BIS_spotted") then {
				// Move back to captive
				BIS_inf setCaptive true;
			};
		};
	}
];

// Prevent extraction team receiving damage from anyone other than the player
{
	private ["_damageEH"];
	_damageEH = _x addEventHandler [
		"HandleDamage",
		{
			private ["_damage", "_source"];
			_damage = _this select 2;
			_source = _this select 3;
			
			if (_source in [vehicle BIS_inf, BIS_inf]) then {_damage} else {0};
		}
	];
	
	_x setVariable ["BIS_damageEH", _damageEH];
} forEach (BIS_extraction_units + BIS_extraction_vehicles);

// Hide player's waypoints
{_x setWaypointVisible false} forEach waypoints group BIS_inf;

[] spawn {
	scriptName "initMission.hpp: delete waypoints control";
	
	waitUntil {alive BIS_inf && {alive _x} count units group BIS_inf == 1};
	
	while {count waypoints group BIS_inf > 0} do {
		deleteWaypoint (waypoints group BIS_inf select 0);
	};
	
	if (isNil "BIS_inBoat") then {
		// Lock boat seats that the player can't get in
		{BIS_BLU_boat2 lockCargo [_x, true]} forEach [0,2,3,4,5,6,7];
		BIS_BLU_boat1 lock true;
	};
};

[] spawn {
	scriptName "initMission.hpp: Bravo control";
	
	waitUntil {!(isNil "BIS_bravoReady") || !(isNil "BIS_attack")};
	
	if (isNil "BIS_attack") then {
		// Separate Bravo subordinates
		{
			private ["_group"];
			_group = createGroup WEST;
			[_x] joinSilent _group;
			
			waitUntil {group _x == _group || !(isNil "BIS_attack")};
			
			if (isNil "BIS_attack") then {
				_x spawn {
					private ["_unit"];
					_unit = _this;
					scriptName format ["initMission.hpp: %1 kneel control", _unit];
					
					private ["_pos", "_target"];
					_pos = markerPos format ["%1_pos", _unit];
					_target = markerPos format ["%1_target", _unit];
					
					// Move to position
					_unit doMove _pos;
					
					waitUntil {!(unitReady _unit) || !(isNil "BIS_attack")};
					waitUntil {unitReady _unit || !(isNil "BIS_attack")};
					
					if (alive _unit && isNil "BIS_attack") then {
						// Watch target
						_unit doWatch _target;
						
						// Take a kneel
						_unit setBehaviour "COMBAT";
						_unit setUnitPos "MIDDLE";
					};
				};
			};
		} forEach [BIS_BLU3, BIS_BLU4, BIS_BLU5];
	};
};

// Mission start
[] spawn {
	scriptName "initMission.hpp: mission start";
	
	sleep 2;
	
	// Play quotation
	["\A3\Missions_F_EPA\video\A_out_quotation.ogv", "STR_A3_Campaign_Quote_22"] call BIS_fnc_quotations;
	
	waitUntil {BIS_fnc_quotations_playing || !(isNil "BIS_fnc_quotations_skip")};
	
	playMusic "AmbientTrack01b_F";
	
	private ["_time"];
	_time = time + 6;
	
	waitUntil {time >= _time || !(isNil "BIS_fnc_quotations_skip")};
	
	BIS_heliMove = true;
	{_x enableAI "MOVE"} forEach ([BIS_IA_truck1D] + units group BIS_inf + units group BIS_BLU2);
	
	private ["_time"];
	_time = time + 1.5;
	
	waitUntil {(!(BIS_fnc_quotations_playing) || !(isNil "BIS_fnc_quotations_skip")) && time >= _time};
	
	enableRadio true;
	BIS_inf enableSimulation true;
	(format ["%1_blackScreen", missionName]) call BIS_fnc_blackIn;
	format ["%1_disabledSave", missionName] call BIS_fnc_enableSaving;
	
	sleep 4;
	
	"BIS_start" call BIS_fnc_missionConversations;
};