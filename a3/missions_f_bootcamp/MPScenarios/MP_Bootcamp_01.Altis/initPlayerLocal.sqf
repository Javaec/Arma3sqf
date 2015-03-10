// Defines
#define SHOW_INTRO true
#define SHOW_ICONS true

// Parameters
private ["_player", "_jip"];
_player = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_jip 	= [_this, 1, false, [false]] call BIS_fnc_param;

// Whether we are dealing with an Instructor or a Recruit
private "_isInstructor";
_isInstructor = !isNil { BIS_instructor } && { !isNull BIS_instructor } && { _player == BIS_instructor };

// Check whether we are dealing with Instructor or Recruit
if (_isInstructor) then {
	// Briefing notes
	_player createDiaryRecord ["Diary", [localize "STR_A3_MP_Bootcamp_Briefing_Instructor_FiringRanges_Title", localize "STR_A3_MP_Bootcamp_Briefing_Instructor_FiringRanges_Description"]];
	_player createDiaryRecord ["Diary", [localize "STR_A3_MP_Bootcamp_Briefing_Instructor_ObstacleCourses_Title", localize "STR_A3_MP_Bootcamp_Briefing_Instructor_ObstacleCourses_Description"]];
	_player createDiaryRecord ["Diary", [localize "STR_A3_MP_Bootcamp_Briefing_Instructor_Training_Title", localize "STR_A3_MP_Bootcamp_Briefing_Instructor_Training_Description"]];
	_player createDiaryRecord ["Diary", [localize "STR_A3_MP_Bootcamp_Briefing_Instructor_Module_Title", localize "STR_A3_MP_Bootcamp_Briefing_Instructor_Module_Description"]];
	_player createDiaryRecord ["Diary", [localize "STR_A3_MP_Bootcamp_Briefing_Instructor_Instructor_Title", localize "STR_A3_MP_Bootcamp_Briefing_Instructor_Instructor_Description"]];
	
	// Initialize last execution for Instructor's UI
	missionNamespace setVariable ["BIS_instructorUiLastExecution", 0];
	
	// Instructor UI
	addMissionEventHandler ["Draw3D", { [] call BIS_fnc_instructorUi; }];
	
	// Log
	"Instructor local initialization finished" call BIS_fnc_log;
} else {
	// Briefing notes
	_player createDiaryRecord ["Diary", [localize "STR_A3_MP_Bootcamp_Briefing_Instructor_FiringRanges_Title", localize "STR_A3_MP_Bootcamp_Briefing_Recruit_FiringRanges_Description"]];
	_player createDiaryRecord ["Diary", [localize "STR_A3_MP_Bootcamp_Briefing_Instructor_ObstacleCourses_Title", localize "STR_A3_MP_Bootcamp_Briefing_Recruit_ObstacleCourses_Description"]];
	_player createDiaryRecord ["Diary", [localize "STR_A3_MP_Bootcamp_Briefing_Recruit_Recruit_Title", localize "STR_A3_MP_Bootcamp_Briefing_Recruit_Recruit_Description"]];
	
	// Reset inventory
	removeHeadgear _player;
	removeGoggles _player;
	removeBackpack _player;
	removeAllWeapons _player;
	_player removeWeapon "NVGoggles_Indep";
	{ _player removeMagazineGlobal _x; } forEach magazines _player;
	
	// Properties
	_player setVariable ["BIS_deathPosition", [], true];
	
	// When the recruit is killed
	_player addEventHandler ["Killed", {
		// Parameters
		private ["_killed", "_killer"];
		_killed = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
		_killer = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
		
		// Decide on the respawn time
		private "_respawnTime";
		_respawnTime = switch (true) do {
			// Killed by the Instructor
			case (["isInstructor", [_killer]] call BIS_fnc_flow) : { 120; };
			// Suicide
			case (_killed == _killer) : { 80; };
			// Killed by another Recruit
			case (isPlayer _killer) : { 30; };
			// Killed by Enemy
			case Default { 60; };
		};
		
		// Set respawn time depending on the kill type
		setPlayerRespawnTime _respawnTime;
		
		// Store the position where the unit was killed
		_killed setVariable ["BIS_deathPosition", position _killed, true];
		
		// Log
		["Recruit (%1, %2, %3) was killed at %4 and will wait %5 seconds until respawn", _killed, name _killed, getPlayerUid _killed, position _killed, _respawnTime] call BIS_fnc_logFormat;
	}];
	
	// When recruit respawns
	_player addEventHandler ["Respawn", {
		// Parameters
		private ["_killed", "_body"];
		_killed 	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
		_body		= [_this, 1, objNull, [objNull]] call BIS_fnc_param;
		
		// Let's make sure there are other Recruits alive
		private "_players";
		_players = ["allRecruits"] call BIS_fnc_flow;
		_players = _players - [_killed, _body];
		
		// Do we have any results
		if (count _players > 0) then {
			// The death position
			private "_deathPosition";
			_deathPosition = _killed getVariable ["BIS_deathPosition", _body getVariable ["BIS_deathPosition", [0,0,0]]];
			
			// The recruits, sorted by distance from the death position
			private "_playersOrdered";
			_playersOrdered = [_players, [], { _x distance _deathPosition }, "ASCEND"] call BIS_fnc_sortBy;
			
			// The recruit, depending on distance from the death position
			private "_player";
			_player = _playersOrdered select 0;
			
			// Vehicle or not?
			if (vehicle _player != _player && { vehicle _player emptyPositions "CARGO" > 0 }) then {
				// Move the respawned recruit to the other recruit's vehicle
				_killed moveInCargo vehicle _player;
			} else {
				// Get a position near the friendly Recruit, behind him
				private "_position";
				_position = [_player, 5, getDir _player + 180] call BIS_fnc_relPos;
				
				// Set the height as terrain
				_position set [2, 0];
				
				// Move Recruit to position of friendly Recruit
				_killed setPosATL _position;
				
				// Log
				["Recruit (%1, %2, %3) respawned near Recruit (%4, %5, %6)", _killed, name _killed, getPlayerUid _killed, _player, name _player, getPlayerUid _player] call BIS_fnc_logFormat;
			};
		} else {
			// Log
			["Recruit (%1, %2, %3) respawned at the base, no available recruits to spawn near to", _killed, name _killed, getPlayerUid _killed] call BIS_fnc_logFormat;
		};
		
		// Reset inventory
		removeHeadgear _killed;
		removeVest _killed;
		removeBackpack _killed;
		removeAllWeapons _killed;
		{ _killed removeMagazineGlobal _x; } forEach magazines _killed;
		_killed removeWeapon "NVGoggles_Indep";
		
		// Transfer inventory status from the dead body to the respawned one
		if (headgear _body != "") then { _killed addHeadgear headgear _body; };
		if (vest _body != "") then { _killed addVest vest _body; };
		{ _killed addMagazine _x; } forEach magazines _body;
		{ _killed addWeapon _x; } forEach weapons _body;
		
		// Hide body
		hideBody _body;
	}];
	
	// Every time a recruit gets damaged and does not have a Fak we give him one
	_player addEventHandler ["Hit", {
		private ["_player"];
		_player = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
		
		if (damage _player > 0 && { !("FirstAidKit" in items player) }) then {
			player addItem "FirstAidKit";
		};
	}];
	
	// Monitor the game state and give feedback to the Recruit
	_player spawn {
		scriptName "MP_Bootcamp_01: Client 'WaitForInstructor' task handling";
		
		// This recruit
		private "_player";
		_player = _this;
		
		// We only add the task after intro
		waitUntil {
			!isNil { BIS_introFinished }
		};
		
		// Wait for Instructor task
		["BIS_waitForInstructor", ["create", [_player]]] call BIS_fnc_missionTasks;
		
		// The loop
		while { true } do {
			// Whether there is a Stage currently selected
			private "_instructorExists";
			_instructorExists = ["instructorExists"] call BIS_fnc_flow;
			
			// In case we don't have a Instructor in game we give some feedback to the Recruits
			if (!_instructorExists) then {
				["BIS_waitForInstructor", ["setState", ["ASSIGNED"]]] call BIS_fnc_missionTasks;
			} else {
				["BIS_waitForInstructor", ["setState", ["SUCCEEDED"]]] call BIS_fnc_missionTasks;
			};
			
			// Delay between each execution
			sleep 5;
		};
	};
	
	// Log
	"Recruit local initialization finished" call BIS_fnc_log;
};

// Initial mission objects that should not be curator editable
private "_blacklistedMissionObjects";
_blacklistedMissionObjects = [
	BIS_vehiclesFiringRange_vehicle_1
];

// Objects that cannot die
{
	_x addEventHandler ["HandleDamage", { 0; }];
} forEach allMissionObjects "TargetBootcampHumanSimple_F" + _blacklistedMissionObjects;

// Icons
if (SHOW_ICONS) then {
	// Base icon image
	private ["_iconImage", "_iconGrenade", "_iconWeapon", "_iconWatch", "_iconRunning", "_iconVehicle", "_iconVehicleFiring"];
	_iconImage 		= "A3\Ui_F_Curator\Data\CfgCurator\waypointCycle_ca.paa";
	_iconGrenade 		= "a3\Ui_F_Curator\Data\RscCommon\RscAttributeInventory\filter_6_ca.paa";
	_iconWeapon 		= "a3\Ui_F_Curator\Data\RscCommon\RscAttributeInventory\filter_1_ca.paa";
	_iconWatch 		= "a3\Ui_f\data\IGUI\Cfg\Actions\settimer_ca.paa";
	_iconRunning 		= "a3\Ui_F_Curator\Data\RscCommon\RscAttributeSpeedMode\full_ca.paa";
	_iconVehicle 		= "a3\Ui_f\data\IGUI\Cfg\Actions\getindriver_ca.paa";
	_iconVehicleFiring 	= "a3\UI_F_Curator\Data\RscCommon\RscAttributeBootcampStage\Icon_VehiclesFiringRange.paa";

	// Initialize
	["initialize"] call BIS_fnc_icons;
	
	// Welcome signs
	["addIcon", ["InfantryObstacleCourse", BIS_infantryObstacleCourse_welcomeSign, player, 2500, true, "nothing", nil, nil, [_iconRunning, [1,1,1,0.75], [0,0,0], 1, 1, 0, localize "STR_A3_MP_Bootcamp_Course_InfantryObstacleCourse", false, 0.040, "PuristaMedium"]]] call BIS_fnc_icons;
	["addIcon", ["VehiclesObstacleCourse", BIS_vehiclesObstacleCourse_welcomeSign, player, 2500, true, "nothing", nil, nil, [_iconVehicle, [1,1,1,0.75], [0,0,0], 1, 1, 0, localize "STR_A3_MP_Bootcamp_Course_VehiclesObstacleCourse", false, 0.040, "PuristaMedium"]]] call BIS_fnc_icons;
	["addIcon", ["GrenadesFiringRange", BIS_grenadesFiringRange_welcomeSign, player, 2500, true, "nothing", nil, nil, [_iconGrenade, [1,1,1,0.75], [0,0,0], 1, 1, 0, localize "STR_A3_MP_Bootcamp_Course_GrenadesFiringRange", false, 0.040, "PuristaMedium"]]] call BIS_fnc_icons;
	["addIcon", ["WeaponsFiringRange", BIS_weaponsFiringRange_welcomeSign, player, 2500, true, "nothing", nil, nil, [_iconWeapon, [1,1,1,0.75], [0,0,0], 1, 1, 0, localize "STR_A3_MP_Bootcamp_Course_WeaponsFiringRange", false, 0.040, "PuristaMedium"]]] call BIS_fnc_icons;
	["addIcon", ["VehiclesFiringRange", BIS_vehiclesFiringRange_welcomeSign, player, 2500, true, "nothing", nil, nil, [_iconVehicleFiring, [1,1,1,0.75], [0,0,0], 1, 1, 0, localize "STR_A3_MP_Bootcamp_Course_VehiclesFiringRange", false, 0.040, "PuristaMedium"]]] call BIS_fnc_icons;
	["addIcon", ["KartsTrack", BIS_karts_welcomeSign, player, 2500, true, "nothing", nil, nil, [_iconVehicle, [1,1,1,0.75], [0,0,0], 1, 1, 0, localize "STR_A3_MP_Bootcamp_Course_Karts", false, 0.040, "PuristaMedium"]]] call BIS_fnc_icons;
	
	// Curator icons
	if (_isInstructor) then {
		[BIS_curator, [_iconRunning, [1,1,1,0.75], position BIS_infantryObstacleCourse_welcomeSign, 1, 1, 0, localize "STR_A3_MP_Bootcamp_Course_InfantryObstacleCourse", false, 0.040, "PuristaMedium"], true, true] call BIS_fnc_addCuratorIcon;
		[BIS_curator, [_iconVehicle, [1,1,1,0.75], position BIS_vehiclesObstacleCourse_welcomeSign, 1, 1, 0, localize "STR_A3_MP_Bootcamp_Course_VehiclesObstacleCourse", false, 0.040, "PuristaMedium"], true, true] call BIS_fnc_addCuratorIcon;
		[BIS_curator, [_iconGrenade, [1,1,1,0.75], position BIS_grenadesFiringRange_welcomeSign, 1, 1, 0, localize "STR_A3_MP_Bootcamp_Course_GrenadesFiringRange", false, 0.040, "PuristaMedium"], true, true] call BIS_fnc_addCuratorIcon;
		[BIS_curator, [_iconWeapon, [1,1,1,0.75], position BIS_weaponsFiringRange_welcomeSign, 1, 1, 0, localize "STR_A3_MP_Bootcamp_Course_WeaponsFiringRange", false, 0.040, "PuristaMedium"], true, true] call BIS_fnc_addCuratorIcon;
		[BIS_curator, [_iconVehicleFiring, [1,1,1,0.75], position BIS_vehiclesFiringRange_welcomeSign, 1, 1, 0, localize "STR_A3_MP_Bootcamp_Course_VehiclesFiringRange", false, 0.040, "PuristaMedium"], true, true] call BIS_fnc_addCuratorIcon;
		[BIS_curator, [_iconVehicle, [1,1,1,0.75], position BIS_karts_welcomeSign, 1, 1, 0, localize "STR_A3_MP_Bootcamp_Course_Karts", false, 0.040, "PuristaMedium"], true, true] call BIS_fnc_addCuratorIcon;
	};
};

// Intro
if (SHOW_INTRO) then {
	[] call BIS_fnc_intro;
	BIS_introFinished = true;
} else {
	BIS_introFinished = true;
};

// Delay
sleep 5;

// Hint about points of interest 3d visualizer
hint parseText format ["%2 <t size=1.0 color='%1'>[T]</t> %3 <t size=1.0 color='#20CC16'>%4</t>", (["GUI", "BCG_RGB"] call BIS_fnc_displayColorGet) call BIS_fnc_colorRGBtoHTML, localize "STR_A3_MP_Bootcamp_Hint_POI_PressAndHold", localize "STR_A3_MP_Bootcamp_Hint_POI_For", localize "STR_A3_MP_Bootcamp_Hint_POI_PointsOfInterest"];

// Delay
sleep 30;

// Hint for Instructor about Zeus interface
if (_isInstructor) then { [["Curator", "Interface"], 30, nil, nil, nil, nil, true] call BIS_fnc_advHint; };
