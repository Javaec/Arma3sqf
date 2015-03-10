/*
	Author: Jiri Wainar

	Description:
	Hub systems exit

	Parameters:
		_this select 0 (Optional): BOOL - Save date (default: true)
		_this select 1 (Optional): BOOL - Save position (default: true)
		_this select 2 (Optional): BOOL - Save direction (default: true)

	Returns:
	True if it exists successfully, false if not
*/

["[!] Mission ended with: %1",_this] call BIS_fnc_logFormat;

if (isMultiplayer) exitWith {"[!] Hub systems are not multiplayer compatible!" call BIS_fnc_error; false};
if (isNull player) exitWith {"[!] Player doesn't exist!" call BIS_fnc_error};

/*--------------------------------------------------------------------------------------------------

	SAVE MISSION COMPLETED STATUS

--------------------------------------------------------------------------------------------------*/

missionNamespace setVariable [format["BIS_%1",missionName], true];

/*--------------------------------------------------------------------------------------------------

	SAVE PERSISTENT DATA

--------------------------------------------------------------------------------------------------*/

private ["_missionMeta", "_isHub", "_isSkirmish"];

_missionMeta = [] call BIS_fnc_camp_getMissionMeta;
_isHub 	     = _missionMeta select 1;
_isSkirmish  = _missionMeta select 2;

//save mission intel
[] call BIS_fnc_camp_saveMissionIntel;

//leaving hub or skirmish ...
if (_isHub || _isSkirmish) then
{
	//save all POI data
	if (isNil "BIS_poiToSave") then
	{
		BIS_poiToSave = []
	};

	{
		[_x] call BIS_fnc_camp_poiSave;
	}
	forEach BIS_poiToSave;
}
//leaving mission, location info is not used
else
{
	//pool of completed missions
	if ([] call BIS_fnc_isCampaign) then
	{
		if (!(missionName in BIS_PER_missionsDone)) then
		{
			BIS_PER_missionsDone = BIS_PER_missionsDone + [missionName];
		};
	};
};

//add completed mission into the que
BIS_PER_missionsQue = BIS_PER_missionsQue + [missionName];

//make sure hub variables are initialized
if (isNil "BIS_selectedMission") then
{
	BIS_selectedMission = "";
};
if (isNil "BIS_skirmishMission") then
{
	BIS_skirmishMission = "";
};

//save skirmish data if player is leaving skirmish or is leaving hub, heading to skirmish
if ((_isSkirmish) || (_isHub && BIS_selectedMission == BIS_skirmishMission)) then
{
	private["_vehicle","_vehicleClass","_vehicleCustom","_vehicleCargo"];

	_vehicle = vehicle player;

	if (player != _vehicle) then
	{
		_vehicleClass  = typeOf _vehicle;
		_vehicleCustom = _vehicle getVariable ["BIS_customizationId",""];
		_vehicleCargo  = [_vehicle] call BIS_fnc_camp_getVehicleCargo;

		BIS_PER_SKIRMISH_vehicle = [_vehicleClass,_vehicleCustom,_vehicleCargo];
	}
	else
	{
		_vehicleClass  = "";
		_vehicleCustom = "";
		_vehicleCargo  = [];

		BIS_PER_SKIRMISH_vehicle = [];
	};

	if (_isHub) then
	{
		BIS_PER_SKIRMISH_crew = [];

		if (player != _vehicle) then
		{
			{
				BIS_PER_SKIRMISH_crew set [_forEachIndex, toLower vehicleVarName _x];
			}
			forEach ((crew _vehicle) - [player]);
		};

		//remove vehicle cargo from the pool
		[_vehicleCargo,false] call BIS_fnc_camp_poolAddVehicleCargo;	//false = don't add, subtract instead
	}
	else
	{
		private["_unit","_unitVar","_vehicles"];

		_vehicles = [];

		{
			_unitVar = _x;
			_unit	 = missionNamespace getVariable [_unitVar, objNull];

			if (isNull _unit) then
			{
				["[x] Unit [%1] doesn't exist in the mission [%2]!",_unitVar,missionName] call BIS_fnc_logFormat;
			};

			if !(alive _unit) then
			{
				BIS_PER_SKIRMISH_crew set [_forEachIndex,""];
				BIS_PER_SKIRMISH_squadPool = BIS_PER_SKIRMISH_squadPool - [_unitVar];

				["[i] Unit [%1] was killed and is no longer available for skirmish.",_unitVar] call BIS_fnc_logFormat;
			};

			if (_unit != vehicle _unit) then
			{
				_vehicles = _vehicles - [vehicle _unit] + [vehicle _unit];
			};

		}
		forEach (BIS_PER_SKIRMISH_crew + ["bis_inf"]); BIS_PER_SKIRMISH_crew = BIS_PER_SKIRMISH_crew - [""];

		{
			//add vehicle cargo to the pool
			[_x,true] call BIS_fnc_camp_poolAddVehicleCargo;	//true = add to pool
		}
		forEach _vehicles;
	};
};

//save unit equipment and ev. skirmish data
if (_isHub) then
{
	[BIS_selectedMission] call BIS_fnc_camp_saveCharacters;
}
else
{
	[missionName] call BIS_fnc_camp_saveCharacters;
};

//store identities
[] call BIS_fnc_camp_setIdentityInit;

//store world objects
[] call BIS_fnc_camp_saveWorldObjects;


//store mission we are leaving so we get the info about previous mission in next mission :)
BIS_PER_prevMission = missionName;

//increment phase, if campaign mission is completed
if !(_isHub || _isSkirmish) then
{
	BIS_PER_phase = BIS_PER_phase + 1;

	["[!] Phase incremented to %1!",BIS_PER_phase] call BIS_fnc_logFormat;
}
//do not touch phase, if skirmish or hub mission is exited
else
{
	["Phase remains at %1.",BIS_PER_phase] call BIS_fnc_logFormat;
};

//store status of skirmish micro compositions (obejcts in sqm)
if (_isSkirmish) then
{
	private["_explored","_exploredVar"];

	_exploredVar 	= format["BIS_PER_EXPLORED_%1",missionName];
	_explored 	= missionNamespace getVariable [_exploredVar,[]];

	missionNamespace setVariable [_exploredVar,_explored];
};

//save step counter
BIS_PER_step = BIS_PER_step + 1;

/*--------------------------------------------------------------------------------------------------

	SAVE PERSISTENT VARIABLES

--------------------------------------------------------------------------------------------------*/

//skirmish
if ((_isSkirmish) || (_isHub && BIS_selectedMission == BIS_skirmishMission)) then
{
	if (_isHub) then
	{
		saveVar "BIS_PER_HUB_vehicleSlot1";
		saveVar "BIS_PER_HUB_vehicleSlotX";
	}
	else
	{
		//array with all micro compositions that were revealed
		[format["bis_per_explored_%1",missionName]] 	call BIS_fnc_camp_saveVar;
	};

	["BIS_PER_SKIRMISH_pos"] call BIS_fnc_camp_saveVar;
	["BIS_PER_SKIRMISH_dir"] call BIS_fnc_camp_saveVar;
	["BIS_PER_SKIRMISH_vehicle"] call BIS_fnc_camp_saveVar;
	["BIS_PER_SKIRMISH_crew"] call BIS_fnc_camp_saveVar;
	["BIS_PER_SKIRMISH_squadPool"] call BIS_fnc_camp_saveVar;
};


[format["bis_%1",missionName]] 	call BIS_fnc_camp_saveVar;				//given mission is completed

["bis_per_phase"]	 	call bis_fnc_camp_saveVar;
["bis_per_step"] 		call bis_fnc_camp_saveVar;

["bis_per_intel"] 		call bis_fnc_camp_saveVar;

["bis_per_missionsdone"] 	call bis_fnc_camp_saveVar;
["bis_per_missionsque"] 	call bis_fnc_camp_saveVar;
["bis_per_prevmission"] 	call bis_fnc_camp_saveVar;

["bis_per_ident_killed"] 	call bis_fnc_camp_saveVar;
["bis_per_ident_survived"] 	call bis_fnc_camp_saveVar;
["bis_per_ident_return"] 	call bis_fnc_camp_saveVar;
["bis_per_ident_main"] 		call bis_fnc_camp_saveVar;
["bis_per_ident_freenamesvo"] 	call bis_fnc_camp_saveVar;
["bis_per_ident_freenames"] 	call bis_fnc_camp_saveVar;

["bis_per_pool_weapon"] 	call bis_fnc_camp_saveVar;
["bis_per_pool_magazine"] 	call bis_fnc_camp_saveVar;
["bis_per_pool_attachment"] 	call bis_fnc_camp_saveVar;
["bis_per_pool_item"] 		call bis_fnc_camp_saveVar;
["bis_per_pool_uniform"] 	call bis_fnc_camp_saveVar;
["bis_per_pool_vest"] 		call bis_fnc_camp_saveVar;
["bis_per_pool_backpack"] 	call bis_fnc_camp_saveVar;
["bis_per_pool_headgear"] 	call bis_fnc_camp_saveVar;
["bis_per_pool_goggles"] 	call bis_fnc_camp_saveVar;

["bis_per_destroyedworldobjects"] 		call BIS_fnc_camp_saveVar;


/*--------------------------------------------------------------------------------------------------

	PUT THE EQUIPMENT TO BRIEFING POOL

--------------------------------------------------------------------------------------------------*/
private["_class","_amount"];

clearWeaponPool;
clearMagazinePool;
clearItemPool;

{
	_class 		= _x select 0;
	_amount 	= _x select 1;

	addWeaponPool [_class,_amount];
}
foreach BIS_PER_POOL_weapon;

{
	_class 		= _x select 0;
	_amount 	= _x select 1;

	addMagazinePool [_class,_amount];
}
foreach BIS_PER_POOL_magazine;

{
	_class 		= _x select 0;
	_amount 	= _x select 1;

	addItemPool [_class,_amount];
}
foreach (BIS_PER_POOL_attachment + BIS_PER_POOL_item /* + BIS_PER_POOL_uniform + BIS_PER_POOL_vest  + BIS_PER_POOL_backpack  + BIS_PER_POOL_headgear + BIS_PER_POOL_goggles */);


true