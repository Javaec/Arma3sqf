/*
	Author: Karel Moricky

	Description:
	Display units in all missions.

	Parameter(s):
	_this select 0:
		OBJECT or STRING - object or it's type which icon is searched for
		BOOL - export marker config macros

	Returns:
	NOTHING
*/

private ["_type"];
_type = [_this,0,"",["",objnull,true]] call bis_fnc_param;


if (typename _type == typename true) then {

	//--- Export marker config macros
	private ["_icons","_iconsString","_cfg","_cfgCount","_n","_class","_icon","_iconArray"];
	startloadingscreen [""];

	_icons = [];
	_iconsString = "";

	_cfg = configfile >> "cfgvehicles";
	_cfgcount = count _cfg;
	_n = 0;
	for "_c" from 0 to (_cfgcount - 1) do {
		_class = _cfg select _c;
		if (isclass _class) then {
			_icon = gettext (_class >> "icon");
			if ({_x == _icon} count _icons == 0 || true) then {
				_icons set [count _icons,_icon];

				_iconArray = toarray _icon;
				if (count _iconArray < 20) then {
					_icon = gettext (configfile >> "cfgvehicleicons" >> _icon);
					_iconArray = toarray _icon;
				};

				if ((_iconArray select 0) != 35) then {
					_iconsString = _iconsString + format ["	VEHICLEICON(%1,%2)
",_n,_icon];
					_n = _n + 1;
				};
			};
		};
		progressloadingscreen (_c / _cfgcount);
	};
	copytoclipboard _iconsString;

	endloadingscreen;
	""
} else {

	//--- Ask for specific marker
	private ["_icon","_iconDef","_iconId"];
	if (typename _type == typename objnull) then {_type = typeof _type;};

	//--- Load marker types
	if (isnil {uinamespace getvariable "BIS_fnc_markerTypeUnit_classes"}) then {
0 call bis_fnc_log;
		private ["_markerclasses","_cfgMarkers","_marker"];

		_markerclasses = [];
		_cfgMarkers = configfile >> "cfgmarkers";
		for "_i" from 0 to (count _cfgMarkers - 1) do {
			_marker = _cfgmarkers select _i;
			if (isclass _marker) then {
				_vehicleicon = getnumber (_marker >> "vehicleicon");
				if (_vehicleicon > 0) then {
					_icon = gettext (_marker >> "icon");
					_markerclasses set [count _markerclasses,tolower _icon];
				};
			};
		};
		uinamespace setvariable ["BIS_fnc_markerTypeUnit_classes",_markerclasses];
	};

	//--- Identify marker type
	_icon = gettext (configfile >> "cfgvehicles" >> _type >> "icon");
	_iconDef = gettext (configfile >> "cfgvehicleicons" >> _icon);
	if (_iconDef != "") then {_icon = _iconDef};
	_icon = tolower _icon;
	_iconId = (uinamespace getvariable ["BIS_fnc_markerTypeUnit_classes",[]]) find _icon;
	if (_iconId > 0) then {
		"VehicleIcon_" + str _iconId
	} else {
		"mil_triangle"
	};
};