/*--------------------------------------------------------------------------------------------------

 	SETUP NIKOS

--------------------------------------------------------------------------------------------------*/
[] spawn
{
	scriptName "initMission.hpp: Nikos animation control";

	{BIS_nikos disableAI _x} forEach ["ANIM","AUTOTARGET","MOVE","TARGET"];

	waitUntil {time > 0};
	BIS_nikos switchMove ("HubStandingUB_idle" + str ([1,2,3] call BIS_fnc_selectRandom));

	private ["_animEH"];
	_animEH = BIS_nikos addEventHandler ["AnimDone", {(_this select 0) switchMove ("HubStandingUB_idle" + str ([1,2,3] call BIS_fnc_selectRandom))}];
	BIS_nikos setVariable ["BIS_animEH", _animEH];
};

/*--------------------------------------------------------------------------------------------------

 	HIDE HELPERS

--------------------------------------------------------------------------------------------------*/
{
	_x hideObject true;
}
forEach (allMissionObjects "Helper_Base_F");

/*--------------------------------------------------------------------------------------------------

 	HANDLE VEHICLES

--------------------------------------------------------------------------------------------------*/
private["_vehicles"];

_vehicles = (allMissionObjects "Car") + (allMissionObjects "Air") + (allMissionObjects "Tank");

{
	clearWeaponCargo _x; clearMagazineCargo _x; clearItemCargo _x;
}
forEach _vehicles;

/*--------------------------------------------------------------------------------------------------

 	REMOVE UNWANTED ITEMS FROM AMBIENT UNITS

--------------------------------------------------------------------------------------------------*/
{
	_x unassignItem "nvgoggles"; removeAllItems _x;
}
forEach ((allMissionObjects "Man") - [BIS_car,BIS_journalist,BIS_nikos,player]);

/*--------------------------------------------------------------------------------------------------

 	MARKERS

--------------------------------------------------------------------------------------------------*/
"BIS_ActionCenter" setMarkerAlpha 0;

/*--------------------------------------------------------------------------------------------------

 	FF MONITOR

--------------------------------------------------------------------------------------------------*/
if (isNil "BIS_FFDetected") then
{
	BIS_FFDetected = false;
};

BIS_friendlyFire =
{
	scriptName "initFF.sqf: BIS_friendlyFire";

	private["_source","_victim"];

	_victim = _this select 0;
	_source = _this select 1;

	if !(BIS_FFDetected) then
	{
		switch (_victim) do
		{
			case BIS_journalist:
			{
				BIS_FFDetected = true;

				sleep 1.5;

				["END3",true] call BIS_fnc_endMission;
			};
			case player:
			{
				if !(canStand player && canMove player) then
				{
					BIS_FFDetected = true;

					sleep 1.5;

					["END4",true] call BIS_fnc_endMission;
				};
			};
			default
			{
				if (_source in [vehicle player, player]) then
				{
					BIS_FFDetected = true;

					sleep 1.5;

					["END2",true] call BIS_fnc_endMission;
				};
			};
		};
	};
};

//{_x addEventHandler ["HandleDamage", {[_this select 0,_this select 3] spawn BIS_friendlyFire; _this select 2}]} forEach (allUnits - [player]);
{_x addEventHandler ["Killed", {[_this select 0,_this select 1] spawn BIS_friendlyFire}]} forEach (allUnits - [player]);

/*--------------------------------------------------------------------------------------------------

 	VEHICLE MONITOR

--------------------------------------------------------------------------------------------------*/
[] execFSM "\A3\Missions_F_EPC\Campaign\Missions\C_EA.Altis\vehicle.fsm";

/*--------------------------------------------------------------------------------------------------

 	WORLDMAP MODIFICATIONS

--------------------------------------------------------------------------------------------------*/
private["_gate","_house","_billboard"];

//Athira metal gate
_gate = nearestObject [[14039.4,18653.8,0.00159264],"Land_City_Gate_F"];
_gate animate ["door_1_rot",1];
_gate animate ["door_2_rot",1];

//2x airport bar gate
_gate = nearestObject [[14549.7,16919.6,0.00146103],"Land_BarGate_F"];
_gate animate ["door_1_rot",1];
_gate = nearestObject [[14477,16829.2,0.00141144],"Land_BarGate_F"];
_gate animate ["door_1_rot",1];

//2x airport hall doors
_house = nearestObject [[14620.6,16809.1,0.00143814],"Land_Airport_left_F"];
_house animate ["Door_7A_move",1];
_house animate ["Door_7B_move",1];
_house animate ["Door_8A_move",1];
_house animate ["Door_8B_move",1];
_house setVariable ["bis_disabled_Door_7",1];
_house setVariable ["bis_disabled_Door_8",1];
//lock airport doors
_house setVariable ['bis_disabled_Door_1',1];
_house setVariable ['bis_disabled_Door_2',1];
_house setVariable ['bis_disabled_Door_3',1];
_house setVariable ['bis_disabled_Door_4',1];
_house setVariable ['bis_disabled_Door_5',1];
_house setVariable ['bis_disabled_Door_6',1];

//2x airport hall doors
_house = nearestObject [[14583.7,16783.1,0.00143814],"Land_Airport_right_F"];
_house animate ["Door_7A_move",1];
_house animate ["Door_7B_move",1];
_house animate ["Door_8A_move",1];
_house animate ["Door_8B_move",1];
_house setVariable ["bis_disabled_Door_7",1];
_house setVariable ["bis_disabled_Door_8",1];
//lock airport doors
_house setVariable ['bis_disabled_Door_1',1];
_house setVariable ['bis_disabled_Door_2',1];
_house setVariable ['bis_disabled_Door_3',1];
_house setVariable ['bis_disabled_Door_4',1];
_house setVariable ['bis_disabled_Door_5',1];
_house setVariable ['bis_disabled_Door_6',1];

//destroy 3 Athira buildings
_house = nearestObject [[14064.9,18560.4,0.00140953],"Land_i_House_Big_02_V2_F"]; _house setDamage 1;
_house = nearestObject [[14072.3,18554.7,0.00133514],"Land_i_Shop_01_V3_F"]; _house setDamage 1;
_house = nearestObject [[14082.5,18553.9,0.00143814],"Land_i_House_Big_02_V3_F"]; _house setDamage 1;

/*
_billboard = nearestObject [[14583.7,16783.1,0.00143814],"Land_Billboard_F"];
_billboard setObjectTexture [0, "\A3\data_f\Flags\flag_bis_co.paa"];
_billboard = nearestObject [[14620.6,16809.1,0.00143814],"Land_Billboard_F"];
_billboard setObjectTexture [0, "\A3\data_f\Flags\flag_bis_co.paa"];
*/

/*--------------------------------------------------------------------------------------------------

 	IDENTITIES

--------------------------------------------------------------------------------------------------*/
BIS_journalist setIdentity "EPC_B_Journalist";
BIS_nikos setIdentity "EPC_I_Nikos";
BIS_BHQ setIdentity "EPC_B_BHQ";

(group BIS_journalist) setGroupId [localize "STR_A3_CfgIdentities_Cole"];
(group BIS_inf) setGroupId [localize "str_a3_cfgidentities_kerry0"];
(group BIS_nikos) setGroupId [localize "STR_A3_cfgfaces_man_a3_nikos0"];
(group BIS_BHQ) setGroupId [localize "STR_A3_Group_Crossroads"];


/*--------------------------------------------------------------------------------------------------

 	REMOVE ANY POSSIBLE KEY-DOWN EVENT HANDLER

--------------------------------------------------------------------------------------------------*/
if (true) then
{
	if (!(isNil {uiNamespace getVariable "BIS_theEnd_skipEH"})) then
	{
		([] call BIS_fnc_displayMission) displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "BIS_theEnd_skipEH"];

		uiNamespace setVariable ["BIS_theEnd_skipEH", nil];
	};
};

/*--------------------------------------------------------------------------------------------------

 	INTRO MUSIC

--------------------------------------------------------------------------------------------------*/
[] execVM "missionMusic.sqf";