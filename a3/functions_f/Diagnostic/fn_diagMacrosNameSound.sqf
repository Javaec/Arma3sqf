/*
	Author: Karel Moricky

	Description:
	Detects vehicle types and prints their radio protocol definitions to clipboard

	Parameter(s): N/A

	Returns:
	STRING
*/
private ["_br","_text","_classes"];

startloadingscreen [""];
_pilots = [];
{
	_scope = getnumber (_x >> "scope");
	if (_scope > 1) then {
		_simulation = tolower gettext (_x >> "simulation");
		if (_simulation in ["helicopter","helicopterx","helicopterrtd","airplane","airplanex"]) then {
			_crew = tolower gettext (_x >> "crew");
			if !(_crew in _pilots) then {_pilots set [count _pilots,_crew];};
		};
	};
} foreach ("isclass _x" configclasses (configfile >> "cfgvehicles"));

_classes = [
	configfile >> "cfgvehicles",
	{
		private ["_class","_classname","_simulation","_scope","_side","_cost","_armor","_camouflage","_transportSoldier","_backpack","_backpackSimulation","_turrets","_weapons","_cursors","_hasWeapons","_namesound"];
		_class = _this;
		_classname = tolower configname _class;
		_simulation = tolower gettext (_class >> "simulation");
		_scope = getnumber (_class >> "scope");
		_side = getnumber (_class >> "side");
		_cost = getnumber (_class >> "cost");
		_icon = gettext (_class >> "icon");
		_attendant = getnumber (_class >> "attendant");
		_armor = getnumber (_class >> "armor");
		_camouflage = getnumber (_class >> "camouflage");
		_transportSoldier = getnumber (_class >> "transportSoldier");
		_hiddenUnderwaterSelections = getarray (_class >> "hiddenUnderwaterSelections");
		_backpack = gettext (_class >> "backpack");
		_backpackSimulation = gettext (configfile >> "cfgvehicles" >> _backpack >> "backpackSimulation");
		_isUAV = getnumber (_class >> "isUAV");
		_turrets = _classname call bis_fnc_getTurrets;
		_weapons = [];
		_cursors = [];

		{
			private ["_turretWeapons","_xLower","_cfgX","_magazines","_cursor"];
			_turretWeapons = getarray (_x >> "weapons");
			{
				_xLower = tolower _x;
				if !(_xLower in _weapons) then {
					_cfgX = configfile >> "cfgweapons" >> _x;
					_magazines = getarray (_cfgX >> "magazines");
					_cursor = gettext (_cfgX >> "cursor");
					_cursors set [count _cursors,tolower _cursor];
					if (count _magazines > 0) then {
						_weapons set [count _weapons,_xLower];
					};
				};
			} foreach _turretWeapons;
		} foreach _turrets;
		_hasWeapons = count _weapons > 0;

		_namesound = switch _simulation do {
			case "soldier": {
				switch true do {
					case (count _hiddenUnderwaterSelections > 0): {"infantry_diver"};
					case ("srifle" in _cursors): {"infantry_sniper"};
					case (_camouflage < 1): {"infantry_SF"};
					case (_attendant > 0): {"infantry_medic"};
					case (_icon == "iconManAT"): {"infantry_AT"};
					case (_icon == "iconManMG"): {"infantry_MG"};
					case (_icon == "iconManOfficer"): {"infantry_officer"};
					case (_classname in _pilots): {"infantry_pilot"};
					case (_side == 3): {"infantry_civilian"};
					default {"infantry"};
				};
			};
			case "car";
			case "carx": {
				if (_scope > 1 || true) then {
					switch (true) do {
						case (_isUAV > 0): {"vehicle_UGV"};
						case (_classname iskindof "Truck_F"): {"vehicle_truck"};
						case (_classname iskindof "Wheeled_APC_F"): {"vehicle_APC"};
						case (_armor > 85): {"vehicle_MRAP"};
						case (_hasWeapons): {"vehicle_armedcar"};
						default {"vehicle_car"};
					};
				} else {
					"vehicle_car"
				};
			};
			case "tank";
			case "tankx": {

				switch (true) do {
					case (_classname iskindof "AT_01_base_F"): {"static_AT"};
					case (_classname iskindof "AA_01_base_F"): {"static_AA"};
					case (_classname iskindof "StaticMGWeapon"): {"static_MG"};
					case (_classname iskindof "StaticGrenadeLauncher"): {"static_GL"};
					case (_classname iskindof "StaticMortar"): {"static_mortar"};
					case (_classname iskindof "StaticWeapon"): {"static"};
					case (_classname iskindof "APC_Tracked_01_base_F" && _transportSoldier > 0): {"vehicle_APC"};
					case (_classname iskindof "APC_Tracked_02_base_F" && _transportSoldier > 0): {"vehicle_APC"};
					case (count _turrets > 2): {"vehicle_tank"};
					default {"vehicle_armor"};

/*
					default {
						if (count _turrets > 2) then {
							"vehicle_tank"
						} else {
							if (_transportSoldier > 0) then {"vehicle_APC"} else {"vehicle_armor"};
						};
					};
*/
				};
			};
			case "helicopter";
			case "helicopterrtd";
			case "helicopterx": {
				if (_isUAV > 0) then {
					"air_UAV"
				} else {
					if (count _weapons > 3) then {"air_gunship"} else {"air_helicopter"};
				};
			};
			case "airplane";
			case "airplanex": {
				if (_isUAV > 0) then {"air_UAV"} else {"air_plane"}
			};
			case "parachute": {
				"air_parachute"
			};
			case "ship";
			case "shipx": {
				if (_hasWeapons) then {"ship_attackBoat"} else {"ship"};
			};
			case "submarine";
			case "submarinex": {
				"ship_submarine"
			};
			default {"unknown"};
		};
//[_class,_nameSound] call bis_fnc_log;
		_namesound = "veh_" + _namesound;
		_namesound
	}
] call bis_fnc_uniqueClasses;


_br = tostring [13,10];
_brMacro =  "\" + _br;
_text = "//--- Generated by BIS_fnc_diagNameSound" + _br;
_namesounds = [
	"veh_unknown",
		"veh_infantry",
			"veh_infantry_AT",
			"veh_infantry_MG",
			"veh_infantry_SF",
			"veh_infantry_sniper",
			"veh_infantry_officer",
			"veh_infantry_pilot",
			"veh_infantry_medic",
			"veh_infantry_diver",
			"veh_infantry_civilian",
		"veh_vehicle",
			"veh_vehicle_car",
				"veh_vehicle_armedcar",
				"veh_vehicle_truck",
				"veh_vehicle_MRAP",
			"veh_vehicle_armor",
				"veh_vehicle_APC",
				"veh_vehicle_tank",
			"veh_vehicle_UGV",
		"veh_air",
			"veh_air_helicopter",
				"veh_air_gunship",
			"veh_air_plane",
			"veh_air_UAV",
			"veh_air_parachute",
		"veh_ship",
			"veh_ship_boat",
			"veh_ship_attackBoat",
			"veh_ship_submarine",
		"veh_static",
			"veh_static_MG",
			"veh_static_AA",
			"veh_static_AT",
			"veh_static_GL",
			"veh_static_cannon",
			"veh_static_mortar",
			"veh_static_light"
];
{
	_text = _text + format [
		"#define DEF_NAMESOUND_%1" + _brMacro +
		"	class SpeechVariants" + _brMacro +
		"	{" + _brMacro +
		"		class Default" + _brMacro +
		"		{" + _brMacro +
		"			speechSingular[] = {%1_s};" + _brMacro +
		"			speechPlural[] = {%1_p};" + _brMacro +
		"		};" + _brMacro +
		"	};" + _brMacro +
		"	textSingular = ""$STR_A3_nameSound_%1_s"";" + _brMacro +
		"	textPlural = ""$STR_A3_nameSound_%1_p"";" + _brMacro +
		"	nameSound = ""%1_s"";" + _br + _br,
		_x
	];
} foreach _namesounds;


{
	_text = _text + format [
		"#define CFGVEHICLES_NAMESOUND_%1	DEF_NAMESOUND_%2" + _br,
		configname (_x select 0),
		_x select 1
	];
} foreach _classes;

copytoclipboard _text;

endloadingscreen;

_text