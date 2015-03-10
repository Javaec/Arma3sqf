if (!Bis_DebugMode) then
{
	[] spawn {
		scriptName "initMission.hpp: mission start";

		["a3\missions_f\video\helicopters.ogv","STR_A3_SHOWCASE_HELICOPTERS_TITLECARD"] spawn BIS_fnc_titlecard;	// Todo: enable only showing it once
		waitUntil {!(isNil "BIS_fnc_titlecard_finished")};

		[[1879.289,5618.516,0], localize "STR_A3_Showcase_Helicopters_SITREP_text",450,nil,120,1] spawn BIS_fnc_establishingShot;

		//un-freeze the ambient helicopters
		Bis_Units_UavShot call Bis_enableUnit;
	};
};

//friendly-fire monitor
[] spawn
{
	sleep 0.01;		//wait for player to enter 3d scene


	waitUntil
	{
		sleep 1;

		(side BIS_player == sideEnemy) || (Bis_MissionAborted) || !(canMove Bis_Heli)
	};

	if (side BIS_player == sideEnemy) then
	{
		Bis_MissionAborted = true;

		sleep 5;

		[[missionName, 3],false] call Bis_fnc_endMission;
	};
};

//helicopter state monitor
[] spawn
{
	private["_fn_isInWater"];

	_fn_isInWater =
	{
		private["_asl"];

		_asl = getposasl _this;

		if ((surfaceIsWater _asl) && (_asl select 2 < -0.7)) exitWith
		{
			true
		};

		false
	};

	sleep 0.1;		//wait for player to enter 3d scene

	waitUntil
	{
		sleep 1;

		!(canMove vehicle player) || (Bis_Heli call _fn_isInWater)
	};

	Bis_MissionAborted = true;

	//end mission immediately, if helicopter drops into water
 	if (Bis_Heli call _fn_isInWater) exitWith
 	{
 		[[missionName, 2],false] call Bis_fnc_endMission;
 	};

	if !(canMove player) exitWith
	{
		(vehicle player) setDamage 1;
		(player) setDamage 1;
	};

	waitUntil{(isTouchingGround vehicle player) || (Bis_AtHome)};

	sleep 10;

	if (Bis_AtHome) exitWith {};

	[[missionName, 2],false] call Bis_fnc_endMission;
};

//set group identities
Bis_AirBase 		setGroupId [localize "str_a3_group_griffin"];
Bis_GrpPlayer 		setGroupId [localize "str_a3_group_hydra"];
Bis_GrpCoPilot 		setGroupId [localize "str_a3_group_hydracopilot"];
Bis_GrpStrikeTeam 	setGroupId [localize "str_a3_group_viperred"];

//set actor identity for conversations
player setIdentity "Yousuf";

//unit grouping for FPS optimalization
//Bis_Units_CampRogainArea = nearestObjects [Bis_CampRogainTrigger,["O_Soldier_base_F"],100];
Bis_Units_CampRogainArea = [];

Bis_Units_UavShot =
[
	Bis_UavAmbientHeli
];

Bis_Units_StartupScene =
[
	Bis_GrpStrikeTeam2,Bis_GrpStrikeTeam3,
	Bis_AmbientHeli1,Bis_AmbientHeli2
];

Bis_Units_EnemyCars =
[
	Bis_GrpEnemyTransport,Bis_GrpEnemyTransport1Cargo,Bis_GrpEnemyTransport2Cargo
];

Bis_Units_Mike26Area =
[
	Bis_GrpMikeAttackers,
	Bis_GrpMikeDefenders1,Bis_GrpMikeDefenders2
];

Bis_Units_KaminoArea =
[
	Bis_GrpKaminoAttackers1,Bis_GrpKaminoAttackers2

] + (nearestObjects [Bis_KaminoBase,["O_Soldier_base_F"],100]);



//lock non-player helicopters
{
	_x lock true;
	_x action ["EngineOn", _x];
	_x flyInHeight 0;
}
forEach [Bis_Heli2,Bis_Heli3];

//setup player helicopter
Bis_Player assignAsDriver Bis_Heli;
Bis_CoPilot assignAsTurret [Bis_Heli,[0]];
Bis_CoPilot moveInTurret [Bis_Heli,[0]];

//move player's cargo squad into the helicopter
{
	_x assignAsCargo Bis_Heli;
	_x moveInCargo Bis_Heli;
}
forEach (units Bis_GrpStrikeTeam);

//slow helicopters down "a bit"
Bis_Heli2 limitSpeed 150; Bis_Heli3 limitSpeed 150;

//load enemy troops to transport vehicles
private["_vehicle"];

{
	_group = _x;
	_units = units _x;

	_vehicle = [Bis_EnemyTransport1,Bis_EnemyTransport2] select _forEachIndex;

	{
		_x assignAsCargo _vehicle;
		_x moveInCargo _vehicle;
		_x setCaptive true;
	}
	forEach _units;
}
forEach [Bis_GrpEnemyTransport1Cargo,Bis_GrpEnemyTransport2Cargo];

//start alarm sound on the air base
[Bis_AirBase,10,{player distance Bis_AirBase < 500}] spawn Bis_createAlarm;

//store helicopter starting ammo
/*
{
	["%1 = %2",_x, Bis_Heli ammo _x] call Bis_debugLogF;

	Bis_Heli setVariable [_x, Bis_Heli ammo _x];
}
forEach (weapons Bis_Heli);
*/

/*
[5624] string "Debug >> LMG_Minigun = 2000"
[5624] string "Debug >> missiles_DAGR = 12"
*/

//start ammo monitoring thread
[] spawn
{
	private["_max","_current","_bullets","_missiles","_progress","_currentTask"];

	_missiles = Bis_Heli ammo "missiles_DAGR";
	_bullets = Bis_Heli ammo "LMG_Minigun";

	_max = (_missiles * 200) + _bullets;

	while {!Bis_MissionAborted} do
	{
		//detect helicopter is running low on ammo || player is sent to resupply
		waitUntil
		{
			sleep 3;

			_missiles = Bis_Heli ammo "missiles_DAGR";
			_bullets = Bis_Heli ammo "LMG_Minigun";

			_current = (_missiles * 200) + _bullets;

			((_current/_max < 0.5) || (Bis_SendToRessuply))
		};

		//play the conversation & do the task stuff, if not send there by
		if !(Bis_SendToRessuply) then
		{
			["LOW_ON_AMMO"] call BIS_fnc_missionConversations;

			waitUntil
			{
				sleep 0.3;

				([Bis_Heli,Bis_HelipadCampRogain,20] call BIS_hasLanded)
			};
		}
		else
		{
			waitUntil
			{
				sleep 0.3;

				([Bis_Heli,Bis_HelipadCampRogain,20] call BIS_hasLanded) && (Bis_LandedAtRogainPlayed)
			};
		};

		[] call Bis_resupply;

		sleep 1;

		if !(Bis_SendToRessuply) then
		{
			["LOW_ON_AMMO_RESUPPLIED"] call BIS_fnc_missionConversations;

			//re-select the current task, if player changed the task to the "RESUPPLY"
			_currentTask = player call Bis_fnc_taskCurrent; [_currentTask,"CURRENT"] call BIS_fnc_missionTasks;
		}
		else
		{
			//complete the 'generic' resupply task if exists together with the 'core' resupply task
			if ("RESUPPLY_LOW_ON_AMMO" call BIS_fnc_taskExists) then
			{
				if (("RESUPPLY_LOW_ON_AMMO" call BIS_fnc_taskState) in ["SUCCEEDED","FAILED","CANCELED"]) exitWith {};

				["RESUPPLY_LOW_ON_AMMO","SUCCEEDED"] call BIS_fnc_missionTasks;
			};

			Bis_Resupplied = true;
			Bis_SendToRessuply = false;
		};

		hintSilent "";
	};
};

//add cheats for debug mode
if (Bis_DebugMode) then
{
	//teleport to Mike-26 landing pad
	[] spawn
	{
		while {!Bis_MissionAborted} do
		{

			waitUntil
			{
				sleep 0.1; false
			};

			//cheat3 = false;

			Bis_Heli setPos getPos Bis_HelipadMike26;
			Bis_Heli setVelocity [0,0,0];
		};
	};

	//teleport to Camp Rogain landing pad
	[] spawn
	{
		while {!Bis_MissionAborted} do
		{

			waitUntil
			{
				sleep 0.1; false
			};

			//cheat4 = false;

			Bis_Heli setPos getPos Bis_HelipadCampRogain;
			Bis_Heli setVelocity [0,0,0];
		};
	};
};

//initial freeze
[
	Bis_Units_UavShot,
	Bis_Units_StartupScene,

	Bis_Units_Mike26Area,
	Bis_Units_KaminoArea,
	Bis_Units_CampRogainArea,

	Bis_Units_EnemyCars,

	Bis_GrpConvoyCampRogain

] call Bis_disableUnit;