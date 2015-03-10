// Keep screen black
0 fadeSound 0;
titleCut ["", "BLACK FADED", 10e10];

[] spawn {
	waitUntil {time > 0};
	enableEnvironment false;
};

// Post process
"Mediterranean" call BIS_fnc_setPPEffectTemplate;

// Alliances
{
	_x setFriend [EAST, 1];
	EAST setFriend [_x, 1];
} forEach [WEST, RESISTANCE, CIVILIAN];

// Mission variables
BIS_introEnded = false;
BIS_meet = false;
BIS_wave1 = false;
BIS_reinfLanded = false;
BIS_getIn = false;
BIS_inHeli = false;
BIS_CSATReturn = false;
BIS_tracers1 = false;
BIS_tracers2 = false;
BIS_allOut = false;
BIS_sequenceStarted = false;
BIS_drive1_terminate = false;
BIS_drive2_terminate = false;
BIS_truckArrived = false;
BIS_investigating = false;
BIS_musicStopped = false;

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