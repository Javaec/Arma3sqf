scriptName "initPool.sqf";

//--------------------------------------------------------------------------------------------------
//
// 	EQUIPMENT POOL
//
//--------------------------------------------------------------------------------------------------

/*
BIS_box_weapons
BIS_box_ammo
BIS_box_items
BIS_box_outfit


AMMUNITION: "Box_NATO_Ammo_F"
- all different type of ammo

WEAPONS: "Box_NATO_Wps_F"
- rifles + ammo
- smgs + ammo
- pistols + ammo

EXPLOSIVES: "Box_NATO_AmmoOrd_F"
- mines
- explosive charges

GRENADES: "Box_NATO_Grenades_F"
- all types of grenades

SUPPORT: "Box_NATO_Support_F"
- medikits
- minedetector, laser designator
- items
- attachments

SPECIAL PURPOSE: "Box_NATO_WpsSpecial_F"
- sniper rifles + ammo
- optics

LAUNCHERS: "Box_NATO_WpsLaunch_F"
- launchers + ammo
*/

BIS_Armory_visualizePool =
{
	//surpress the debuglog output
	private["_fnc_log_disable"];_fnc_log_disable = true;

	private["_units","_unit","_weaponBackup","_magazineBackup","_attachmentBackup","_itemBackup","_uniformBackup","_vestBackup","_backpackBackup","_headgearBackup","_gogglesBackup"];

	_units = _this;

	{
		if (typeName _x == typeName "") then
		{
			_unit = missionnamespace getVariable [_x,objNull];
			_units set [_forEachIndex, _unit];
		};
	}
	forEach _units; _units = _units - [objNull];

	["[i][Armory] Armory visualization started."] call BIS_fnc_logFormat;
	["[ ][Armory] Changes to pool will be reverted upon end."] call BIS_fnc_logFormat;

	["[ ][Armory] Equipment of the following units will not be shown in ARMORY composition ..."] call BIS_fnc_logFormat;

	{
		["[ ][Armory] - %1",_x] call BIS_fnc_logFormat;
	}
	forEach _units;

	/*------------------------------------------------------------------------------------------

		BACKUP THE POOL GLOBALS

	------------------------------------------------------------------------------------------*/

	_weaponBackup 	  =+ BIS_PER_POOL_weapon;
	_magazineBackup   =+ BIS_PER_POOL_magazine;
	_attachmentBackup =+ BIS_PER_POOL_attachment;

	_itemBackup 	  =+ BIS_PER_POOL_item;
	_uniformBackup    =+ BIS_PER_POOL_uniform;
	_vestBackup 	  =+ BIS_PER_POOL_vest;
	_backpackBackup   =+ BIS_PER_POOL_backpack;
	_headgearBackup   =+ BIS_PER_POOL_headgear;
	_gogglesBackup 	  =+ BIS_PER_POOL_goggles;

	/*------------------------------------------------------------------------------------------

		REMOVE THE GEAR ON UNITS FROM "TO-BE-VISUALIZED" GEAR

	------------------------------------------------------------------------------------------*/
	{
		[_x] call BIS_fnc_camp_poolRemoveCharacter;
	}
	forEach _units;

	/*------------------------------------------------------------------------------------------

		PROCESS WEAPON HOLDERS

	------------------------------------------------------------------------------------------*/
	private["_holders","_cargo","_type","_class","_inPool","_class"];

	//reset 'wild'/'unwanted' weapon holders ---------------------------------------------------
	_holders = (allMissionObjects "weaponholder_single_f") + (allMissionObjects "groundweaponholder");

	{
		_class = toLower typeOf _x;

		if (_class in ["weaponholder_single_f","groundweaponholder"]) then
		{
			clearMagazineCargo _x;
			clearWeaponCargo _x;
			clearItemCargo _x;
			clearBackpackCargo _x;
		};
	}
	forEach _holders;

	_holders = (allMissionObjects "weaponholder_single_limited_weapon_f") + (allMissionObjects "weaponholder_single_limited_magazine_f");
	_holders = _holders call BIS_fnc_arrayShuffle;

	//re-setup weapon holders ------------------------------------------------------------------
	{
		//no backpacks in holders!
		clearBackpackCargo _x;

		_cargo = (weaponCargo _x) + (magazineCargo _x) + (itemCargo _x) + (backpackCargo _x);

		if (count _cargo > 0) then
		{
			if (count _cargo > 1) exitWith
			{
				clearMagazineCargo _x;
				clearWeaponCargo _x;
				clearItemCargo _x;
			};

			_cargo  = _cargo select 0;
			_type 	= _cargo call BIS_fnc_camp_getEquipType;
			_class	= _cargo call BIS_fnc_camp_getEquipClass;
			_inPool = [_type,_class] call BIS_fnc_camp_poolAvailable;

			if !(_inPool) then
			{
				clearMagazineCargo _x;
				clearWeaponCargo _x;
				clearItemCargo _x;
			}
			else
			{
				if (_type == "weapon") then
				{
					["[ ][%1] < weapon holder",_class] call BIS_fnc_logFormat;
				}
				else
				{
					["[ ][%1] < ammo holder",_class] call BIS_fnc_logFormat;
				};

				[_type,_class,-1] call BIS_fnc_camp_poolAdd;
			};
		};
	}
	forEach _holders;

	/*------------------------------------------------------------------------------------------

		PROCESS CONTAINERS

	------------------------------------------------------------------------------------------*/

	//clear cargo in vehicles
	{
		clearMagazineCargo _x;
		clearWeaponCargo _x;
		clearItemCargo _x;
		clearBackpackCargo _x;
	}
	forEach (allMissionObjects "Car");

	private["_boxTypes","_boxes","_class","_count"];

	_boxTypes = ["ReammoBox_F"];

	//prepare all weapon boxes
	{
		_boxes = allMissionObjects _x;

		{
			clearMagazineCargo _x;
			clearWeaponCargo _x;
			clearItemCargo _x;
			clearBackpackCargo _x;

			_x enableSimulation true;
			_x allowDamage false;
		}
		forEach _boxes;
	}
	forEach _boxTypes;

	//fill weapon box
	{
		_class = _x select 0;
		_count = _x select 1;

		if !(_class in ["binocular","laserdesignator"]) then
		{
			["[ ][%1] %2x < weapon box",_class,_count] call BIS_fnc_logFormat;

			BIS_box_weapons addWeaponCargo [_class,_count];
		}
		else
		{
			["[ ][%1] %2x < support box",_class,_count] call BIS_fnc_logFormat;

			BIS_box_items addWeaponCargo [_class,_count];
		};
	}
	forEach BIS_PER_POOL_weapon;

	//fill ammo box
	{
		_class = _x select 0;
		_count = _x select 1;

		["[ ][%1] %2x < ammo box",_class,_count] call BIS_fnc_logFormat;

		BIS_box_ammo addMagazineCargo [_class,_count];
	}
	forEach BIS_PER_POOL_magazine;

	//fill item box
	{
		_class = _x select 0;
		_count = _x select 1;

		["[ ][%1] %2x < support box",_class,_count] call BIS_fnc_logFormat;

		BIS_box_items addItemCargo [_class,_count];
	}
	forEach (BIS_PER_POOL_attachment + BIS_PER_POOL_item);

	//fill outfit box
	{
		_class = _x select 0;
		_count = _x select 1;

		["[ ][%1] %2x < outfit box",_class,_count] call BIS_fnc_logFormat;

		BIS_box_outfit addItemCargo [_class,_count];
	}
	forEach (BIS_PER_POOL_uniform + BIS_PER_POOL_vest + BIS_PER_POOL_headgear + BIS_PER_POOL_goggles);
	{
		_class = _x select 0;
		_count = _x select 1;

		["[ ][%1] %2x < outfit box",_class,_count] call BIS_fnc_logFormat;

		BIS_box_outfit addBackpackCargo [_class,_count];
	}
	forEach BIS_PER_POOL_backpack;

	/*------------------------------------------------------------------------------------------

		RESTORE THE POOL GLOBALS

	------------------------------------------------------------------------------------------*/
	BIS_PER_POOL_weapon 	=+ _weaponBackup;
	BIS_PER_POOL_magazine 	=+ _magazineBackup;
	BIS_PER_POOL_attachment =+ _attachmentBackup;

	BIS_PER_POOL_item       =+ _itemBackup;
	BIS_PER_POOL_uniform    =+ _uniformBackup;
	BIS_PER_POOL_vest       =+ _vestBackup;
	BIS_PER_POOL_backpack   =+ _backpackBackup;
	BIS_PER_POOL_headgear   =+ _headgearBackup;
	BIS_PER_POOL_goggles    =+ _gogglesBackup;

	["[i][Armory] Armory visualization ended, pool restored."] call BIS_fnc_logFormat;
	["[ ][Armory] Changes to pool reverted."] call BIS_fnc_logFormat;
};

/*--------------------------------------------------------------------------------------------------

	GET THE UNITS RETURNING TO HUB

--------------------------------------------------------------------------------------------------*/
private["_identities","_characters","_xCharacter","_xAdjustArmory","_xIdentity","_referenceMission","_referenceMissionCfg","_unit","_pooledUnits"];

_pooledUnits = [];

if !(["BIS_PER_prevMission"] call BIS_fnc_camp_hasImplicitValue) then
{
	_referenceMission = BIS_PER_prevMission;

	//get returning units
	{
		if (true) then
		{
			_unit = missionNamespace getVariable [_x,objNull];

			if (isNull _unit) exitWith {};

			_xIdentity = _unit getVariable ["BIS_Identity",""];

			if (_xIdentity == "") exitWith {};

			_pooledUnits set [count _pooledUnits,_unit];
		};
	}
	forEach
	[
		"BIS_squadMember1",
		"BIS_squadMember2",
		"BIS_squadMember3",
		"BIS_squadMember4",
		"BIS_squadMember5",
		"BIS_squadMember6",
		"BIS_squadMember7",
		"BIS_squadMember8",
		"BIS_squadMember9",
		"BIS_squadMember10",
		"BIS_inf"
	];

	//get returning unit character classnames (as defined in the prev. mission)
	_characters = [];

	{
		if (true) then
		{
			_xIdentity  = _x getVariable ["BIS_Identity",""];
			_xCharacter = [_xIdentity,_referenceMission] call BIS_fnc_camp_getCharacterByIdentity;

			if (_xCharacter == "") exitWith
			{
				["[x][Armory] Cannot find identity [%1] in mission [%2]! Unit gear will not affect armory composition.",_xIdentity,_referenceMission] call BIS_fnc_logFormat;

				_pooledUnits set [_forEachIndex, objNull];
			};

			_characters = _characters + [_xCharacter];
		};
	}
	forEach _pooledUnits; _pooledUnits = _pooledUnits - [objNull];
}
else
{
	_referenceMission 	= missionName;
	_pooledUnits 		= [BIS_inf];
	_characters 		= ["BIS_inf"];

	BIS_PER_IDENT_return 	= [];
};

_referenceMissionCfg = [_referenceMission] call BIS_fnc_camp_getMissionDesc;

//filter out characters/units that are marked as not to affect armory composition
{
	_xAdjustArmory 	= [_referenceMissionCfg,"Characters",_x,"adjustArmory"] call BIS_fnc_getCfgDataBool;

	if !(_xAdjustArmory) then
	{
		_characters set [_forEachIndex,""];
		_pooledUnits set [_forEachIndex,objNull];
	};
}
forEach _characters;

_characters = _characters - [""];
_pooledUnits = _pooledUnits - [objNull];

//remove the gear on selected units from armory
_pooledUnits call BIS_Armory_visualizePool;