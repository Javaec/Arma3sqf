// Keep screen black
0 fadeSound 0;
titleCut ["", "BLACK FADED", 10e10];

[] spawn {
	waitUntil {time > 0};
	enableEnvironment false;
};

// Post process
"Mediterranean" call BIS_fnc_setPPEffectTemplate;

// Disable saving
"BIS_BOOT_m04" call BIS_fnc_disableSaving;

// Show cinema border
[0, 0, false, true] spawn BIS_fnc_cinemaBorder;

// Mission variables
BIS_introEnded = false;
BIS_foundConvoy = false;
BIS_inValley = false;
BIS_overwatch = false;
BIS_moveIn = false;
BIS_musicStopped = false;
BIS_failedROE = false;
BIS_engaged = false;
BIS_atConvoy = false;
BIS_FAKHolder = objNull;
BIS_FAKTaken = false;
BIS_healedEarly = false;
BIS_healed = false;

// Setup the mission
#include "setup\briefing.hpp"
#include "setup\characters.hpp"
#include "setup\comps.hpp"
#include "setup\anims.hpp"
#include "setup\scenes.hpp"


{
	private ["_unit"];
	_unit = _x;
	
	// Prevent from fleeing
	_unit allowFleeing 0;
	
	// Remove NVGs
	{_unit unlinkItem _x} forEach ["NVGoggles", "NVGoggles_OPFOR", "NVGoggles_INDEP"];
	
	// Handle spawned units too
	[
		_unit,
		{
			this allowFleeing 0;
			{this unlinkItem _x} forEach ["NVGoggles", "NVGoggles_OPFOR", "NVGoggles_INDEP"];
		}
	] call BIS_fnc_setSceneInit;
} forEach allUnits;

// Stop player's team from taking damage
{
	_x addEventHandler [
		"HandleDamage",
		{
			private ["_damage", "_source"];
			_damage = _this select 2;
			_source = _this select 3;
			
			if (_source in [vehicle BIS_lacey, BIS_lacey]) then {_damage} else {0};
		}
	];
} forEach [BIS_adams, BIS_team1, BIS_team2];

// Control damage dealt to wounded AAF
BIS_wounded addEventHandler [
	"HandleDamage",
	{
		private ["_damage", "_source"];
		_damage = _this select 2;
		_source = _this select 3;
		
		if (_source in [vehicle BIS_lacey, BIS_lacey]) then {_damage * 0.5} else {0};
	}
];

// Detect when wounded is treated
[] spawn {
	scriptName "missionFlow.fsm: detect wounded healing";
	
	waitUntil {damage BIS_wounded == 0.25};
	BIS_healed = true;
};

// Handle if the wounded is killed
BIS_wounded addEventHandler [
	"Killed",
	{
		private ["_unit"];
		_unit = _this select 0;
		_unit switchMove "Acts_SittingWounded_out";
	}
];

// Control Adams' animations in the heli
BIS_heliAnims = {
	private ["_unit", "_mode"];
	_unit = BIS_adams;
	_mode = _this;
	
	private ["_prefix", "_return"];
	_prefix = "Acts_HeliCargo";
	_return = false;
	
	// Remove any existing eventhandlers
	if (!(isNil {_unit getVariable "BIS_animEH"})) then {
		_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
		_unit setVariable ["BIS_animEH", nil];
	};
	
	switch (toUpper _mode) do {
		case "INIT": {
			// Setup Adams
			{_unit disableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];
			_unit enableMimics false;
			
			// Loop
			_unit switchMove (format ["%1Talking_loop", _prefix]);
		};
		
		case "TALK": {
			BIS_heliAnims_talkStop = false;
			
			// Talk
			_unit playMoveNow (format ["%1Talking_in", _prefix]);
			
			private ["_animEH"];
			_animEH = _unit addEventHandler [
				"AnimDone",
				{
					private ["_unit", "_anim"];
					_unit = _this select 0;
					_anim = _this select 1;
					
					if (!(BIS_heliAnims_talkStop)) then {
						// Loop
						_unit switchMove _anim;
					} else {
						// Remove eventhandler
						_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
						_unit setVariable ["BIS_animEH", nil];
						
						// Return to idle
						_unit switchMove "Acts_HeliCargoTalking_loop";
					};
				}
			];
			
			_unit setVariable ["BIS_animEH", _animEH];
		};
		
		case "POINT": {
			// Point forwards
			_unit switchMove (format ["%1Pointing", _prefix]);
			_return = true;
		};
	};
	
	if (_return) then {
		// Return to idle
		private ["_animEH"];
		_animEH = _unit addEventHandler [
			"AnimDone",
			{
				private ["_unit"];
				_unit = _this select 0;
				
				// Remove eventhandler
				_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
				_unit setVariable ["BIS_animEH", nil];
				
				// Return to the idle
				_unit switchMove "Acts_HeliCargoTalking_loop";
			}
		];
		
		_unit setVariable ["BIS_animEH", _animEH];
	};
};