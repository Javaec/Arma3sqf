/*
	Author: Jiøí Wainar

	Description:
	--------------------------------------------------------------------------------------------
	Function:
	1. adds equipment listed in cfg for given unit
	2. removes equipment listed in cfg for given unit
	3. gathers the info about unit's equipment
	4. scans through the equipment, type by type and removes or replaces items that are not available up to the min. requirements

	Example:
	--------------------------------------------------------------------------------------------
	[missionName,<unit_gvar>] call BIS_fnc_camp_setupCharacter;
*/

//disable debug logging
private["_fnc_log_disable"]; _fnc_log_disable = true;

BIS_fnc_camp_addEquipment__added = [];

private["_mission","_unitVar","_unit","_cfg"];

_mission = [_this, 0, missionName, [""]] call bis_fnc_param;
_unitVar = [_this, 1, "", [""]] call bis_fnc_param;
_unit	 = missionNamespace getVariable [_unitVar,objNull];

_cfg 	 = [_mission] call BIS_fnc_camp_getMissionDesc;
_cfg 	 = _cfg >> "Characters" >> _unitVar;

//if unit doesn't exist create it
if (isNull _unit) then
{
	private["_class","_side","_group"];

	_class  = [_cfg,"appearance"] call BIS_fnc_getCfgData;;
	_side = getNumber(configfile >> "cfgVehicles" >> _class >> "side");
	_side = [east,west,resistance,civilian] select _side;

	_group 	= createGroup _side;
	_unit 	= _group createUnit [_class,[120,120,0],[],0,"NONE"];

	missionNamespace setVariable [_unitVar,_unit];
};

_unit setVehicleVarName _unitVar;

["[!][%1] Unit setup has started!",_unitVar] call BIS_fnc_logFormat;

/*--------------------------------------------------------------------------------------------------

	LOADOUT & APPEARANCE MODIFICATION

--------------------------------------------------------------------------------------------------*/

private["_appearance","_loadout","_appearanceIgnore","_loadoutIgnore","_transitBackpack"];

_appearance 	  = [_cfg,"appearance"] call BIS_fnc_getCfgData;
_appearanceIgnore = ["backpack","items","linkeditems","weapons","magazines"];
_loadout 	  = [_cfg,"loadout"] call BIS_fnc_getCfgData;
_loadoutIgnore 	  = ["uniform","vest","headgear","goggles"];

_transitBackpack  = false;

if (_loadout == "appearance") then
{
	_loadout = _appearance;
};

//remove backpack from unit
if (backpack _unit != "") then
{
	removeBackpack _unit;
};

//set unit's: "uniform","vest","headgear","goggles"
[_unit, configFile >> "CfgVehicles" >> _appearance, _appearanceIgnore] call BIS_fnc_loadInventory;

//check if class used for loadout copying has a backpack; if not, give a backpack to the unit
if (true) then
{
	private["_backpack"];

	_backpack = getText (configFile >> "CfgVehicles" >> _loadout >> "backpack");

	//no backpack, give a "temporary" backpack to the unit
	if (_backpack == "") then
	{
		["[!][%1] Transit backpack added to unit.",_unitVar] call BIS_fnc_logFormat;

		_unit addBackpack "b_assaultpack_blk";

		_transitBackpack = true;
		_loadoutIgnore set [count _loadoutIgnore, "backpack"];
	};
};


//give equipment to the unit: "backpack","items","linkeditems","weapons","magazines"
[_unit, configFile >> "CfgVehicles" >> _loadout, _loadoutIgnore] call BIS_fnc_loadInventory;

/*--------------------------------------------------------------------------------------------------

	IDENTITY

--------------------------------------------------------------------------------------------------*/
private["_identity"];

_identity = [_cfg,"identity"] call BIS_fnc_getCfgData;

if !(_identity == "default" || _identity == "") then
{
	[_unit,_identity,true,_mission] call BIS_fnc_camp_setIdentity;
};

/*--------------------------------------------------------------------------------------------------

	REMOVE EQUIPMENT

	* Containers (types "backpack", "vest" and "uniform") are removed at last.
	* Containers content is stored before it is removed.
	* Content is later transfered to new container of the same type or given to player.

--------------------------------------------------------------------------------------------------*/
private["_remove","_type","_record","_containers","_backpackItems","_vestItems","_uniformItems"];

_remove 	= [_cfg,"remove"] call BIS_fnc_getCfgData;
_containers 	= [];

_backpackItems 	= [];
_vestItems 	= [];
_uniformItems	= [];

//handle transit backpack - the fake backpack added to fix the problem with missing space during the 'loadout' setting
if (_transitBackpack) then
{
	_remove set [count _remove, "backpack"];
};


["[!][%1] Remove: %2",_unitVar,_remove] call BIS_fnc_logFormat;

//move containers to the end of the array
{
	_record = _x;
	_type   = _record call BIS_fnc_camp_getEquipType;

	if ({_type == _x} count ["backpack","vest","uniform"] > 0) then
	{
		_remove set [_forEachIndex,"---"];
		_containers set [count _containers,_record];
	};
}
forEach _remove;

_remove = _remove - ["---"];
_remove = _remove + _containers;

{
	switch (_x) do
	{
		case "backpack":
		{
			if (backpack _unit != "") then
			{
				_backpackItems = backpackItems _unit;
			};
		};
		case "vest":
		{
			if (vest _unit != "") then
			{
				_vestItems = vestItems _unit;
			};
		};
		case "uniform":
		{
			if (uniform _unit != "") then
			{
				_uniformItems = uniformItems _unit;
			};
		};
	};

	[_unit,_x] call BIS_fnc_camp_removeEquipment;
}
forEach _remove;

//temp: safecheck & disclaimer warning
if !(alive _unit) then
{
	["[!][%1] Unit is dead. Commands backpackItems/vestItems/uniformItems might fail and the items might not transfer correctly to new container(s).",_unitVar] call BIS_fnc_logFormat;

	_backpackItems = [];
	_vestItems = [];
	_uniformItems = [];
};

/*--------------------------------------------------------------------------------------------------

	ADD CONTAINERS

	* Containers (types "backpack", "vest" and "uniform") are added at the very first.
	* Items that remained from the removed containers are added to the created containers.
	* If there is not a container for them, they are added just to unit. If they don't fit in, they are lost.

--------------------------------------------------------------------------------------------------*/

private["_add","_type","_containers","_record"];

_add	 	= [_cfg,"add"] call BIS_fnc_getCfgData;
_containers 	= [];

{
	_record = _x;
	_type   = _record call BIS_fnc_camp_getEquipType;

	if ({_type == _x} count ["backpack","vest","uniform"] > 0) then
	{
		_add set [_forEachIndex,"---"];
		_containers set [count _containers,_record];
	};
}
forEach _add;

_add = _add - ["---"];

{
	_record = _x;
	_type   = _record call BIS_fnc_camp_getEquipType;

	//store backpack items, in case new is being added
	if (_type == "backpack") then
	{
		_backpackItems = _backpackItems + (backpackItems _unit);
	};
	//store vest items, in case new is being added
	if (_type == "vest") then
	{
		_vestItems = _vestItems + (vestItems _unit);
	};
	//store uniform items, in case new is being added
	if (_type == "uniform") then
	{
		_uniformItems = _uniformItems + (uniformItems _unit);
	};

	//add container
	[_unit,_record] call BIS_fnc_camp_addEquipment;

	//add backpack
	if (_type == "backpack") then
	{
		["[!][%1] Backpack items loaded: %2",_unitVar,_backpackItems] call BIS_fnc_logFormat;

		private["_t","_c"];

		//fill backpack with items from the previously removed backpack
		{
			_t = _x call BIS_fnc_camp_getEquipType;
			_c = _x call BIS_fnc_camp_getEquipClass;

			[_unit,[_t,_c,1,"backpack"],false] call BIS_fnc_camp_addEquipment;
		}
		forEach _backpackItems;

		["[!][%1] Backpack items stored: %2",_unitVar,backpackItems _unit] call BIS_fnc_logFormat;

		_backpackItems = [];
	};
	//add vest
	if (_type == "vest") then
	{
		["[!][%1] Vest items loaded: %2",_unitVar,_vestItems] call BIS_fnc_logFormat;

		private["_t","_c"];

		//fill vest with items from the previously removed vest
		{
			_t = _x call BIS_fnc_camp_getEquipType;
			_c = _x call BIS_fnc_camp_getEquipClass;

			[_unit,[_t,_c,1],false] call BIS_fnc_camp_addEquipment;
		}
		forEach _vestItems;

		["[!][%1] Vest items: %2",_unitVar,vestItems _unit] call BIS_fnc_logFormat;

		_vestItems = [];
	};
	//add uniform
	if (_type == "uniform") then
	{
		["[!][%1] Uniform items loaded: %2",_unitVar,_uniformItems] call BIS_fnc_logFormat;

		private["_t","_c"];

		//fill uniform with items from the previously removed uniform
		{
			_t = _x call BIS_fnc_camp_getEquipType;
			_c = _x call BIS_fnc_camp_getEquipClass;

			[_unit,[_t,_c,1],false] call BIS_fnc_camp_addEquipment;
		}
		forEach _uniformItems;

		["[!][%1] Uniform items: %2",_unitVar,uniformItems _unit] call BIS_fnc_logFormat;

		_uniformItems = [];
	};
}
forEach _containers;

//add items directly to unit inventory, that were not put into the unit containers
{
	[_unit,_x] call BIS_fnc_camp_addEquipment;
}
forEach (_backpackItems + _vestItems + _uniformItems);


/*--------------------------------------------------------------------------------------------------

	SET PRIMARY / SECONDARY / HANDGUN WEAPON

	* Existing weapon and their magazines are stored.
	* Priority array is scanned.
	* First matching definition is used.
	* If "default" is choosen, the starting weapon and magazines are used.

--------------------------------------------------------------------------------------------------*/

private["_data","_slot","_record","_weapon","_weaponOld","_magazines","_useDefault","_useNone","_hasWeapon","_hasMagazines","_i","_magClass","_magCount"];

{
	_slot 	= _x;
	_data = [_cfg,_slot] call BIS_fnc_getCfgData;

	_useDefault = false;
	_useNone    = false;

	//scan data, one-by-one
	{
		_record 	= _x;

		_hasWeapon 	= false;
		_hasMagazines 	= false;

		if (typeName _record == typeName "") then
		{
			if (_record == "default") then
			{
				_useDefault = true;
			};
			if (_record == "none") then
			{
				_useNone = true;
			};
		}
		else
		{
			_weapon    = _record select 0;
			_record	   = _record - [_weapon];
			_magazines = [];

			_i = 0;

			while {_i < count _record} do
			{
				_magClass = _record select _i;
				_i = _i + 1;

				_magCount = 1;

				if (_i < count _record) then
				{
					if (typeName (_record select _i) != typeName "") then
					{
						_magCount = _record select _i;
						_i = _i + 1;
					};
				};

				_magazines = _magazines + [[_magClass,_magCount]];
			};

			_hasWeapon = ["weapon",_weapon] call BIS_fnc_camp_poolAvailable;

			{
				_hasMagazines = ["magazine",_x select 0,_x select 1] call BIS_fnc_camp_poolAvailable;

				if !(_hasMagazines) exitWith {};
			}
			forEach _magazines;
		};

		//exit, if default weapon & ammo
		if (_useDefault) exitWith
		{
			["[!][%1] Default weapon & ammo is used for slot '%2'.",_unitVar,_slot] call BIS_fnc_logFormat;
		};

		//last combination is always ok, ommits the eqpool limits
		if (!_useNone && !(_hasWeapon && _hasMagazines) && (_forEachIndex + 1 == count _data)) then
		{
			_hasWeapon 	= true;
			_hasMagazines 	= true;

			["[!][%1] Last combo of weapon & ammo is used for slot '%2'.",_unitVar,_slot] call BIS_fnc_logFormat;
		};

		if ((_useNone) || (_hasWeapon && _hasMagazines)) exitWith
		{
			//remove weapon and ammo
			switch (_slot) do
			{
				case "primaryWeapon":
				{
					_weaponOld = primaryWeapon _unit;
				};
				case "secondaryWeapon":
				{
					_weaponOld = secondaryWeapon _unit;
				};
				case "handgun":
				{
					_weaponOld = handgunWeapon _unit;
				};
			};

			if (_weaponOld != "") then
			{
				["[!][%1] Weapon & ammo for slot '%2' is being removed.",_unitVar,_slot] call BIS_fnc_logFormat;

				[_unit,["weapon",_weaponOld]] call BIS_fnc_camp_removeEquipment;
			};

			//add the first weapon + ammo that is in weapon pool OR last weapon + ammo from the list
			if ((_hasWeapon && _hasMagazines)) then
			{
				["[!][%1] Weapon & ammo for slot '%2' is being added.",_unitVar,_slot] call BIS_fnc_logFormat;

				{
					[_unit,["magazine",_x select 0,_x select 1]] call BIS_fnc_camp_addEquipment;
				}
				forEach _magazines;

				if (_slot == "primaryWeapon") then
				{
					[_unit,["weapon",_weapon,1,"equip"]] call BIS_fnc_camp_addEquipment;
				}
				else
				{
					[_unit,["weapon",_weapon]] call BIS_fnc_camp_addEquipment;
				};
			};
		};
	}
	forEach _data;
}
forEach ["primaryWeapon","secondaryWeapon","handgun"];



/*--------------------------------------------------------------------------------------------------

	ADD REMAINING EQUIPMENT

--------------------------------------------------------------------------------------------------*/

{
	[_unit,_x] call BIS_fnc_camp_addEquipment;
}
forEach _add;

/*--------------------------------------------------------------------------------------------------

	ADJUST THE UN-TOUCHED MAGAZINES

	* Adjusts the number of magazines that are on unit by default.
	* Magazines that were added to unit via this system are ignored.

--------------------------------------------------------------------------------------------------*/
private["_fn_getMinMagCount"];

//returns minimum number of magazines that should avoid Ai shooting for low ammo
_fn_getMinMagCount =
{
	private["_unit","_magazine","_magazines","_count","_code","_min"];

	_unit 	   = _this select 0;
	_magazine  = toLower(_this select 1);
	_count	   = 0;

	{
		_code = _x select 0;
		_min  = _x select 1;

		_magazines = getArray(configfile >> "CfgWeapons" >> _unit call _code >> "magazines");

		{
			_magazines set [_forEachIndex, toLower _x];
		}
		forEach _magazines;

		if (_magazine in _magazines) exitWith
		{
			_count = _min;
		};
	}
	forEach [[{primaryWeapon _this},4],[{secondaryWeapon _this},3],[{handgunWeapon _this},2]];

	_count
};

/*--------------------------------------------------------------------------------------------------

	LOAD TOGGLES FOR EQUIPMENT POOL INTERACTION

--------------------------------------------------------------------------------------------------*/
private["_adjustMagazines"];

_adjustMagazines = [_cfg,"adjustMagazines"] call BIS_fnc_getCfgDataBool;

if (_adjustMagazines) then
{
	private["_magazines","_class","_count","_poolCount","_remove","_untouched","_maxRemove","_minKeep"];

	_magazines = [_unit] call BIS_fnc_camp_unitMagazines;

	{
		_class 		= _x select 0;
		_count 		= _x select 1;
		_poolCount 	= ["magazine",_class] call BIS_fnc_camp_poolCount;
		_untouched	= ([BIS_fnc_camp_addEquipment__added,_class,0] call BIS_fnc_getFromPairs) <= 0;

		//1 or more magazines are missing, adjust the loadout and remove up to 50% of them
		if ((_count > _poolCount) && _untouched) then
		{
			_minKeep = [_unit,_class] call _fn_getMinMagCount;
			_maxRemove = _count - _minKeep;

			_remove = _count - _poolCount;

			if (_remove > _maxRemove) then
			{
				_remove = _maxRemove;
			};

			["[!][%1] %3 x %2 magazines removed from unit!",_unitVar,_class,_remove] call BIS_fnc_logFormat;

			//remove magazines on unit
			[_unit,["magazine",_class,_remove]] call BIS_fnc_camp_removeEquipment;
		};
	}
	forEach _magazines;
};

/*--------------------------------------------------------------------------------------------------

	REPLACE THE SPECIAL BACKPACK WITH BACKPACK WITHOUT THE SPECIAL CARGO

--------------------------------------------------------------------------------------------------*/
private["_backpackFixed","_backpackOld"];

_backpackOld   = backpack _unit;
_backpackFixed = [_unit] call BIS_fnc_camp_fixUnitBackpack;

if (_backpackFixed != "") then
{
	private["_fnc_log_disable"]; _fnc_log_disable = false;

	["[!][%1] Backpack '%2' replaced for '%3'!",_unit,_backpackOld,_backpackFixed] call BIS_fnc_logFormat;
};