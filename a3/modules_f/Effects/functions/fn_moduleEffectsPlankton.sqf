/*
	File: fn_moduleEffectsPlankton.sqf
	Author: Borivoj Hlava

	Description:
	Module function.  Creates underwater plankton effect around player (called usually by BIS_fnc_moduleEffectsEmitterCreator).

	Parameter(s):
	_this select 0 (Object) - Module logic.
	
	Returned value:
	None.
*/

_logic = _this;
_player = player;

_emitter = (_logic getVariable "effectEmitter") select 0;
_emitter setParticleClass "PlanktonEffect";
_emitter attachto [player,[0,2,1.3]];

[_logic,_player,_emitter] spawn {
	_logic = _this select 0;
	_player = _this select 1;
	_emitter = _this select 2;
	_vehicle = vehicle player;
	
	while {_player == player} do {
		sleep 2;
		if (_vehicle != (vehicle player)) then {
			_vehicle = vehicle player;
			
			if (player != vehicle player) then {
				_emitter attachto [_vehicle,[0,3,1.3]];
			} else {
				_emitter attachto [player,[0,2,1.3]];
			};
		};
	};
};