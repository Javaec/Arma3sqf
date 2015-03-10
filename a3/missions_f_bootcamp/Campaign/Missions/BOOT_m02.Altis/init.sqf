// Keep screen black
0 fadeSound 0;
titleCut ["", "BLACK FADED", 10e10];

[] spawn {
	waitUntil {time > 0};
	enableEnvironment false;
	showHUD false;
};

// Post process
//"EastWind" call BIS_fnc_setPPEffectTemplate;

// Disable saving
"BIS_BOOT_m02" call BIS_fnc_disableSaving;

// Show cinema border
[0, 0, false, true] spawn BIS_fnc_cinemaBorder;

// Alliances
{
	_x setFriend [EAST, 1];
	EAST setFriend [_x, 1];
} forEach [WEST, RESISTANCE, CIVILIAN];

// Mission variables
BIS_cutsceneEnded = false;
BIS_introEnded = false;
BIS_targetAssembled = false;
BIS_targets_short = [BIS_target_short1, BIS_target_short2, BIS_target_short3, BIS_target_short4, BIS_target_short5];
BIS_targets_long = [BIS_target_long1, BIS_target_long2, BIS_target_long3];
BIS_targets = BIS_targets_short + BIS_targets_long;
BIS_walkOver = false;
BIS_firstSetDone = false;
BIS_secondSetDone = false;
BIS_firedStance = "";
BIS_inventoryOpened = false;
BIS_crateOpen = false;
BIS_holdBreath = false;
BIS_fatigueFired = false;
BIS_compassHeld = false;
BIS_compassToggled = false;

// Set up the mission
#include "setup\briefing.hpp"
#include "setup\characters.hpp"
#include "setup\anims.hpp"

// Control laptop status
BIS_laptopStatus = {
	private ["_laptop", "_status"];
	_laptop = BIS_laptop;
	_status = _this;
	
	private ["_path"];
	_path = "A3\Missions_F_Bootcamp\data\img\laptop\Electronics_screens_laptop_target%1_CO.paa";
	
	switch (toUpper _status) do {
		case "DEACTIVATED": {
			// Deactivated
			_laptop setObjectTexture [0, format [_path, "deactivated"]];
		};
		
		case "ERROR": {
			// Error
			_laptop setObjectTexture [0, format [_path, "error"]];
		};
		
		case "ACTIVATED": {
			// Activated
			_laptop setObjectTexture [0, format [_path, "activated"]];
		};
	};
};

// Setup laptop
"DEACTIVATED" call BIS_laptopStatus;

// Fold down targets
{_x animate ["Terc", 1]} forEach BIS_targets;

// Control folding of targets
BIS_controlTarget = {
	private ["_target"];
	_target = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	
	private ["_hitEH"];
	_hitEH = _target addEventHandler [
		"HitPart",
		{
			private ["_target"];
			_target = (_this select 0) select 0;
			
			// Remove eventhandler
			_target removeEventHandler ["HitPart", _target getVariable "BIS_hitEH"];
			_target setVariable ["BIS_hitEH", nil];
			
			// Fold down
			_target animate ["Terc", 1];
			_target say3D "FD_Target_PopDown_Large_F";
		}
	];
	
	_target setVariable ["BIS_hitEH", _hitEH];
};

// Detect when the player accesses the inventory
BIS_lacey addEventHandler [
	"InventoryOpened",
	{
		private ["_unit", "_container"];
		_unit = _this select 0;
		_container = _this select 1;
		
		if (typeOf _container != "GroundWeaponHolder") then {
			// Player has opened the inventory of an object
			BIS_inventoryOpened = true;
			
			// Detect if the player has the crate inventory open
			if (_container == BIS_crate) then {
				[] spawn {
					scriptName "init.sqf: crate open control";
					
					private ["_invIDD"];
					_invIDD = 602;
					
					waitUntil {!(isNull (findDisplay _invIDD))};
					BIS_crateOpen = true;
					waitUntil {isNull (findDisplay _invIDD)};
					BIS_crateOpen = false;
				};
			};
		};
	}
];

// Control Adams' animations
BIS_instructorAnims = {
	private ["_unit", "_mode"];
	_unit = BIS_adams;
	_mode = _this;
	
	private ["_prefix", "_return"];
	_prefix = "Acts_Kore";
	_return = true;
	
	switch (toUpper _mode) do {
		case "INIT": {
			// Setup Adams
			_unit doWatch objNull;
			removeAllWeapons _unit;
			_unit setBehaviour "CARELESS";
			{_unit disableAI _x} forEach ["ANIM", "AUTOTARGET", "MOVE", "TARGET"];
			_unit enableMimics false;
			
			// Loop
			_unit switchMove (format ["%1_IdleNoWeapon_loop", _prefix]);
			_return = false;
		};
		
		case "INTRO": {
			// Introduce
			_unit playMoveNow (format ["%1_Introducing", _prefix]);
		};
		
		case "POINT": {
			// Point forwards
			_unit playMoveNow (format ["%1_PointingForward", _prefix]);
		};
		
		case "RADIO": {
			// Talk on the radio
			_unit playMoveNow (format ["%1_TalkingOverRadio_in", _prefix]);
			_return = false;
			
			// Loop
			private ["_animEH"];
			_animEH = _unit addEventHandler [
				"AnimDone",
				{
					private ["_unit"];
					_unit = _this select 0;
					
					// Remove eventhandler
					_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
					_unit setVariable ["BIS_animEH", nil];
					
					// Play loop
					_unit switchMove "Acts_Kore_TalkingOverRadio_loop";
				}
			];
			
			_unit setVariable ["BIS_animEH", _animEH];
		};
	};
	
	if (_return) then {
		// Return to the idle
		private ["_animEH"];
		_animEH = _unit addEventHandler [
			"AnimDone",
			{
				private ["_unit"];
				_unit = _this select 0;
				
				// Remove eventhandler
				_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
				_unit setVariable ["BIS_animEH", nil];
				
				// Play idle
				_unit switchMove "Acts_Kore_IdleNoWeapon_loop";
			}
		];
		
		_unit setVariable ["BIS_animEH", _animEH];
	};
};