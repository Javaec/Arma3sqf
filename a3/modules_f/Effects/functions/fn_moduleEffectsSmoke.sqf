/*
	File: fn_moduleEffectsSmoke.sqf
	Author: Borivoj Hlava

	Description:
	Module function. Creates smoke on position of module (called usually by BIS_fnc_moduleEffectsEmitterCreator).

	Parameter(s):
	_this select 0 (Object) - Module logic.
	
	Returned value:
	None.
*/

_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_emitter = (_logic getVariable "effectEmitter") select 0;
_pos = getPos _logic;
_emitter setPos _pos;

//--- variables set by user
_colorRed = _logic getVariable ["ColorRed",0.5];
_colorGreen = _logic getVariable ["ColorGreen",0.5];
_colorBlue = _logic getVariable ["ColorBlue",0.5];
_colorAlpha = _logic getVariable ["ColorAlpha",0.5];
_timeout = _logic getVariable ["Timeout",0];
_particleLifeTime = _logic getVariable ["ParticleLifeTime",50];
_particleDensity = _logic getVariable ["ParticleDensity",10];
_particleSize = _logic getVariable ["ParticleSize",1];
_particleSpeed = _logic getVariable ["ParticleSpeed",1];
_particleLifting = _logic getVariable ["ParticleLifting",1];
_windEffect = _logic getVariable ["WindEffect",1];
_effectSize = _logic getVariable ["EffectSize",1];
_expansion = _logic getVariable ["Expansion",1];

if (_colorRed > 1) then {_colorRed = 1};
if (_colorRed < 0) then {_colorRed = 0};
if (_colorGreen > 1) then {_colorGreen = 1};
if (_colorGreen < 0) then {_colorGreen = 0};
if (_colorBlue > 1) then {_colorBlue = 1};
if (_colorBlue < 0) then {_colorBlue = 0};


//--- particle effect creation
_emitter setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02",8,0,40,1],"","billboard",1,_particleLifeTime,[0,0,0],[0,0,2*_particleSpeed],0,0.05,0.04*_particleLifting,0.05*_windEffect,[1 *_particleSize + 1,1.8 * _particleSize + 15],
		[[0.7*_colorRed,0.7*_colorGreen,0.7*_colorBlue,0.7*_colorAlpha],[0.7*_colorRed,0.7*_colorGreen,0.7*_colorBlue,0.6*_colorAlpha],[0.7*_colorRed,0.7*_colorGreen,0.7*_colorBlue,0.45*_colorAlpha],
		[0.84*_colorRed,0.84*_colorGreen,0.84*_colorBlue,0.28*_colorAlpha],[0.84*_colorRed,0.84*_colorGreen,0.84*_colorBlue,0.16*_colorAlpha],[0.84*_colorRed,0.84*_colorGreen,0.84*_colorBlue,0.09*_colorAlpha],
		[0.84*_colorRed,0.84*_colorGreen,0.84*_colorBlue,0.06*_colorAlpha],[1*_colorRed,1*_colorGreen,1*_colorBlue,0.02*_colorAlpha],[1*_colorRed,1*_colorGreen,1*_colorBlue,0*_colorAlpha]],
		[1,0.55,0.35], 0.1, 0.08*_expansion, "", "", ""];
// ["JmenoModelu"],"NazevAnimace","TypAnimace",RychlostAnimace,DobaZivota,[Pozice],[SilaPohybu],Rotace,Hmotnost,Objem,Rubbing,[Velikost],
// [Barva],[FazeAnimace],PeriodaNahodnehoSmeru,IntensitaNahodnehoSmeru,"OnTimer","PredZnicenim","Objekt";
_emitter setParticleRandom [_particleLifeTime/2, [0.5*_effectSize,0.5*_effectSize,0.2*_effectSize], [0.3,0.3,0.5], 1, 0, [0,0,0,0.06], 0, 0];
						//[lifeTime, position, moveVelocity, rotationVelocity, size, color, randomDirectionPeriod, randomDirectionIntensity] 
_emitter setDropInterval (1/_particleDensity);


//--- timeout
if (_timeout != 0) then {
	[_logic,_timeout] spawn {
		_logic = _this select 0;
		_timeout = _this select 1;
		
		sleep _timeout;
		deleteVehicle ((_logic getVariable "effectEmitter") select 0);
	};
};