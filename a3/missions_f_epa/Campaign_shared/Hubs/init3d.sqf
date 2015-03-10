scriptName "init3d.sqf";

/*--------------------------------------------------------------------------------------------------

	AREA TWEAKS

	1. Adjusts the objects in area = hides unwanted objects or opens doors on buildings.
	2. Disables simulation on the objects.
	3. Hides all helper objects (driven by global toggle).

	Global variables:
	-----------------
	* BIS_DebugMode

--------------------------------------------------------------------------------------------------*/

if (isNil "BIS_DebugMode") then
{
	BIS_DebugMode = false;
};

//--------------------------------------------------------------------------------------------------
// 	SAMPLE POSTPROCESS EFFECT
//
// 	* Will be adjusted later for different weather & daytime conditions.
//--------------------------------------------------------------------------------------------------
//["EastWind"] call BIS_fnc_setPPeffectTemplate;
//Set in fnc_camp_setTimeWeather


//--------------------------------------------------------------------------------------------------
// 	DYNAMIC HIDING / OPENING OBJECTS OR BUILDINGS
//
// 	* params are defined per hub in cfgHubs
//--------------------------------------------------------------------------------------------------
BIS_3d_tweakObject =
{
	//["[!][BIS_3d_tweakObject] _this = %1",_this] call BIS_fnc_logFormat;

	private["_objects","_tweak","_condition","_doorId"];

	_objects   = [_this, 0, [], [[]]] call BIS_fnc_param;
	_tweak 	   = [_this, 1, "OPEN", [""]] call BIS_fnc_param;
	_condition = [_this, 2, "", [""]] call BIS_fnc_param;

	if (count _objects == 0) exitWith {};				//exit if no objects are detected

	if (_condition != "") then
	{
		_condition = compile _condition;

		waitUntil{call _condition};
	};

	switch (_tweak) do
	{
		//open & disable the building doors
		case "OPEN":
		{
			//["[!] OPEN executed on %1.",_objects] call BIS_fnc_logFormat;

			{
				for "_doorId" from 1 to 8 do
				{
					_x setVariable [format["bis_disabled_door_%1",_doorId], 1];
					_x animate [format["door_%1_rot",_doorId], 1];
				};
			}
			forEach _objects;
		};

		//close & disable the building doors
		case "CLOSE":
		{
			{
				for "_doorId" from 1 to 8 do
				{
					_x setVariable [format["bis_disabled_door_%1",_doorId], 1];
					_x animate [format["door_%1_rot",_doorId], 0];
				};
			}
			forEach _objects;
		};

		//delete the building
		case "DELETE":
		{
			{
				for "_doorId" from 1 to 8 do
				{
					hideObject _x;
				};
			}
			forEach _objects;
		};

		//delete the building
		case "DESTROY":
		{
			private["_object","_pos","_radius","_units"];

			{
				_object = _x;

				//delete all soldiers that are nearby
				/*
				_pos = getPos _object;
				_radius = sizeOf typeOf _object;

				_radius = _radius * 0.75;

				_units = _pos nearObjects ["man", _radius];

				{
					deleteVehicle _x;
				}
				forEach _units;
				*/

				//destroy the object
				if !(_object isKindOf "house") then
				{
					_object setDamage 1;
				}
				//or hide the building & spawn ruin
				else
				{
					private["_class","_newBuilding"];

					_class = [typeOf _object,0,-2] call BIS_fnc_trimString;
					_class = format["%1_ruins_F",_class];

					//does the ruin exists?
					if (isClass (configfile >> "CfgVehicles" >> _class)) then
					{
						//hide current building
						_object hideObject true;

						//create ruin
						_newBuilding = createVehicle [_class, getPos _object, [], 0, "CAN_COLLIDE"];
						_newBuilding setPosASL getPosASL _object;
						_newBuilding setDir getDir _object;
					}
					//no ruin, just destroy the building
					else
					{
						_object setDamage 1;
					};
				};
			}
			forEach _objects;
		};

		default
		{
		};
	};
};


private["_cfgData","_phases","_pos","_id","_i","_objects","_tweak","_class","_radius","_probability","_condition"];

for "_i" from 0 to 20 do
{
	if (true) then
	{
		_id  = format["_%1",_i];
		_cfgData = ["Hubs",missionName,"3dTweaks",_id] call BIS_fnc_getCfgData;

		if (isNil "_cfgData") exitWith {};					//exit if no more building data are d efined

		//get the type of the tweak that will be applied to the building
		_phases		= [_cfgData, 0, -1, [123,[]]] call BIS_fnc_param;
		_pos 		= [_cfgData, 1, [50,50,0], [[]]] call BIS_fnc_param;
		_tweak		= [_cfgData, 2, "OPEN", [""]] call BIS_fnc_param;
		_class 		= [_cfgData, 3, "house", [""]] call BIS_fnc_param;
		_radius 	= [_cfgData, 4, 0, [12345]] call BIS_fnc_param;
		_probability	= [_cfgData, 5, 1, [12345]] call BIS_fnc_param;		//probability the tweak will happen
		_condition	= [_cfgData, 6, "", [""]] call BIS_fnc_param;

		if (typeName _phases == typeName 123) then
		{
			if (_phases == -1) then
			{
				_phases = [BIS_PER_phase];
			}
			else
			{
				_phases = [_phases];
			};
		};

		if !(BIS_PER_phase in _phases) exitWith {};

		if (_radius <= 0) then
		{
			_objects = [nearestObject [_pos, _class]] - [objNull];
		}
		else
		{
			_objects = _pos nearObjects [_class, _radius];

			if (count _objects == 0) then
			{
				_objects = [nearestObject [_pos, _class]] - [objNull];
			};
		};

		//apply the probability filter
		{
			if (random(1) > _probability) then
			{
				_objects set [_forEachIndex,objNull];
			};
		}
		forEach _objects; _objects = _objects - [objNull];

		//tweak object
		if (_condition == "") then
		{
			[_objects,_tweak] call BIS_3d_tweakObject;
		}
		else
		{
			[_objects,_tweak,_condition] spawn BIS_3d_tweakObject;
		};
	};
};

//--------------------------------------------------------------------------------------------------
//
// 	SETUP STATIC OBJECTS
//
//--------------------------------------------------------------------------------------------------

//lock all cars
{
	_x lock 3;
}
forEach ((allMissionObjects "Car") + (allMissionObjects "Tank"));

//--------------------------------------------------------------------------------------------------
//
// 	PARTICLE EFFECTS
//
//--------------------------------------------------------------------------------------------------
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
			_intensity	= 200;
			_attenuation	= [0,0,0,4];
		};
		case "FIRE_BIG":
		{
			_fire 	= "BigDestructionFire";
			_smoke 	= "BigDestructionSmoke";

			_brightness	= 1.0;
			//_color	= [1,0.85,0.6];
			//_ambient	= [1,0.45,3];
			_intensity	= 800;
			_attenuation	= [0,0,0,2];
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


//--------------------------------------------------------------------------------------------------
//
// 	AMBIENT LIGHT
//
//--------------------------------------------------------------------------------------------------
private["_stage","_hubCenter","_pos","_light","_brightness","_color","_ambient","_intensity","_attenuation"];

_stage = ["stage"] call BIS_fnc_getCfgData;

if (_stage == "A" || _stage == "B") then
{
	_hubCenter = ["Hubs",missionName,"center"] call BIS_fnc_getCfgData;
	_pos   	   = [_hubCenter select 0,_hubCenter select 1,(_hubCenter select 2)+10];
	_light     = createVehicle ["#lightpoint", _pos, [], 0, "CAN_COLLIDE"];
	_light setPosATL _pos;

	_brightness	= 1.0;
	_color		= [0,0,0];
	_ambient	= [1,0.85,0.6];

	_intensity	= 3.5;
	_attenuation	= [0,0,0,0.001];

	_light setLightBrightness _brightness;
	//_light setLightColor _color;
	_light setLightAmbient _ambient;
	_light setLightIntensity _intensity;
	_light setLightAttenuation _attenuation;
	_light setLightDayLight false;
};