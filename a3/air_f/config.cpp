////////////////////////////////////////////////////////////////////
//DeRap: Produced from mikero's Dos Tools Dll version 4.97
//Tue Mar 10 00:06:16 2015 : Source 'file' date Tue Mar 10 00:06:16 2015
//http://dev-heaven.net/projects/list_files/mikero-pbodll
////////////////////////////////////////////////////////////////////

#define _ARMA_

//ndefs=13
enum {
	destructengine = 2,
	destructdefault = 6,
	destructwreck = 7,
	destructtree = 3,
	destructtent = 4,
	stabilizedinaxisx = 1,
	stabilizedinaxesxyz = 4,
	stabilizedinaxisy = 2,
	stabilizedinaxesboth = 3,
	destructno = 0,
	stabilizedinaxesnone = 0,
	destructman = 5,
	destructbuilding = 1
};

//Class air_f : config.bin{
class DefaultEventhandlers;
class CfgPatches
{
	class A3_Air_F
	{
		units[] = {"NonSteerable_Parachute_F","Steerable_Parachute_F"};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Characters_F","A3_Weapons_F","A3_Anims_F","A3_Anims_F_COnfig_Sdr"};
	};
};
class AirplaneHUD
{
	borderLeft = 0.09;
	borderRight = 0.02;
	borderTop = 0.02;
	borderBottom = 0.1;
	helmetMountedDisplay = 1;
	helmetPosition[] = {-0.025,0.025,0.1};
	helmetRight[] = {0.05,0.0,0.0};
	helmetDown[] = {-0.0,-0.05,0.0};
	class Pos10Vector;
	class bones
	{
		class AGLMove1;
		class AGLMove2;
		class ASLMove1;
		class ASLMove2;
		class VertSpeed;
		class SpdMove2;
		class ILS;
		class WeaponAim;
		class Target;
		class TargetDistanceMissile;
		class TargetDistanceMGun;
		class Level0;
		class LevelP5;
		class LevelM5;
		class LevelP10;
		class LevelM10;
		class LevelP15;
		class LevelM15;
		class Velocity;
		class PlaneW;
	};
	class Draw
	{
		class Altitude;
		class DimmedBase
		{
			class AltitudeBase;
		};
		class Speed;
		class SpeedNumber;
		class PlaneW
		{
			class LineHL;
			class Velocity;
		};
		class MGun
		{
			class Circle;
		};
		class Missile
		{
			class Circle;
			class Target;
		};
		class Horizont
		{
			class Dimmed
			{
				class Level0;
			};
			class LevelP5;
			class LevelM5;
			class LevelP10;
			class LevelM10;
			class LevelP15;
			class LevelM15;
		};
		class ILS
		{
			class Glideslope
			{
				class ILS;
			};
			class AOABracket;
		};
	};
};
class CfgVehicles
{
	class AllVehicles;
	class Air: AllVehicles
	{
		mapSize = 10.56;
		author = "$STR_A3_Bohemia_Interactive";
		_generalMacro = "Air";
		waterLeakiness = 100;
		maxFordingDepth = 0.001;
		waterResistance = 1;
		impactEffectsSea = "ImpactEffectsAir";
		class NewTurret;
		class ViewPilot;
		accuracy = 0;
		flareVelocity = 100;
		class AnimationSources
		{
			class CollisionLightRed_source
			{
				source = "MarkerLight";
				markerLight = "CollisionRed";
			};
			class CollisionLightWhite_source
			{
				source = "MarkerLight";
				markerLight = "CollisionWhite";
			};
		};
		memoryPointCM[] = {"flare_launcher1","flare_launcher2"};
		memoryPointCMDir[] = {"flare_launcher1_dir","flare_launcher2_dir"};
		class MarkerLights
		{
			class PositionRed
			{
				color[] = {0.8,0.0,0.0};
				ambient[] = {0.08,0.0,0.0};
				intensity = 75;
				name = "PositionLight_red_1_pos";
				drawLight = 1;
				drawLightSize = 0.15;
				drawLightCenterSize = 0.04;
				activeLight = 0;
				blinking = 0;
				dayLight = 0;
				useFlare = 0;
				class Attenuation
				{
					start = 0;
					constant = 0;
					linear = 25;
					quadratic = 50;
					hardLimitStart = 0.75;
					hardLimitEnd = 1;
				};
			};
			class PositionGreen: PositionRed
			{
				color[] = {0.0,0.8,0.0};
				ambient[] = {0.0,0.08,0.0};
				name = "PositionLight_green_1_pos";
			};
			class PositionWhite: PositionRed
			{
				color[] = {1.0,1.0,1.0};
				ambient[] = {0.1,0.1,0.1};
				name = "PositionLight_white_1_pos";
				drawLightSize = 0.2;
			};
			class CollisionRed: PositionRed
			{
				color[] = {0.9,0.15,0.1};
				ambient[] = {0.09,0.015,0.01};
				name = "CollisionLight_red_1_pos";
				blinking = 1;
				blinkingPattern[] = {0.2,1.3};
				blinkingPatternGuarantee = 0;
				drawLightSize = 0.25;
				drawLightCenterSize = 0.08;
			};
			class CollisionWhite: PositionRed
			{
				color[] = {1.0,1.0,1.0};
				ambient[] = {0.1,0.1,0.1};
				name = "CollisionLight_white_1_pos";
				blinking = 1;
				blinkingPattern[] = {0.1,0.9};
				blinkingPatternGuarantee = 0;
				drawLightSize = 0.2;
				drawLightCenterSize = 0.04;
			};
		};
		radarType = 4;
		class TransportItems
		{
			class _xx_FirstAidKit
			{
				name = "FirstAidKit";
				count = 4;
			};
		};
		class Exhausts
		{
			class Exhaust1
			{
				position = "exhaust1";
				direction = "exhaust1_dir";
				effect = "ExhaustsEffectPlane";
			};
			class Exhaust2
			{
				position = "exhaust2";
				direction = "exhaust2_dir";
				effect = "ExhaustsEffectPlane";
			};
		};
		class camShakeGForce
		{
			power = 1;
			frequency = 20;
			distance = 0;
			minSpeed = 1;
		};
		class camShakeDamage
		{
			power = 0.5;
			frequency = 60;
			distance = -1;
			minSpeed = 1;
			attenuation = 0.5;
			duration = 3;
		};
		minGForce = 0.2;
		maxGForce = 2;
		gForceShakeAttenuation = 0.5;
		secondaryExplosion = -1;
		fuelExplosionPower = 1;
	};
	class Helicopter: Air
	{
		class SpeechVariants
		{
			class Default
			{
				speechSingular[] = {"veh_air_helicopter_s"};
				speechPlural[] = {"veh_air_helicopter_p"};
			};
		};
		textSingular = "$STR_A3_nameSound_veh_air_helicopter_s";
		textPlural = "$STR_A3_nameSound_veh_air_helicopter_p";
		nameSound = "veh_air_helicopter_s";
		author = "$STR_A3_Bohemia_Interactive";
		_generalMacro = "Helicopter";
		accuracy = 0.02;
		camouflage = 100;
		audible = 30;
		epeImpulseDamageCoef = 50;
		crewCrashProtection = 0.5;
		getInAction = "GetInLow";
		getOutAction = "GetOutLow";
		cargoGetInAction[] = {"GetInLow"};
		cargoGetOutAction[] = {"GetOutLow"};
		driverCanEject = 0;
		damageEffect = "AirDestructionEffects";
		type = 2;
		weapons[] = {};
		magazines[] = {};
		transportMaxBackpacks = 1;
		supplyRadius = 1.2;
		dammageHalf[] = {};
		dammageFull[] = {};
		crewVulnerable = 1;
		armorStructural = 4;
		class DestructionEffects{};
		class HitPoints
		{
			class HitHull
			{
				armor = 1;
				material = 51;
				name = "NEtrup";
				visual = "trup";
				passThrough = 1;
			};
			class HitEngine
			{
				armor = 0.25;
				material = 51;
				name = "motor";
				visual = "motor";
				passThrough = 1;
			};
			class HitEngine1: HitEngine
			{
				name = "engine_1_hit";
				convexComponent = "engine_1_hit";
			};
			class HitEngine2: HitEngine
			{
				name = "engine_2_hit";
				convexComponent = "engine_2_hit";
			};
			class HitEngine3: HitEngine
			{
				name = "engine_3_hit";
				convexComponent = "engine_3_hit";
			};
			class HitAvionics
			{
				armor = 0.15;
				material = 51;
				name = "elektronika";
				visual = "elektronika";
				passThrough = 1;
			};
			class HitVRotor
			{
				armor = 0.3;
				material = 51;
				name = "mala vrtule";
				visual = "mala vrtule staticka";
				passThrough = 0.3;
			};
			class HitHRotor
			{
				armor = 0.2;
				material = 51;
				name = "velka vrtule";
				visual = "velka vrtule staticka";
				passThrough = 0.1;
			};
			class HitMissiles
			{
				armor = 0.1;
				material = 51;
				name = "munice";
				visual = "munice";
				passThrough = 0.5;
			};
			class HitRGlass
			{
				armor = 0.1;
				material = 51;
				name = "sklo predni P";
				visual = "sklo predni P";
				passThrough = 0;
			};
			class HitLGlass
			{
				armor = 0.1;
				material = 51;
				name = "sklo predni L";
				visual = "sklo predni L";
				passThrough = 0;
			};
			class HitWinch
			{
				armor = 0.1;
				material = 51;
				name = "slingLoad0";
				visual = "";
				passThrough = 0;
				radius = 0.1;
				class DestructionEffects
				{
					ammoExplosionEffect = "";
					class Explo
					{
						simulation = "particles";
						type = "WinchDestructionExplo";
						position = "slingLoad0";
						intensity = 1;
						interval = 1;
						lifeTime = 0.06;
					};
					class Sparks
					{
						simulation = "particles";
						type = "WinchDestructionSparks";
						position = "slingLoad0";
						intensity = 1;
						interval = 1;
						lifeTime = 0.1;
					};
				};
			};
			class HitTransmission
			{
				armor = 0.8;
				material = -1;
				name = "transmission";
				passThrough = 0.8;
			};
			class HitGlass1
			{
				armor = 2;
				material = -1;
				name = "glass1";
				convexComponent = "glass1";
				visual = "glass1";
				passThrough = 0;
			};
			class HitGlass2: HitGlass1
			{
				name = "glass2";
				convexComponent = "glass2";
				visual = "glass2";
			};
			class HitGlass3: HitGlass1
			{
				name = "glass3";
				convexComponent = "glass3";
				visual = "glass3";
			};
			class HitGlass4: HitGlass1
			{
				name = "glass4";
				convexComponent = "glass4";
				visual = "glass4";
			};
			class HitGlass5: HitGlass1
			{
				name = "glass5";
				convexComponent = "glass5";
				visual = "glass5";
			};
			class HitGlass6: HitGlass1
			{
				name = "glass6";
				convexComponent = "glass6";
				visual = "glass6";
			};
			class HitLight
			{
				armor = 0.1;
				material = -1;
				name = "light";
				passThrough = 0;
			};
			class HitHydraulics
			{
				armor = 0.8;
				material = -1;
				name = "hydraulics";
				passThrough = 0.8;
			};
			class HitGear
			{
				armor = 0.9;
				material = -1;
				name = "gear";
				passThrough = 0;
			};
			class HitFuel
			{
				armor = 0.4;
				material = -1;
				name = "fuel tanks";
				passThrough = 0.5;
			};
			class HitHStabilizerL1
			{
				armor = 0.8;
				material = -1;
				name = "HStabilizerL1";
				passThrough = 1;
			};
			class HitHStabilizerR1
			{
				armor = 0.8;
				material = -1;
				name = "HStabilizerR1";
				passThrough = 0;
			};
			class HitVStabilizer1
			{
				armor = 0.8;
				material = -1;
				name = "VStabilizer1";
				passThrough = 1;
			};
			class HitTail
			{
				armor = 0.8;
				material = -1;
				name = "tail boom";
				passThrough = 1;
			};
			class HitPitotTube
			{
				armor = 0.5;
				material = -1;
				name = "pitot tube";
				passThrough = 0.2;
			};
			class HitStaticPort
			{
				armor = 0.1;
				material = -1;
				name = "static port";
				passThrough = 1;
			};
			class HitStarter1
			{
				armor = 0.1;
				material = -1;
				name = "starter1";
				passThrough = 0;
			};
			class HitStarter2
			{
				armor = 0.1;
				material = -1;
				name = "starter2";
				passThrough = 0;
			};
			class HitStarter3
			{
				armor = 0.1;
				material = -1;
				name = "starter3";
				passThrough = 0;
			};
		};
		class AnimationSources: AnimationSources
		{
			class HitGlass1
			{
				source = "Hit";
				hitpoint = "HitGlass1";
				raw = 1;
			};
			class HitGlass2: HitGlass1
			{
				hitpoint = "HitGlass2";
			};
			class HitGlass3: HitGlass1
			{
				hitpoint = "HitGlass3";
			};
			class HitGlass4: HitGlass1
			{
				hitpoint = "HitGlass4";
			};
			class HitGlass5: HitGlass1
			{
				hitpoint = "HitGlass5";
			};
			class HitGlass6: HitGlass1
			{
				hitpoint = "HitGlass6";
			};
			class HitEngine1
			{
				source = "hit";
				hitpoint = "HitEngine1";
				raw = 1;
			};
			class HitEngine2
			{
				source = "hit";
				hitpoint = "HitEngine2";
				raw = 1;
			};
			class HitWinch_Source
			{
				source = "hit";
				hitpoint = "HitWinch";
				raw = 1;
			};
		};
		class ViewPilot: ViewPilot
		{
			initFov = 1;
			minFov = 0.3;
			maxFov = 1.2;
			initAngleX = 0;
			minAngleX = -65;
			maxAngleX = 85;
			initAngleY = 0;
			minAngleY = -150;
			maxAngleY = 150;
			minMoveX = -0.3;
			maxMoveX = 0.3;
			minMoveY = -0.025;
			maxMoveY = 0.05;
			minMoveZ = -0.2;
			maxMoveZ = 0.2;
		};
		class Turrets
		{
			class MainTurret: NewTurret
			{
				startEngine = 0;
				outGunnerMayFire = 1;
				commanding = -1;
				memoryPointsGetInGunner = "pos gunner";
				memoryPointsGetInGunnerDir = "pos gunner dir";
				gunnerGetInAction = "GetInLow";
				gunnerGetOutAction = "GetOutLow";
				memoryPointGun = "machinegun";
				memoryPointGunnerOptics = "gunnerview";
				selectionFireAnim = "zasleh";
				castGunnerShadow = 1;
				viewGunnerShadow = 1;
				gunnerAction = "AH1Z_Gunner";
				gunnerInAction = "AH1Z_Gunner";
				gunnerOpticsModel = "\A3\Weapons_F\empty.p3d";
				gunnerForceOptics = 0;
				enableManualFire = 0;
				canEject = 0;
				class HitPoints
				{
					class HitTurret
					{
						armor = 0.2;
						material = 51;
						name = "vez";
						visual = "vez";
						passThrough = 0.3;
					};
					class HitGun
					{
						armor = 0.2;
						material = 51;
						name = "zbran";
						visual = "zbran";
						passThrough = 0.1;
					};
				};
				class ViewGunner;
			};
		};
		LockDetectionSystem = 8;
		incomingMissileDetectionSystem = 16;
		class Eventhandlers: DefaultEventhandlers{};
		mainBladeCenter = "rotor_center";
		tailBladeCenter = "rotor_02_center";
		tailBladeRadius = 0.5;
		tailBladeVertical = 1;
	};
	class Helicopter_Base_F: Helicopter
	{
		author = "$STR_A3_Bohemia_Interactive";
		_generalMacro = "Helicopter_Base_F";
		side = 3;
		faction = "CIV_F";
		crew = "C_man_pilot_F";
		simulation = "helicopterrtd";
		unitInfoTypeRTD = "RscUnitInfoAirRTDFull";
		unitInfoTypeLite = "RscUnitInfoAirRTDBasic";
		unitInfoType = "RscUnitInfoAir";
		washDownStrength = "1.0f";
		washDownDiameter = "40.0f";
		minSmokeDamage = 0.3;
		maxSmokeDamage = 0.99;
		selectionHRotorStill = "main rotor static";
		selectionHRotorMove = "main rotor blur";
		selectionVRotorStill = "tail rotor static";
		selectionVRotorMove = "tail rotor blur";
		driverLeftHandAnimName = "lever_pilot";
		driverRightHandAnimName = "stick_pilot";
		driverLeftLegAnimName = "pedalL";
		driverRightLegAnimName = "pedalR";
		destrType = "DestructWreck";
		class HitPoints: HitPoints
		{
			class HitHull: HitHull
			{
				name = "hull_hit";
				convexComponent = "hull_hit";
			};
			class HitEngine: HitEngine
			{
				name = "engine_hit";
				convexComponent = "engine_hit";
			};
			class HitEngine1: HitEngine
			{
				name = "engine_1_hit";
				convexComponent = "engine_1_hit";
			};
			class HitEngine2: HitEngine
			{
				name = "engine_2_hit";
				convexComponent = "engine_2_hit";
			};
			class HitAvionics: HitAvionics
			{
				name = "avionics_hit";
				convexComponent = "avionics_hit";
			};
			class HitMissiles: HitMissiles
			{
				name = "ammo_hit";
				convexComponent = "ammo_hit";
			};
			class HitFuel: HitHull
			{
				name = "fuel_hit";
				convexComponent = "fuel_hit";
				visual = "zbytek";
			};
			class HitHRotor: HitHRotor
			{
				name = "main_rotor_hit";
				convexComponent = "main_rotor_hit";
				visual = "main rotor static";
			};
			class HitVRotor: HitVRotor
			{
				name = "tail_rotor_hit";
				convexComponent = "tail_rotor_hit";
				visual = "tail rotor static";
			};
		};
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				gunnerOpticsModel = "";
			};
		};
		class CamShake
		{
			power = 30;
			frequency = 20;
			distance = 50;
			minSpeed = 50;
		};
		camShakeCoef = 0.0;
		class Eventhandlers: Eventhandlers
		{
			fired = "";
		};
		class RotorLibHelicopterProperties;
		class Reflectors
		{
			class Right
			{
				color[] = {7000,7500,10000};
				ambient[] = {70,75,100};
				intensity = 50;
				size = 1;
				innerAngle = 5;
				outerAngle = 75;
				coneFadeCoef = 10;
				position = "Light_R";
				direction = "Light_R_end";
				hitpoint = "Light_R";
				selection = "Light_R";
				useFlare = 1;
				dayLight = 0;
				FlareSize = 4;
				class Attenuation
				{
					start = 0;
					constant = 0;
					linear = 1;
					quadratic = 0;
					hardLimitStart = 200;
					hardLimitEnd = 250;
				};
			};
		};
	};
	class Helicopter_Base_H: Helicopter_Base_F
	{
		author = "$STR_A3_Bohemia_Interactive";
		_generalMacro = "Helicopter_Base_H";
		commanderCanSee = "1 + 2 + 4 + 8 + 16";
		gunnerCanSee = "1 + 2 + 4 + 8 + 16";
		driverCanSee = "1 + 2 + 4 + 8 + 16";
		class PilotSpec
		{
			showHeadPhones = 1;
		};
		class CargoSpec
		{
			class Cargo1
			{
				showHeadPhones = 1;
			};
		};
		class AnimationSources: AnimationSources
		{
			class AddCargoHook
			{
				source = "user";
				animPeriod = 1e-007;
				initPhase = 0;
				isComponent = 1;
			};
			class AddCargoHook_COver
			{
				source = "user";
				animPeriod = 1e-007;
				initPhase = 1;
				isComponent = 1;
			};
			class HitHRotor
			{
				source = "hit";
				hitpoint = "HitHRotor";
				raw = 1;
			};
			class HitVRotor
			{
				source = "hit";
				hitpoint = "HitVRotor";
				raw = 1;
			};
			class HitEngine
			{
				source = "hit";
				hitpoint = "HitEngine";
				raw = 1;
			};
			class HitEngine2
			{
				source = "hit";
				hitpoint = "HitEngine2";
				raw = 1;
			};
			class HitBatteries
			{
				source = "hit";
				hitpoint = "HitBatteries";
				raw = 1;
			};
			class HitTransmission
			{
				source = "hit";
				hitpoint = "HitTransmission";
				raw = 1;
			};
			class HitHydraulics
			{
				source = "hit";
				hitpoint = "HitHydraulics";
				raw = 1;
			};
			class HitFuel
			{
				source = "hit";
				hitpoint = "HitFuel";
				raw = 1;
			};
		};
		class Turrets: Turrets
		{
			class CopilotTurret: MainTurret
			{
				isCopilot = 1;
				primaryGunner = 0;
				canEject = 0;
				body = "";
				gun = "";
				animationSourceBody = "";
				animationSourceGun = "";
				weapons[] = {};
				magazines[] = {};
				gunnerAction = "Heli_Medium_Gunner_H";
				gunnerInAction = "Heli_Medium_Gunner_H";
				gunnerName = "$STR_A3_COPILOT";
				gunnerNotSpawned = 1;
				memoryPointsGetInGunner = "pos codriver";
				memoryPointsGetInGunnerDir = "pos codriver dir";
				minElev = -50;
				maxElev = 30;
				initElev = 11;
				minTurn = -170;
				maxTurn = 170;
				initTurn = 0;
				maxHorizontalRotSpeed = 3;
				maxVerticalRotSpeed = 3;
				class ViewGunner: ViewGunner
				{
					minAngleX = -65;
					maxAngleX = 85;
					initAngleX = 0;
					minAngleY = -150;
					maxAngleY = 150;
					initAngleY = 0;
					minFov = 0.3;
					maxFov = 1.2;
					initFov = 1;
				};
				commanding = -1;
				gunnerLeftHandAnimName = "lever_copilot";
				gunnerRightHandAnimName = "stick_copilot";
				gunnerLeftLegAnimName = "pedalL";
				gunnerRightLegAnimName = "pedalR";
				turretCanSee = "1 + 2 + 4 + 8 + 16";
			};
		};
		class RotorLibHelicopterProperties: RotorLibHelicopterProperties
		{
			maxTorque = 800;
			maxMainRotorStress = 100000;
			maxTailRotorStress = 8000;
			maxHorizontalStabilizerLeftStress = 8000;
			maxHorizontalStabilizerRightStress = 8000;
			maxVerticalStabilizerStress = 8000;
			stressDamagePerSec = 0.01;
			rtd_center = "rtd_center";
		};
		transportMaxWeapons = 12;
		transportMaxMagazines = 48;
		transportMaxBackpacks = 24;
		maximumLoad = 3000;
		supplyRadius = -1;
		memoryPointSupply = "doplnovani";
		class TransportBackpacks{};
		class TransportMagazines{};
		class TransportWeapons{};
		class TransportItems
		{
			class _xx_FirstAidKit
			{
				name = "FirstAidKit";
				count = 4;
			};
			class _xx_Toolkit
			{
				name = "Toolkit";
				count = 1;
			};
			class _xx_ItemGPS
			{
				name = "ItemGPS";
				count = 1;
			};
			class _xx_ItemRadio
			{
				name = "ItemRadio";
				count = 1;
			};
		};
	};
};
class CfgNonAIVehicles
{
	class ProxyDriver;
	class ProxyParasutista: ProxyDriver{};
	class ProxyWeapon;
	class ProxyMissile_AT_01_F: ProxyWeapon
	{
		model = "\A3\Weapons_F\Ammo\Missile_AT_01_F";
		simulation = "maverickweapon";
	};
	class ProxyBomb_01_F: ProxyWeapon
	{
		model = "\A3\Weapons_F\Ammo\Bomb_01_F";
		simulation = "maverickweapon";
	};
	class ProxyMissile_AA_01_F: ProxyWeapon
	{
		model = "\A3\Weapons_F\Ammo\Missile_AA_01_F";
		simulation = "maverickweapon";
	};
	class ProxyFlag;
	class ProxyPlane_Flag_F: ProxyFlag
	{
		model = "\A3\Air_F\Data\Plane_Flag_F";
	};
	class ProxyPlane_Flag_big_F: ProxyFlag
	{
		model = "\A3\Air_F\Data\Plane_Flag_big_F";
	};
};
//};
