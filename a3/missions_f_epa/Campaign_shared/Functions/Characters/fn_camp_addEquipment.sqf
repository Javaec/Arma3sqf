/*--------------------------------------------------------------------------------------------------

	Author: Jiøí Wainar

	Valid values for _location:
	---------------------------
	"equip" 	- tries to equip/assign the equipment
	"default" 	- adds equipment to inventory
	"primary"	- used for attachments, tries to add it to primary weapon
	"secondary"	- used for attachments, tries to add it to secondary weapon
	"handgun"	- used for attachments, tries to add it to handgun weapon

	Example:

	[player,["uniform","u_b_combatuniform_mcam_vest"]] call BIS_fnc_camp_addEquipment;

--------------------------------------------------------------------------------------------------*/
private["_fnc_log_disable"];

//disable debug logging
_fnc_log_disable = true;

if (isNil "BIS_fnc_camp_addEquipment__added") then {BIS_fnc_camp_addEquipment__added = []};

private["_unit","_data","_monitor","_autoRestoreContainerCargo","_type","_class","_count","_i","_location","_backpack","_containerItems"];

_unit  	 	= [_this, 0, objNull, ["",objNull]] call bis_fnc_param;
_data 	 	= [_this, 1, "", ["",[]]] call bis_fnc_param;
_monitor 	= [_this, 2, true, [true]] call bis_fnc_param;
_autoContainer	= [_this, 3, false, [true]] call bis_fnc_param;

if (typeName _unit == typeName "") then
{
	_unit = missionNamespace getVariable [_unit, objNull];
};

//re-type string definition to array
if (typeName _data == typeName "") then
{
	_type   	= _data call BIS_fnc_camp_getEquipType;
	_class  	= _data call BIS_fnc_camp_getEquipClass;
	_count  	= 1;
	_location  	= "equip";
}
else
{
	_type   	= _data call BIS_fnc_camp_getEquipType;
	_class  	= _data call BIS_fnc_camp_getEquipClass;
	_count  	= [_data, 2, 1, [123,[]]] call bis_fnc_param;
	_location  	= [_data, 3, "default", [""]] call bis_fnc_param;

	//make classname shortcut to work in array defintions as well
	_class  	= _class call BIS_fnc_camp_getEquipClass;
};

//adjust the variable count; valid only for types stored in persistant pool
if (_type in ["magazine","weapon","attachment","item","uniform","vest","backpack","headgear","goggles"]) then
{
	if (typeName _count != typeName []) exitWith {};

	private["_onHub","_min","_max","_pool","_added"];

	_pool 	= missionnamespace getVariable format["BIS_PER_POOL_%1",_type];
	_onHub 	= [_pool,_class,0] call BIS_fnc_getFromPairs;
	_added	= [BIS_fnc_camp_addEquipment__added,_class,0] call BIS_fnc_getFromPairs;
	_onHub	= _onHub - _added;

	_min	= _count select 0;
	_max	= _count select 1;

	if (_onHub < _min) exitWith
	{
		_count = _min;
	};
	if (_onHub < _max) exitWith
	{
		_count = _onHub;
	};

	_count = _max;
}
else
{
	if (typeName _count == typeName []) then
	{
		_count = _count select 0;
	};
};

//terminate adding if set or generated ammount is 0 or less
if (_count <= 0) exitWith {};

["[i][%1] Adding [type:%2,class:%3,count:%4,location:%5] ...",_unit,_type,_class,_count,_location] call BIS_fnc_logFormat;

_backpack = unitBackpack _unit;

if (_location == "backpack" && (isNull _backpack)) then
{
	_location = "default";
};

//if adding to backpack container, use the backpack entity
if (_location == "backpack") then
{
	switch (_type) do
	{
		case "weapon":
		{
			_backpack addWeaponCargo [_class,_count];
		};
		case "magazine":
		{
			_backpack addMagazineCargo [_class,_count];
		};
		default
		{
			_backpack addItemCargo [_class,_count];
		};
	};
}
else
{
	switch (_type) do
	{
		case "magazine":
		{
			private["_added"];

			_added 	= [BIS_fnc_camp_addEquipment__added,_class,0] call BIS_fnc_getFromPairs;

			//remove all magazines with the same class
			if ((_added <= 0) && _monitor) then
			{
				_unit removeMagazines _class;
			};

			//add set number of magazines
			for "_i" from 1 to _count do
			{
				_unit addMagazine _class;
			};
		};
		case "uniform":
		{
			if (_autoContainer) then
			{
				_containerItems = uniformItems _unit;

				_unit forceAddUniform _class;

				{
					[_unit,_x,false] call BIS_fnc_camp_addEquipment;
				}
				forEach _containerItems;
			}
			else
			{
				_unit forceAddUniform _class;
			};
		};
		case "vest":
		{
			if (_autoContainer) then
			{
				_containerItems = vestItems _unit;

				_unit addVest _class;

				{
					[_unit,_x,false] call BIS_fnc_camp_addEquipment;
				}
				forEach _containerItems;
			}
			else
			{
				_unit addVest _class;
			};
		};
		case "backpack":
		{
			if (_autoContainer) then
			{
				_containerItems = backpackItems _unit;

				if (backpack _unit != "") then
				{
					removeBackpack _unit;
				};

				_unit addBackpack _class;

				private["_t","_c"];

				//fill backpack with items from the previously removed backpack
				{
					_t = _x call BIS_fnc_camp_getEquipType;
					_c = _x call BIS_fnc_camp_getEquipClass;

					[_unit,[_t,_c,1,"backpack"],false] call BIS_fnc_camp_addEquipment;
				}
				forEach _containerItems;
			}
			else
			{
				if (backpack _unit != "") then
				{
					removeBackpack _unit;
				};

				_unit addBackpack _class;
			};
		};
		case "headgear":
		{
			_unit addHeadgear _class;
		};
		case "goggles":
		{
			_unit addGoggles _class;
		};
		case "item":
		{
			for "_i" from 1 to _count do
			{
				_unit addItem _class;

				if (!(_class in ["medikit","firstaidkit","minedetector","toolkit"]) && (_location == "equip")) then
				{
					_unit assignItem _class;
				};
			};
		};
		case "weapon":
		{
			_unit addWeapon _class;

			if (_location == "equip") then
			{
				_unit selectWeapon _class;
			};
		};

		case "attachment":
		{
			switch (_location) do
			{
				case "primary":
				{
					if (primaryWeapon _unit != "") then
					{
						_unit addPrimaryWeaponItem _class;
					};
				};
				case "secondary":
				{
					if (secondaryWeapon _unit != "") then
					{
						_unit addSecondaryWeaponItem _class;
					};
				};
				case "handgun":
				{
					if (handgunWeapon _unit != "") then
					{
						_unit addHandgunItem _class;
					};
				};
				default
				{
					if (primaryWeapon _unit != "") then
					{
						_unit addPrimaryWeaponItem _class;
					};
				};
			};
		};

		default
		{
			["[x][Adding failed] unit: %1 | type: %2 | item: %3 | location: %4",_unit,_type,_class,_location] call BIS_fnc_logFormat;

			_count = 0;
		};
	};
};

//store the added equipment
if ((_count > 0) && _monitor) then
{
	[BIS_fnc_camp_addEquipment__added,_class,_count] call BIS_fnc_addToPairs;
};