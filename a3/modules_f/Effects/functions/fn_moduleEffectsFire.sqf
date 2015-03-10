/*
	File: fn_moduleEffectsFire.sqf
	Author: Borivoj Hlava

	Description:
	Module function. Creates fire on position of module (called usually by BIS_fnc_moduleEffectsEmitterCreator).

	Parameter(s):
	_this select 0 (Object) - Module logic.
	
	Returned value:
	None.
*/

_logic = _this;
_emitter = (_logic getVariable "effectEmitter") select 0;
_pos = getPos _logic;
_emitter setPos _pos;

//--- variables set by user
_colorRed = _logic getVariable ["ColorRed",0.5];
_colorGreen = _logic getVariable ["ColorGreen",0.5];
_colorBlue = _logic getVariable ["ColorBlue",0.5];
_timeout = _logic getVariable ["Timeout",0];
_particleLifeTime = _logic getVariable ["ParticleLifeTime",2];
_particleDensity = _logic getVariable ["ParticleDensity",20];
_particleSize = _logic getVariable ["ParticleSize",1];
_particleSpeed = _logic getVariable ["ParticleSpeed",1];
_effectSize = _logic getVariable ["EffectSize",1];
_orientation = _logic getVariable ["ParticleOrientation",5.4];
_damage = _logic getVariable ["FireDamage",1];

if (_colorRed > 1) then {_colorRed = 1};
if (_colorRed < 0) then {_colorRed = 0};
if (_colorGreen > 1) then {_colorGreen = 1};
if (_colorGreen < 0) then {_colorGreen = 0};
if (_colorBlue > 1) then {_colorBlue = 1};
if (_colorBlue < 0) then {_colorBlue = 0};


//--- particle effect creation
_emitter setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16,10,32],"","billboard",1,_particleLifeTime,[0,0,0],[0,0,0.4*_particleSpeed],0,0.0565,0.05,0.03,[0.9*_particleSize,0],
						[[1*_colorRed,1*_colorGreen,1*_colorBlue,-0],[1*_colorRed,1*_colorGreen,1*_colorBlue,-1],[1*_colorRed,1*_colorGreen,1*_colorBlue,-1],[1*_colorRed,1*_colorGreen,1*_colorBlue,-1],[1*_colorRed,1*_colorGreen,1*_colorBlue,-1],[1*_colorRed,1*_colorGreen,1*_colorBlue,0]],
						[1], 0.01, 0.02, "", "", "",_orientation,false,-1,[[3,3,3,0]]];
// ["JmenoModelu"],"NazevAnimace","TypAnimace",RychlostAnimace,DobaZivota,[Pozice],[SilaPohybu],Rotace,Hmotnost,Objem,Rubbing,[Velikost],
// [Barva],[FazeAnimace],PeriodaNahodnehoSmeru,IntensitaNahodnehoSmeru,"OnTimer","PredZnicenim","Objekt";
_emitter setParticleRandom [_particleLifeTime/4, [0.15*_effectSize,0.15*_effectSize,0], [0.2,0.2,0], 0.4, 0, [0,0,0,0], 0, 0, 0.2];
						//[lifeTime, position, moveVelocity, rotationVelocity, size, color, randomDirectionPeriod, randomDirectionIntensity] 
if (_damage > 0) then {_emitter setParticleFire [0.6*_damage, 0.25*_damage, 0.1];};
_emitter setDropInterval (1/_particleDensity);

//--- light
_lightSize = (_particleSize + _effectSize)/2;

_light = createVehicle ["#lightpoint", (getPos _emitter), [], 0, "CAN_COLLIDE"];
_light setPos [_pos select 0,_pos select 1,(_pos select 2) + 0.5];
_light setLightBrightness 1.0;
_light setLightColor [1,0.65,0.4];
_light setLightAmbient [0.15,0.05,0];
_light setLightIntensity (50 + 400*_lightSize);
_light setLightAttenuation [0,0,0,1];
_light setLightDayLight false;

_logic setVariable ["effectLight",[_light],true];

//--- timeout
if (_timeout != 0) then {
	[_logic,_timeout] spawn {
		_logic = _this select 0;
		_timeout = _this select 1;
		
		sleep _timeout;
		deleteVehicle ((_logic getVariable "effectEmitter") select 0);
		deleteVehicle ((_logic getVariable "effectLight") select 0);
	};
};