/*
	Author: Karel Moricky

	Description:
	Export list of weapons for Community Wiki
	http://community.bistudio.com/wiki/Category:Arma_3:_Assets

	Parameter(s):
		0: STRING - mode
			"Weapon", "VehicleWeapon", "Item" - specific item type, based on BIS_fnc_itemType
			"screenshots" - create items one by one and take their screenshot. Works only on "Render" terrain.
			"screenshotsTest" - create items one by one without taking screen (to verify everything is ok)

		1: ARRAY of STRINGs - list of CfgPatches classes. Only weapons belonging to these addons will be used doesn't work, ToDo)

	Returns:
	BOOL
*/

startloadingscreen [""];

_mode = [_this,0,"Weapon",[""]] call bis_fnc_param;
_patches = [_this,1,[],[[]]] call bis_fnc_param;
_types = [_this,2,[],[[]]] call bis_fnc_param;

player enablesimulation false;
player hideobject true;

_mode = tolower _mode;
_screenshots = _mode in ["screenshots","screenshotstest"];
if (_screenshots && !(worldname in ["Render","RenderGreen","RenderBlue"])) exitwith {"Use 'Render White' for capturing screenshots." call bis_fnc_errorMsg;};
_capture = _mode == "screenshots";
if (_screenshots) then {_mode = "Weapon";};

_mode = tolower _mode;
_patchWeapons = [];
_allPatches = true;
if (count _patches > 0) then {
	_allPatches = false;
	{
		_patchWeapons = _patchWeapons + getarray (configfile >> "cfgpatches" >> _x >> "weapons");
	} foreach _patches;
};

_types = +_types;
{
	_types set [_foreachindex,tolower _x];
} foreach _types;
_allTypes = count _types == 0;

_br = tostring [13,10];
_product = productversion select 0;
_productShort = productversion select 1;
_text = "";
_cam = objnull;
_holder = objnull;

_alt = 100;
_pos = [3540,100,_alt];
_player = player;
_weaponObjects = [];

_cfgWeapons = (configfile >> "cfgweapons") call bis_fnc_returnchildren;
_cfgWeaponsCount = count _cfgWeapons;

if (_screenshots) then {
	endloadingscreen;

	_cam = "camera" camcreate _pos;
	_cam cameraeffect ["internal","back"];
	_cam campreparefocus [-1,-1];
	_cam camcommitprepared 0;
	showcinemaborder false;
	setaperture 25;
	setdate [2035,5,28,10,0];
	0 setfog 0.2;
} else {
	{
		_object = configname _x;
		if (getnumber (_x >> "scope") > 0) then {
			_weapons = getarray (_x >> "items") + getarray (_x >> "linkeditems") + [gettext (_x >> "uniformClass")];
			{_weapons = _weapons + getarray (_x >> "weapons");} foreach (_object call bis_fnc_getTurrets);
			{
				_weapon = tolower _x;
				_weaponID = _weaponObjects find _weapon;
				if (_weaponID < 0) then {
					_weaponID = count _weaponObjects;
					_weaponObjects set [_weaponID,_weapon];
					_weaponObjects set [_weaponID + 1,[]];
				};
				_objects = _weaponObjects select (_weaponID + 1);
				if !(_object in _objects) then {_objects set [count _objects,_object];};
			} foreach _weapons;
		};
	} foreach ((configfile >> "cfgvehicles") call bis_fnc_returnchildren);

	_text = "{| class=""wikitable sortable"" border=""1"" style=""border-collapse:collapse; font-size:80%;"" cellpadding=""3px""" + _br;
	if (_mode != "VehicleWeapon") then {_text = _text + "! Preview<br />" + _br;};
	_text = _text + "! Class<br />" + _br;
	_text = _text + "! Name<br />" + _br;
	_text = _text + "! Inventory description<br />" + _br;
	_text = _text + "! Magazines<br />" + _br;
	if (_mode == "Weapon") then {_text = _text + "! Accessories<br />" + _br;};
	_text = _text + "! Used by<br />" + _br;
	if (_mode == "VehicleWeapon") then {_text = _text + "! Used by (gallery)<br />" + _br;};
};
{
	_cfg = _x;
	_class = configname _cfg;
	_scope = getnumber (_cfg >> "scope");
	_model = gettext (_cfg >> "model");
	_weaponAddons = [];
	_itemTypeArray = _class call bis_fnc_itemType;
	_itemCategory = _itemTypeArray select 0;
	_itemType = _itemTypeArray select 1;
	_isAllVehicles = _class iskindof "allvehicles";

	if (
		(_itemCategory == _mode || _screenshots)
		&&
		(_allPatches || {_class == _x} count _patchWeapons > 0)
		&&
		(_allTypes || (tolower _itemType) in _types)
		&&
		_scope > 0
		//&&
		//(_model != "")
	) then {
		if (_screenshots) then {
			_holder = switch _itemType do {
				case "NVGoggles";
				case "Headgears": {
					_holder = createvehicle ["groundweaponholder",_pos,[],0,"none"];
					_holder setpos _pos;
					_holder addweaponcargo [_class,1];
					_holder setvectordirandup [[0,0,1],[0,-1,0]];

					_campos = [_pos,1.75,60] call bis_fnc_relpos;
					_campos set [2,_alt + 1.3];
					_cam campreparepos _campos;
					_cam campreparefov 0.4;
					_cam campreparetarget [(_pos select 0),(_pos select 1) + 0.5,_alt + 1.3];
					_cam camcommitprepared 0;
					_holder
				};
				case "Vestx": {
					_holder = createvehicle ["groundweaponholder",_pos,[],0,"none"];
					_holder setpos _pos;
					_holder addweaponcargo [_class,1];
					_holder setvectordirandup [[0.00173726,0.000167279,0.999998],[-0.995395,-0.0958456,0.00177588]];//[[0,0,1],[-1,0,0]];

					_campos = [_pos,2,90] call bis_fnc_relpos;
					_campos set [2,_alt + 1];
					_cam campreparepos _campos;
					_cam campreparefov 0.7;
					_cam campreparetarget [(_pos select 0),(_pos select 1)-0.3,_alt + 0.6];
					_cam camcommitprepared 0;
					_holder
				};
				case "Headgear";
				case "Vest";
				case "Uniform": {
					_holder = createagent [typeof player,_pos,[],0,"none"];
					removeallweapons _holder;
					removeallitems _holder;
					removeuniform _holder;
					removevest _holder;
					removeheadgear _holder;
					removegoggles _holder;
					_items = assigneditems _holder;
					{_holder unassignitem _x} foreach _items;
					_holder switchcamera "internal";
					_holder setpos _pos;
					_holder setdir 90;
					_holder setface "kerry";
					_holder switchmove "amovpercmstpsnonwnondnon";
					_offset = switch _itemType do {
						case "Headgear": {
							_holder addheadgear _class;
							_cam campreparefov 0.125;
							setShadowDistance 0;
							 0.8125
						};
						case "Vest": {
							_holder addvest _class;
							_cam campreparefov 0.3;
							 0.3
						};
						case "Uniform": {
							_holder adduniform _class;
							_cam campreparefov 0.6;
							 0
						};
					};
					_holder enablesimulation false;

					_campos = [_pos,2.5,90] call bis_fnc_relpos;
					_campos set [2,_alt + 1];
					_cam campreparepos _campos;
					_cam campreparetarget [(_pos select 0),(_pos select 1),_alt + 0.85 + _offset];
					_cam camcommitprepared 0;
					_holder
				};
				case "AccessoryMuzzle";
				case "AccessoryPointer";
				case "AccessorySights": {
						_holder = createvehicle ["groundweaponholder",_pos,[],0,"none"];
						_holder setpos _pos;
						_holder addweaponcargo [_class,1];
						_holder setvectordirandup [[0,0,1],[1,0,0]];

						_fov = if (_itemType == "AccessoryMuzzle") then {0.3} else {0.2};
						_campos = [_pos,0.5,90] call bis_fnc_relpos;
						_campos set [2,_alt + 0.5];
						_cam campreparepos _campos;
						_cam campreparefov _fov;
						_cam campreparetarget [(_pos select 0),(_pos select 1),_alt + 0.57];
						_cam camcommitprepared 0;
						_holder
				};
				default {
					if (_itemCategory == "Item") then {
						_holder = createvehicle ["groundweaponholder",_pos,[],0,"none"];
						_holder setpos [(_pos select 0),(_pos select 1)+0.55,_alt+0.15];
						_holder addweaponcargo [_class,1];
						_holder setvectordirandup [[0.707107,0,0.707107],[0.408248,0.816497,-0.408248]];

						_campos = [_pos,0.5*2,90] call bis_fnc_relpos;
						_campos set [2,_alt + 0.5];
						_cam campreparepos _campos;
						_cam campreparefov 0.4;
						_cam campreparetarget [(_pos select 0),(_pos select 1),_alt + 1];
						_cam camcommitprepared 0;
						_holder
					} else {

						_holder = createvehicle ["groundweaponholder",_pos,[],0,"none"];
						_holder setpos _pos;
						_holder addweaponcargo [_class,1];
						_holder setvectordirandup [[0,0,1],[1,0,0]];

						_fov = if (_itemType == "Handgun") then {0.3} else {0.7};
						_campos = [_pos,0.5,90] call bis_fnc_relpos;
						_campos set [2,_alt + 0.5];
						_cam campreparepos _campos;
						_cam campreparefov _fov;
						_cam campreparetarget [(_pos select 0),(_pos select 1),_alt + 0.57];
						_cam camcommitprepared 0;
						_holder
					};
				};
			};
			if (_capture) then {
				sleep 1;
				if (cheatsenabled) then {
					call compile format ["diag_screenshot 'exportCfg\%1 CfgWeapons %2.png';",_productShort,_class];
				};
				sleep 0.01;
			} else {
				_class call bis_fnc_log;
				sleep 0.1;
			};
			selectplayer _player;
			_holder setpos [10,10,10];
			deletevehicle _holder;
			setShadowDistance -1;
		} else {
			_displayNameArray = toarray gettext (_x >> "displayName");
			{
				if (_x == 160) then {_displayNameArray set [_foreachindex,32];};
			} foreach _displayNameArray;
			_displayName = tostring _displayNameArray;

			_descriptionShortArray = toarray gettext (_x >> "descriptionShort");
			{
				if (_x == 160) then {_descriptionShortArray set [_foreachindex,32];};
			} foreach _descriptionShortArray;
			_descriptionShort = tostring _descriptionShortArray;

			_magazines = getarray (_cfg >> "magazines");
			{
				_magazines = _magazines + getarray (_cfg >> _x >> "magazines");
			} foreach (getarray (_cfg >> "muzzles") - ["this"]);

			_textMagazines = "";
			{
				_textMagazines = _textMagazines + _br + format [":[[%1 CfgMagazines#%2|%2]]",_product,_x];
			} foreach _magazines;

			_textItems = "";
			if (_mode == "Weapon") then {
				{
					if (_x != "") then {
						_textItems = _textItems + _br + format [":[[%1 CfgWeapons Items#%2|%2]]",_product,configname (configfile >> "cfgweapons" >> _x)];
					};
				} foreach [
					gettext (_x >> "linkeditems" >> "linkedItemsOptic" >> "item"),
					gettext (_x >> "linkeditems" >> "linkedItemsAcc" >> "item"),
					gettext (_x >> "linkeditems" >> "linkedItemsMuzzle" >> "item")
				];
			};

			_textObjects = "";
			_galleryObjects = "";
			_weaponID = _weaponObjects find (tolower _class);
			_objects = [];
			if (_weaponID >= 0) then {
				_objects = _weaponObjects select (_weaponID + 1);
				{
					_textSide = if (_x iskindof "allvehicles") then {
						str ((getnumber (configfile >> "cfgvehicles" >> _x >> "side") min 3) call bis_fnc_sidetype)
					} else {
						"EMPTY"
					};
					_textObjects = _textObjects + _br + format [":[[%1 CfgVehicles %3#%2|%2]]",_product,_x,_textSide];
					_galleryObjects = _galleryObjects + format ["[[File:%1 CfgVehicles %2.jpg|150px|&nbsp;]]",_productShort,_x];
				} foreach _objects;
			};

			_text = _text + "|-" + _br;
			if (_mode != "VehicleWeapon") then {_text = _text + "| " + format ["[[File:%1 CfgWeapons %2.jpg|150px|&nbsp;]]",_productShort,_class] + _br;};
			_text = _text + "| " + format ["<span id=""%1"" >'''%1'''</span>",_class] + _br;
			_text = _text + "| " + "''" + _displayName + "''" + _br;
			_text = _text + "| " + "''" + _descriptionShort + "''" + _br;
			_text = _text + "| " + _textMagazines + _br;
			if (_mode == "Weapon") then {_text = _text + "| " + _textItems + _br;};
			_text = _text + "| " + _br;
			if (_textObjects != "") then {
				_collapse = count _objects > (count _magazines max 10);
				if (_collapse) then {
					_text = _text + "{| class=""wikitable collapsible collapsed""" + _br;
					_text = _text + "! Objects&nbsp;" + _br;
					_text = _text + "|-" + _br;
					_text = _text + "|" + _br;
				};
				_text = _text + _textObjects + _br;
				if (_collapse) then {
					_text = _text + "|}" + _br;
				};
			};
			if (_mode == "VehicleWeapon") then {_text = _text + "| " + _galleryObjects + _br};
		};
	};

	progressloadingscreen (_foreachindex / _cfgWeaponsCount);
} foreach _cfgWeapons;

if (_screenshots) then {
	_cam cameraeffect ["terminate","back"];
	camdestroy _cam;
	setaperture -1;
} else {
	_text = _text + "|}" + _br;
	_text = _text + format [
		"<small style=""color:grey;"">Generated by [[%1]] in [[%2]] version %3.%4 by ~~~~</small>",
		_fnc_scriptName,
		productversion select 0,
		(productversion select 2) * 0.01,
		productversion select 3
	] + _br;
	_text = _text + format ["{{Template:%1 Assets}}",_product] + _br;
	_text = _text + format ["[[Category:%1: Assets]]",_product] + _br;
	_text = _text + format ["[[Category:%1: Editing]]",_product] + _br;
	copytoclipboard _text;

	endloadingscreen;
};

player enablesimulation true;
player hideobject false;

true