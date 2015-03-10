/*

	Author: Jiøí Wainar

	Description:
	Return equipment class.

	Example:
	_class:string = _equipId:string or array call BIS_fnc_camp_getEquipClass;

	_class = "compass" call BIS_fnc_camp_getEquipClass;
	_class = ["magazine","apersboundingmine_range_mag",3] call BIS_fnc_camp_getEquipClass;
*/

private["_equip","_class"];

//if defined as array, 2nd parameter is the class
if (typeName _this == typeName []) exitWith
{
	_this select 1
};

_this = toLower _this;

_class = switch (_this) do
{
	case "itemmap";
	case "itemcompass";
	case "itemwatch";
	case "itemradio";
	case "itemgps";
	case "firstaidkit";
	case "medikit";
	case "nvgoggles";
	case "minedetector";
	case "toolkit";
	case "laserdesignator";
	case "binocular":
	{
		_this
	};
	case "map";
	case "compass";
	case "watch";
	case "radio";
	case "gps":
	{
		format["item%1",_this]
	};
	default
	{
		_this
	};
};

_class