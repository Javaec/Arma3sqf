/*--------------------------------------------------------------------------------------------------

	PARTICLE EFFECTS

--------------------------------------------------------------------------------------------------*/

if (isNil "BIS_DebugMode") then
{
	BIS_DebugMode = false;
};

[] spawn
{
	sleep 0.01;

	private["_fn_createEffect"];

	_fn_createEffect =
	{
		private["_effect","_pos","_fire","_smoke"];
		private["_light","_brightness","_color","_ambient","_intensity","_attenuation"];

		//["[PARTICLE EFFECT CREATED]: %1",_this] call BIS_fnc_logFormat;

		_pos 	= _this select 0;
		_effect = _this select 1;

		_fire	= "";
		_smoke	= "";
		_light	= objNull;

		/*
		_color		= [1,0.85,0.6];
		_ambient	= [1,0.45,3];
		*/

		_color		= [1,0.85,0.6];
		_ambient	= [1,0.3,0];


		switch (_effect) do
		{
			case "FIRE_SMALL":
			{
				_fire 	= "SmallDestructionFire";
				_smoke 	= "SmallDestructionSmoke";
			};
			case "FIRE_MEDIUM":
			{
				_fire 	= "MediumDestructionFire";
				_smoke 	= "MediumDestructionSmoke";

				_brightness	= 1.0;
				//_color	= [1,0.85,0.6];
				//_ambient	= [1,0.3,0];
				_intensity	= 400;
				_attenuation	= [0,0,0,2];
			};
			case "FIRE_BIG":
			{
				_fire 	= "BigDestructionFire";
				_smoke 	= "BigDestructionSmoke";

				_brightness	= 1.0;
				//_color	= [1,0.85,0.6];
				//_ambient	= [1,0.45,3];
				_intensity	= 1600;
				_attenuation	= [0,0,0,1.6];
			};
			case "SMOKE_SMALL":
			{
				_smoke 	= "SmallDestructionSmoke";
			};
			case "SMOKE_MEDIUM":
			{
				_smoke 	= "MediumSmoke";
			};
			case "SMOKE_BIG":
			{
				_smoke 	= "BigDestructionSmoke";
			};
		};

		if (_fire != "") then
		{
			_eFire = "#particlesource" createVehicleLocal _pos;
			_eFire setParticleClass _fire;
			_eFire setPosATL _pos;
		};

		if (_smoke != "") then
		{
			_eSmoke = "#particlesource" createVehicleLocal _pos;
			_eSmoke setParticleClass _smoke;
			_eSmoke setPosATL _pos;
		};

		//create lightsource
		if (_effect in ["FIRE_BIG","FIRE_MEDIUM"]) then
		{
			_pos   = [_pos select 0,_pos select 1,(_pos select 2)+1];
			_light = createVehicle ["#lightpoint", _pos, [], 0, "CAN_COLLIDE"];
			_light setPosATL _pos;

			_light setLightBrightness _brightness;
			_light setLightColor _color;
			_light setLightAmbient _ambient;
			_light setLightIntensity _intensity;
			_light setLightAttenuation _attenuation;
			_light setLightDayLight false;
		};
	};

	#define FIRE_SMALL	"Sign_Pointer_Yellow_F"
	#define FIRE_MEDIUM     "Sign_Arrow_Large_Cyan_F"
	#define FIRE_BIG        "Sign_Arrow_Large_Pink_F"
	#define SMOKE_SMALL     "Sign_Pointer_Green_F"
	#define SMOKE_MEDIUM    "Sign_Pointer_Blue_F"
	#define SMOKE_BIG	"Sign_Arrow_Large_Blue_F"

	private["_helperClass","_effectType"];

	{
		_helperClass 	= _x select 0;
		_effectType 	= _x select 1;

		{
			[getPosATL _x,_effectType] call _fn_createEffect;
		}
		forEach (allMissionObjects _helperClass);
	}
	forEach
	[
		[FIRE_SMALL,"FIRE_SMALL"],
		[FIRE_MEDIUM,"FIRE_MEDIUM"],
		[FIRE_BIG,"FIRE_BIG"],
		[SMOKE_SMALL,"SMOKE_SMALL"],
		[SMOKE_MEDIUM,"SMOKE_MEDIUM"],
		[SMOKE_BIG,"SMOKE_BIG"]
	];
};

