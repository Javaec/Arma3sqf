/*
	Author: Jiøí Wainar

	Description:
	Reads required gear from character config, compares it possesed gear and returns what is missing = needs to be added.

	Example:
	--------------------------------------------------------------------------------------------
	_requiredGear:array = [missionName,<unit_gvar>] call BIS_fnc_camp_getRequiredGear;
*/

private["_fnc_log_disable"];

//disable debug logging
_fnc_log_disable = true;

private["_mission","_unitVar","_unit","_cfg","_getAll"];

_mission = [_this, 0, missionName, [""]] call bis_fnc_param;
_unitVar = [_this, 1, "", [""]] call bis_fnc_param;
_getAll  = [_this, 2, false, [true]] call bis_fnc_param;		//return all gear, even the gear unit currently has

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
private["_requiredGear","_requiredCount","_possessedCount","_addCount","_type","_class","_location","_toAdd","_toAddMagazines","_toAddWeapons","_displayName","_iconPath","_genericType","_requiredAmmo","_magazineDisplayName"];

_requiredGear 	= [_cfg,"required"] call BIS_fnc_getCfgDataArray;
_toAdd	      	= [];
_toAddMagazines = [];
_toAddWeapons 	= [];

{
	if (true) then
	{
		//retype string definition into array, allow only "item" type
		if (typeName _x == typeName "") then
		{
			_type 	= _x call BIS_fnc_camp_getEquipType;
			_class 	= _x call BIS_fnc_camp_getEquipClass;

			if (_type != "item") then
			{
				_x = [];
			}
			else
			{
				_x = ["item",_class];
			};
		};

		if (count _x == 0) exitWith {};

		_type		= toLower([_x, 0, "", [""]] call bis_fnc_param);
		_class		= toLower([_x, 1, "", [""]] call bis_fnc_param);

		if (_type in ["pweapon*","sweapon*","hweapon*"]) then
		{
			_requiredCount	= 1;
			_requiredAmmo   = [_x, 2, 0.5, [123]] call bis_fnc_param;
		}
		else
		{
			_requiredCount	= [_x, 2, 1, [123]] call bis_fnc_param;
			_requiredAmmo   = 0;
		};

		_location  	= toLower([_x, 3, "default", [""]] call bis_fnc_param);
		_genericType	= _type;

		_displayName 	= [_class,"displayName"] call BIS_fnc_camp_getEquipAttribute;
		_iconPath    	= [_class,"picture"] call BIS_fnc_camp_getEquipAttribute;
		_magazineDisplayName = "";

		_possessedCount = switch (_type) do
		{
			case "pweapon*":
			{
				_type = "weapon";
				_displayName = localize "STR_A3_RequiredGear_ListItem_primaryWeapon";
				_magazineDisplayName = localize "STR_A3_RequiredGear_ListItem_primaryWeaponAmmo";
				_location = "equip";

				if (primaryWeapon _unit != "") then {_class = primaryWeapon _unit; 1} else {0};
			};
			case "sweapon*":
			{
				_type = "weapon";
				_displayName = localize "STR_A3_RequiredGear_ListItem_secondaryWeapon";
				_magazineDisplayName = localize "STR_A3_RequiredGear_ListItem_secondaryWeaponAmmo";

				if (secondaryWeapon _unit != "") then {_class = secondaryWeapon _unit; 1} else {0};
			};
			case "hweapon*":
			{
				_type = "weapon";
				_displayName = localize "STR_A3_RequiredGear_ListItem_handgunWeapon";
				_magazineDisplayName = localize "STR_A3_RequiredGear_ListItem_handgunWeaponAmmo";

				if (handgunWeapon _unit != "") then {_class = handgunWeapon _unit; 1} else {0};
			};
			case "backpack*":
			{
				_type = "backpack";
				_displayName = localize "STR_A3_RequiredGear_ListItem_backpack";

				if (backpack _unit != "") then {1} else {0};
			};
			case "uniform*":
			{
				_type = "uniform";
				_displayName = localize "STR_A3_RequiredGear_ListItem_uniform";

				if (uniform _unit != "") then {1} else {0};
			};
			case "vest*":
			{
				_type = "vest";
				_displayName = localize "STR_A3_RequiredGear_ListItem_vest";

				if (vest _unit != "") then {1} else {0};
			};
			case "headgear*":
			{
				_type = "headgear";
				_displayName = localize "STR_A3_RequiredGear_ListItem_headgear";

				if (headgear _unit != "") then {1} else {0};
			};

			default
			{
				[_unit,_x] call BIS_fnc_camp_getEquipCount;
			};
		};

		//add 2 magazines for provided weapon
		if (_genericType in ["pweapon*","sweapon*","hweapon*"]) then
		{
			private["_fittingMagazines","_defaultMagazine","_defaultMagazineSize","_defaultAmmoCount","_unitAmmo","_unitMagazines","_possessedAmmo","_addCount","_iconPath"];

			_fittingMagazines = (configfile >> "CfgWeapons" >> _class >> "magazines") call BIS_fnc_getCfgDataArray;

			if (count _fittingMagazines == 0) exitWith {};

			_defaultMagazine = _fittingMagazines select 0;
			_iconPath    	 = [_defaultMagazine,"picture"] call BIS_fnc_camp_getEquipAttribute;
			_unitAmmo  	 = [_unit,_class] call BIS_fnc_camp_unitAmmo;	//array of all ammo fitting into required primary/secondary/handgun weapon

			_possessedAmmo	 = 0;

			{
				_possessedAmmo = _possessedAmmo + (_x select 1);
			}
			forEach _unitAmmo;

			_defaultMagazineSize  = getNumber(configfile >> "CfgMagazines" >> _defaultMagazine >> "count");

			if (_defaultMagazineSize <= 0) then
			{
				_defaultMagazineSize = 1;
			};

			//get required ammo
			_defaultAmmoCount = switch (_defaultMagazineSize) do
			{
				case 30:  {180};
				case 20:  {120};

				default
				{
					if (_defaultMagazineSize > 30) exitWith {200};
					if (_defaultMagazineSize == 1) exitWith {10};

					(4 * _defaultMagazineSize)
				};
			};

			_requiredAmmo = _requiredAmmo * _defaultAmmoCount;

			_addCount = ceil((_requiredAmmo - _possessedAmmo) / _defaultMagazineSize);

			if (_addCount < 0) then {_addCount = 0};

			if (_addCount > 0 || _getAll) then
			{
				["[i][%1|%2] Required: %3 | Possessed: %4 | Add: %5","magazine",_defaultMagazine,_requiredAmmo,_possessedAmmo,_addCount] call BIS_fnc_logFormat;

				_toAddMagazines set [count _toAddMagazines,["magazine",_defaultMagazine,_addCount,"default",_requiredAmmo,_magazineDisplayName,_iconPath]];
			};
		};

		_addCount = _requiredCount - _possessedCount;

		if (_addCount < 0) then {_addCount = 0};

		["[i][%1|%2] Required: %3 | Possessed: %4 | Add: %5",_type,_class,_requiredCount,_possessedCount,_addCount] call BIS_fnc_logFormat;

		if (_addCount > 0 || _getAll) then
		{
			switch (_type) do
			{
				case "weapon":
				{
					_toAddWeapons set [count _toAddWeapons,[_type,_class,_addCount,_location,_requiredCount,_displayName,_iconPath]];
				};
				case "magazine":
				{
					_toAddMagazines set [count _toAddMagazines,[_type,_class,_addCount,_location,_requiredCount,_displayName,_iconPath]];
				};
				default
				{
					_toAdd set [count _toAdd,[_type,_class,_addCount,_location,_requiredCount,_displayName,_iconPath]];
				};
			};
		};
	};
}
forEach _requiredGear;

_toAdd = _toAdd + _toAddMagazines + _toAddWeapons;

_toAdd