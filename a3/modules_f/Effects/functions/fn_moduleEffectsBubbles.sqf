/*
	File: fn_moduleEffectsBubblesCore.sqf
	Author: Borivoj Hlava

	Description:
	Module function. Creates underwater bubble effect on defined place (called usually by BIS_fnc_moduleEffectsEmitterCreator).

	Parameter(s):
	_this select 0 (Object) - Module logic.
	
	Returned value:
	None.
*/

_logic = _this;
_emitterArray = _logic getVariable "effectEmitter";
_emitter = _emitterArray select 0;
_pos = getPos _logic;

if ((_pos select 2 > -0.01) && (surfaceIsWater _pos)) then {
	_logic setPosATL [_pos select 0,_pos select 1, -0.1];
	_pos = getPos _logic;
};
_emitter setPos _pos;

//--- variables set by user
_size = _logic getVariable ["Size",1];
_dropInt = 1/(_logic getVariable ["Density",5]);
_speedX = _logic getVariable ["SpeedX",0];
_speedY = _logic getVariable ["SpeedY",0];
_speedZ = _logic getVariable ["SpeedZ",0.5];
_period = _logic getVariable ["Period",10];
_delay = _logic getVariable ["Delay",1];
_lifeTime = _logic getVariable ["LifeTime",4];


if (_size < 0) then {_size = 0};
if (_dropInt > 1000) then {_dropInt = 1000};
if (_period < 1) then {_period = 1};
if (_delay > _period) then {debugLog "PARTICLE MODULE - WARNING: Bubbles effect delay is too big! Emitter won't create any particles!"};
if (_lifeTime <= 0) then {debugLog "PARTICLE MODULE - WARNING: Bubbles effect life time has negative value! Emitter won't create any particles!"};

_emitter setParticleClass "PointBubbles1";
_emitter setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16,13,7,0], "", "Billboard", 1, 50, [0, 0, 0], [_speedX, _speedY, _speedZ], 0, 1, 1, 15, [0.05 * _size],
			  [[1,1,1,-2]], [1000], 0.12, 0.045, "", "", ""];
	// ["JmenoModelu"],"NazevAnimace","TypAnimace",RychlostAnimace,DobaZivota,[Pozice],[SilaPohybu],Rotace,Hmotnost,Objem,Rubbing,[Velikost],[Barva],
	// [FazeAnimace],PeriodaNahodnehoSmeru,IntensitaNahodnehoSmeru,"OnTimer","PredZnicenim","Objekt";
_emitter setParticleRandom [20, [0,0,0], [0.02,0.02,0], 0, (0.005 * _size), [0,0,0,1], 0, 0];
	// [lifeTime, position, moveVelocity, rotationVelocity, size, color, randomDirectionPeriod, randomDirectionIntensity, {angle}, bounceOnSurface]

//--- particle effect cycle
while {!isNull _logic} do {
	if !(_lifeTime <= 0) then {
		if (_delay < _period) then {	//delay is shorter than period, effect can be started
			sleep _delay;
			_emitter setDropInterval _dropInt;
			
			if ((_period - _delay) > _lifeTime) then {	//effect is terminated by end of the lifetime
				sleep _lifeTime;
				_emitter setDropInterval -1;
				sleep (_period - (_lifeTime + _delay));
			} else {	//delay and lifetime are too long, effect is terminated sooner by end of the period
				sleep (_period - _delay);
				_emitter setDropInterval -1;
			};
			
		} else {	//delay is so big, that effect is not even started
			sleep _period;
		};
	};
};

deleteVehicle _emitter;