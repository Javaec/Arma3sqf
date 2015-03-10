//conversation playlist
if (isNil "Bis_PlayList") then
{
	Bis_PlayList = [];
	Bis_Skippable = ["IDLE_TAKEOFF","IDLE_GETIN"];
};

#define BASE		Bis_AirBase
#define PILOT		Bis_Player
#define COPILOT		Bis_CoPilot
#define SPECOPS		(leader Bis_GrpStrikeTeam)

#define PLAY {}

#define PLAY2\
{\
	private["_entity","_content","_gap"];\
	\
	if ((count Bis_PlayList > 0) && (_mode in Bis_Skippable)) exitWith {};\
	\
	["[%1] Bis_PlayList = %2 + [""%1""]",_mode,Bis_PlayList] call Bis_debugLogF;\
	Bis_PlayList set [count Bis_PlayList, _mode];\
	/*["[%1] Bis_PlayList = %2",_mode,Bis_PlayList] call Bis_debugLogF;*/\
	\
	waitUntil{sleep 0.1; (Bis_PlayList select 0) == _mode};\
	["[%1] PLAYING...!",_mode] call Bis_debugLogF;\
	\
	for "_line" from 0 to ((count _this) - 1) do\
	{\
		if (Bis_MissionAborted && _mode != "MISSION_ABORTED") exitWith {};\
		\
		_entity  = (_this select _line) select 0;\
		_content = (_this select _line) select 1;\
		_gap	 = [_this select _line,2,4] call BIS_fnc_param;\
		\
		_entity sideChat _content;\
		\
		sleep _gap;\
	};\
	\
	hintSilent "";\
	["[%1] STOPPED!",_mode] call Bis_debugLogF;\
	\
	/*["[%1] Bis_PlayList = %2 - [""%1""]",_mode,Bis_PlayList] call Bis_debugLogF;*/\
	Bis_PlayList = Bis_PlayList - [_mode];\
	/*["[%1] Bis_PlayList = %2",_mode,Bis_PlayList] call Bis_debugLogF;*/\
};

//["01_Intro","Showcase_Helicopters"] call Bis_playConversation;
Bis_playConversation =
{
	if (Bis_MissionAborted) exitWith {};

	_this call bis_fnc_kbTell;
};

//--------------------------------------------------------------------------------------------------
// INITIAL CONVERSATIONS @ AIRBASE
//--------------------------------------------------------------------------------------------------

case "INTRO":
{
	sleep 1;

	/*
	[
		[BASE, "All to the vehicles!"],
		[BASE, "We got enemy at Kamino sector. Base is under heavy attack."]

	] call PLAY;
	*/

	_kb = ["01_Intro","Showcase_Helicopters",nil,"side"] call Bis_playConversation;

	//hint: show 1x
	[] spawn
	{
		private["_pos"];

		_pos = getPos player;

		sleep 10;

		if ((getPos player) distance _pos < 1) Then
		{
			["InfantryMovement", "BasicMove"] spawn Bis_showAdvHint;
		};
	};
};

case "IN_HELI":
{
	/*
	[
		[BASE, 	"Drop the cargo at the Kamino base and wait for more intel."],
		[PILOT,	"Roger.", 1]

	] call PLAY;
	*/

	["Vehicle", "VehicleGUI"] spawn Bis_showAdvHint;

	_kb = ["05_In_Heli","Showcase_Helicopters",nil,"side"] call Bis_playConversation;
};

case "IDLE_GETIN":
{
	/*
	[
		[BASE, "Get into the chopper. Now!"]

	] call PLAY;
	*/

	_kb = ["x05_Idle_Getin","Showcase_Helicopters",nil,"side"] call Bis_playConversation;

	["Vehicle", "Entering", 1] spawn Bis_showAdvHint;
};

case "IDLE_TAKEOFF":
{
	/*
	[
		[COPILOT, "Hurry, start it up!"],
		[COPILOT, "We need to take off ASAP."]

	] call PLAY;
	*/

	//it is acctually idle_takeoff :)
	_kb = ["x05_Idle_Getin","Showcase_Helicopters"] call Bis_playConversation;

	["Vehicle", "TakeOff", 1] spawn Bis_showAdvHint;
};

//--------------------------------------------------------------------------------------------------
// RUNNING LOW ON AMMO? -> RESSUPLY
//--------------------------------------------------------------------------------------------------

case "LOW_ON_AMMO":
{
	/*
	[
		[PILOT, "Hydra reporting, we are running low on ammo."],
		[BASE, 	"Be advice, resupply is available at Camp Rogain."]

	] call PLAY;
	*/

	_kb = ["x10_Low_on_ammo","Showcase_Helicopters",nil,"side"] call Bis_playConversation;

	["RESUPPLY_LOW_ON_AMMO"] call BIS_fnc_missionTasks;
	["RESUPPLY_LOW_ON_AMMO","CREATED"] call BIS_fnc_missionTasks;
};

case "LOW_ON_AMMO_RESUPPLIED":
{
	/*
	[
		[PILOT, "Hydra is fully resupplied."],
		[PILOT, "All systems ready!"]

	] call PLAY;
	*/

	_kb = ["53_Resupplied","Showcase_Helicopters",nil,"side"] call Bis_playConversation;

	["RESUPPLY_LOW_ON_AMMO","SUCCEEDED"] call BIS_fnc_missionTasks;
};

//--------------------------------------------------------------------------------------------------
// ENEMY VEHICLES
//--------------------------------------------------------------------------------------------------

case "ENEMY_VEHICLES_REVEALED":
{
	/*
	[
		[BASE, 	"We got 2 enemy vehicles west of the Mike-26 base. Uploading data ..."],
		[BASE, 	"Engage and destroy those vehicles!"],
		[PILOT, "Roger."]

	] call PLAY;
	*/

	_kb = ["10_Enemy_vehicles_revealed","Showcase_Helicopters",nil,"side"] call Bis_playConversation;

	["Vehicle", "Firing", 2] spawn Bis_showAdvHint;

	//give corresponding tasks
	["DEFEND_BASE"] call BIS_fnc_missionTasks;
	["DESTROY_ENEMY_VEHICLES"] call BIS_fnc_missionTasks;
};

//1st vehicle is destroyed
case "ENEMY_VEHICLE_DESTROYED":
{
	/*
	[
		[PILOT, "Vehicle destroyed!"]

	] call PLAY;
	*/

	_kb = ["15_Enemy_vehicle_destroyed","Showcase_Helicopters",nil,"side"] call Bis_playConversation;
};

//2nd vehicle is destroyed
case "ENEMY_VEHICLES_DESTROYED":
{
	/*
	[
		[PILOT, "Vehicles are destroyed."],
		[BASE, 	"Good job!"]

	] call PLAY;
	*/

	_kb = ["20_Enemy_vehicles_destroyed","Showcase_Helicopters",nil,"side"] call Bis_playConversation;

	//handle corresponding task
	["DESTROY_ENEMY_VEHICLES","SUCCEEDED"] call BIS_fnc_missionTasks;

	if !(Bis_debugMode) then
	{
		[] spawn
		{
			sleep 15; if (canMove Bis_Heli) then {saveGame;};
		};
	};
};

//1 or 2 vehicles reached final WP
//+ player witnesses the troops being unloaded or not
case "ENEMY_VEHICLES_NEAR_BASE":
{
	//player witnesses the troops being unloaded
	if ({[BIS_Heli,_x] call BIS_getHasLos} count [Bis_EnemyTransport1,Bis_EnemyTransport2] > 0) then
	{
		//2 cars are alive
		if ({canMove _x} count [Bis_EnemyTransport1,Bis_EnemyTransport2] == 2) then
		{
			/*
			[
				[PILOT, "Hydra reporting ... both vehicles stopped north of Mike-26."],
				[PILOT, "Enemy troops are disembarking, moving towards Mike-26."],
				[BASE,  "Roger."]

			] call PLAY;
			*/

			_kb = ["x15_Enemy_vehicles_near_base_both_alive","Showcase_Helicopters",nil,"side"] call Bis_playConversation;
		}
		//1 car are alive
		else
		{
			/*
			[
				[PILOT, "Hydra reporting ... the vehicle stopped north of Mike-26."],
				[PILOT, "Enemy troops are disembarking, moving towards Mike-26."],
				[BASE,  "Roger."]

			] call PLAY;
			*/

			_kb = ["x20_Enemy_vehicles_near_base_one_alive","Showcase_Helicopters",nil,"side"] call Bis_playConversation;
		};
	}
	//player cannot see the vehicles, msg is transmitted from HQ
	else
	{
		/*
		[
			[BASE, "The vehicles stopped near Mike-26 base."],
			[BASE, "We've some infantry movement around."]

		] call PLAY;
		*/

		_kb = ["x25_Enemy_vehicles_near_base_reported_by_hq","Showcase_Helicopters",nil,"side"] call Bis_playConversation;
	};

	//cancel task
	["DESTROY_ENEMY_VEHICLES","FAILED"] call BIS_fnc_missionTasks;
};

//--------------------------------------------------------------------------------------------------
// MORTARS @ MIKE-26
//--------------------------------------------------------------------------------------------------
case "BOMBARDMENT_STARTED":
{
	if ({canMove _x} count [Bis_Mortar1,Bis_Mortar2] > 0) then
	{
		//sent to land
		if ((("DEPLOY_TROOPS" call BIS_fnc_taskState) == "ASSIGNED") && !Bis_LandedAtMike26) then
		{
			/*
			[
				[PILOT, "FUCK! WE ARE UNDER ATTACK!"],
				[PILOT, "I repeat, Mike-26 is under mortar attack. We cannot land in!"],
				[BASE, 	"Got it. Find the mortars and destroy them."]

			] call PLAY;
			*/

			_kb = ["25_bombardment_started_while_landing","Showcase_Helicopters",nil,"side"] call Bis_playConversation;
		}
		else
		{
			/*
			[
				[BASE, "Enemy mortar fire on Mike-26!"],
				[BASE, "Hydra, search for the mortar emplacements and destroy them!"],
				[PILOT, "Oscar Mike."]

			] call PLAY;
			*/

			_kb = ["x30_Bombardment_started_reported_by_hq","Showcase_Helicopters",nil,"side"] call Bis_playConversation;
		};

		//give parent task
		["DESTROY_MORTARS"] call BIS_fnc_missionTasks;
	};
};

case "MORTARS_DETECTED":
{
	/*
	[
		[PILOT, "Hydra reporting ... we spotted enemy mortar emplacement at Mike-26 sector."],
		[BASE, "Roger. Hydra, engage the enemy and destroy the mortars."]

	] call PLAY;
	*/

	_kb = ["x35_Mortars_detected","Showcase_Helicopters",nil,"side"] call Bis_playConversation;

	["Vehicle", "Firing", 2] spawn Bis_showAdvHint;

	//give related task
	["DESTROY_MORTARS"] call BIS_fnc_missionTasks;
};

case "MORTARS_DESTROYED":
{
	/*
	[
		[PILOT, "The mortars are destroyed!"]

	] call PLAY;
	*/

	_kb = ["30_Mortars_destroyed","Showcase_Helicopters",nil,"side"] call Bis_playConversation;

	//give relevant task
	["DESTROY_MORTARS","SUCCEEDED"] call BIS_fnc_missionTasks;
};

//--------------------------------------------------------------------------------------------------
// COMBAT @ MIKE-26
//--------------------------------------------------------------------------------------------------

case "LAND_AT_MIKE26":
{
	/*
	if ({canMove _x} count [Bis_EnemyTransport1,Bis_EnemyTransport2] > 0) then
	{
		[
			[BASE, 	"Hydra, unload Viper at the base and await further orders."],
			[PILOT,	"Roger."]

		] call PLAY;
	}
	else
	{
		[
			[BASE, 	"We got an enemy movement around Mike-26."],
			[BASE, 	"Hydra, unload Viper at the base and await further orders."],
			[PILOT,	"Roger."]

		] call PLAY;
	};
	*/

	if ({canMove _x} count [Bis_EnemyTransport1,Bis_EnemyTransport2] == 0) then
	{
		_kb = ["x40_Land_at_mike26_intro","Showcase_Helicopters",nil,"side"] call Bis_playConversation;
	};

	_kb = ["35_Land_at_mike26","Showcase_Helicopters",nil,"side"] call Bis_playConversation;

	//cancel obsolete tasks
	["FLY_TO_KAMINO","CANCELED"] call BIS_fnc_missionTasks;
	["UNLOAD","CANCELED"] call BIS_fnc_missionTasks;
	["TRANSPORT","CANCELED"] call BIS_fnc_missionTasks;

	//give unload troops task
	["DEPLOY_TROOPS"] call BIS_fnc_missionTasks;
};

case "LANDED_AT_MIKE26":
{
	/*
	[
		[PILOT, 	"Hydra has landed at Mike-26."],
		[PILOT, 	"Viper. Go. Go. Go."]

	] call PLAY;
	*/

	_kb = ["40_Landed_at_mike26","Showcase_Helicopters"] call Bis_playConversation;
};

case "LAND_AT_MIKE26_AFTER_MORTARS":
{
	/*
	[
		[BASE,  "Hydra, deploy Viper at Mike-26 and report back."],
		[PILOT, "Oscar Mike."]

	] call PLAY;
	*/

	_kb = ["x45_Land_at_mike26_after_mortars","Showcase_Helicopters",nil,"side"] call Bis_playConversation;

	//give unload troops task
	["DEPLOY_TROOPS"] call BIS_fnc_missionTasks;
	["DEPLOY_TROOPS","CURRENT"] call BIS_fnc_missionTasks;
};

case "LANDED_AT_CAMP_ROGAIN":
{
	/*
	[
		[PILOT, 	"Hydra has landed at Camp Rogain and is rearming..."]

	] call PLAY;
	*/

	_kb = ["x50_Landed_at_camp_rogain","Showcase_Helicopters",nil,"side"] call Bis_playConversation;

	sleep 1;

	Bis_LandedAtRogainPlayed = true;

	//["Vehicle", "VehicleRearm"] spawn Bis_showAdvHint;
};

case "SQUAD_UNLOADED":
{
	/*
	[
		[PILOT, 	"Viper deployed!"]

	] call PLAY;
	*/

	_kb = ["45_Squad_unloaded","Showcase_Helicopters",nil,"side"] call Bis_playConversation;

	//complete a sub-task
	["DEPLOY_TROOPS","SUCCEEDED"] call BIS_fnc_missionTasks;

	//wait for mortars to be destroyed
	waitUntil{{canMove _x} count [Bis_Mortar1,Bis_Mortar2] == 0};

	sleep 1;

	//complete parent task
	["DEFEND_BASE","SUCCEEDED"] call BIS_fnc_missionTasks;
};

case "RESUPPLY":
{
	Bis_SendToRessuply = true;

	/*
	[
		[BASE, 		"Good, take off and resupply at Camp Rogain."],
		[BASE, 		"You'll get more intel when you get ready."]

	] call PLAY;
	*/

	_kb = ["50_Resuppy","Showcase_Helicopters",nil,"side"] call Bis_playConversation;

	sleep 1;

	//give re-supply task
	["RESUPPLY"] call BIS_fnc_missionTasks;

	if !(Bis_debugMode) then
	{
		[] spawn {sleep 5;saveGame;};
	};
};

case "RESUPPLIED":
{
	/*
	[
		[PILOT, "Hydra reports - we are full on ammo & fuel."],
		[PILOT, "Ready to liff of!"]

	] call PLAY;
	*/

	_kb = ["53_Resupplied","Showcase_Helicopters",nil,"side"] call Bis_playConversation;

	//complete task
	["RESUPPLY","SUCCEEDED"] call BIS_fnc_missionTasks;

	Bis_SendToRessuply = false;
};

case "DESTROY_MORTARS_KAMINO":
{
	/*
	[
		[BASE, 	"Roger. We need your support at Kamino base."],
		[BASE, 	"Our forces around the base are pinned."],
		[BASE, 	"Enemy had setup those dammned mortars on a rocky island, east of the Kamino base, about 700m away."],
		[BASE, 	"We cannot reached them."],
		[BASE, 	"Fly there and destroy the mortar emplacements."]

	] call PLAY;
	*/

	_kb = ["55_Go_kamino","Showcase_Helicopters",nil,"side"] call Bis_playConversation;

	//create a new task
	["DESTROY_MORTARS_KAMINO"] call BIS_fnc_missionTasks;
};


case "MORTARS_DESTROYED_KAMINO":
{
	/*
	[
		[PILOT, "Enemy mortars at Kamino base are destroyed!"]

	] call PLAY;
	*/

	_kb = ["60_Mortars_destroyed_kamino","Showcase_Helicopters",nil,"side"] call Bis_playConversation;

	//complete task
	["DESTROY_MORTARS_KAMINO","SUCCEEDED"] call BIS_fnc_missionTasks;
};

//needs to be generic enough as it plays in different situations:
//1. after unloading cargo at Mike26
//2. after destruction of Kamino base mortars
case "FLY_HOME":
{
	sleep 3;

	/*
	[
		[BASE, "Well done! Ground forces will take care of the rest of enemy forces."],
		[BASE, "You are done there. Return to the air base."],
		[PILOT,"Roger. Hydra is flying home."]

	] call PLAY;
	*/

	_kb = ["65_Fly_home","Showcase_Helicopters",nil,"side"] call Bis_playConversation;

	//give sub-task task
	["RTB"] call BIS_fnc_missionTasks;

	if !(Bis_debugMode) then
	{
		[] spawn
		{
			sleep 5; if (canMove Bis_Heli) then {saveGame;};
		};
	};
};

case "AT_HOME":
{
	/*
	[
		[PILOT, "Daddy is home!"]

	] call PLAY;
	*/

	sleep 1.5;

	_kb = ["70_At_Home","Showcase_Helicopters",nil,"side"] call Bis_playConversation;

	//complete task
	["RTB","SUCCEEDED"] call BIS_fnc_missionTasks;

	//end mission in FSM
};
