/*
	Author: Karel Moricky

	Description:
	Export list of objects for Community Wiki
	http://community.bistudio.com/wiki/Category:Arma_3:_Assets

	Parameter(s):
		0: STRING - mode
			"config" - copy the objects table to clipboard
			"screenshots" - create objects one by one and take their screenshot. Works only on "Render" terrain.
			"screenshotsTest" - create objects one by one without taking screen (to verify everything is ok)

		1: ARRAY of SIDEs 0 list of sides. Only objects of these sides will be used
		2: ARRAY of STRINGs - list of CfgPatches classes. Only objects belonging to these addons will be used
		3: BOOL - true to use only AI units (soldiers, vehicles), false to use empty ones

	Returns:
	BOOL
*/

_mode = [_this,0,"config",[""]] call bis_fnc_param;
_sides = [_this,1,[0,1,2,3],[[]]] call bis_fnc_param;
_patches = [_this,2,[],[[]]] call bis_fnc_param;
_allVehicles = [_this,3,true,[true]] call bis_fnc_param;

_patches = +_patches;
{
	_patches set [_foreachindex,tolower _x];
} foreach _patches;
_allPatches = count _patches == 0;

_sides = +_sides;
{
	if (typename _x == typename sideunknown) then {_sides set [_foreachindex,_x call bis_fnc_sideid];};
} foreach _sides;
if (count _sides == 0) then {_sides = [0,1,2,3,4];};

player enablesimulation false;
player hideobject true;

switch tolower _mode do {
	case "config": {
		startloadingscreen [""];
		_br = tostring [13,10];
		_product = productversion select 0;
		_productShort = productversion select 1;
		_scopes = ["Private","Protected","Public"];

		_fnc_getItemPage = {
			switch (_this) do {
				case "Weapon": {"CfgWeapons Weapons"};
				case "VehicleWeapon": {"CfgWeapons Vehicle Weapons"};
				case "Item": {"CfgWeapons Items"};
				case "Equipment": {"CfgWeapons Equipment"};
				default {"CfgWeapons"};
			};
		};

		_text = "{| class=""wikitable sortable"" border=""1"" style=""border-collapse:collapse; font-size:80%;"" cellpadding=""3px""" + _br;
		_text = _text + "! Preview<br />" + _br;
		_text = _text + "! Class<br />" + _br;
		_text = _text + "! Name<br />" + _br;
		_text = _text + "! Side<br />" + _br;
		_text = _text + "! Faction<br />" + _br;
		_text = _text + "! Category<br />" + _br;
		_text = _text + "! Scope<br />" + _br;
		_text = _text + "! Weapons<br />" + _br;
		_text = _text + "! Magazines<br />" + _br;
		_text = _text + "! Items<br />" + _br;
		_text = _text + "! Addons<br />" + _br;
		_text = _text + "! Features<br />" + _br;

		_cfgVehicles = (configfile >> "cfgvehicles") call bis_fnc_returnchildren;
		_cfgVehiclesCount = count _cfgVehicles;
		{
			_class = configname _x;
			_side = getnumber (_x >> "side");
			_scope = getnumber (_x >> "scope");
			_unitAddons = unitaddons _class; 
			_isAllVehicles = _class iskindof "allvehicles";
			if (
				((_allVehicles && _isAllVehicles) || (!_allVehicles && !_isAllVehicles))
				&&
				_side in _sides
				&&
				(_allPatches || {(tolower _x) in _patches} count _unitAddons > 0)
				&&
				_scope > 0
			) then {
				_textWeapons = "";
				_textMagazines = "";
				_textItems = "";

				_weapons = [];
				_magazines = [];
				_items = [gettext (_x >> "uniformClass")] + getarray (_x >> "linkedItems") + getarray (_x >> "items");
				_items = _items - [""];
				{
					_weapons = _weapons + getarray (_x >> "weapons");
					_magazines = _magazines + getarray (_x >> "magazines");
				} foreach (_class call bis_fnc_getTurrets);

				{
					_type = _x call bis_fnc_itemType;
					_page = (_type select 0) call _fnc_getItemPage;
					_textWeapons = _textWeapons + _br + format [":[[%1 %3#%2|%2]]",_product,_x,_page];
				} foreach _weapons;

				while {count _magazines > 0} do {
					_mag = _magazines select 0;
					_textMagazines = _textMagazines + _br + format [":%1x&nbsp;[[%3 CfgMagazines#%2|%2]]",{_x == _mag} count _magazines,_mag,_product];
					_magazines = _magazines - [_mag];
				};

				while {count _items > 0} do {
					_item = _items select 0;
					_type = _item call bis_fnc_itemType;
					_page = (_type select 0) call _fnc_getItemPage;
					_textItems = _textItems + _br + format [":[[%4 %3#%2|%2]]",{_x == _item} count _items,_item,_page,_product];
					_items = _items - [_item];
				};

				_textAddons = "";
				{
					_textAddons = _textAddons + _br + format [":[[%1 CfgPatches CfgVehicles#%2|%2]]",_product,_x];
				} foreach _unitAddons;

				_sideColor = ["#e1c2c2","#c2d4e7","#c2e1c2","#dac2e1","#ede7c2"] select _side;

				_text = _text + "|-" + _br;
				_text = _text + "| " + format ["[[File:%1 CfgVehicles %2.jpg|150px|&nbsp;]]",_productShort,_class] + _br;
				_text = _text + "| " + format ["<span id=""%1"" >'''%1'''</span>",_class] + _br;
				_text = _text + "| " + "''" + gettext (_x >> "displayName") + "''" + _br;
				_text = _text + "| " + format ["style='background-color:%2;' | %1",str (_side call bis_fnc_sideType),_sideColor] + _br;
				_text = _text + "| " + gettext (_x >> "faction") + _br;
				_text = _text + "| " + gettext (_x >> "vehicleClass") + _br;
				//_text = _text + "| " + (_scopes select getnumber (_x >> "scope")) + _br;
				_text = _text + "| " + format ["<span title=""%1"" class=""help"">",_scopes select _scope] + str _scope + "</span>" + _br;
				_text = _text + "| " + /*"<small>" +*/ _textWeapons + _br + /*"</small>" + */_br;
				_text = _text + "| " + /*"<small>" +*/ _textMagazines + _br + /*"</small>" + */_br;
				_text = _text + "| " + /*"<small>" +*/ _textItems + _br + /*"</small>" + */_br;
				_text = _text + "| " + /*"<small>" +*/ _textAddons + _br + /*"</small>" + */_br;
				_text = _text + "| " + gettext (_x >> "features") + _br;;
			};
			progressloadingscreen (_foreachindex / _cfgVehiclesCount);
		} foreach _cfgVehicles;

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
	case "screenshots";
	case "screenshotsTest": {

		if !(worldname in ["Render","RenderGreen","RenderBlue"]) exitwith {"Use 'Render White' for capturing screenshots." call bis_fnc_errorMsg;};

		_alt = 100;
		_pos = [3540,100,_alt];
		_object = objnull;
		_cfgAll = configfile >> "cfgvehicles" >> "all";
		_restrictedModels = ["","\A3\Weapons_f\dummyweapon.p3d","\A3\Weapons_f\laserTgt.p3d"];
		_blacklist = [
			"WeaponHolder",
			"LaserTarget",
			"Bag_Base"
		];
		_capture = _mode == "screenshots";
		_product = productversion select 1;

		startloadingscreen [""];
		_cfgVehicles = (configfile >> "cfgvehicles") call bis_fnc_returnchildren;
		endloadingscreen;

		_cam = "camera" camcreate _pos;
		_cam cameraeffect ["internal","back"];
		_cam campreparefocus [-1,-1];
		_cam camcommitprepared 0;
		showcinemaborder false;
		setaperture 25;
		setdate [2035,5,28,10,0];
		0 setfog 0.2;

		_n = 0;
		{
			_class = configname _x;
			_scope = getnumber (_x >> "scope");
			_side = getnumber (_x >> "side");
			_unitAddons = unitaddons _class; 
			_isAllVehicles = _class iskindof "allvehicles";

			if (
				((_allVehicles && _isAllVehicles) || (!_allVehicles && !_isAllVehicles))
				&&
				_side in _sides
				&&
				(_allPatches || {(tolower _x) in _patches} count _unitAddons > 0)
				&&
				_scope > 0
			) then {
				_model = gettext (_x >> "model");
				if (!(_model in _restrictedModels) && inheritsfrom _x != _cfgAll && {_class iskindof _x} count _blacklist == 0) then {
					_object = createvehicle [_class,_pos,[],0,"none"];
					if (_class iskindof "allvehicles") then {_object setdir 90;} else {_object setdir 270;};
					//_object setdir 90;
					_object setpos _pos;
					_object switchmove "amovpercmstpsnonwnondnon";
					_object enablesimulation false;

					_size = (sizeof _class) max 0.1;
					_targetZ = 0;
					if (_class iskindof "allvehicles") then {
						_size = _size * 0.5;
					};
					if (_class iskindof "man" && !(_class iskindof "animal")) then {
						_size = _size * 0.5;
						_targetZ = _size * 0.5;
					};
					if (_class iskindof "staticweapon") then {
						_targetZ = -_size * 0.25;
					};
					if (_class iskindof "house") then {
						_size = _size * 0.75;
					};
					_campos = [_pos,_size * 1.5,135] call bis_fnc_relpos;
					_campos set [2,_alt + _size * 0.5];

					_cam campreparepos _campos;
					_cam campreparetarget (_object modeltoworld [0,0,_targetZ]);
					_cam camcommitprepared 0;

					if (_capture) then {
						sleep 1;
						if (cheatsenabled) then {
							call compile format ["diag_screenshot 'exportCfg\%1 CfgVehicles %2.png';",_product,_class];
						};
						sleep 0.01;
					} else {
						sleep 0.1;
					};
					_n = _n + 1;
					_object setpos [10,10,10];
					deletevehicle _object;

					[_class,_size] call bis_fnc_log;
				};
			};
		} foreach _cfgVehicles;
		_n call bis_fnc_log;

		_cam cameraeffect ["terminate","back"];
		camdestroy _cam;
		setaperture -1;
	};
};

player enablesimulation true;
player hideobject false;

true