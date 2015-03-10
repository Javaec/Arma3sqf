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

//Class air_f : Heli_Light_02\config.bin{
class CfgPatches
{
	class A3_Air_F_Heli_Light_02
	{
		units[] = {"O_Heli_Light_02_F","O_Heli_Light_02_unarmed_F"};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Air_F"};
	};
};
class WeaponCloudsMGun;
class CfgVehicles
{
	class Helicopter;
	class Helicopter_Base_F: Helicopter
	{
		class Turrets;
		class HitPoints;
	};
	class Helicopter_Base_H: Helicopter_Base_F
	{
		class Turrets: Turrets
		{
			class CopilotTurret;
		};
		class AnimationSources;
		class EventHandlers;
		class ViewOptics;
		class ViewPilot;
		class Reflectors;
		class HitPoints: HitPoints
		{
			class HitHull;
			class HitFuel;
			class HitAvionics;
			class HitMissiles;
			class HitEngine;
			class HitHRotor;
			class HitVRotor;
			class HitGlass1;
			class HitGlass2;
			class HitGlass3;
			class HitGlass4;
			class HitGlass5;
			class HitGlass6;
		};
	};
	class Heli_Light_02_base_F: Helicopter_Base_H
	{
		features = "Randomization: No						<br />Camo selections: 1 - the whole exterior						<br />Script door sources: No						<br />Script animations: Doors, HideWeapon, proxy						<br />Executed scripts: None 						<br />Firing from vehicles: No						<br />Slingload: Slingloads up to 500 kg						<br />Cargo proxy indexes: 1 to 8";
		mapSize = 16.01;
		author = "$STR_A3_Bohemia_Interactive";
		_generalMacro = "Heli_Light_02_base_F";
		armor = 30;
		sensitivity = 2;
		altFullForce = 4000;
		altNoForce = 6000;
		maxFordingDepth = 0.55;
		mainBladeRadius = 7.0;
		liftForceCoef = 1.1;
		bodyFrictionCoef = 0.7;
		class RotorLibHelicopterProperties
		{
			RTDconfig = "A3\Air_F\Heli_Light_02\RTD_Heli_Light_02.xml";
			defaultCollective = 0.68;
			autoHoverCorrection[] = {4,-3.3,0};
			maxTorque = 2700;
			stressDamagePerSec = 0.0033333332;
			retreatBladeStallWarningSpeed = 87.5;
			maxHorizontalStabilizerLeftStress = 10000;
			maxHorizontalStabilizerRightStress = 10000;
			maxVerticalStabilizerStress = 10000;
			horizontalWingsAngleCollMin = 0;
			horizontalWingsAngleCollMax = 0;
			maxMainRotorStress = 110000;
			maxTailRotorStress = 25000;
		};
		fuelCapacity = 800;
		fuelConsumptionRate = 0.11;
		maxSpeed = 290;
		slingLoadMaxCargoMass = 2000;
		accuracy = 0.5;
		displayName = "$STR_A3_CfgVehicles_Heli_Light_02_Base_F0";
		model = "\A3\Air_F\Heli_Light_02\Heli_Light_02_F.p3d";
		driveOnComponent[] = {"Wheels"};
		icon = "\A3\Air_F\Heli_Light_02\Data\UI\Map_Heli_Light_02_CA.paa";
		picture = "\A3\Air_F\Heli_Light_02\Data\UI\Heli_Light_02_CA.paa";
		driverAction = "pilot_Heli_Light_02";
		driverInAction = "pilot_Heli_Light_02";
		precisegetinout = 1;
		GetInAction = "pilot_Heli_Light_02_Enter";
		GetOutAction = "pilot_Heli_Light_02_Exit";
		cargoGetInAction[] = {"GetInHelicopterCargo"};
		cargoGetOutAction[] = {"GetOutHelicopterCargo"};
		transportSoldier = 8;
		maximumLoad = 3000;
		class TransportBackpacks
		{
			class _xx_B_Parachute
			{
				backpack = "B_Parachute";
				count = 8;
			};
		};
		class TransportMagazines
		{
			class _xx_SmokeShell
			{
				magazine = "SmokeShell";
				count = 2;
			};
			class _xx_SmokeShellRed
			{
				magazine = "SmokeShellRed";
				count = 2;
			};
			class _xx_30Rnd_65x39_caseless_green
			{
				magazine = "30Rnd_65x39_caseless_green";
				count = 4;
			};
		};
		class TransportWeapons
		{
			class _xx_arifle_Katiba_C_F
			{
				weapon = "arifle_Katiba_C_F";
				count = 2;
			};
		};
		class TransportItems
		{
			class _xx_FirstAidKit
			{
				name = "FirstAidKit";
				count = 8;
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
		};
		cargoCanEject = 1;
		driverCanEject = 0;
		cargoAction[] = {"passenger_apc_narrow_generic03","passenger_apc_generic02","passenger_apc_narrow_generic01","passenger_apc_generic04","passenger_apc_narrow_generic02","passenger_generic01_leanright","passenger_generic01_leanleft","passenger_generic01_foldhands"};
		cargoIsCoDriver[] = {0,0};
		hideWeaponsCargo = 1;
		class Exhausts
		{
			class Exhaust1
			{
				position = "exhaust1";
				direction = "exhaust1_dir";
				effect = "ExhaustsEffectHeliMed";
			};
			class Exhaust2
			{
				position = "exhaust2";
				direction = "exhaust2_dir";
				effect = "ExhaustsEffectHeliMed";
			};
		};
		memoryPointsGetInCargo = "pos cargo";
		memoryPointsGetInCargoDir = "pos cargo dir";
		memoryPointLMissile = "Rocket_1";
		memoryPointRMissile = "Rocket_1";
		memoryPointGun = "machinegun_end";
		LockDetectionSystem = "8  + 4";
		incomingMissileDetectionSystem = 16;
		weapons[] = {"LMG_Minigun_heli","missiles_DAGR","CMFlareLauncher"};
		magazines[] = {"2000Rnd_65x39_Belt_Tracer_Green_Splash","12Rnd_PG_missiles","168Rnd_CMFlare_Chaff_Magazine"};
		class ViewPilot: ViewPilot
		{
			initAngleX = 10;
		};
		class ViewOptics: ViewOptics
		{
			initAngleX = 0;
			minAngleX = 0;
			maxAngleX = 0;
			initAngleY = 0;
			minAngleY = 0;
			maxAngleY = 0;
			initFov = 0.1;
			minFov = 0.1;
			maxFov = 1.2;
		};
		class HitPoints: HitPoints
		{
			class HitHull: HitHull
			{
				armor = 999;
				visual = "zbytek";
				minimalHit = 0.05;
				depends = "Total";
				radius = 0.01;
			};
			class HitFuel: HitFuel
			{
				armor = 1;
				radius = 0.25;
				minimalHit = 0.05;
			};
			class HitAvionics: HitAvionics
			{
				armor = 2;
				radius = 0.4;
				minimalHit = 0.1;
			};
			class HitMissiles: HitMissiles
			{
				armor = 1;
				radius = 0.15;
				minimalHit = 0.05;
			};
			class HitEngine1: HitEngine
			{
				armor = 1;
				radius = 0.4;
				explosionShielding = 3;
				minimalHit = 0.2;
				name = "engine_1_hit";
				convexComponent = "engine_1_hit";
			};
			class HitEngine2: HitEngine1
			{
				armor = 1;
				minimalHit = 0.2;
				name = "engine_2_hit";
				convexComponent = "engine_2_hit";
			};
			class HitEngine: HitEngine2
			{
				armor = 999;
				name = "engine_hit";
				convexComponent = "engine_hit";
				depends = "0.5 * (HitEngine1 + HitEngine2)";
			};
			class HitHRotor: HitHRotor
			{
				armor = 4.5;
				radius = 0.4;
				minimalHit = 0.09;
				explosionShielding = 2.5;
			};
			class HitVRotor: HitVRotor
			{
				armor = 3;
				radius = 0.06;
				minimalHit = 0.09;
				explosionShielding = 6;
			};
		};
		class Turrets: Turrets
		{
			class CopilotTurret: CopilotTurret
			{
				gunnerAction = "copilot_Heli_Light_02";
				gunnerInAction = "copilot_Heli_Light_02";
				precisegetinout = 1;
				gunnerGetInAction = "copilot_Heli_Light_02_Enter";
				gunnerGetOutAction = "copilot_Heli_Light_02_Exit";
				memoryPointsGetInCargo = "pos copilot";
				memoryPointsGetInCargoDir = "pos copilot dir";
				canEject = 0;
				selectionFireAnim = "";
				minElev = -50;
				maxElev = 30;
				initElev = 11;
				minTurn = -170;
				maxTurn = 170;
				initTurn = 0;
				gunnerLeftHandAnimName = "lever_copilot";
				gunnerRightHandAnimName = "stick_copilot";
				maxHorizontalRotSpeed = 3;
				maxVerticalRotSpeed = 3;
			};
		};
		class Damage
		{
			tex[] = {};
			mat[] = {"A3\Air_F\Heli_Light_02\Data\Heli_Light_02_ext.rvmat","A3\Air_F\Heli_Light_02\Data\Heli_Light_02_ext_damage.rvmat","A3\Air_F\Heli_Light_02\Data\Heli_Light_02_ext_destruct.rvmat","A3\Air_F\Heli_Light_02\Data\Heli_Light_02_glass.rvmat","A3\Air_F\Heli_Light_02\Data\Heli_Light_02_glass_damage.rvmat","A3\Air_F\Heli_Light_02\Data\Heli_Light_02_glass_destruct.rvmat","A3\data_F\default.rvmat","A3\data_F\default.rvmat","A3\data_F\default_destruct.rvmat"};
		};
		attenuationEffectType = "HeliAttenuation";
		emptySound[] = {"",0,1};
		soundGeneralCollision1[] = {"A3\Sounds_F\vehicles\crashes\helis\Heli_coll_default_int_1",1.0,1,100};
		soundGeneralCollision2[] = {"A3\Sounds_F\vehicles\crashes\helis\Heli_coll_default_int_2",1.0,1,100};
		soundGeneralCollision3[] = {"A3\Sounds_F\vehicles\crashes\helis\Heli_coll_default_int_3",1.0,1,100};
		soundCrashes[] = {"soundGeneralCollision1",0.33,"soundGeneralCollision2",0.33,"soundGeneralCollision3",0.33};
		soundLandCrashes[] = {"emptySound",0};
		soundBuildingCrash[] = {"soundGeneralCollision1",1,"soundGeneralCollision2",1,"soundGeneralCollision3",1};
		soundArmorCrash[] = {"soundGeneralCollision1",1,"soundGeneralCollision2",1,"soundGeneralCollision3",1};
		soundWoodCrash[] = {"soundGeneralCollision1",1,"soundGeneralCollision2",1,"soundGeneralCollision3",1};
		soundBushCollision1[] = {"A3\Sounds_F\vehicles\crashes\helis\Heli_coll_bush_int_1",1.0,1,100};
		soundBushCollision2[] = {"A3\Sounds_F\vehicles\crashes\helis\Heli_coll_bush_int_2",1.0,1,100};
		soundBushCollision3[] = {"A3\Sounds_F\vehicles\crashes\helis\Heli_coll_bush_int_3",1.0,1,100};
		soundBushCrash[] = {"soundBushCollision1",0.33,"soundBushCollision2",0.33,"soundBushCollision3",0.33};
		soundWaterCollision1[] = {"A3\Sounds_F\vehicles\crashes\helis\Heli_coll_water_ext_1",1.0,1,100};
		soundWaterCollision2[] = {"A3\Sounds_F\vehicles\crashes\helis\Heli_coll_water_ext_2",1.0,1,100};
		soundWaterCrashes[] = {"soundWaterCollision1",0.5,"soundWaterCollision2",0.5};
		soundDammage[] = {"A3\Sounds_F\vehicles\crashes\helis\Heli_crash_default_int_1",10.0,1};
		soundGetIn[] = {"A3\Sounds_F\vehicles\air\Heli_Light_02\open",0.56234133,1};
		soundGetOut[] = {"A3\Sounds_F\vehicles\air\Heli_Light_02\close",1.0,1,50};
		soundEngineOnInt[] = {"A3\Sounds_F\vehicles\air\Heli_Light_02\Heli_Light_02_int_start_v2",0.39810717,1.0};
		soundEngineOnExt[] = {"A3\Sounds_F\vehicles\air\Heli_Light_02\Heli_Light_02_ext_start_v2",0.7943282,1.0,600};
		soundEngineOffInt[] = {"A3\Sounds_F\vehicles\air\Heli_Light_02\Heli_Light_02_int_stop_v2",0.39810717,1.0};
		soundEngineOffExt[] = {"A3\Sounds_F\vehicles\air\Heli_Light_02\Heli_Light_02_ext_stop_v2",0.7943282,1.0,600};
		soundLocked[] = {"\A3\Sounds_F\weapons\Rockets\opfor_lock_1",1.0,1};
		soundIncommingMissile[] = {"\A3\Sounds_F\weapons\Rockets\opfor_lock_2",1.0,1};
		rotorDamageInt[] = {"A3\Sounds_F\vehicles\air\noises\heli_damage_rotor_int_1",1.0,1.0};
		rotorDamageOut[] = {"A3\Sounds_F\vehicles\air\noises\heli_damage_rotor_ext_1",2.5118864,1.0,300};
		rotorDamage[] = {"rotorDamageInt","rotorDamageOut"};
		tailDamageInt[] = {"A3\Sounds_F\vehicles\air\noises\heli_damage_tail",1.0,1.0};
		tailDamageOut[] = {"A3\Sounds_F\vehicles\air\noises\heli_damage_tail",1.0,1.0,300};
		tailDamage[] = {"tailDamageInt","tailDamageOut"};
		landingSoundInt0[] = {"A3\Sounds_F\vehicles\air\noises\landing_wheels_large_int1",1.0,1.0,100};
		landingSoundInt1[] = {"A3\Sounds_F\vehicles\air\noises\landing_wheels_large_int2",1.0,1.0,100};
		landingSoundInt[] = {"landingSoundInt0",0.5,"landingSoundInt1",0.5};
		landingSoundOut0[] = {"A3\Sounds_F\vehicles\air\noises\landing_wheels_ext1",1.7782794,1.0,100};
		landingSoundOut1[] = {"A3\Sounds_F\vehicles\air\noises\landing_wheels_ext2",1.7782794,1.0,100};
		landingSoundOut[] = {"landingSoundOut0",0.5,"landingSoundOut1",0.5};
		slingCargoAttach0[] = {"A3\Sounds_F\vehicles\air\noises\SL_engineDownEndINT",1.0,1.0};
		slingCargoAttach1[] = {"A3\Sounds_F\vehicles\air\noises\SL_1hookLock",1.0,1.0,80};
		slingCargoAttach[] = {"slingCargoAttach0","slingCargoAttach1"};
		slingCargoDetach0[] = {"A3\Sounds_F\vehicles\air\noises\SL_engineUpEndINT",1.0,1.0};
		slingCargoDetach1[] = {"A3\Sounds_F\vehicles\air\noises\SL_1hookUnlock",1.0,1.0,80};
		slingCargoDetach[] = {"slingCargoDetach0","slingCargoDetach1"};
		slingCargoDetachAir0[] = {"A3\Sounds_F\vehicles\air\noises\SL_unhook_air_int",1.0,1.0};
		slingCargoDetachAir1[] = {"A3\Sounds_F\vehicles\air\noises\SL_unhook_air_ext",1.0,1.0,80};
		slingCargoDetachAir[] = {"slingCargoDetach0","slingCargoDetach1"};
		slingCargoRopeBreak0[] = {"A3\Sounds_F\vehicles\air\noises\SL_rope_break_int",1.0,1.0};
		slingCargoRopeBreak1[] = {"A3\Sounds_F\vehicles\air\noises\SL_rope_break_ext",1.0,1.0,80};
		slingCargoRopeBreak[] = {"slingCargoDetach0","slingCargoDetach1"};
		class Sounds
		{
			class EngineExt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\Heli_Light_02\Heli_Light_02_ext_engine_v2",1.7782794,1.0,700};
				frequency = "rotorSpeed";
				volume = "camPos*((rotorSpeed-0.72)*4)";
			};
			class RotorExt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\Heli_Light_02\Heli_Light_02_ext_rotor_normal",1.4125376,1.0,1500};
				frequency = "rotorSpeed * (1-rotorThrust/5)";
				volume = "camPos*(0 max (rotorSpeed-0.1))*(1 + rotorThrust)";
				cone[] = {1.6,3.14,1.6,0.95};
			};
			class RotorNoiseExt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\Heli_Light_02\rotor_swist",1.0,1,400};
				frequency = 1;
				volume = "(camPos*(rotorThrust factor [0.6, 1]))";
				cone[] = {0.7,1.3,1.0,0};
			};
			class EngineInt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\Heli_Light_02\Heli_Light_02_int_engine_v2",1.0,1.0};
				frequency = "rotorSpeed";
				volume = "2 * (1-camPos)*(rotorSpeed factor[0.4,1])";
			};
			class RotorInt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\Heli_Light_02\Heli_Light_02_int_rotor_normal",0.70794576,1.0};
				frequency = "rotorSpeed * (1-rotorThrust/5)";
				volume = "(1-camPos) * (rotorSpeed factor[0.3, 1]) * (1 + rotorThrust)";
			};
			class TransmissionDamageExt_phase1
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_damage_transmission_ext_1",1.0,1.0,150};
				frequency = "0.66 + rotorSpeed / 3";
				volume = "camPos * (transmissionDamage factor [0.3, 0.35]) * (transmissionDamage factor [0.5, 0.45]) * (rotorSpeed factor [0.2, 0.5])";
			};
			class TransmissionDamageExt_phase2
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_damage_transmission_ext_2",1.0,1.0,150};
				frequency = "0.66 + rotorSpeed / 3";
				volume = "camPos * (transmissionDamage factor [0.45, 0.5]) * (rotorSpeed factor [0.2, 0.5])";
			};
			class TransmissionDamageInt_phase1
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_damage_transmission_int_1",1.0,1.0,150};
				frequency = "0.66 + rotorSpeed / 3";
				volume = "(1 - camPos) * (transmissionDamage factor [0.3, 0.35]) * (transmissionDamage factor [0.5, 0.45]) * (rotorSpeed factor [0.2, 0.5])";
			};
			class TransmissionDamageInt_phase2
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_damage_transmission_int_2",1.0,1.0,150};
				frequency = "0.66 + rotorSpeed / 3";
				volume = "(1 - camPos) * (transmissionDamage factor [0.45, 0.5]) * (rotorSpeed factor [0.2, 0.5])";
			};
			class damageAlarmInt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_alarm_opfor",0.31622776,1.0};
				frequency = 1;
				volume = "engineOn * (1 - camPos) * ( 1 - ((transmissionDamage factor [0.61, 0.60]) * (motorDamage factor [0.61, 0.60]) * (rotorDamage factor [0.51, 0.50]))) * (rotorSpeed factor [0.0, 0.001])";
			};
			class damageAlarmExt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_alarm_opfor",0.2238721,1.0,20};
				frequency = 1;
				volume = "engineOn * camPos * ( 1 - ((transmissionDamage factor [0.61, 0.60]) * (motorDamage factor [0.61, 0.60]) * (rotorDamage factor [0.51, 0.50]))) * (rotorSpeed factor [0, 0.001])";
			};
			class rotorLowAlarmInt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_alarm_rotor_low",0.31622776,1.0};
				frequency = 1;
				volume = "engineOn * (1 - camPos) * (rotorSpeed factor [0.9, 0.8999]) * (rotorSpeed factor [-0.5, 1]) * (speed factor [3, 3.01])";
			};
			class rotorLowAlarmExt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_alarm_rotor_low",0.2238721,1.0,20};
				frequency = 1;
				volume = "engineOn * camPos * (rotorSpeed factor [0.9, 0.8999]) * (rotorSpeed factor [-0.5, 1]) * (speed factor [3, 3.01])";
			};
			class scrubLandInt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\wheelsInt",1.0,1.0,100};
				frequency = 1;
				volume = "2 * (1-camPos) * (scrubLand factor[0.02, 0.05]) * (1 - (lateralMovement factor [0.7,1]))";
			};
			class scrubLandExt
			{
				sound[] = {"A3\Sounds_F\dummysound",1.0,1.0,100};
				frequency = 1;
				volume = "camPos * (scrubLand factor[0.02, 0.05]) * (1 - (lateralMovement factor [0.7,1]))";
			};
			class scrubBuildingInt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\wheelsInt",1.0,1.0,100};
				frequency = 1;
				volume = "(1-camPos) * (scrubBuilding factor[0.02, 0.05]) * (1 - (lateralMovement factor [0.7,1]))";
			};
			class scrubBuildingExt
			{
				sound[] = {"A3\Sounds_F\dummysound",1.0,1.0,100};
				frequency = 1;
				volume = "camPos * (scrubBuilding factor[0.02, 0.05])";
			};
			class scrubTreeInt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\scrubTreeInt",1.0,1.0,100};
				frequency = 1;
				volume = "(1 - camPos) * ((scrubTree) factor [0, 0.01])";
			};
			class scrubTreeExt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\scrubTreeExt",1.0,1.0,100};
				frequency = 1;
				volume = "camPos * ((scrubTree) factor [0, 0.01])";
			};
			class RainExt
			{
				sound[] = {"A3\Sounds_F\vehicles\noises\rain1_ext",1.0,1.0,100};
				frequency = 1;
				volume = "camPos * (rain - rotorSpeed/2) * 2";
			};
			class RainInt
			{
				sound[] = {"A3\Sounds_F\vehicles\noises\rain1_int",1.0,1.0,100};
				frequency = 1;
				volume = "(1-camPos)*(rain - rotorSpeed/2)*2";
			};
			class SlingLoadDownExt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\SL_engineDownEXT",1.0,1.0,500};
				frequency = 1;
				volume = "camPos*(slingLoadActive factor [0,-1])";
			};
			class SlingLoadUpExt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\SL_engineUpEXT",1.0,1.0,500};
				frequency = 1;
				volume = "camPos*(slingLoadActive factor [0,1])";
			};
			class SlingLoadDownInt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\SL_engineDownINT",1.0,1.0,500};
				frequency = 1;
				volume = "(1-camPos)*(slingLoadActive factor [0,-1])";
			};
			class SlingLoadUpInt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\SL_engineUpINT",1.0,1.0,500};
				frequency = 1;
				volume = "(1-camPos)*(slingLoadActive factor [0,1])";
			};
			class WindInt
			{
				sound[] = {"A3\Sounds_F\vehicles\air\noises\wind_closed",0.4466836,1.0,50};
				frequency = 1;
				volume = "(1-camPos)*(speed factor[5, 60])*(speed factor[5, 60])";
			};
			class GStress
			{
				sound[] = {"A3\Sounds_F\vehicles\noises\vehicle_stress2e",0.39810717,1.0,50};
				frequency = 1;
				volume = "engineOn * (1-camPos) * ((gmeterZ factor[1.5, 2.5]) + (gmeterZ factor[0.5, -0.5]))";
			};
		};
		class SoundsExt
		{
			class SoundEvents{};
			class Sounds
			{
				class EngineExt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\Heli_Light_02\Heli_Light_02_ext_engine_v2",1.7782794,1.0,700};
					frequency = "rotorSpeed";
					volume = "camPos*((rotorSpeed-0.72)*4)";
				};
				class RotorExt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\Heli_Light_02\Heli_Light_02_ext_rotor_normal",1.4125376,1.0,1500};
					frequency = "rotorSpeed * (1-rotorThrust/5)";
					volume = "camPos*(0 max (rotorSpeed-0.1))*(1 + rotorThrust)";
					cone[] = {1.6,3.14,1.6,0.95};
				};
				class RotorNoiseExt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\Heli_Light_02\rotor_swist",1.0,1,400};
					frequency = 1;
					volume = "(camPos*(rotorThrust factor [0.6, 1]))";
					cone[] = {0.7,1.3,1.0,0};
				};
				class EngineInt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\Heli_Light_02\Heli_Light_02_int_engine_v2",1.0,1.0};
					frequency = "rotorSpeed";
					volume = "2 * (1-camPos)*(rotorSpeed factor[0.4,1])";
				};
				class RotorInt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\Heli_Light_02\Heli_Light_02_int_rotor_normal",0.70794576,1.0};
					frequency = "rotorSpeed * (1-rotorThrust/5)";
					volume = "(1-camPos) * (rotorSpeed factor[0.3, 1]) * (1 + rotorThrust)";
				};
				class TransmissionDamageExt_phase1
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_damage_transmission_ext_1",1.0,1.0,150};
					frequency = "0.66 + rotorSpeed / 3";
					volume = "camPos * (transmissionDamage factor [0.3, 0.35]) * (transmissionDamage factor [0.5, 0.45]) * (rotorSpeed factor [0.2, 0.5])";
				};
				class TransmissionDamageExt_phase2
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_damage_transmission_ext_2",1.0,1.0,150};
					frequency = "0.66 + rotorSpeed / 3";
					volume = "camPos * (transmissionDamage factor [0.45, 0.5]) * (rotorSpeed factor [0.2, 0.5])";
				};
				class TransmissionDamageInt_phase1
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_damage_transmission_int_1",1.0,1.0,150};
					frequency = "0.66 + rotorSpeed / 3";
					volume = "(1 - camPos) * (transmissionDamage factor [0.3, 0.35]) * (transmissionDamage factor [0.5, 0.45]) * (rotorSpeed factor [0.2, 0.5])";
				};
				class TransmissionDamageInt_phase2
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_damage_transmission_int_2",1.0,1.0,150};
					frequency = "0.66 + rotorSpeed / 3";
					volume = "(1 - camPos) * (transmissionDamage factor [0.45, 0.5]) * (rotorSpeed factor [0.2, 0.5])";
				};
				class damageAlarmInt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_alarm_opfor",0.31622776,1.0};
					frequency = 1;
					volume = "engineOn * (1 - camPos) * ( 1 - ((transmissionDamage factor [0.61, 0.60]) * (motorDamage factor [0.61, 0.60]) * (rotorDamage factor [0.51, 0.50]))) * (rotorSpeed factor [0.0, 0.001])";
				};
				class damageAlarmExt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_alarm_opfor",0.2238721,1.0,20};
					frequency = 1;
					volume = "engineOn * camPos * ( 1 - ((transmissionDamage factor [0.61, 0.60]) * (motorDamage factor [0.61, 0.60]) * (rotorDamage factor [0.51, 0.50]))) * (rotorSpeed factor [0, 0.001])";
				};
				class rotorLowAlarmInt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_alarm_rotor_low",0.31622776,1.0};
					frequency = 1;
					volume = "engineOn * (1 - camPos) * (rotorSpeed factor [0.9, 0.8999]) * (rotorSpeed factor [-0.5, 1]) * (speed factor [3, 3.01])";
				};
				class rotorLowAlarmExt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\heli_alarm_rotor_low",0.2238721,1.0,20};
					frequency = 1;
					volume = "engineOn * camPos * (rotorSpeed factor [0.9, 0.8999]) * (rotorSpeed factor [-0.5, 1]) * (speed factor [3, 3.01])";
				};
				class scrubLandInt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\wheelsInt",1.0,1.0,100};
					frequency = 1;
					volume = "2 * (1-camPos) * (scrubLand factor[0.02, 0.05]) * (1 - (lateralMovement factor [0.7,1]))";
				};
				class scrubLandExt
				{
					sound[] = {"A3\Sounds_F\dummysound",1.0,1.0,100};
					frequency = 1;
					volume = "camPos * (scrubLand factor[0.02, 0.05]) * (1 - (lateralMovement factor [0.7,1]))";
				};
				class scrubBuildingInt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\wheelsInt",1.0,1.0,100};
					frequency = 1;
					volume = "(1-camPos) * (scrubBuilding factor[0.02, 0.05]) * (1 - (lateralMovement factor [0.7,1]))";
				};
				class scrubBuildingExt
				{
					sound[] = {"A3\Sounds_F\dummysound",1.0,1.0,100};
					frequency = 1;
					volume = "camPos * (scrubBuilding factor[0.02, 0.05])";
				};
				class scrubTreeInt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\scrubTreeInt",1.0,1.0,100};
					frequency = 1;
					volume = "(1 - camPos) * ((scrubTree) factor [0, 0.01])";
				};
				class scrubTreeExt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\scrubTreeExt",1.0,1.0,100};
					frequency = 1;
					volume = "camPos * ((scrubTree) factor [0, 0.01])";
				};
				class RainExt
				{
					sound[] = {"A3\Sounds_F\vehicles\noises\rain1_ext",1.0,1.0,100};
					frequency = 1;
					volume = "camPos * (rain - rotorSpeed/2) * 2";
				};
				class RainInt
				{
					sound[] = {"A3\Sounds_F\vehicles\noises\rain1_int",1.0,1.0,100};
					frequency = 1;
					volume = "(1-camPos)*(rain - rotorSpeed/2)*2";
				};
				class SlingLoadDownExt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\SL_engineDownEXT",1.0,1.0,500};
					frequency = 1;
					volume = "camPos*(slingLoadActive factor [0,-1])";
				};
				class SlingLoadUpExt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\SL_engineUpEXT",1.0,1.0,500};
					frequency = 1;
					volume = "camPos*(slingLoadActive factor [0,1])";
				};
				class SlingLoadDownInt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\SL_engineDownINT",1.0,1.0,500};
					frequency = 1;
					volume = "(1-camPos)*(slingLoadActive factor [0,-1])";
				};
				class SlingLoadUpInt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\SL_engineUpINT",1.0,1.0,500};
					frequency = 1;
					volume = "(1-camPos)*(slingLoadActive factor [0,1])";
				};
				class WindInt
				{
					sound[] = {"A3\Sounds_F\vehicles\air\noises\wind_closed",0.4466836,1.0,50};
					frequency = 1;
					volume = "(1-camPos)*(speed factor[5, 60])*(speed factor[5, 60])";
				};
				class GStress
				{
					sound[] = {"A3\Sounds_F\vehicles\noises\vehicle_stress2e",0.39810717,1.0,50};
					frequency = 1;
					volume = "engineOn * (1-camPos) * ((gmeterZ factor[1.5, 2.5]) + (gmeterZ factor[0.5, -0.5]))";
				};
			};
		};
		class Library
		{
			libTextDesc = "$STR_A3_cfgVehicles_heli_light_02_lib";
		};
		class AnimationSources: AnimationSources
		{
			class Doors
			{
				source = "user";
				animPeriod = 1;
				initPhase = 0;
			};
			class HideWeapon
			{
				source = "user";
				animPeriod = 1e-005;
				initPhase = 0;
			};
			class Gatling
			{
				source = "revolving";
				weapon = "LMG_Minigun_heli";
			};
			class Gatling_flash
			{
				source = "ammorandom";
				weapon = "LMG_Minigun_heli";
			};
			class Missiles_revolving
			{
				source = "revolving";
				weapon = "missiles_DAGR";
			};
			class Proxy
			{
				source = "user";
				animPeriod = 1;
				initPhase = 0;
			};
		};
		hiddenSelections[] = {"camo1"};
		class MFD
		{
			class AirplaneHUD
			{
				topLeft = "HUD_top_left";
				topRight = "HUD_top_right";
				bottomLeft = "HUD_bottom_left";
				borderLeft = 0;
				borderRight = 0;
				borderTop = 0;
				borderBottom = 0;
				color[] = {1.0,1.0,1.0,1.0};
				helmetMountedDisplay = 1;
				helmetPosition[] = {-0.025,0.025,0.1};
				helmetRight[] = {0.05,0.0,0.0};
				helmetDown[] = {0.0,-0.05,0.0};
				class Bones
				{
					class PlaneOrientation
					{
						type = "fixed";
						pos[] = {0.5,0.5};
					};
					class WeaponAim
					{
						type = "vector";
						source = "weapon";
						pos0[] = {0.5,0.5};
						pos10[] = {0.847,0.845};
					};
					class Velocity
					{
						type = "vector";
						source = "velocityToView";
						pos0[] = {0.5,0.5};
						pos10[] = {0.847,0.845};
					};
					class ForwardVec
					{
						type = "vector";
						source = "forward";
						pos0[] = {0,0};
						pos10[] = {0.347,0.345};
					};
					class HorizonBank2
					{
						type = "rotational";
						source = "HorizonBank";
						center[] = {0.5,0.5};
						min = -6.28319;
						max = 6.28319;
						minAngle = -360;
						maxAngle = 360;
						aspectRatio = 0.994236;
					};
					class HorizonDive
					{
						source = "horizonDive";
						type = "linear";
						min = -1;
						max = 1;
						minPos[] = {0.5,2.5};
						maxPos[] = {0.5,-1.5};
					};
					class SliderAltitudeSource
					{
						type = "linear";
						source = "altitudeAGL";
						min = 3;
						max = 53;
						minPos[] = {0.845,"0.2 + 0 * 0.065"};
						maxPos[] = {0.845,"0.2 + 5 * 0.065"};
					};
					class SliderVSpeedSource
					{
						type = "linear";
						source = "vspeed";
						min = -15;
						max = 15;
						minPos[] = {0.895,"0.6 + 0 * 0.04"};
						maxPos[] = {0.895,"0.6 + 6 * 0.04"};
					};
				};
				class Draw
				{
					color[] = {0.8,0.8,0.4};
					alpha = 0.7;
					condition = "on";
					clipTL[] = {0.0,0.0};
					clipBR[] = {1.0,1.0};
					class PlaneHeading
					{
						width = 4.0;
						class Vector
						{
							type = "line";
							width = 4.0;
							points[] = {{ "PlaneOrientation",{ 0,0 },1 },{ "Velocity",{ 0,0 },1 }};
						};
					};
					class Horizont
					{
						clipTL[] = {0.25,0.25};
						clipBR[] = {0.75,0.75};
						width = 4.0;
						class Dimmed
						{
							width = 4.0;
							class Level00
							{
								type = "line";
								width = 4.0;
								points[] = {{ "HorizonDive",{ -0.2,0 },1 },{ "HorizonDive",{ -0.15,0 },1 },{  },{ "HorizonDive",{ -0.01,0 },1 },{ "HorizonDive",{ 0.01,0 },1 },{  },{ "HorizonDive",{ 0.15,0 },1 },{ "HorizonDive",{ 0.2,0 },1 }};
							};
							class Level2M5: Level00
							{
								type = "line";
								points[] = {{ "HorizonDive",{ -0.2,"-0.345 / 10 * 5 * 2/3" },1 },{ "HorizonDive",{ -0.1,"-0.345 / 10 * 5 * 2/3" },1 },{  },{ "HorizonDive",{ 0.1,"-0.345 / 10 * 5 * 2/3" },1 },{ "HorizonDive",{ 0.2,"-0.345 / 10 * 5 * 2/3" },1 }};
							};
							class VALM2_1_5
							{
								type = "text";
								source = "static";
								text = 5;
								align = "center";
								scale = 1;
								sourceScale = 1;
								pos[] = {"HorizonDive",{ 0.0,"-0.025 * 2/3 - 0.345 / 10 * 5 * 2/3" },1};
								right[] = {"HorizonDive",{ "0.0 + 0.08 * 2/3","-0.025 * 2/3 - 0.345 / 10 * 5 * 2/3" },1};
								down[] = {"HorizonDive",{ 0.0,"+0.025 * 2/3 - 0.345 / 10 * 5 * 2/3" },1};
							};
							class Level2P5: Level00
							{
								type = "line";
								points[] = {{ "HorizonDive",{ -0.2,"+0.345 / 10 * 5 * 2/3" },1 },{ "HorizonDive",{ -0.1,"+0.345 / 10 * 5 * 2/3" },1 },{  },{ "HorizonDive",{ 0.1,"+0.345 / 10 * 5 * 2/3" },1 },{ "HorizonDive",{ 0.2,"+0.345 / 10 * 5 * 2/3" },1 }};
							};
							class VALP2_1_5
							{
								type = "text";
								source = "static";
								text = -5;
								align = "center";
								scale = 1;
								sourceScale = 1;
								pos[] = {"HorizonDive",{ 0.0,"-0.025 * 2/3 + 0.345 / 10 * 5 * 2/3" },1};
								right[] = {"HorizonDive",{ "0.0 + 0.08 * 2/3","-0.025 * 2/3 + 0.345 / 10 * 5 * 2/3" },1};
								down[] = {"HorizonDive",{ 0.0,"+0.025 * 2/3 + 0.345 / 10 * 5 * 2/3" },1};
							};
							class Level2M10: Level00
							{
								type = "line";
								points[] = {{ "HorizonDive",{ -0.2,"-0.345 / 10 * 10 * 2/3" },1 },{ "HorizonDive",{ -0.1,"-0.345 / 10 * 10 * 2/3" },1 },{  },{ "HorizonDive",{ 0.1,"-0.345 / 10 * 10 * 2/3" },1 },{ "HorizonDive",{ 0.2,"-0.345 / 10 * 10 * 2/3" },1 }};
							};
							class VALM2_1_10
							{
								type = "text";
								source = "static";
								text = 10;
								align = "center";
								scale = 1;
								sourceScale = 1;
								pos[] = {"HorizonDive",{ 0.0,"-0.025 * 2/3 - 0.345 / 10 * 10 * 2/3" },1};
								right[] = {"HorizonDive",{ "0.0 + 0.08 * 2/3","-0.025 * 2/3 - 0.345 / 10 * 10 * 2/3" },1};
								down[] = {"HorizonDive",{ 0.0,"+0.025 * 2/3 - 0.345 / 10 * 10 * 2/3" },1};
							};
							class Level2P10: Level00
							{
								type = "line";
								points[] = {{ "HorizonDive",{ -0.2,"+0.345 / 10 * 10 * 2/3" },1 },{ "HorizonDive",{ -0.1,"+0.345 / 10 * 10 * 2/3" },1 },{  },{ "HorizonDive",{ 0.1,"+0.345 / 10 * 10 * 2/3" },1 },{ "HorizonDive",{ 0.2,"+0.345 / 10 * 10 * 2/3" },1 }};
							};
							class VALP2_1_10
							{
								type = "text";
								source = "static";
								text = -10;
								align = "center";
								scale = 1;
								sourceScale = 1;
								pos[] = {"HorizonDive",{ 0.0,"-0.025 * 2/3 + 0.345 / 10 * 10 * 2/3" },1};
								right[] = {"HorizonDive",{ "0.0 + 0.08 * 2/3","-0.025 * 2/3 + 0.345 / 10 * 10 * 2/3" },1};
								down[] = {"HorizonDive",{ 0.0,"+0.025 * 2/3 + 0.345 / 10 * 10 * 2/3" },1};
							};
							class Level2M15: Level00
							{
								type = "line";
								points[] = {{ "HorizonDive",{ -0.2,"-0.345 / 10 * 15 * 2/3" },1 },{ "HorizonDive",{ -0.1,"-0.345 / 10 * 15 * 2/3" },1 },{  },{ "HorizonDive",{ 0.1,"-0.345 / 10 * 15 * 2/3" },1 },{ "HorizonDive",{ 0.2,"-0.345 / 10 * 15 * 2/3" },1 }};
							};
							class VALM2_1_15
							{
								type = "text";
								source = "static";
								text = 15;
								align = "center";
								scale = 1;
								sourceScale = 1;
								pos[] = {"HorizonDive",{ 0.0,"-0.025 * 2/3 - 0.345 / 10 * 15 * 2/3" },1};
								right[] = {"HorizonDive",{ "0.0 + 0.08 * 2/3","-0.025 * 2/3 - 0.345 / 10 * 15 * 2/3" },1};
								down[] = {"HorizonDive",{ 0.0,"+0.025 * 2/3 - 0.345 / 10 * 15 * 2/3" },1};
							};
							class Level2P15: Level00
							{
								type = "line";
								points[] = {{ "HorizonDive",{ -0.2,"+0.345 / 10 * 15 * 2/3" },1 },{ "HorizonDive",{ -0.1,"+0.345 / 10 * 15 * 2/3" },1 },{  },{ "HorizonDive",{ 0.1,"+0.345 / 10 * 15 * 2/3" },1 },{ "HorizonDive",{ 0.2,"+0.345 / 10 * 15 * 2/3" },1 }};
							};
							class VALP2_1_15
							{
								type = "text";
								source = "static";
								text = -15;
								align = "center";
								scale = 1;
								sourceScale = 1;
								pos[] = {"HorizonDive",{ 0.0,"-0.025 * 2/3 + 0.345 / 10 * 15 * 2/3" },1};
								right[] = {"HorizonDive",{ "0.0 + 0.08 * 2/3","-0.025 * 2/3 + 0.345 / 10 * 15 * 2/3" },1};
								down[] = {"HorizonDive",{ 0.0,"+0.025 * 2/3 + 0.345 / 10 * 15 * 2/3" },1};
							};
							class Level2M20: Level00
							{
								type = "line";
								points[] = {{ "HorizonDive",{ -0.2,"-0.345 / 10 * 20 * 2/3" },1 },{ "HorizonDive",{ -0.1,"-0.345 / 10 * 20 * 2/3" },1 },{  },{ "HorizonDive",{ 0.1,"-0.345 / 10 * 20 * 2/3" },1 },{ "HorizonDive",{ 0.2,"-0.345 / 10 * 20 * 2/3" },1 }};
							};
							class VALM2_1_20
							{
								type = "text";
								source = "static";
								text = 20;
								align = "center";
								scale = 1;
								sourceScale = 1;
								pos[] = {"HorizonDive",{ 0.0,"-0.025 * 2/3 - 0.345 / 10 * 20 * 2/3" },1};
								right[] = {"HorizonDive",{ "0.0 + 0.08 * 2/3","-0.025 * 2/3 - 0.345 / 10 * 20 * 2/3" },1};
								down[] = {"HorizonDive",{ 0.0,"+0.025 * 2/3 - 0.345 / 10 * 20 * 2/3" },1};
							};
							class Level2P20: Level00
							{
								type = "line";
								points[] = {{ "HorizonDive",{ -0.2,"+0.345 / 10 * 20 * 2/3" },1 },{ "HorizonDive",{ -0.1,"+0.345 / 10 * 20 * 2/3" },1 },{  },{ "HorizonDive",{ 0.1,"+0.345 / 10 * 20 * 2/3" },1 },{ "HorizonDive",{ 0.2,"+0.345 / 10 * 20 * 2/3" },1 }};
							};
							class VALP2_1_20
							{
								type = "text";
								source = "static";
								text = -20;
								align = "center";
								scale = 1;
								sourceScale = 1;
								pos[] = {"HorizonDive",{ 0.0,"-0.025 * 2/3 + 0.345 / 10 * 20 * 2/3" },1};
								right[] = {"HorizonDive",{ "0.0 + 0.08 * 2/3","-0.025 * 2/3 + 0.345 / 10 * 20 * 2/3" },1};
								down[] = {"HorizonDive",{ 0.0,"+0.025 * 2/3 + 0.345 / 10 * 20 * 2/3" },1};
							};
							class Level2M25: Level00
							{
								type = "line";
								points[] = {{ "HorizonDive",{ -0.2,"-0.345 / 10 * 25 * 2/3" },1 },{ "HorizonDive",{ -0.1,"-0.345 / 10 * 25 * 2/3" },1 },{  },{ "HorizonDive",{ 0.1,"-0.345 / 10 * 25 * 2/3" },1 },{ "HorizonDive",{ 0.2,"-0.345 / 10 * 25 * 2/3" },1 }};
							};
							class VALM2_1_25
							{
								type = "text";
								source = "static";
								text = 25;
								align = "center";
								scale = 1;
								sourceScale = 1;
								pos[] = {"HorizonDive",{ 0.0,"-0.025 * 2/3 - 0.345 / 10 * 25 * 2/3" },1};
								right[] = {"HorizonDive",{ "0.0 + 0.08 * 2/3","-0.025 * 2/3 - 0.345 / 10 * 25 * 2/3" },1};
								down[] = {"HorizonDive",{ 0.0,"+0.025 * 2/3 - 0.345 / 10 * 25 * 2/3" },1};
							};
							class Level2P25: Level00
							{
								type = "line";
								points[] = {{ "HorizonDive",{ -0.2,"+0.345 / 10 * 25 * 2/3" },1 },{ "HorizonDive",{ -0.1,"+0.345 / 10 * 25 * 2/3" },1 },{  },{ "HorizonDive",{ 0.1,"+0.345 / 10 * 25 * 2/3" },1 },{ "HorizonDive",{ 0.2,"+0.345 / 10 * 25 * 2/3" },1 }};
							};
							class VALP2_1_25
							{
								type = "text";
								source = "static";
								text = -25;
								align = "center";
								scale = 1;
								sourceScale = 1;
								pos[] = {"HorizonDive",{ 0.0,"-0.025 * 2/3 + 0.345 / 10 * 25 * 2/3" },1};
								right[] = {"HorizonDive",{ "0.0 + 0.08 * 2/3","-0.025 * 2/3 + 0.345 / 10 * 25 * 2/3" },1};
								down[] = {"HorizonDive",{ 0.0,"+0.025 * 2/3 + 0.345 / 10 * 25 * 2/3" },1};
							};
							class Level2M30: Level00
							{
								type = "line";
								points[] = {{ "HorizonDive",{ -0.2,"-0.345 / 10 * 30 * 2/3" },1 },{ "HorizonDive",{ -0.1,"-0.345 / 10 * 30 * 2/3" },1 },{  },{ "HorizonDive",{ 0.1,"-0.345 / 10 * 30 * 2/3" },1 },{ "HorizonDive",{ 0.2,"-0.345 / 10 * 30 * 2/3" },1 }};
							};
							class VALM2_1_30
							{
								type = "text";
								source = "static";
								text = 30;
								align = "center";
								scale = 1;
								sourceScale = 1;
								pos[] = {"HorizonDive",{ 0.0,"-0.025 * 2/3 - 0.345 / 10 * 30 * 2/3" },1};
								right[] = {"HorizonDive",{ "0.0 + 0.08 * 2/3","-0.025 * 2/3 - 0.345 / 10 * 30 * 2/3" },1};
								down[] = {"HorizonDive",{ 0.0,"+0.025 * 2/3 - 0.345 / 10 * 30 * 2/3" },1};
							};
							class Level2P30: Level00
							{
								type = "line";
								points[] = {{ "HorizonDive",{ -0.2,"+0.345 / 10 * 30 * 2/3" },1 },{ "HorizonDive",{ -0.1,"+0.345 / 10 * 30 * 2/3" },1 },{  },{ "HorizonDive",{ 0.1,"+0.345 / 10 * 30 * 2/3" },1 },{ "HorizonDive",{ 0.2,"+0.345 / 10 * 30 * 2/3" },1 }};
							};
							class VALP2_1_30
							{
								type = "text";
								source = "static";
								text = -30;
								align = "center";
								scale = 1;
								sourceScale = 1;
								pos[] = {"HorizonDive",{ 0.0,"-0.025 * 2/3 + 0.345 / 10 * 30 * 2/3" },1};
								right[] = {"HorizonDive",{ "0.0 + 0.08 * 2/3","-0.025 * 2/3 + 0.345 / 10 * 30 * 2/3" },1};
								down[] = {"HorizonDive",{ 0.0,"+0.025 * 2/3 + 0.345 / 10 * 30 * 2/3" },1};
							};
							class Level2M35: Level00
							{
								type = "line";
								points[] = {{ "HorizonDive",{ -0.2,"-0.345 / 10 * 35 * 2/3" },1 },{ "HorizonDive",{ -0.1,"-0.345 / 10 * 35 * 2/3" },1 },{  },{ "HorizonDive",{ 0.1,"-0.345 / 10 * 35 * 2/3" },1 },{ "HorizonDive",{ 0.2,"-0.345 / 10 * 35 * 2/3" },1 }};
							};
							class VALM2_1_35
							{
								type = "text";
								source = "static";
								text = 35;
								align = "center";
								scale = 1;
								sourceScale = 1;
								pos[] = {"HorizonDive",{ 0.0,"-0.025 * 2/3 - 0.345 / 10 * 35 * 2/3" },1};
								right[] = {"HorizonDive",{ "0.0 + 0.08 * 2/3","-0.025 * 2/3 - 0.345 / 10 * 35 * 2/3" },1};
								down[] = {"HorizonDive",{ 0.0,"+0.025 * 2/3 - 0.345 / 10 * 35 * 2/3" },1};
							};
							class Level2P35: Level00
							{
								type = "line";
								points[] = {{ "HorizonDive",{ -0.2,"+0.345 / 10 * 35 * 2/3" },1 },{ "HorizonDive",{ -0.1,"+0.345 / 10 * 35 * 2/3" },1 },{  },{ "HorizonDive",{ 0.1,"+0.345 / 10 * 35 * 2/3" },1 },{ "HorizonDive",{ 0.2,"+0.345 / 10 * 35 * 2/3" },1 }};
							};
							class VALP2_1_35
							{
								type = "text";
								source = "static";
								text = -35;
								align = "center";
								scale = 1;
								sourceScale = 1;
								pos[] = {"HorizonDive",{ 0.0,"-0.025 * 2/3 + 0.345 / 10 * 35 * 2/3" },1};
								right[] = {"HorizonDive",{ "0.0 + 0.08 * 2/3","-0.025 * 2/3 + 0.345 / 10 * 35 * 2/3" },1};
								down[] = {"HorizonDive",{ 0.0,"+0.025 * 2/3 + 0.345 / 10 * 35 * 2/3" },1};
							};
							class Level2M40: Level00
							{
								type = "line";
								points[] = {{ "HorizonDive",{ -0.2,"-0.345 / 10 * 40 * 2/3" },1 },{ "HorizonDive",{ -0.1,"-0.345 / 10 * 40 * 2/3" },1 },{  },{ "HorizonDive",{ 0.1,"-0.345 / 10 * 40 * 2/3" },1 },{ "HorizonDive",{ 0.2,"-0.345 / 10 * 40 * 2/3" },1 }};
							};
							class VALM2_1_40
							{
								type = "text";
								source = "static";
								text = 40;
								align = "center";
								scale = 1;
								sourceScale = 1;
								pos[] = {"HorizonDive",{ 0.0,"-0.025 * 2/3 - 0.345 / 10 * 40 * 2/3" },1};
								right[] = {"HorizonDive",{ "0.0 + 0.08 * 2/3","-0.025 * 2/3 - 0.345 / 10 * 40 * 2/3" },1};
								down[] = {"HorizonDive",{ 0.0,"+0.025 * 2/3 - 0.345 / 10 * 40 * 2/3" },1};
							};
							class Level2P40: Level00
							{
								type = "line";
								points[] = {{ "HorizonDive",{ -0.2,"+0.345 / 10 * 40 * 2/3" },1 },{ "HorizonDive",{ -0.1,"+0.345 / 10 * 40 * 2/3" },1 },{  },{ "HorizonDive",{ 0.1,"+0.345 / 10 * 40 * 2/3" },1 },{ "HorizonDive",{ 0.2,"+0.345 / 10 * 40 * 2/3" },1 }};
							};
							class VALP2_1_40
							{
								type = "text";
								source = "static";
								text = -40;
								align = "center";
								scale = 1;
								sourceScale = 1;
								pos[] = {"HorizonDive",{ 0.0,"-0.025 * 2/3 + 0.345 / 10 * 40 * 2/3" },1};
								right[] = {"HorizonDive",{ "0.0 + 0.08 * 2/3","-0.025 * 2/3 + 0.345 / 10 * 40 * 2/3" },1};
								down[] = {"HorizonDive",{ 0.0,"+0.025 * 2/3 + 0.345 / 10 * 40 * 2/3" },1};
							};
							class Level2M45: Level00
							{
								type = "line";
								points[] = {{ "HorizonDive",{ -0.2,"-0.345 / 10 * 45 * 2/3" },1 },{ "HorizonDive",{ -0.1,"-0.345 / 10 * 45 * 2/3" },1 },{  },{ "HorizonDive",{ 0.1,"-0.345 / 10 * 45 * 2/3" },1 },{ "HorizonDive",{ 0.2,"-0.345 / 10 * 45 * 2/3" },1 }};
							};
							class VALM2_1_45
							{
								type = "text";
								source = "static";
								text = 45;
								align = "center";
								scale = 1;
								sourceScale = 1;
								pos[] = {"HorizonDive",{ 0.0,"-0.025 * 2/3 - 0.345 / 10 * 45 * 2/3" },1};
								right[] = {"HorizonDive",{ "0.0 + 0.08 * 2/3","-0.025 * 2/3 - 0.345 / 10 * 45 * 2/3" },1};
								down[] = {"HorizonDive",{ 0.0,"+0.025 * 2/3 - 0.345 / 10 * 45 * 2/3" },1};
							};
							class Level2P45: Level00
							{
								type = "line";
								points[] = {{ "HorizonDive",{ -0.2,"+0.345 / 10 * 45 * 2/3" },1 },{ "HorizonDive",{ -0.1,"+0.345 / 10 * 45 * 2/3" },1 },{  },{ "HorizonDive",{ 0.1,"+0.345 / 10 * 45 * 2/3" },1 },{ "HorizonDive",{ 0.2,"+0.345 / 10 * 45 * 2/3" },1 }};
							};
							class VALP2_1_45
							{
								type = "text";
								source = "static";
								text = -45;
								align = "center";
								scale = 1;
								sourceScale = 1;
								pos[] = {"HorizonDive",{ 0.0,"-0.025 * 2/3 + 0.345 / 10 * 45 * 2/3" },1};
								right[] = {"HorizonDive",{ "0.0 + 0.08 * 2/3","-0.025 * 2/3 + 0.345 / 10 * 45 * 2/3" },1};
								down[] = {"HorizonDive",{ 0.0,"+0.025 * 2/3 + 0.345 / 10 * 45 * 2/3" },1};
							};
							class Level2M50: Level00
							{
								type = "line";
								points[] = {{ "HorizonDive",{ -0.2,"-0.345 / 10 * 50 * 2/3" },1 },{ "HorizonDive",{ -0.1,"-0.345 / 10 * 50 * 2/3" },1 },{  },{ "HorizonDive",{ 0.1,"-0.345 / 10 * 50 * 2/3" },1 },{ "HorizonDive",{ 0.2,"-0.345 / 10 * 50 * 2/3" },1 }};
							};
							class VALM2_1_50
							{
								type = "text";
								source = "static";
								text = 50;
								align = "center";
								scale = 1;
								sourceScale = 1;
								pos[] = {"HorizonDive",{ 0.0,"-0.025 * 2/3 - 0.345 / 10 * 50 * 2/3" },1};
								right[] = {"HorizonDive",{ "0.0 + 0.08 * 2/3","-0.025 * 2/3 - 0.345 / 10 * 50 * 2/3" },1};
								down[] = {"HorizonDive",{ 0.0,"+0.025 * 2/3 - 0.345 / 10 * 50 * 2/3" },1};
							};
							class Level2P50: Level00
							{
								type = "line";
								points[] = {{ "HorizonDive",{ -0.2,"+0.345 / 10 * 50 * 2/3" },1 },{ "HorizonDive",{ -0.1,"+0.345 / 10 * 50 * 2/3" },1 },{  },{ "HorizonDive",{ 0.1,"+0.345 / 10 * 50 * 2/3" },1 },{ "HorizonDive",{ 0.2,"+0.345 / 10 * 50 * 2/3" },1 }};
							};
							class VALP2_1_50
							{
								type = "text";
								source = "static";
								text = -50;
								align = "center";
								scale = 1;
								sourceScale = 1;
								pos[] = {"HorizonDive",{ 0.0,"-0.025 * 2/3 + 0.345 / 10 * 50 * 2/3" },1};
								right[] = {"HorizonDive",{ "0.0 + 0.08 * 2/3","-0.025 * 2/3 + 0.345 / 10 * 50 * 2/3" },1};
								down[] = {"HorizonDive",{ 0.0,"+0.025 * 2/3 + 0.345 / 10 * 50 * 2/3" },1};
							};
						};
					};
					class MGun
					{
						condition = "mgun";
						width = 4.0;
						class Circle
						{
							type = "line";
							width = 4.0;
							points[] = {{ "ForwardVec",1,"WeaponAim",1,{ 0.01,0 },1 },{ "ForwardVec",1,"WeaponAim",1,{ -0.01,0 },1 },{  },{ "ForwardVec",1,"WeaponAim",1,{ 0,0.00994236 },1 },{ "ForwardVec",1,"WeaponAim",1,{ 0,-0.00994236 },1 },{  },{ "ForwardVec",1,"WeaponAim",1,{ 0,-0.0695965 },1 },{ "ForwardVec",1,"WeaponAim",1,{ 0.049497,-0.0492117 },1 },{ "ForwardVec",1,"WeaponAim",1,{ 0.07,0 },1 },{ "ForwardVec",1,"WeaponAim",1,{ 0.049497,0.0492117 },1 },{ "ForwardVec",1,"WeaponAim",1,{ 0,0.0695965 },1 },{ "ForwardVec",1,"WeaponAim",1,{ -0.049497,0.0492117 },1 },{ "ForwardVec",1,"WeaponAim",1,{ -0.07,0 },1 },{ "ForwardVec",1,"WeaponAim",1,{ -0.049497,-0.0492117 },1 },{ "ForwardVec",1,"WeaponAim",1,{ 0,-0.0695965 },1 },{  },{ "ForwardVec",1,"WeaponAim",1,{ 0,-0.139193 },1 },{ "ForwardVec",1,"WeaponAim",1,{ 0.07,-0.120541 },1 },{ "ForwardVec",1,"WeaponAim",1,{ 0.12124,-0.0695965 },1 },{ "ForwardVec",1,"WeaponAim",1,{ 0.14,0 },1 },{ "ForwardVec",1,"WeaponAim",1,{ 0.12124,0.0695965 },1 },{ "ForwardVec",1,"WeaponAim",1,{ 0.07,0.120541 },1 },{ "ForwardVec",1,"WeaponAim",1,{ 0,0.139193 },1 },{ "ForwardVec",1,"WeaponAim",1,{ -0.07,0.120541 },1 },{ "ForwardVec",1,"WeaponAim",1,{ -0.12124,0.0695965 },1 },{ "ForwardVec",1,"WeaponAim",1,{ -0.14,0 },1 },{ "ForwardVec",1,"WeaponAim",1,{ -0.12124,-0.0695965 },1 },{ "ForwardVec",1,"WeaponAim",1,{ -0.07,-0.120541 },1 },{ "ForwardVec",1,"WeaponAim",1,{ 0,-0.139193 },1 },{  },{ "WeaponAim",{ 0,-0.139193 },1,"ForwardVec",1 },{ "WeaponAim",{ 0,-0.159078 },1,"ForwardVec",1 },{  },{ "WeaponAim",{ 0.07,-0.120545 },1,"ForwardVec",1 },{ "WeaponAim",{ 0.08,-0.137765 },1,"ForwardVec",1 },{  },{ "WeaponAim",{ 0.121244,-0.0695965 },1,"ForwardVec",1 },{ "WeaponAim",{ 0.138564,-0.0795389 },1,"ForwardVec",1 },{  },{ "WeaponAim",{ 0.14,6.08432e-009 },1,"ForwardVec",1 },{ "WeaponAim",{ 0.16,6.95351e-009 },1,"ForwardVec",1 },{  },{ "WeaponAim",{ 0.121244,0.0695965 },1,"ForwardVec",1 },{ "WeaponAim",{ 0.138564,0.0795389 },1,"ForwardVec",1 },{  },{ "WeaponAim",{ 0.07,0.120545 },1,"ForwardVec",1 },{ "WeaponAim",{ 0.08,0.137765 },1,"ForwardVec",1 },{  },{ "WeaponAim",{ -1.22392e-008,0.139193 },1,"ForwardVec",1 },{ "WeaponAim",{ -1.39876e-008,0.159078 },1,"ForwardVec",1 },{  },{ "WeaponAim",{ -0.07,0.120545 },1,"ForwardVec",1 },{ "WeaponAim",{ -0.08,0.137765 },1,"ForwardVec",1 },{  },{ "WeaponAim",{ -0.121244,0.0695965 },1,"ForwardVec",1 },{ "WeaponAim",{ -0.138564,0.0795389 },1,"ForwardVec",1 },{  },{ "WeaponAim",{ -0.14,-1.65986e-009 },1,"ForwardVec",1 },{ "WeaponAim",{ -0.16,-1.89698e-009 },1,"ForwardVec",1 },{  },{ "WeaponAim",{ -0.121244,-0.0695965 },1,"ForwardVec",1 },{ "WeaponAim",{ -0.138564,-0.0795389 },1,"ForwardVec",1 },{  },{ "WeaponAim",{ -0.07,-0.120545 },1,"ForwardVec",1 },{ "WeaponAim",{ -0.08,-0.137765 },1,"ForwardVec",1 }};
						};
					};
					class Missile
					{
						condition = "missile";
						width = 0.05;
						class Circle
						{
							type = "line";
							width = 4.0;
							points[] = {{ "ForwardVec",1,"WeaponAim",1,{ 0,-0.0994236 },1 },{ "ForwardVec",1,"WeaponAim",1,{ 0.05,-0.0861009 },1 },{ "ForwardVec",1,"WeaponAim",1,{ 0.0866,-0.0497118 },1 },{ "ForwardVec",1,"WeaponAim",1,{ 0.1,0 },1 },{ "ForwardVec",1,"WeaponAim",1,{ 0.0866,0.0497118 },1 },{ "ForwardVec",1,"WeaponAim",1,{ 0.05,0.0861009 },1 },{ "ForwardVec",1,"WeaponAim",1,{ 0,0.0994236 },1 },{ "ForwardVec",1,"WeaponAim",1,{ -0.05,0.0861009 },1 },{ "ForwardVec",1,"WeaponAim",1,{ -0.0866,0.0497118 },1 },{ "ForwardVec",1,"WeaponAim",1,{ -0.1,0 },1 },{ "ForwardVec",1,"WeaponAim",1,{ -0.0866,-0.0497118 },1 },{ "ForwardVec",1,"WeaponAim",1,{ -0.05,-0.0861009 },1 },{ "ForwardVec",1,"WeaponAim",1,{ 0,-0.0994236 },1 }};
						};
					};
					class RtdOnlyGroup
					{
						condition = "simulRTD";
						class CollectiveNumber
						{
							type = "text";
							source = "rtdCollective";
							sourceScale = 100;
							align = "left";
							scale = 1;
							pos[] = {{ 0.18,0.535 },1};
							right[] = {{ 0.23,0.535 },1};
							down[] = {{ 0.18,0.57 },1};
						};
						class CollectiveText
						{
							type = "text";
							source = "static";
							text = "%";
							align = "right";
							scale = 1;
							pos[] = {{ 0.18,0.535 },1};
							right[] = {{ 0.23,0.535 },1};
							down[] = {{ 0.18,0.57 },1};
						};
					};
					class SpeedNumber
					{
						type = "text";
						source = "speed";
						sourceScale = 3.6;
						align = "right";
						scale = 1;
						pos[] = {{ 0.16,0.07 },1};
						right[] = {{ 0.24,0.07 },1};
						down[] = {{ 0.16,0.12 },1};
					};
					class AltNumber
					{
						type = "text";
						source = "altitudeASL";
						sourceScale = 1;
						align = "left";
						scale = 1;
						pos[] = {{ 0.84,0.07 },1};
						right[] = {{ 0.92,0.07 },1};
						down[] = {{ 0.84,0.12 },1};
					};
					class VspeedNumber
					{
						type = "text";
						source = "vspeed";
						sourceScale = 1;
						align = "left";
						scale = 1;
						pos[] = {{ 0.9,0.54 },1};
						right[] = {{ 0.95,0.54 },1};
						down[] = {{ 0.9,0.575 },1};
					};
					class AltStatic50
					{
						type = "text";
						source = "static";
						text = "50";
						scale = 1;
						sourceScale = 1;
						align = "right";
						pos[] = {{ 0.88,0.183 },1};
						right[] = {{ "0.880 + 0.04",0.183 },1};
						down[] = {{ 0.88,"0.183 + 0.03" },1};
					};
					class AltStatic0
					{
						type = "text";
						source = "static";
						text = "0";
						scale = 1;
						sourceScale = 1;
						align = "right";
						pos[] = {{ 0.88,0.508 },1};
						right[] = {{ "0.880 + 0.04",0.508 },1};
						down[] = {{ 0.88,"0.508 + 0.03" },1};
					};
					class VspeedNumberStaticP15
					{
						type = "text";
						source = "static";
						text = "+15";
						scale = 1;
						sourceScale = 1;
						align = "right";
						pos[] = {{ 0.93,0.583 },1};
						right[] = {{ "0.930 + 0.04",0.583 },1};
						down[] = {{ 0.93,"0.583 + 0.03" },1};
					};
					class VspeedNumberStatic0
					{
						type = "text";
						source = "static";
						text = " 0";
						scale = 1;
						sourceScale = 1;
						align = "right";
						pos[] = {{ 0.93,0.703 },1};
						right[] = {{ "0.930 + 0.04",0.703 },1};
						down[] = {{ 0.93,"0.703 + 0.03" },1};
					};
					class VspeedNumberStaticM15
					{
						type = "text";
						source = "static";
						text = "-15";
						scale = 1;
						sourceScale = 1;
						align = "right";
						pos[] = {{ 0.93,0.823 },1};
						right[] = {{ "0.930 + 0.04",0.823 },1};
						down[] = {{ 0.93,"0.823 + 0.03" },1};
					};
					class HeadingNumber
					{
						type = "text";
						source = "heading";
						sourceScale = 1;
						align = "center";
						scale = 1;
						pos[] = {{ 0.5,0.0 },1};
						right[] = {{ 0.58,0.0 },1};
						down[] = {{ 0.5,0.05 },1};
					};
					class HeadingScale
					{
						type = "scale";
						horizontal = 1;
						source = "heading";
						sourceScale = 1;
						width = 4.0;
						top = 0.3;
						center = 0.5;
						bottom = 0.7;
						lineXleft = 0.11;
						lineYright = 0.1;
						lineXleftMajor = 0.11;
						lineYrightMajor = 0.09;
						majorLineEach = 5;
						numberEach = 5;
						step = "18 / 9";
						stepSize = "(0.70 - 0.3) / 15";
						align = "center";
						scale = 1;
						pos[] = {0.3,"0.00 + 0.05"};
						right[] = {0.36,"0.00 + 0.05"};
						down[] = {0.3,"0.04 + 0.05"};
					};
					class Static
					{
						type = "line";
						width = 4.0;
						points[] = {{ "HorizonBank2",{ -0.16,6.95351e-009 },1,"ForwardVec",1 },{ "HorizonBank2",{ -0.21,9.12648e-009 },1,"ForwardVec",1 },{  },{ "HorizonBank2",{ -0.154548,0.0411724 },1,"ForwardVec",1 },{ "HorizonBank2",{ -0.202844,0.0540387 },1,"ForwardVec",1 },{  },{ "HorizonBank2",{ -0.138564,0.0795389 },1,"ForwardVec",1 },{ "HorizonBank2",{ -0.181865,0.104395 },1,"ForwardVec",1 },{  },{ "HorizonBank2",{ -0.08,0.137765 },1,"ForwardVec",1 },{ "HorizonBank2",{ -0.105,0.180817 },1,"ForwardVec",1 },{  },{ "HorizonBank2",{ 0.08,0.137765 },1,"ForwardVec",1 },{ "HorizonBank2",{ 0.105,0.180817 },1,"ForwardVec",1 },{  },{ "HorizonBank2",{ 0.138564,0.0795389 },1,"ForwardVec",1 },{ "HorizonBank2",{ 0.181865,0.104395 },1,"ForwardVec",1 },{  },{ "HorizonBank2",{ 0.154548,0.0411724 },1,"ForwardVec",1 },{ "HorizonBank2",{ 0.202844,0.0540387 },1,"ForwardVec",1 },{  },{ "HorizonBank2",{ 0.16,6.95351e-009 },1,"ForwardVec",1 },{ "HorizonBank2",{ 0.21,9.12648e-009 },1,"ForwardVec",1 },{  },{ "HorizonBank2",{ -0.159391,0.0138645 },1,"ForwardVec",1 },{ "HorizonBank2",{ -0.184296,0.0160309 },1,"ForwardVec",1 },{  },{ "HorizonBank2",{ -0.157569,0.0276236 },1,"ForwardVec",1 },{ "HorizonBank2",{ -0.182189,0.0319398 },1,"ForwardVec",1 },{  },{ "HorizonBank2",{ 0.157569,0.0276236 },1,"ForwardVec",1 },{ "HorizonBank2",{ 0.182189,0.0319398 },1,"ForwardVec",1 },{  },{ "HorizonBank2",{ 0.159391,0.0138645 },1,"ForwardVec",1 },{ "HorizonBank2",{ 0.184296,0.0160309 },1,"ForwardVec",1 },{  },{ "SliderAltitudeSource",{ -0.015,0.01 },1 },{ "SliderAltitudeSource",{ 0.0,0.0 },1 },{ "SliderAltitudeSource",{ -0.015,-0.01 },1 },{ "SliderAltitudeSource",{ -0.015,0.01 },1 },{  },{ { 0.85,"0.2 + 0 * 0.065" },1 },{ { 0.85,"0.2 + 5 * 0.065" },1 },{  },{ { 0.85,"0.2 + 0 * 0.065" },1 },{ { 0.87,"0.2 + 0 * 0.065" },1 },{  },{ { 0.86,"0.2 + 1 * 0.065" },1 },{ { 0.87,"0.2 + 1 * 0.065" },1 },{  },{ { 0.86,"0.2 + 2 * 0.065" },1 },{ { 0.87,"0.2 + 2 * 0.065" },1 },{  },{ { 0.86,"0.2 + 3 * 0.065" },1 },{ { 0.87,"0.2 + 3 * 0.065" },1 },{  },{ { 0.86,"0.2 + 4 * 0.065" },1 },{ { 0.87,"0.2 + 4 * 0.065" },1 },{  },{ { 0.85,"0.2 + 5 * 0.065" },1 },{ { 0.87,"0.2 + 5 * 0.065" },1 },{  },{ "SliderVSpeedSource",{ -0.015,0.01 },1 },{ "SliderVSpeedSource",{ 0.0,0.0 },1 },{ "SliderVSpeedSource",{ -0.015,-0.01 },1 },{ "SliderVSpeedSource",{ -0.015,0.01 },1 },{  },{ { 0.9,"0.6 - 0.3 * 0.04" },1 },{ { 0.9,"0.6 + 6.3 * 0.04" },1 },{  },{ { 0.9,"0.6 + 0 * 0.04" },1 },{ { 0.92,"0.6 + 0 * 0.04" },1 },{  },{ { 0.91,"0.6 + 1 * 0.04" },1 },{ { 0.92,"0.6 + 1 * 0.04" },1 },{  },{ { 0.91,"0.6 + 2 * 0.04" },1 },{ { 0.92,"0.6 + 2 * 0.04" },1 },{  },{ { 0.9,"0.6 + 3 * 0.04" },1 },{ { 0.92,"0.6 + 3 * 0.04" },1 },{  },{ { 0.91,"0.6 + 4 * 0.04" },1 },{ { 0.92,"0.6 + 4 * 0.04" },1 },{  },{ { 0.91,"0.6 + 5 * 0.04" },1 },{ { 0.92,"0.6 + 5 * 0.04" },1 },{  },{ { 0.9,"0.6 + 6 * 0.04" },1 },{ { 0.92,"0.6 + 6 * 0.04" },1 }};
					};
					class Weapons
					{
						type = "text";
						source = "weapon";
						sourceScale = 1;
						align = "right";
						scale = 0.5;
						pos[] = {{ 0.1,0.88 },1};
						right[] = {{ "0.16 - 0.02",0.88 },1};
						down[] = {{ 0.1,0.92 },1};
					};
					class Ammo
					{
						type = "text";
						source = "ammo";
						sourceScale = 1;
						align = "right";
						scale = 0.5;
						pos[] = {{ 0.1,0.83 },1};
						right[] = {{ "0.16 - 0.02",0.83 },1};
						down[] = {{ 0.1,0.87 },1};
					};
				};
			};
		};
		class Reflectors: Reflectors
		{
			class Right
			{
				color[] = {7000,7500,10000};
				ambient[] = {70,75,100};
				intensity = 50;
				size = 1;
				innerAngle = 15;
				outerAngle = 65;
				coneFadeCoef = 10;
				position = "Light_R_pos";
				direction = "Light_R_dir";
				hitpoint = "Light_R_hitpoint";
				selection = "Light_R";
				useFlare = 1;
				flareSize = 10;
				flareMaxDistance = 250;
				dayLight = 0;
				class Attenuation
				{
					start = 0;
					constant = 0;
					linear = 1;
					quadratic = 1;
					hardLimitStart = 100;
					hardLimitEnd = 200;
				};
			};
			class Left: Right
			{
				position = "Light_L_pos";
				direction = "Light_L_dir";
				hitpoint = "Light_L_hitpoint";
				selection = "Light_L";
			};
		};
		aggregateReflectors[] = {{ "Left","Right" }};
		numberPhysicalWheels = 3;
		class pilotCamera
		{
			class OpticsIn
			{
				class Wide
				{
					opticsDisplayName = "W";
					initAngleX = 0;
					minAngleX = 0;
					maxAngleX = 0;
					initAngleY = 0;
					minAngleY = 0;
					maxAngleY = 0;
					initFov = 0.5;
					minFov = 0.5;
					maxFov = 0.5;
					directionStabilized = 1;
					visionMode[] = {"Normal","NVG"};
					thermalMode[] = {0,1};
					gunnerOpticsModel = "A3\drones_f\Weapons_F_Gamma\Reticle\UAV_Optics_Gunner_wide_F.p3d";
				};
				showMiniMapInOptics = 0;
				showUAVViewpInOptics = 0;
				showSlingLoadManagerInOptics = 1;
			};
			minTurn = 0;
			maxTurn = 0;
			initTurn = 0;
			minElev = 80;
			maxElev = 80;
			initElev = 80;
			maxXRotSpeed = 0.5;
			maxYRotSpeed = 0.5;
			pilotOpticsShowCursor = 1;
			controllable = 0;
		};
		memoryPointDriverOptics = "slingCamera";
		class textureSources
		{
			class opfor
			{
				displayname = "OPFOR";
				author = "$STR_A3_Bohemia_Interactive";
				textures[] = {"\A3\Air_F\Heli_Light_02\Data\Heli_Light_02_ext_OPFOR_CO.paa"};
				faction[] = {"OPF_F"};
			};
			class black
			{
				displayname = "Black";
				author = "$STR_A3_Bohemia_Interactive";
				textures[] = {"\A3\Air_F\Heli_Light_02\Data\Heli_Light_02_ext_CO.paa"};
				faction[] = {"OPF_F"};
			};
			class blackcustom
			{
				displayname = "Black custom";
				author = "$STR_A3_Bohemia_Interactive";
				textures[] = {"\A3\Air_F_Heli\Heli_Light_02\Data\Heli_Light_02_ext_OPFOR_V2_CO.paa"};
				faction[] = {"OPF_F"};
			};
		};
	};
	class Heli_Light_02_unarmed_base_F: Heli_Light_02_base_F
	{
		forceInGarage = 1;
		availableForSupportTypes[] = {"Drop","Transport"};
		weapons[] = {};
		magazines[] = {};
		class AnimationSources: AnimationSources
		{
			class Proxy: Proxy
			{
				initPhase = 1;
			};
			class Missiles_revolving: Missiles_revolving
			{
				initPhase = 1;
			};
		};
	};
	class O_Heli_Light_02_F: Heli_Light_02_base_F
	{
		author = "$STR_A3_Bohemia_Interactive";
		_generalMacro = "O_Heli_Light_02_F";
		scope = 2;
		side = 0;
		faction = "OPF_F";
		crew = "O_helipilot_F";
		accuracy = 1.5;
		icon = "\A3\Air_F\Heli_Light_02\Data\UI\Map_Heli_Light_02_rockets_CA.paa";
		picture = "\A3\Air_F\Heli_Light_02\Data\UI\Heli_Light_02_rockets_CA.paa";
		hiddenSelectionsTextures[] = {"A3\Air_F\Heli_Light_02\Data\Heli_Light_02_ext_OPFOR_CO"};
		availableForSupportTypes[] = {"Drop","Transport","CAS_Heli"};
		cost = 2000000;
		threat[] = {0.6,0.8,0.5};
		textureList[] = {"opfor",1};
	};
	class O_Heli_Light_02_unarmed_F: Heli_Light_02_unarmed_base_F
	{
		author = "$STR_A3_Bohemia_Interactive";
		_generalMacro = "O_Heli_Light_02_unarmed_F";
		displayName = "$STR_A3_CfgVehicles_O_Heli_Light_02_Unarmed_F0";
		scope = 2;
		side = 0;
		faction = "OPF_F";
		crew = "O_helipilot_F";
		accuracy = 1.5;
		hiddenSelectionsTextures[] = {"A3\Air_F\Heli_Light_02\Data\Heli_Light_02_ext_CO.paa"};
		cost = 900000;
		threat[] = {0.3,0.2,0.3};
		radarType = 8;
		textureList[] = {"black",1};
	};
	class O_Heli_Light_02_v2_F: Heli_Light_02_base_F
	{
		features = "Randomization: No						<br />Camo selections: 2 - the whole exterior, missile pod						<br />Script door sources: No						<br />Script animations: Doors, HideWeapon, proxy						<br />Executed scripts: None 						<br />Firing from vehicles: No						<br />Slingload: Slingloads up to 2000 kg						<br />Cargo proxy indexes: 1 to 8";
		author = "$STR_A3_Bohemia_Interactive";
		_generalMacro = "O_Heli_Light_02_v2_F";
		displayName = "$STR_A3_CfgVehicles_O_Heli_Light_02_v2_F0";
		scope = 2;
		side = 0;
		faction = "OPF_F";
		crew = "O_helipilot_F";
		accuracy = 1.5;
		icon = "\A3\Air_F\Heli_Light_02\Data\UI\Map_Heli_Light_02_rockets_CA.paa";
		picture = "\A3\Air_F\Heli_Light_02\Data\UI\Heli_Light_02_rockets_CA.paa";
		cost = 2000000;
		weapons[] = {"LMG_Minigun_heli","missiles_DAR","CMFlareLauncher"};
		magazines[] = {"2000Rnd_65x39_Belt_Tracer_Green_Splash","12Rnd_missiles","168Rnd_CMFlare_Chaff_Magazine"};
		radarType = 8;
		hiddenSelections[] = {"camo1","camo2"};
		hiddenSelectionsTextures[] = {"\A3\Air_F_Heli\Heli_Light_02\Data\Heli_Light_02_ext_OPFOR_V2_CO.paa","\A3\Air_F_Heli\Heli_Light_02\Data\Rockets_CO.paa"};
		availableForSupportTypes[] = {"Drop","Transport","CAS_Heli"};
		class AnimationSources: AnimationSources
		{
			class Missiles_revolving
			{
				source = "revolving";
				weapon = "missiles_DAR";
			};
		};
		textureList[] = {"blackcustom",1};
	};
};
//};
