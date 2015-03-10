/*
	Author: Jiøí Wainar

	Description:
	Reads required gear from character config and gives it to the unit.

	Example:
	--------------------------------------------------------------------------------------------
	[missionName,<unit_gvar>] call BIS_fnc_camp_addRequiredGear;
*/

private["_fnc_log_disable"];

//disable debug logging
_fnc_log_disable = false;

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

//["[!][%1] Processing unit...",_unitVar] call BIS_fnc_logFormat;

/*--------------------------------------------------------------------------------------------------

	GET REQUIRED GEAR

	Definition examples:
	------------------------
	"map","compass","watch","radio","nvgoggles","gps","minedetector",		//itemclass
	{"uniform","u_b_combatuniform_mcam_vest"},
	{"vest","v_platecarrier1_cbr"},
	{"backpack","b_fieldpack_oucamo"},
	{"headgear","h_helmetb"},
	{"goggles","g_shades_black"},
	{"magazine","apersboundingmine_range_mag",3,"backpack"},			//[itemType,itemClass,itemCount(default:1),container(default:first available)]

	{"backpack","b_fieldpack_oucamo"},
	{"item","radio",1,"backpack"},
	{"magazine","satchel",{3,5},"backpack"},
	{"magazine","handgrenade",{0,4}}

	{"magazine","30rnd_65x39_caseless_mag",20,"backpack"},
	{"uniform","u_b_combatuniform_mcam_vest"},
	{"backpack","b_fieldpack_oucamo"},
	{"weapon","arifle_mx_aco_pointer_f",3,"backpack"},
	{"item","radio",20,"backpack"},
	{"item","map",7,""},
	{"uniform","u_b_combatuniform_mcam_vest",2,""},
	{"headgear","h_helmetb",7,"backpack"},
	{"vest","v_platecarrier1_cbr"},
	{"backpack","b_fieldpack_oucamo"},
	{"magazine","handgrenade",2}

--------------------------------------------------------------------------------------------------*/
private["_requiredGear","_addingFailed"];

_requiredGear = [_mission,_unitVar] call BIS_fnc_camp_getRequiredGear;
_addingFailed = false;

{
	if (true) then
	{
		private["_displayName","_iconPath","_type","_class","_addCount","_possessedCount","_targetCount"];

		_type	     	= [_x, 0, "", [""]] call bis_fnc_param;
		_class	     	= [_x, 1, "", [""]] call bis_fnc_param;
		_addCount    	= [_x, 2, 1, [123]] call bis_fnc_param;
		_displayName 	= [_class,"displayName"] call BIS_fnc_camp_getEquipAttribute;
		_iconPath    	= [_class,"picture"] call BIS_fnc_camp_getEquipAttribute;

		if (_class == "" || _type == "") exitWith {};

		_possessedCount = [player,[_type,_class]] call BIS_fnc_camp_getEquipCount;
		_targetCount	= _possessedCount + _addCount;

		if (_possessedCount >_targetCount) exitWith {};

		[_unit,_x,false,true] call BIS_fnc_camp_addEquipment;

		if (_displayName == "" || _iconPath == "") exitWith
		{
			["[x][type:%1|class:%2] Cannot display notification for required gear!",_type,_class] call BIS_fnc_error;
		};

		_possessedCount = [player,[_type,_class]] call BIS_fnc_camp_getEquipCount;

		if (_possessedCount >_targetCount) exitWith {};

		if (_targetCount == _possessedCount) then
		{
			["ArmoryGearAdded",[_displayName,_addCount,_iconPath]] call BIS_fnc_showNotification;
		}
		else
		{
			["ArmoryGearAddingFailed",[_displayName,_targetCount - _possessedCount,_iconPath]] call BIS_fnc_showNotification;

			_addingFailed = true;
		};
	};
}
forEach _requiredGear;

if (_addingFailed) then
{
	["ArmoryInventoryFull"] call BIS_fnc_showNotification;
};