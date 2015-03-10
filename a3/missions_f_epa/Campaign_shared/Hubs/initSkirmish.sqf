scriptName "initSkirmish.sqf";

if (BIS_skirmishMission == "") then
{
	BIS_Skirmish_disabled = true;
};

if (BIS_Skirmish_disabled) exitWith {};

#define QUADBIKES	["B_Quadbike_01_F","B_G_Quadbike_01_F","I_Quadbike_01_F","I_G_Quadbike_01_F","O_Quadbike_01_F","O_G_Quadbike_01_F","C_Quadbike_01_F"]

/*--------------------------------------------------------------------------------------------------

	HANDLE REVEALED POIs

	POI states:
	-----------
	-1: UNKNOWN; default state - POI is active, but player doesn't know about him yet
	 0: KNOWN; POI is active and is revealed to player (through conversation)
	 1: COMPLETED; POI is NOT active as it was already completed by player

--------------------------------------------------------------------------------------------------*/
BIS_Skirmish_initPOIs =
{
	private["_pois","_poi","_status"];

	//get all linked pois
	_pois = [] call BIS_fnc_camp_poiGetLinked;

	{
		if (true) then
		{
			_poi = _x;

			//check the POI status
			_status = [_poi] call BIS_fnc_camp_poiGetStatus;

			if (_status == -1) exitWith {};

			if (_status == 0) then
			{
				//add task for known POIs
				[_poi,false] call BIS_fnc_camp_poiAddTask;
			};

			//only draw marker
			[_poi] call BIS_fnc_camp_poiDrawMarker;
		};
	}
	forEach _pois;
};

/*--------------------------------------------------------------------------------------------------

	TRIGGER ACTION

--------------------------------------------------------------------------------------------------*/
BIS_Skirmish_addAction =
{
	private ["_vehicle","_mission","_label","_distance"];

	_vehicle	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_mission 	= [_this, 1, BIS_skirmishMission, [""]] call BIS_fnc_param;
	_label	 	= localize "STR_A3_UserAction_StartPatrol";
	_distance 	= 5;

	_label		= format["<img image='%1' size='1.8'/> <t size='1.2'>%2</t>","\A3\Ui_f\data\IGUI\Cfg\Actions\open_door_ca.paa",_label];

	//ensure there is no delay in showing the action
	(group player) reveal _vehicle;

	_vehicle addAction
	[
		_label,
		{
			["hide", BIS_fnc_showHubMarkers_markersonhub] spawn BIS_fnc_ShowMarkers;
			_this call BIS_Skirmish_exec;
		},
		[_mission,_vehicle],
		10e10,
		true,
		true,
		"",
		format["(player distance %1 < %2) && !(BIS_FFDetected) && (vehicle player != %1) && (canMove %1) && ([] call BIS_ZR_getMode == 'skirmish')", _vehicle, _distance]
	];

	//attach vehicle so it cannot move
	_vehicle spawn BIS_Skirmish_attachVehicle;
};


BIS_Skirmish_attachVehicle =
{
	private["_logic","_vehicle"];

	waitUntil{time > 0};

	_vehicle = _this;

	_logic = (createGroup west) createUnit ["Logic", getPos _vehicle, [], 0, "NONE"];
	_logic setPosASL getPosASL _vehicle;
	_logic setDir getDir _vehicle;

	_logic setVectorUp vectorUp _vehicle;
	_logic setVectorDir vectorDir _vehicle;

	_vehicle attachTo [_logic];
};

BIS_Skirmish_exec =
{
	private["_params","_mission","_vehicle"];

	if (count _this > 2) then
	{
		_params	 = _this select 3;
	}
	else
	{
		_params	 = _this;
	};

	_mission = [_params, 0, BIS_skirmishMission, [""]] call BIS_fnc_param;
	_vehicle = [_params, 1, vehicle player, [objNull]] call BIS_fnc_param;

	_vehicle lock 3;

	player action ["GetInDriver", _vehicle];

	waitUntil{(player in _vehicle)};

	_vehicle lock 2;

	["BIS_Skirmish_MapTriggered",true] call BIS_fnc_blackOut; waitUntil {BIS_fnc_blackOut_completed};

	[_mission,_vehicle] call BIS_Skirmish_createMap;
};

BIS_Skirmish_createMap =
{
	private["_mission","_vehicle"];

	_mission = [_params, 0, BIS_skirmishMission, [""]] call BIS_fnc_param;
	_vehicle = [_params, 1, vehicle player, [objNull]] call BIS_fnc_param;

	disableserialization;

	private["_mDescExt","_mName","_mDesc","_mOverview","_playerName","_spawnPoints"];

	_mDescExt	= [_mission] call BIS_fnc_camp_getMissionDescData;
	_mName		= _mDescExt select 4;
	_mDesc		= _mDescExt select 2;
	_mOverview	= _mDescExt select 3;

	_spawnPoints	= ["Missions",_mission,"spawnpoints"] call BIS_fnc_getCfgDataArray;
	_playerName	= format["%1. %2",[player,"displayNameShort"] call BIS_fnc_rankParams,name player];

	//show HQ marker
	"BIS_mrkHubCenter" setMarkerAlpha 1;

	private["_pos","_dir","_allowSquad","_mapData","_vehicle"];

	_mapData = [];

	{
		if (true) then
		{
			_pos  	    = _x select 0;
			_dir  	    = _x select 1;
			_allowSquad = [_x, 2, 1, [123]] call BIS_fnc_param; _allowSquad = [false,true] select _allowSquad;
			_vehicle    = vehicle player;

			if (!_allowSquad && (_vehicle != player) && ({typeOf _vehicle == _x} count QUADBIKES == 0)) exitWith {};

			_mapData = _mapData +
			[[
				_pos,
				BIS_Skirmish_onSpawnSelected,
				_mName,
				_mDesc,
				_playerName,
				_mOverview,
				1,
				[_pos,_dir]
			]]
		};
	}
	forEach _spawnPoints;

	private["_parentDisplay","_mapCenter","_ORBAT","_markers","_images","_overcast","_isNight","_mapDisplay"];

	_parentDisplay 	= [] call bis_fnc_displayMission;
	_mapCenter 	= position player;
	_ORBAT 		= [];
	_markers 	= [];
	_images 	= [];
	_overcast 	= overcast;
	_isNight 	= !((dayTime > 6) && (dayTime < 20));

	_mapDisplay =
	[
		_parentDisplay,
		_mapCenter,
		_mapData,
		_ORBAT,
		_markers,
		_images,
		_overcast,
		_isNight,
		2,
		true,
		"Select starting position",
		false/*,
		"\A3\Ui_f\data\Map\GroupIcons\number4_rotate_%1_gs.paa"*/
	]
	call BIS_fnc_strategicMapOpen;

	//(_mapDisplay displayCtrl 2) ctrlAddEventHandler ["ButtonClick",BIS_Skirmish_onCancelClicked];

	waitUntil{!(isNull _mapDisplay)};

	waitUntil{(isNull _mapDisplay)};

	if (BIS_selectedMission == BIS_skirmishMission) exitWith {};

	[] call BIS_Skirmish_onCancelClicked;
};

BIS_Skirmish_onSpawnSelected =
{
	private["_params","_pos","_dir"];

	_params = [_this, 9, [], [[]]] call BIS_fnc_param;

	_pos = _params select 0;
	_dir = _params select 1;

	BIS_PER_SKIRMISH_pos = _pos;
	BIS_PER_SKIRMISH_dir = _dir;

	BIS_selectedMission = BIS_skirmishMission;

	if (vehicle player != player) then
	{
		if ({typeOf vehicle player == _x} count QUADBIKES > 0) then
		{
			BIS_PER_HUB_vehicleSlot1 = [];
		}
		else
		{
			BIS_PER_HUB_vehicleSlotX = [];
		};
	};

	[BIS_selectedMission,true,2] call BIS_fnc_endMission;
};

BIS_Skirmish_onCancelClicked =
{
	//hide HQ marker
	"BIS_mrkHubCenter" setMarkerAlpha 0;

	["BIS_Skirmish_MapTriggered",false] call BIS_fnc_blackIn;

	if (vehicle player != player) then
	{
		doGetOut player;
	}
	else
	{
		[] call BIS_Skirmish_walkToBase;
	};

	false
};

BIS_Skirmish_walkToBase =
{
	["BIS_Skirmish_walkToBase",false] call BIS_fnc_blackOut;

	//create cinematic subtitles
	[0,0,false] spawn BIS_fnc_cinemaBorder;

	//crate player walking cutscene
	player setPos getPos BIS_point_introPlayer;
	player setDir getDir BIS_point_introPlayer;

	if (primaryWeapon player != "") then
	{
		player switchMove "HubSpectator_walk";
	}
	else
	{
		player switchMove "HubSpectator_walkU";
	};

	[] spawn
	{
		sleep 1;

		["BIS_Skirmish_walkToBase"] call BIS_fnc_blackIn;

		sleep 10;

		//hide cinema borders
		[1,nil,false] spawn BIS_fnc_cinemaBorder;

		//un-lock player from the walk animation
		if (primaryWeapon player != "") then
		{
			player playMoveNow "amovpercmstpslowwrfldnon";
		}
		else
		{
			player playMoveNow "amovpercmstpsnonwnondnon";
		};
	};
};

/*--------------------------------------------------------------------------------------------------

	INITIALIZE BOTH SKIRMISH CARS

--------------------------------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------------------------------

	SETUP SINGLE-PLAYER VEHICLE

	Can be any quadbike:

	"B_Quadbike_01_F"
	"B_G_Quadbike_01_F"
	"I_Quadbike_01_F"
	"I_G_Quadbike_01_F"
	"O_Quadbike_01_F"
	"O_G_Quadbike_01_F"
	"C_Quadbike_01_F"

--------------------------------------------------------------------------------------------------*/
if (true) then
{
	private["_defClass","_defCustId","_currentVehicle","_savedClass","_savedCustId"];
	private["_varName","_pos","_dir"];

	_currentVehicle = ["Missions",BIS_skirmishMission,"Vehicles","Player","name"] call BIS_fnc_getCfgDataObject; if (isNull _currentVehicle) exitWith {};
	_defClass   	= ["Missions",BIS_skirmishMission,"Vehicles","Player","type"] call BIS_fnc_getCfgData; if (_defClass == "") exitWith {};
	_defCustId  	= ["Missions",BIS_skirmishMission,"Vehicles","Player","cust"] call BIS_fnc_getCfgData;

	_savedClass	= [BIS_PER_SKIRMISH_vehicle, 0, "", [""]] call BIS_fnc_param;
	_savedCustId	= [BIS_PER_SKIRMISH_vehicle, 1, "", [""]] call BIS_fnc_param;

	_varName    	= vehicleVarName _currentVehicle;
	_pos 		= getPos _currentVehicle;
	_dir 		= getDir _currentVehicle;

	//initialize vehicle slot #1
	if (isNil "BIS_PER_HUB_vehicleSlot1") then
	{
		BIS_PER_HUB_vehicleSlot1 = [_defClass,_defCustId];
	};

	if (count BIS_PER_HUB_vehicleSlot1 == 0) then
	{
		BIS_PER_HUB_vehicleSlot1 = [_defClass,_defCustId];
	};

	//overwrite vehicle slot #1 with data from player's current quadbike
	if ({_savedClass == _x} count QUADBIKES > 0) then
	{
		BIS_PER_HUB_vehicleSlot1 = [_savedClass,_savedCustId];
	};

	//delete former vehicle
	deleteVehicle _currentVehicle;

	//re-create new vehicle
	_currentVehicle = createVehicle [BIS_PER_HUB_vehicleSlot1 select 0, _pos, [], 0, "CAN_COLLIDE"];
	_currentVehicle setDir _dir;
	_currentVehicle setPos _pos;
	_currentVehicle setVehicleVarName _varName; missionNamespace setVariable [_varName,_currentVehicle];
	_currentVehicle lock 2;

	//setup it (customization)
	[_currentVehicle,BIS_PER_HUB_vehicleSlot1 select 1] call BIS_fnc_camp_setupVehicle;

	//add trigger action to the vehicle
	[_currentVehicle] call BIS_Skirmish_addAction;

	//clear vehicle cargo
	clearWeaponCargo _currentVehicle; clearMagazineCargo _currentVehicle; clearItemCargo _currentVehicle;

	_currentVehicle addEventHandler ["HandleDamage", {[_this select 0,_this select 3] spawn BIS_friendlyFire; _this select 2}];
	_currentVehicle addEventHandler ["Killed", {[_this select 0,_this select 1] spawn BIS_friendlyFire}];
};

/*--------------------------------------------------------------------------------------------------

	SETUP MULTI-UNIT VEHICLE

	Can be any non-quadbike vehicle.

--------------------------------------------------------------------------------------------------*/
if (true) then
{
	private["_defClass","_defCustId","_currentVehicle","_savedClass","_savedCustId"];
	private["_varName","_pos","_dir"];

	_currentVehicle = ["Missions",BIS_skirmishMission,"Vehicles","Squad","name"] call BIS_fnc_getCfgDataObject; if (isNull _currentVehicle) exitWith {};
	_defClass   	= ["Missions",BIS_skirmishMission,"Vehicles","Squad","type"] call BIS_fnc_getCfgData; if (_defClass == "") exitWith {};
	_defCustId  	= ["Missions",BIS_skirmishMission,"Vehicles","Squad","cust"] call BIS_fnc_getCfgData;

	_savedClass	= [BIS_PER_SKIRMISH_vehicle, 0, "", [""]] call BIS_fnc_param;
	_savedCustId	= [BIS_PER_SKIRMISH_vehicle, 1, "", [""]] call BIS_fnc_param;

	_varName    	= vehicleVarName _currentVehicle;
	_pos 		= getPos _currentVehicle;
	_dir 		= getDir _currentVehicle;

	//initialize vehicle slot #2
	if (isNil "BIS_PER_HUB_vehicleSlotX") then
	{
		BIS_PER_HUB_vehicleSlotX = [_defClass,_defCustId];
	};

	if (count BIS_PER_HUB_vehicleSlotX == 0) then
	{
		BIS_PER_HUB_vehicleSlotX = [_defClass,_defCustId];
	};

	//overwrite vehicle slot #2 with data from player's current non-quadbike
	if ((_savedClass != "")  && ({_savedClass == _x} count QUADBIKES == 0)) then
	{
		BIS_PER_HUB_vehicleSlotX = [_savedClass,_savedCustId];
	};

	//delete former vehicle
	deleteVehicle _currentVehicle;

	//create new vehicle
	_currentVehicle = createVehicle [BIS_PER_HUB_vehicleSlotX select 0, _pos, [], 0, "CAN_COLLIDE"];
	_currentVehicle setDir _dir;
	_currentVehicle setPos _pos;
	_currentVehicle setVehicleVarName _varName; missionNamespace setVariable [_varName,_currentVehicle];
	_currentVehicle lock 2;

	//setup it
	[_currentVehicle,BIS_PER_HUB_vehicleSlotX select 1] call BIS_fnc_camp_setupVehicle;

	//add trigger action to the vehicle
	[_currentVehicle] call BIS_Skirmish_addAction;

	//clear vehicle cargo
	clearWeaponCargo _currentVehicle; clearMagazineCargo _currentVehicle; clearItemCargo _currentVehicle;

	_currentVehicle addEventHandler ["HandleDamage", {[_this select 0,_this select 3] spawn BIS_friendlyFire; _this select 2}];
	_currentVehicle addEventHandler ["Killed", {[_this select 0,_this select 1] spawn BIS_friendlyFire}];

	//create player's squad and move units into the vehicle
	private["_unit","_squad","_added"];

	if (count BIS_PER_SKIRMISH_squadPool > 3) then
	{
		_squad = [BIS_PER_SKIRMISH_squadPool select 0,BIS_PER_SKIRMISH_squadPool select 1,BIS_PER_SKIRMISH_squadPool select 2];
	}
	else
	{
		_squad =+ BIS_PER_SKIRMISH_squadPool;
	};

	{
		_unit = [_x,missionName,_currentVehicle] call BIS_fnc_camp_createSkirmishSquadUnit;

		if !(isNull _unit) then
		{
			_unit addEventHandler ["HandleDamage", {[_this select 0,_this select 3] spawn BIS_friendlyFire; _this select 2}];
			_unit addEventHandler ["Killed", {[_this select 0,_this select 1] spawn BIS_friendlyFire}];
		};
	}
	forEach _squad;
};

/*--------------------------------------------------------------------------------------------------

	POSITION PLAYER
	- when returned from skirmish

--------------------------------------------------------------------------------------------------*/
private["_prevMission","_isSkirmish"];

_prevMission = missionNamespace getVariable ["BIS_PER_prevMission",""];
_isSkirmish  = [_prevMission] call BIS_fnc_camp_getMissionMeta select 2;

if !(_isSkirmish) exitWith {};

private["_savedClass","_savedCustId","_vehicle"];

_savedClass	= [BIS_PER_SKIRMISH_vehicle, 0, "", [""]] call BIS_fnc_param;
_savedCustId	= [BIS_PER_SKIRMISH_vehicle, 1, "", [""]] call BIS_fnc_param;

if (_savedClass == "") exitWith
{
	[] call BIS_Skirmish_walkToBase;
};

//returned on quadbike
if (BIS_PER_HUB_vehicleSlot1 select 0 == _savedClass) then
{
	_vehicle = ["Missions",BIS_skirmishMission,"Vehicles","Player","name"] call BIS_fnc_getCfgDataObject;
}
//returned in bigger car
else
{
	_vehicle = ["Missions",BIS_skirmishMission,"Vehicles","Squad","name"] call BIS_fnc_getCfgDataObject;
};

if (isNull _vehicle) exitWith {};

player moveInDriver _vehicle;
player action ["EngineOn", _vehicle];

if !((daytime > 7.5) && (daytime < 18.5)) then
{
	player action ["lightOn", _vehicle];
};

_vehicle spawn
{
	waitUntil{BIS_fnc_blackIn_completed};

	sleep 1;

	doGetOut player;
};