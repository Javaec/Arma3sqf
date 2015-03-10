/*
	Author: Karel Moricky

	Description:
	Checks length of weapon info texts.

	Parameter(s):
	NONE

	Returns:
	BOOL
*/

//--- Function called before display - create display and terminate
if (count _this <= 1) exitwith {
	if (count _this > 0) then {
		_parent = [_this,0,displaynull,[displaynull]] call (uinamespace getvariable "bis_fnc_param");
		_parent createdisplay "RscDisplayLocWeaponInfo";
	} else {
		createdialog "RscDisplayLocWeaponInfo"
	};
};

disableserialization;
_mode = [_this,0,"Init",[displaynull,""]] call bis_fnc_param;
_this = [_this,1,[]] call bis_fnc_param;

switch _mode do {

	///////////////////////////////////////////////////////////////////////////////////////////
	case "Init": {
		startloadingscreen [""];
		_display = _this select 0;
		//_xMod = 0.02 - (0.035 / safezoneH);
		_xMod = (getResolution select 2) * 0.00001;
		//_xMod = (getResolution select 0) * 0.00001;

		//--- Scan weapons
		_listWeapons = _display displayctrl 1500;
		_weaponNames = [];
		_weaponClasses = [];
		_cfgWeapons = configfile >> "cfgweapons";

		_checkWeapon = {
			private ["_weapon","_configName","_displayName","_weaponId","_lbAdd","_muzzles","_isWeapon"];
			_weapon = _this;
			if (isclass _weapon) then {
				_configName = configname _weapon;
				_displayName = gettext (_weapon >> "displayName");
				if (_displayName == "") then {_displayName = "!!!MISSING!!!"};

				_weaponId = _weaponNames find _displayName;
				if (_weaponId < 0) then {

					//---- Add to listbox
					_lbAdd = _listWeapons lbadd _displayName;
					_listWeapons lbsetdata [_lbAdd,_configName];
					_listWeapons lbsetvalue [_lbAdd,_lbAdd];
					_weaponNames set [_lbAdd,_displayName];
					_weaponClasses set [_lbAdd,[_configName]];

					_muzzles = getarray (_weapon >> "muzzles");
					{
						_muzzle = _weapon >> _x;
						if (isclass _muzzle) then {
							_muzzle call _checkWeapon;
						};
					} foreach _muzzles;

					//--- Grey out non-weaponInfo classes
					_isWeapon = count getarray (_weapon >> "magazines") > 0;
					if (!_isWeapon) then {
						_listWeapons lbsetcolor [_lbAdd,[1,1,1,0.5]];
					};
				} else {
					_classes = (_weaponClasses select _weaponId);
					_classes set [count _classes,_configName];
				};
			};
		};
		for "_w" from 0 to (count _cfgWeapons - 1) do {
			(_cfgWeapons select _w) call _checkWeapon;
		};
		BIS_fnc_locWeaponInfo_weaponClasses = _weaponClasses;
		_listWeapons ctrladdeventhandler ["lbselchanged","with uinamespace do {['lbSelChanged_weapons',_this] call bis_fnc_locWeaponInfo};"];
		lbsort _listWeapons;
		_listWeapons lbsetcursel 0;

		//--- Background for comparison
		_etalonPattern = "<t size='0.8' color='#0000ff00' shadow='0'>MMMMMMMMMMMMMMMM</t><t size='0.8' color='#ffff0000' shadow='0'>I</t><br />";
		_etalonString = "";
		for "_i" from 1 to 22 do {_etalonString = _etalonString + _etalonPattern};
		_etalonWeapons = _display displayctrl 1100;
		_etalonWeapons ctrlsetstructuredtext parsetext _etalonString;

		//--- Scan magazines
		_listMagazines = _display displayctrl 1501;
		_magazineNames = [];
		_magazineClasses = [];
		_cfgMagazines = configfile >> "cfgMagazines";
		for "_m" from 0 to (count _cfgMagazines - 1) do {
			_magazine = _cfgMagazines select _m;
			if (isclass _magazine) then {
				_configName = configname _magazine;
				_displayName = gettext (_magazine >> "displayNameShort");
				if (_displayName == "") then {_displayName = "!!!MISSING!!!"};

				_magazineId = _magazineNames find _displayName;
				if (_magazineId < 0) then {

					//---- Add to listbox
					_lbAdd = _listMagazines lbadd _displayName;
					_listMagazines lbsetdata [_lbAdd,_configName];
					_listMagazines lbsetvalue [_lbAdd,_lbAdd];
					_magazineNames set [_lbAdd,_displayName];
					_magazineClasses set [_lbAdd,[_configName]];

				};
			};
		};
		BIS_fnc_locWeaponInfo_magazineClasses = _magazineClasses;
		_listMagazines ctrladdeventhandler ["lbselchanged","with uinamespace do {['lbSelChanged_magazines',_this] call bis_fnc_locWeaponInfo};"];
		lbsort _listMagazines;
		_listMagazines lbsetcursel 0;

		//--- Background for comparison
		_etalonPattern = "<t size='0.8' color='#0000ff00' shadow='0'>MMMMMMMM</t><t size='0.8' color='#ffff0000' shadow='0'>I</t><br />";
		_etalonString = "";
		for "_i" from 1 to 22 do {_etalonString = _etalonString + _etalonPattern};
		_etalonMagazines = _display displayctrl 1101;
		_etalonMagazines ctrlsetstructuredtext parsetext _etalonString;

		endloadingscreen;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "Exit": {
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "lbSelChanged_weapons": {
		_display = ctrlparent (_this select 0);
		_cursel = _this select 1;

		_editWeapons = _display displayctrl 1400;
		_listWeapons = _display displayctrl 1500;
		_editWeapons ctrlsettext str (BIS_fnc_locWeaponInfo_weaponClasses select (_listWeapons lbvalue _cursel));
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "lbSelChanged_magazines": {
		_display = ctrlparent (_this select 0);
		_cursel = _this select 1;

		_editMagazines = _display displayctrl 1401;
		_listMagazines = _display displayctrl 1501;
		_editMagazines ctrlsettext str (BIS_fnc_locWeaponInfo_weaponClasses select (_listMagazines lbvalue _cursel));
	};

};
true