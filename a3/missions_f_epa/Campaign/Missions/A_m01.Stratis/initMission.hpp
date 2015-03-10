BIS_crashSite_attackers = (units BIS_IA_group2 + units BIS_IA_group3);

{
	private ["_unit", "_items"];
	_unit = _x;
	_items = primaryWeaponItems _unit;
	
	{
		// Find the item's type
		private ["_item", "_type"];
		_item = _x;
		_type = getNumber (configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "type");
		
		// Remove scopes and silences (ToDo: remove when fixed?)
		if (_type in [101, 201]) then {
			_unit removePrimaryWeaponItem _item;
		};
	} forEach _items;
} forEach (allUnits - units group BIS_inf);

// Stop all units from fleeing
{_x allowFleeing 0} forEach allUnits;

// Hide player's waypoints
{_x setWaypointVisible false} forEach (waypoints group BIS_inf + waypoints BIS_BLU_group2);

// Handle if the medic or pilot are killed by the player
{
	private ["_killedEH"];
	_killedEH = _x addEventHandler [
		"Killed",
		{
			private ["_unit", "_source"];
			_unit = _this select 0;
			_source = _this select 1;
			
			if (_source in [vehicle BIS_inf, BIS_inf]) then {
				// Signal that they were killed by the player
				BIS_playerKilled = true;
			};
			
			// Remove animation eventhandler if necessary
			if (!(isNil {_unit getVariable "BIS_animEH"})) then {
				_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
			};
			
			// Detach from their logic
			if (_unit != BIS_BLU4) then {detach _unit};
		}
	];
	
	_x setVariable ["BIS_killedEH", _killedEH];
} forEach [BIS_BLU3, BIS_BLU4];

// Prevent units from being damaged by anyone other than the player
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
} forEach (units BIS_BLU_group2 + [BIS_BLU3, BIS_BLU4]);

// Ensure charges destroy the wreck
BIS_bombControl = {
	private ["_bomb", "_pos"];
	_bomb = _this;
	_pos = position _bomb;
	
	scriptName format ["initMission.hpp: BIS_bombControl - [%1]", _bomb];
	
	waitUntil {!(alive _bomb) && !(isNull _bomb)};
	
	if (_pos distance BIS_wreck < 20) then {
		// Destroy the wreck
		BIS_wreck setDamage 1;
	};
};

// Store planted charges
BIS_planted = [];

BIS_inf addEventHandler [
	"Fired",
	{
		private ["_magazine", "_projectile"];
		_magazine = _this select 5;
		_projectile = _this select 6;
		
		if (_magazine == "DemoCharge_Remote_Mag") then {
			BIS_planted = BIS_planted + [_projectile];
			_projectile spawn BIS_bombControl;
		};
	}
];

// Handle friendly fire
[] spawn {
	scriptName "initMission.hpp: friendly fire control";
	
	// Wait for the player to become a renegade
	waitUntil {side BIS_inf == sideEnemy || !(isNil "BIS_playerKilled")};
	
	BIS_courtMartial = true;
	{if (_x call BIS_fnc_taskExists) then {_x call BIS_fnc_missionTasks}} forEach ["BIS_crashSite", "BIS_defend", "BIS_scavenge", "BIS_plant", "BIS_destroy"];
	
	// Fail the mission
	["friendlyFire", false] call BIS_fnc_endMission;
};

// Mission start
[] spawn {
	scriptName "initMission.hpp: mission start";
	
	waitUntil {time > 0};
	
	// Injured pilot
	BIS_BLU4 switchMove "Acts_LyingWounded_loop2";
	
	private ["_animEH"];
	_animEH = BIS_BLU4 addEventHandler ["AnimDone", {(_this select 0) switchMove (_this select 1)}];
	BIS_BLU4 setVariable ["BIS_animEH", _animEH];
	
	BIS_BLU4 addEventHandler [
		"Killed",
		{
			BIS_BLU4 removeEventHandler ["AnimDone", BIS_BLU4 getVariable "BIS_animEH"];
			terminate BIS_A_m01_woundedSounds;
		}
	];
	
	private ["_cutter"];
	_cutter = "Land_ClutterCutter_medium_F" createVehicle position BIS_BLU4;
	_cutter setPos position BIS_BLU4;
	
	// Add wounded soldier sounds
	BIS_A_m01_woundedSounds = BIS_BLU4 spawn BIS_fnc_camp_playWoundedSounds;
	
	sleep 1;
	
	// Initialize Instructor Figure
	["Init"] call BIS_fnc_InstructorFigure;
	
	// Play quotation
	["\A3\Missions_F_EPA\video\A_m01_quotation.ogv", "STR_A3_Campaign_Quote_8"] call BIS_fnc_quotations;
	
	waitUntil {BIS_fnc_quotations_playing || !(isNil "BIS_fnc_quotations_skip")};
	
	playMusic "EventTrack02a_F_EPA";
	
	private ["_time"];
	_time = time + 6.5;
	
	waitUntil {time >= _time || !(isNil "BIS_fnc_quotations_skip")};
	
	{_x enableAI "MOVE"} forEach units group BIS_inf;
	
	private ["_time"];
	_time = time + 1.5;
	
	waitUntil {(!(BIS_fnc_quotations_playing) || !(isNil "BIS_fnc_quotations_skip")) && time >= _time};
	
	enableSentences false;
	
	BIS_inf enableSimulation true;
	(format ["%1_blackScreen", missionName]) call BIS_fnc_blackIn;
	format ["%1_disabledSave", missionName] call BIS_fnc_enableSaving;
	
	sleep 2;
	
	enableRadio true;
	
	sleep 1;
	
	"BIS_start" call BIS_fnc_missionConversations;
};

