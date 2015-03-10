/*
	Author: Thomas Ryan
	
	Description:
	Play distant ambient combat sounds.
	
	Parameters:
		_this (Optional): CODE - Condition which will terminate the sounds when it returns true.
	
	Returns:
	True if successful, false if not.
*/

private ["_condition"];
_condition = [_this, 0, {false}, [{}]] call BIS_fnc_param;

private ["_explosions"];
_explosions = [
	"BattlefieldExplosions1_3D",
	"BattlefieldExplosions2_3D",
	"BattlefieldExplosions5_3D"
];

private ["_fireFights"];
_fireFights = [
	"BattlefieldFirefight1_3D",
	"BattlefieldFirefight2_3D"
];

{
	[_forEachIndex, _condition, _explosions, _fireFights] spawn {
		private ["_index"];
		_index = _this select 0;
		
		scriptName format ["BIS_fnc_camp_ambientCombatSounds: random sound playing - [%1]", _index];
		
		private ["_condition", "_explosions", "_fireFights"];
		_condition = _this select 1;
		_explosions = _this select 2;
		_fireFights = _this select 3;
		
		while {!(call _condition)} do {
			sleep (1 + random 59);
			
			private ["_sound"];
			_sound = if (random 1 < 0.5) then {
				// Explosions
				_explosions call BIS_fnc_selectRandom
			} else {
				// Firefights
				_fireFights call BIS_fnc_selectRandom
			};
			
			// Play ambient sound
			playSound _sound;
		};
	};
} forEach [0,1,2];