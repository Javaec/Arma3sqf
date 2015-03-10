// Compositions in office building
Mike26Compositions = BIS_inf execVM "Composition.sqf";

// Define guard towers
BIS_tower1 = [4364.95,3678.53,-0.055542] nearestObject "Land_Cargo_Patrol_V1_F";
BIS_tower2 = [4346.2,3759.61,-0.00445557] nearestObject "Land_Cargo_HQ_V1_F";
BIS_tower3 = [4337.46,3774.26,-0.202255] nearestObject "Land_Cargo_Patrol_V1_F";
BIS_tower4 = [4390.22,3798.32,-0.21965] nearestObject "Land_Cargo_Patrol_V1_F";

// Destroy towers
([3496.171,4916.087,0.000] nearestObject "Land_TTowerBig_2_F") setDamage 1;

BIS_mike26_defenders = [BIS_IA1, BIS_IA2, BIS_IA3, BIS_IA4, BIS_IA5, BIS_IA6, BIS_IA7, BIS_IA8, BIS_IA9, BIS_IA10, BIS_IA11, BIS_IA12, BIS_IA13, BIS_IA14, BIS_IA15, BIS_IA16];
BIS_mike26_towers = [BIS_tower1, BIS_tower2, BIS_tower3, BIS_tower4];
BIS_mike26_towerGuards = [BIS_IA1, BIS_IA2, BIS_IA8, BIS_IA9, BIS_IA10];
BIS_mike26_reinforcements = [BIS_IA17, BIS_IA18, BIS_IA19, BIS_IA20, BIS_IA21, BIS_IA22, BIS_IA23, BIS_IA24];

BIS_commTower = [4380.799,3783.074,0] nearestObject "Land_Cargo_House_V1_F";

{_x setCaptive true} forEach BIS_mike26_defenders;

// Prevent units from fleeing
{_x allowFleeing 0} forEach allUnits;

// Hide player's waypoints
{_x setWaypointVisible false} forEach waypoints group BIS_inf;

// Disable fatigue
[group BIS_inf, false] call BIS_fnc_camp_setFatigue;

[] spawn {
	scriptName "initMission.hpp: delete waypoints control";
	
	waitUntil {alive BIS_inf && {alive _x} count units group BIS_inf == 1};
	
	while {count waypoints group BIS_inf > 0} do {
		deleteWaypoint (waypoints group BIS_inf select 0);
	};
};

// Detect friendly fire using the mortar as well
{
	if (side _x == WEST) then {
		_x addEventHandler [
			"Killed",
			{
				private ["_source"];
				_source = _this select 1;
				if (_source == BIS_BLU_mortar1) then {BIS_courtMartial = true};
			}
		];
	};
} forEach (allUnits - [BIS_inf]);

// Prevent friendly fire
[] spawn {
	scriptName "initMission.hpp: friendly fire control";
	
	waitUntil {side BIS_inf == sideEnemy || !(isNil "BIS_courtMartial")};
	
	if (isNil "BIS_courtMartial") then {
		// Ensure player is court-martialed
		BIS_courtMartial = true;
		
		// Ensure remaining tasks are failed
		{_x call BIS_fnc_missionTasks} forEach ["BIS_OP", "BIS_towers", "BIS_mike26"];
		if ("BIS_reinf" call BIS_fnc_taskExists) then {"BIS_reinf" call BIS_fnc_missionTasks};
		
		["friendlyFire", false] call BIS_fnc_endMission;
	};
};

// Check if the truck is destroyed
[] spawn {
	scriptName "initMission.hpp: truck control";
	
	waitUntil {!(canMove BIS_BLU_truck1) || {!(isNil _x)} count ["BIS_attack", "BIS_courtMartial"] > 0};
	
	if ({!(isNil _x)} count ["BIS_attack", "BIS_courtMartial"] == 0) then {
		// Ensure player is court-martialed
		BIS_courtMartial = true;
		
		// Ensure remaining tasks are failed
		{_x call BIS_fnc_missionTasks} forEach ["BIS_OP", "BIS_towers", "BIS_mike26"];
		if ("BIS_reinf" call BIS_fnc_taskExists) then {"BIS_reinf" call BIS_fnc_missionTasks};
		
		[[missionName, 1], false] call BIS_fnc_endMission;
	};
};

// Add mortar support
[] spawn {
	scriptName "initMission.hpp: add mortar support";
	
	sleep 120;
	
	{
		_x addEventHandler [
			"HandleDamage",
			{
				private ["_unit", "_damage", "_source"];
				_unit = _this select 0;
				_damage = _this select 2;
				_source = _this select 3;
				
				if (_source != BIS_BLU_mortar1) then {
					_damage
				} else {
					// Sound the alarm
					BIS_alarm = true;
					
					if (_unit in (BIS_mike26_towers + BIS_mike26_towerGuards)) then {
						// Instantly kill or destroy tower guards and towers
						1
					} else {
						// Deal normal damage
						_damage
					};
				};
			}
		];
	} forEach (BIS_mike26_defenders + BIS_mike26_towers);
	
	// Count how many rounds are fired
	BIS_mortarCount = 0;
	
	BIS_BLU_mortar1 addEventHandler [
		"Fired",
		{
			// Increase count of rounds fired
			BIS_mortarCount = BIS_mortarCount + 1;
			
			if (BIS_mortarCount == 8) then {
				private ["_projectile"];
				_projectile = _this select 6;
				
				_projectile spawn {
					private ["_projectile"];
					_projectile = _this;
					
					scriptName format ["missionFlow.fsm: mortar shell tracking - [%1]", _projectile];
					
					// Wait for it to hit the ground
					waitUntil {!(alive _projectile)};
					
					// Allow it some time to take effect
					sleep 1;
					
					// Register that the final round hit
					BIS_finalSplash = true;
				};
			};
		}
	];
	
	// Add mortar support to the player
	if (isNil "BIS_compromised") then {
		[BIS_inf, BIS_requester, BIS_provider] call BIS_fnc_addSupportLink;
	};
};

// Prevent Bravo Lead from dying
BIS_attackLead addEventHandler [
	"HandleDamage",
	{
		private ["_damage", "_source"];
		_damage = _this select 2;
		_source = _this select 3;
		
		if (_source in [vehicle BIS_inf, BIS_inf, BIS_BLU_mortar1]) then {_damage} else {0};
	}
];

// Mission start
[] spawn {
	scriptName "initMission.hpp: mission start";
	
	sleep 1;
	
	["Init"] call BIS_fnc_InstructorFigure;
	
	// Play quotation
	["\A3\Missions_F_EPA\video\A_m03_quotation.ogv", "STR_A3_Campaign_Quote_3"] call BIS_fnc_quotations;
	
	waitUntil {BIS_fnc_quotations_playing || !(isNil "BIS_fnc_quotations_skip")};
	
	private ["_time"];
	_time = time + 9.5;
	
	playMusic "LeadTrack02_F_EPA";
	
	sleep 1;
	
	BIS_BLU2 enableAI "MOVE";
	
	waitUntil {(!(BIS_fnc_quotations_playing) || !(isNil "BIS_fnc_quotations_skip")) && time >= _time};
	
	enableRadio true;
	(format ["%1_blackScreen", missionName]) call BIS_fnc_blackIn;
	format ["%1_disabledSave", missionName] call BIS_fnc_enableSaving;
	
	sleep 4;
	
	"BIS_start" call BIS_fnc_missionConversations;
};