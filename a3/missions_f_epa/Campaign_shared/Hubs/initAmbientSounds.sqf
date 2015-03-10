scriptName "initAmbientSounds.sqf";

private["_ambientCombat"];

_ambientCombat = ["Hubs",missionName,"ambientCombat"] call BIS_fnc_getCfgDataBool;

if !(_ambientCombat) exitWith {};

private ["_explosions"];

_explosions =
[
	"BattlefieldExplosions1_3D",
	"BattlefieldExplosions2_3D",
	"BattlefieldExplosions5_3D"
];

private ["_fireFights"];

_fireFights =
[
	"BattlefieldFirefight1_3D",
	"BattlefieldFirefight2_3D"
];

{
	[_forEachIndex, _explosions, _fireFights] spawn
	{
		scriptName "initAmbientSounds.sqf: playback loop";

		private ["_index","_explosions", "_fireFights"];

		_index = _this select 0;

		scriptName format ["initAmbientSounds.sqf: random sound playing - [%1]", _index];

		_explosions = _this select 1;
		_fireFights = _this select 2;

		while {true} do
		{
			sleep (1 + random 59);

			private ["_sound"];
			_sound = if (random 1 < 0.5) then
			{
				_explosions call BIS_fnc_selectRandom
			}
			else
			{
				_fireFights call BIS_fnc_selectRandom
			};

			playSound _sound;
		};
	};
}
forEach [0,1,2];