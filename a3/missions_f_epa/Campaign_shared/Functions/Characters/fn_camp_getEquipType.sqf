/*

	Author: Jiøí Wainar

	Description:
	Return equipment category (eg. weapon, magazine, item).

	Example:
	_type:string = _equipId:string or array call BIS_fnc_camp_getEquipType;

	_type = "compass" call BIS_fnc_camp_getEquipType;
	_type = ["magazine","apersboundingmine_range_mag",3] call BIS_fnc_camp_getEquipType;
*/

private["_fnc_log_disable"];

//disable debug logging
_fnc_log_disable = false;

private["_type","_group","_subgroup","_details"];

//if defined as array, 1st parameter is the type
if (typeName _this == typeName []) exitWith
{
	_type = switch (_this select 0) do
	{
		case "pweapon*";
		case "sweapon*";
		case "hweapon*":
		{
			"weapon"
		};
		case "backpack*":
		{
			"backpack"
		};
		case "uniform*":
		{
			"uniform"
		};
		case "vest*":
		{
			"vest"
		};
		case "headgear*":
		{
			"headgear"
		};
		default
		{
			_this select 0
		};
	};

	_type
};

_this = toLower _this;

//make sure "weapons","items" won't get into the processing
if (_this in ["weapons","items"]) exitWith
{
	//["[x] Function called with prohibited type: %1!",_this] call BIS_fnc_logFormat;

	_this
};

//if type is already one of the valid types, no need to retype it
if (_this in ["magazine","uniform","vest","backpack","headgear","goggles","item","weapon","attachment"]) exitWith
{
	_this
};

_type = switch (_this) do
{
	case "itemmap";
	case "itemcompass";
	case "itemwatch";
	case "itemradio";
	case "itemgps";
	case "map";
	case "compass";
	case "watch";
	case "radio";
	case "gps";
	case "firstaidkit";
	case "medikit";
	case "minedetector";
	case "toolkit";
	case "nvgoggles":
	{
		"item"
	};
	case "laserdesignator";
	case "rangefinder";
	case "binocular":
	{
		"weapon"
	};

	case "optic_hamr";
	case "acc_flashlight";
	case "muzzle_snds_b";
	case "optic_nightstalker";
	case "optic_aco_grn";
	case "optic_aco";
	case "optic_holosight";
	case "optic_sos";
	case "optic_mrco";
	case "acc_pointer_ir";
	case "muzzle_snds_h";
	case "muzzle_snds_acp";
	case "optic_aco_smg";
	case "optic_aco_grn_smg";
	case "optic_arco";
	case "acc_pointer_greenlaser";
	case "optic_holosight_smg";
	case "muzzle_snds_m";
	case "muzzle_snds_h_mg";
	case "optic_dms";
	case "optic_yorris";
	case "optic_mrd";
	case "optic_lrps";
	case "optic_nvs";
	case "optic_tws";
	case "optic_tws_mg";
	case "muzzle_snds_l":
	{
		"attachment"
	};

	default
	{
		"auto"
	};
};

if (_type != "auto") exitWith {_type};

_details  = [_this] call BIS_fnc_itemType;
_group	  = toLower(_details select 0);
_subgroup = toLower(_details select 1);

switch (_group) do
{
	case "magazine";
	case "mine":
	{
		_type = "magazine";
	};

	case "weapon";
	case "item":
	{
		_type = _group;
	};

	case "equipment":
	{
		if (_subgroup == "glasses") then
		{
			_type = "goggles";
		}
		else
		{
			_type = toLower _subgroup;
		};
	};

	default
	{
		_type = "unknown";
	};
};

if (_type == "unknown") then
{
	["[x] Cannot determine equipment type for [class:%1]!",_this] call BIS_fnc_logFormat;
}
else
{
	//["[ ] Equipment [class:%4] type determined as [type:%3].",_group,_subgroup,_type,_this] call BIS_fnc_logFormat;
};

_type