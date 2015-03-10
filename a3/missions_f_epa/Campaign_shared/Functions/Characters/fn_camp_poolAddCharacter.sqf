/*

	Author: Jiri Wainar

	Description:
	Function stores the unit's equipment into the equipment pool.

	Example:
	[player] call BIS_fnc_camp_poolAddCharacter;

*/

private["_unit","_weapons","_attachments","_magazines","_vehicle","_items","_uniforms","_vests","_backpacks","_headgears","_goggles"];

_unit 		= [_this, 0, objNull, [objNull,""]] call bis_fnc_param;

//get unit equipment
_weapons 	= [_unit] call BIS_fnc_camp_unitWeapons;
_attachments 	= [_unit] call BIS_fnc_camp_unitAttachments;
_magazines 	= [_unit] call BIS_fnc_camp_unitMagazines;

_items		= [_unit] call BIS_fnc_camp_unitItems;
_uniforms	= [_unit,"uniform"] call BIS_fnc_camp_unitOutfit;
_vests		= [_unit,"vest"] call BIS_fnc_camp_unitOutfit;
_backpacks	= [_unit,"backpack"] call BIS_fnc_camp_unitOutfit;
_headgears	= [_unit,"headgear"] call BIS_fnc_camp_unitOutfit;
_goggles	= [_unit,"goggles"] call BIS_fnc_camp_unitOutfit;

["[i][%1] Adding character gear to pool.",_unit] call BIS_fnc_logFormat;

["[ ][%1] Adding weapons: %2",_unit,_weapons] call BIS_fnc_logFormat;
["[ ][%1] Adding attachments: %2",_unit,_attachments] call BIS_fnc_logFormat;
["[ ][%1] Adding magazines: %2",_unit,_magazines] call BIS_fnc_logFormat;

["[ ][%1] Adding items: %2",_unit,_items] call BIS_fnc_logFormat;
["[ ][%1] Adding uniforms: %2",_unit,_uniforms] call BIS_fnc_logFormat;
["[ ][%1] Adding vests: %2",_unit,_vests] call BIS_fnc_logFormat;
["[ ][%1] Adding backpacks: %2",_unit,_backpacks] call BIS_fnc_logFormat;
["[ ][%1] Adding headgears: %2",_unit,_headgears] call BIS_fnc_logFormat;
["[ ][%1] Adding goggles: %2",_unit,_goggles] call BIS_fnc_logFormat;

//store equipment in da pool
{
	["weapon",_x select 0,_x select 1] call BIS_fnc_camp_poolAdd;
}
forEach _weapons;

{
	["attachment",_x select 0,_x select 1] call BIS_fnc_camp_poolAdd;
}
forEach _attachments;

{
	["magazine",_x select 0,_x select 1] call BIS_fnc_camp_poolAdd;
}
forEach _magazines;

{
	["item",_x select 0,_x select 1] call BIS_fnc_camp_poolAdd;
}
forEach _items;

{
	["uniform",_x select 0,_x select 1] call BIS_fnc_camp_poolAdd;
}
forEach _uniforms;

{
	["vest",_x select 0,_x select 1] call BIS_fnc_camp_poolAdd;
}
forEach _vests;

{
	["backpack",_x select 0,_x select 1] call BIS_fnc_camp_poolAdd;
}
forEach _backpacks;

{
	["headgear",_x select 0,_x select 1] call BIS_fnc_camp_poolAdd;
}
forEach _headgears;

{
	["goggles",_x select 0,_x select 1] call BIS_fnc_camp_poolAdd;
}
forEach _goggles;


//check for vehicle equipment, if unit is in vehicle
if (isNil "BIS_fnc_camp_poolAddCharacter_vehicles") then
{
	BIS_fnc_camp_poolAddCharacter_vehicles = [];
};

/*
_vehicle = vehicle _unit;

if ((_vehicle != _unit) && !(_vehicle in BIS_fnc_camp_poolAddCharacter_vehicles)) then
{
	private["_vehicleWeapons","_vehicleMagazines","_vehicleAttachments","_parts","_items"];

	//check for plain vehicle weapons (without attachments) ------------------------------------
	_vehicleWeapons = [];

	{
		_parts 	= _x call BIS_fnc_weaponComponents;

		if (count _parts > 0) then
		{
			_vehicleWeapons set [count _vehicleWeapons, _parts select 0];
		};
	}
	forEach (weaponCargo _vehicle);

	_vehicleWeapons = _vehicleWeapons call BIS_fnc_consolidateArray;

	//check for vehicle magazines --------------------------------------------------------------
	_vehicleMagazines = magazineCargo _vehicle;
	_vehicleMagazines = _vehicleMagazines call BIS_fnc_consolidateArray;

	//check for weapon attachments -------------------------------------------------------------
	_vehicleAttachments = [];

	//get loose attachments (stored in vehicle cargo)
	_items = itemCargo _vehicle;

	//get attachments on weapons (stored in vehicle cargo)
	{
		_parts 	= _x call BIS_fnc_weaponComponents;

		if (count _parts > 1) then
		{
			_parts = _parts - [_parts select 0];
			_items = _items + _parts;
		};
	}
	forEach (weaponCargo _vehicle);

	//filter out attachments from other items
	{
		_type = _x call BIS_fnc_camp_getEquipType;

		if (_type == "attachment") then
		{
			_vehicleAttachments set [count _vehicleAttachments, toLower _x];
		};
	}
	forEach _items;

	//consolidate array
	_vehicleAttachments = _vehicleAttachments call BIS_fnc_consolidateArray;

	//store the equipment into the pool --------------------------------------------------------
	{
		["Adding weapon from vehicle cargo to pool: %1",_x] call BIS_fnc_logFormat;

		["weapon",_x select 0,_x select 1] call BIS_fnc_camp_poolAdd;
	}
	forEach _vehicleWeapons;

	{
		["Adding attachment from vehicle cargo to pool: %1",_x] call BIS_fnc_logFormat;

		["attachment",_x select 0,_x select 1] call BIS_fnc_camp_poolAdd;
	}
	forEach _vehicleAttachments;


	{
		["Adding magazine from vehicle cargo to pool: %1",_x] call BIS_fnc_logFormat;

		["magazine",_x select 0,_x select 1] call BIS_fnc_camp_poolAdd;
	}
	forEach _vehicleMagazines;
};
*/