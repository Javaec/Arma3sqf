scriptName "HC\data\scripts\HC_GUI_stat.sqf";
_is3D = _this select 0;
_group = _this select 1;
_wpID = _this select 2;
_posx = _this select 3;
_posy = _this select 4;
_logic = player getvariable "BIS_HC_scope";

disableserialization;

if (typename _group == "GROUP") then {

	//--- Group icon
	_grpIconId = _group getvariable "BIS_MARTA_ICON_TYPE";
	_grpIcon = _group getgroupicon _grpIconId;
	_grpIconClass = _grpIcon select 0;
	_grpIconPath = gettext (configfile >> "cfggroupicons" >> _grpIconClass >> "icon");
	_grpIconName = gettext (configfile >> "cfggroupicons" >> _grpIconClass >> "displayName");
	_grpIconParams = getgroupiconparams _group;
	_grpIconColor = _grpIconParams select 0;
	_grpIconColorHTML = _grpIconColor call bis_fnc_colorRGBtoHTML;

	if (_wpID < 0) then {

		///////////////////////////////////////////////////////////////////////////////////
		///// TOOLTIP - GROUP
		///////////////////////////////////////////////////////////////////////////////////
		_leader = leader _group;
		_leadername = "N/A";
		_rank = "";
		_isplayer = "";
		if (alive _leader) then {
			_leadername = name (leader _group);
			_rank = localize format ["str_short_%1",rank _leader];
			if (isplayer _leader) then {_isplayer = " (" + localize "str_player" + ")"};
		};


		//--- Group icon
		_grpIconId = _group getvariable "BIS_MARTA_ICON_TYPE";
		_grpIcon = _group getgroupicon _grpIconId;
		_grpIconClass = _grpIcon select 0;
		_grpIconPath = gettext (configfile >> "cfggroupicons" >> _grpIconClass >> "icon");
		_grpIconName = gettext (configfile >> "cfggroupicons" >> _grpIconClass >> "displayName");
		_grpIconParams = getgroupiconparams _group;
		_grpIconColor = _grpIconParams select 0;
		_grpIconColorHTML = _grpIconColor call bis_fnc_colorRGBtoHTML;

		//--- Status bar
		_defaultCount = _group getvariable "BIS_HC_THREAT";
		_threatCount = 0;
		{_threatCount = _threatCount + ((1 - damage vehicle _x) * (_x call bis_fnc_threat))} foreach units _group;
		if (_threatCount > _defaultCount) then {_defaultCount = _threatCount; _group setvariable ["BIS_HC_THREAT",_defaultCount]};
		_ratio = _threatCount / _defaultCount;
		_ratio = round (_ratio * 100);
		_bar = format ["%1%2 ",_ratio,"%"];
		_ratio = _ratio / 5;
		for "_i" from 1 to _ratio do {
			_bar = _bar + "I";
		};

		_lineCount = 0;

		//--- Display text
		_tooltip_text = parsetext (
		 	format ["<t size='1.8' color='%2' shadow='0'><img image='%1'/></t>",_grpIconPath,_grpIconColorHTML] + 
			format ["<t size='1.1' color='#ffffff' font='PuristaMedium'> %1</t><br />",_group] + 
			format ["<t size='0.8' color='#ffffff'>%1 %2%3</t><br /> ",_rank,_leadername,_isplayer] + 
			_bar + 
		/*
			"<t size='0.5' align='center' color='#ffffff'>----------------------------------------------------------------</t><br />" + 
			format ["<t>%1</t>",_unitInfo] + 
			format ["<t>%1</t>",_vehInfo] + 
			"<t size='0.5' align='center' color='#ffffff'>----------------------------------------------------------------</t><br />" + 
			format ["<t color='#ffffff'>Health:</t> %1",_damageTotal] + "%<br />" + 
			format ["<t color='#ffffff'>Mode:</t> %1<br />",_mode] + 
			"<t color='#ffffff'>Mission:</t> N/A<br />" +
		*/
			""
		);

		//_tooltip_w = 0.34;
		_tooltip_w = 0.28;
		_tooltip_h = 0.15;
		//_tooltip_h = 0.25 + _lineCount * 0.035;
		_tooltip_x = if ((1 - _posx) < _tooltip_w) then {_posx - _tooltip_w - 0.02} else {_posx + 0.02};
		_tooltip_y = if (_posy > 0.5) then {_posy - _tooltip_h - 0.02} else {_posy + 0.02};

		_tooltip_back = (findDisplay 12) displayctrl 1124;
		if ((ctrlposition _tooltip_back select 0) == 0 || true) then {_tooltip_back ctrlsetposition [_tooltip_x,_tooltip_y,_tooltip_w,_tooltip_h]};
		_tooltip_back ctrlcommit 0;

		_tooltip = (findDisplay 12) displayctrl 1125;
		_tooltip ctrlsetstructuredtext _tooltip_text;
		if ((ctrlposition _tooltip select 0) == 0 || true) then {_tooltip ctrlsetposition [_tooltip_x,_tooltip_y,_tooltip_w,_tooltip_h]};

		_tooltip ctrlcommit 0



	} else {

		///////////////////////////////////////////////////////////////////////////////////
		///// TOOLTIP - WAYPOINT
		///////////////////////////////////////////////////////////////////////////////////


		_wp = [_group,_wpID];

		_wp_number = 1 + (_wp select 1) - currentwaypoint _group;

		_lineCount = 0;
		_wp_info = "";

		//--- Type
		_wp_type = waypointtype _wp;
		_wp_type_list = ["MOVE","CYCLE","SAD","SENTRY","UNLOAD","LOAD","GETOUT","GETIN NEAREST"];
		_wp_type_strings = ["STR_AC_MOVE","STR_AC_CYCLE","STR_AC_SEEKANDDESTROY","STR_AC_SENTRY","STR_AC_UNLOAD","STR_AC_LOAD","STR_AC_GETOUT","STR_AC_GETIN"];
		_wp_type_id = _wp_type_list find _wp_type;
		if (_wp_type_id > 0) then {_wp_info = _wp_info + format ["<t color='#ffffff'>%1</t> %2<br />",localize "STR_DISP_ARCGRP_TYPE",localize (_wp_type_strings select _wp_type_id)]; _lineCount = _lineCount + 1.0};;

		//--- Combat mode
		_wp_combat = waypointbehaviour _wp;
		if (_wp_combat != "UNCHANGED") then {_wp_info = _wp_info + format ["<t color='#ffffff'>%1</t> %2<br />",localize "STR_DISP_ARCWP_SEMAPHORE",localize ("STR_" + _wp_combat)]; _lineCount = _lineCount + 1.0};

		//--- Formation
		_wp_form = waypointformation _wp;
		_wp_form_list = ["COLUMN","STAG COLUMN","WEDGE","ECH LEFT","ECH RIGHT","VEE","LINE","FILE","DIAMOND"];
		_wp_form_strings = ["STR_COLUMN","STR_STAGGERED","STR_WEDGE","STR_ECHL","STR_ECHR","STR_VEE","STR_LINE","STR_FILE","STR_DIAMOND"];
		_wp_form_id = _wp_form_list find _wp_form;
		if (_wp_form_id >= 0) then {_wp_info = _wp_info + format ["<t color='#ffffff'>%1</t> %2<br />",localize "STR_DISP_ARCWP_FORM",localize (_wp_form_strings select _wp_form_id)]; _lineCount = _lineCount + 1.0};

		//--- Speed
		_wp_speed = waypointspeed _wp;
		if (_wp_speed != "UNCHANGED") then {_wp_info = _wp_info + format ["<t color='#ffffff'>%1</t> %2<br />",localize "STR_DISP_ARCWP_SPEED",localize ("STR_SPEED_" + _wp_speed)]; _lineCount = _lineCount + 1.0};

		//--- Timeout
		_wp_timeout = waypointtimeout _wp select 1;
		if (_wp_timeout > 0) then {_wp_info = _wp_info + format ["<t color='#ffffff'>%1:</t> %2 min<br />",localize "STR_DISP_ARCWP_TIMEOUT",str (round (_wp_timeout / 60))]; _lineCount = _lineCount + 1.0};

		//--- Wait until
		_wp_statements = waypointstatements _wp;
		_wp_wait_radiostrings = ["ALPHA","BRAVO","CHARLIE","DELTA","ECHO","FOXTROT","GOLF","HOTEL","INDIA","JULIET"];
		_wp_wait_value = call compile  (_wp_statements select 1);
		if (isnil {_wp_wait_value}) then {_wp_wait_value = "";};
		_wp_wait_desc = localize "STR_HC_MENU_WAITUNTIL" + "";
		if (_wp_wait_value in _wp_wait_radiostrings) then {_wp_wait_value = localize ("STR_RADIO_" + _wp_wait_value); _wp_wait_desc = localize "STR_RADIO" + ":"};
		if ((_wp_statements select 0) != "true") then {_wp_info = _wp_info + format ["<t color='#ffffff'>%1</t> %2<br />",_wp_wait_desc, _wp_wait_value]; _lineCount = _lineCount + 1.0};

		//--- Divider
		//xxx if (_wp_info != "") then {_wp_info = "<t size='0.5' align='center' color='#ffffff'>---------------------------------------------------------</t><br />" + _wp_info; _lineCount = _lineCount + 0.5};

		//--- Display text
		_tooltip_text = parsetext (
		 	format ["<t size='1.5' color='%2' shadow='0'><img image='%1'/></t>",_grpIconPath,_grpIconColorHTML] + 
			format ["<t size='1.1' color='#ffffff' font='PuristaMedium'> %1</t>",_group] + 
			format ["<t align='right'>#%1</t><br />",_wp_number] + 
			_wp_info
		);

		_tooltip_w = 0.30;
		_tooltip_h = 0.06 + _lineCount * 0.035;
		_tooltip_x = if ((1 - _posx) < _tooltip_w) then {_posx - _tooltip_w - 0.02} else {_posx + 0.02};
		_tooltip_y = if (_posy > 0.5) then {_posy - _tooltip_h - 0.02} else {_posy + 0.02};

		_tooltip_back = (findDisplay 12) displayctrl 1124;
		_tooltip_back ctrlsetposition [_tooltip_x,_tooltip_y,_tooltip_w,_tooltip_h];
		_tooltip_back ctrlcommit 0;

		_tooltip = (findDisplay 12) displayctrl 1125;
		_tooltip ctrlsetstructuredtext _tooltip_text;
		_tooltip ctrlsetposition [_tooltip_x,_tooltip_y,_tooltip_w,_tooltip_h];
		_tooltip ctrlcommit 0;
	};
} else {

	///////////////////////////////////////////////////////////////////////////////////
	///// SITREP
	///////////////////////////////////////////////////////////////////////////////////
	_selected = _group;
	if (count _selected == 0) exitwith {};

	//--- Loading
	_loading = [] spawn {
		_n = 0;
		while {true} do {
			_dots = "";
			for "_i" from 0 to (_n % 3) do {_dots = _dots + "."};
			_text = parsetext (
				"<t size='1.3' color='#ffffff' font='PuristaMedium' underline='true' align='left'>SITREP</t>      " + 
				format ["<t size='0.9'>Preparing %1</t><br /> ",_dots] + 
				""
			);
			hintsilent _text;
			_n = _n + 1;
			sleep 0.2;
		};
	};

	_showlimit = 5;

	_allunits = [];
	_textIcons = "";
	{
		_group = _x;
		_allunits = _allunits + units _group;

		//--- Group icon
		_grpIconId = _group getvariable "BIS_MARTA_ICON_TYPE";
		_grpIcon = _group getgroupicon _grpIconId;
		_grpIconClass = _grpIcon select 0;
		_grpIconPath = gettext (configfile >> "cfggroupicons" >> _grpIconClass >> "icon");
		_grpIconName = gettext (configfile >> "cfggroupicons" >> _grpIconClass >> "displayName");
		_grpIconParams = getgroupiconparams _group;
		_grpIconColor = _grpIconParams select 0;
		_grpIconColorHTML = _grpIconColor call bis_fnc_colorRGBtoHTML;
		_textIcons = _textIcons + format ["<t size='1.6' color='%2' shadow='0'><img image='%1'/></t>",_grpIconPath,_grpIconColorHTML];

	} foreach _selected;


	//--- Initial lists of living units
	_units = [];
	_sizeLarge = 1.0;
	_sizeSmall = 0.9;
	_textLarge = "<t size='%3' color='#ffffff'><t align='left'>%1:</t><t align='right'>%2x</t></t><br />";
	_textSmall = "<t size='%3' color='#cccccc'><t align='left'> - %1:</t><t align='right'>%2x</t></t><br />";
	_lineCount = 0;

	//--- Filter living units
	_units = [];
	{if (alive _x) then {_units = _units + [_x]}} foreach _allunits;

	//--- Get list of vehicles
	_vehicles = [];
	{_veh = vehicle _x; if (_veh != _x && !(_veh in _vehicles) && alive _x) then {_vehicles = _vehicles + [_veh]}} foreach _units;
	_all = _units + _vehicles;

	//--- Count units
	_unitTypes = [];
	_unitInfo = "";
	{_type = typeof _x; if !(_type in _unitTypes) then {_unitTypes = _unitTypes + [_type]}} foreach _units;
	_unitCount = count _unitTypes;

	//--- General types
	_displayname = gettext (configfile >> "cfgvehicles" >> "Man" >> "displayname");
	_unitInfo = _unitInfo + format [_textLarge,_displayname,count _units,_sizeLarge];
	_lineCount = _lineCount + _sizeLarge;

	if (_unitCount <= _showlimit) then {

		//--- Detail types
		{
			_class = _x;
			_displayname = gettext (configfile >> "cfgvehicles" >> _x >> "displayname");
			_typeCount = {typeof _x == _class && alive _x} count _units;
			_unitInfo = _unitInfo + format [_textSmall,_displayname,_typeCount,_sizeSmall];
		} foreach _unitTypes;
	};

	//--- Count vehicles
	_vehTypes = [];
	_vehInfo = "";
	_vehCount = 0;
	_result = [];
	if (count _vehicles > 0) then {
		//_vehInfo = "<t size='0.5' align='center' color='#ffffff'>----------------------------------------------------------------</t><br />";
		_vehInfo = "";
		{
			_type = typeof _x;
			if !(_type in _vehTypes) then {_vehTypes = _vehTypes + [_type]};
		} foreach _vehicles;
		_vehCount = count _vehTypes;

		//--- General types (CASE SENSITIVE!)
		_classes = ["Wheeled_APC","Tracked_APC","Car","Tank","Helicopter","Plane","Ship","StaticCannon","StaticMortar"];
		_names = [localize "STR_DN_APC" + " (Wheeled)",localize "STR_DN_APC" + " (Tracked)","","","","","","",""];
		_db = [];
		{
			_class = _x;
			_id = _classes find _class;

			_typeCount = {
				_veh = _x;
				_parents = ([configfile >> "cfgvehicles" >> typeof _veh,true] call bis_fnc_returnParents) - [_class];

				if (_veh iskindof _class) then {
					_limitValue = {_class iskindof _x} count (_classes - [_class]);
					if ({_x in _parents} count _classes == _limitvalue) then {true} else {false};
				} else {false};

			} count _vehicles;

			if (_typeCount > 0) then {

				_displaynameCategory = gettext (configfile >> "cfgvehicles" >> _class >> "displayname");
				if ((_names select _id) != "") then {_displaynameCategory = _names select _id};
				_vehInfo = _vehInfo + format [_textLarge,_displaynameCategory,_typeCount,_sizeLarge];
				_lineCount = _lineCount + _sizeLarge + 0.5;
				if (_typeCount > _showlimit) exitwith {};


				_tempArray = [];
				//--- Detail types
				{
					_type = _x;
					_displayname = gettext (configfile >> "cfgvehicles" >> _x >> "displayname");
					_typeCountSub = {typeof _x == _type && _x iskindof _class} count _vehicles;

					if (_typeCountSub > 0) then {
						_tempArray = _tempArray + [[_displayname,_typeCountSub]];
						_vehInfo = _vehInfo + format [_textSmall,_displayname,_typeCountSub,_sizeSmall];
						_vehTypes = _vehTypes - [_type]
					};
				} foreach _vehTypes;
				_result set [_id,[_displaynameCategory,_typeCount,_tempArray]];
			};
		} foreach _classes;
	};
/*
	{
		_categoryName = _x select 0;
		_categoryCount = _x select 1;
		_items = _x select 2;

		_vehInfo = _vehInfo + format [_textLarge,_categoryName,_categoryCount,_sizeLarge];
		{
			_itemName = _x select 0;
			_itemCount = _x select 1;
			_vehInfo = _vehInfo + format [_textSmall,_itemName,_itemCount,_sizeSmall];
			
		} foreach _items;
		
	} foreach _result;
*/




	//--- Display text
	terminate _loading;
	_text = parsetext (
		"<t size='1.3' color='#ffffff' font='PuristaMedium' underline='true' align='left'>SITREP</t>" + 
		format ["<t size='0.9' align='right'>%1</t><br />",[daytime] call bis_fnc_timetostring] + 
	 	_textIcons + "<br />" + 
		format ["<t>%1</t>",_unitInfo] + 
		format ["<t>%1</t>",_vehInfo] + 
		""
	);
	hint _text;

	//--- Show menu again
	showCommandingMenu "RscHCGroupRootMenu"

};