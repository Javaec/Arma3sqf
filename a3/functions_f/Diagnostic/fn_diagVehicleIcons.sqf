/*
	Author: Karel Moricky

	Description:
	Previews all vehicle icons on map

	Parameter(s):
		0: STRING (Optional) - Parent class of scanned vehicles (default "All")
		1: ARRAY (Optional) - Position of the fist icon, others will be layered on top of it (default: [100,100], i.e. bottom left corner)
		2: CONTROL (Optional) - Map on which markers are displayed (default value: main map)

	Returns:
	BOOL
*/
disableserialization;

_parent = [_this,0,"all",[""]] call bis_fnc_param;
_posStart = [_this,1,[100,100]] call bis_fnc_param;
_map = [_this,2,finddisplay 12 displayctrl 51,[controlnull]] call bis_fnc_param;

if (isnull _map) exitwith {"Map control not found" call bis_fnc_error;};
_posStart = _posStart call bis_fnc_position;

BIS_fnc_diagVehicleIcons_posStart = _posStart;

//--- Extract all vehicle icons
startloadingscreen [""];
_iconList = [];
_duplicity = [];
_cfgIslandMap = configfile >> "cfgingameui" >> "islandmap";
_cfg = configfile >> "cfgvehicles";
for "_i" from 0 to (count _cfg - 1) do {
	_veh = _cfg select _i;
	if (isclass _veh) then {
		_parents = [_veh,""] call bis_fnc_returnparents;
		if ({_x == _parent} count _parents > 0) then {
			_icon = gettext (_veh >> "icon");
			if ({tolower _icon == _x} count _duplicity == 0) then {
				_model = gettext (_veh >> "model");
				_vehicleIcon = gettext (configfile >> "cfgvehicleicons" >> "icon");

				_iconList set [count _iconList,[configname _veh,_model,_icon,_vehicleIcon]];
				_duplicity set [count _duplicity,tolower _icon];
			};
		};
	};
};
endloadingscreen;

BIS_fnc_diagVehicleIcons_list = _iconList;

//--- Create text description
_markers = missionnamespace getvariable ["BIS_fnc_diagVehicleIcons_markers",[]];
{deletemarker _x;} foreach _markers;
_markers = [];
{
	_veh = _x select 0;
	_model = _x select 1;
	_icon = _x select 2;
	_vehicleicon = _x select 3;
	_side = _x select 4;
	_pos = [
		(BIS_fnc_diagVehicleIcons_posStart select 0) + 60,
		(BIS_fnc_diagVehicleIcons_posStart select 1) + 15 * _foreachindex
	];

	_text = format ["   %3",_veh,_model,_icon,_vehicleicon];

	//--- White box behind testing icon
	_marker = createmarker ["BIS_fnc_diagVehicleIcons_marker_" + str _foreachindex,_pos];
	_marker setmarkertype "mil_box";
	_marker setmarkersize [3,3];
	_marker setmarkercolor "colorwhite";
	_markers set [count _markers,_marker];

	//--- Icon path
	_marker = createmarker ["BIS_fnc_diagVehicleIcons_markertext_" + str _foreachindex,_pos];
	_marker setmarkertype "mil_box";
	_marker setmarkertext _text;
	_marker setmarkersize [0,0];
	_marker setmarkercolor "colorblack";
	_markers set [count _markers,_marker];

} foreach BIS_fnc_diagVehicleIcons_list;
BIS_fnc_diagVehicleIcons_markers = _markers;

//--- Create icons
BIS_fnc_diagVehicleIcons_sidecolors = [
	getarray (_cfgIslandMap >> "colorenemy"),
	getarray (_cfgIslandMap >> "colorcivilian"),
	getarray (_cfgIslandMap >> "colorfriendly"),
	getarray (_cfgIslandMap >> "colorneutral"),
	[0,0,0,1]
];
BIS_fnc_diagVehicleIcons_code = {
	_map = _this select 0;
	{
		_veh = _x select 0;
		_model = _x select 1;
		_icon = _x select 2;
		_vehicleicon = _x select 3;
		_texture = if (_vehicleicon == "") then {_icon} else {_vehicleicon};
		_posy = (BIS_fnc_diagVehicleIcons_posStart select 1) + 15 * _foreachindex;

		{
			_sideColor = BIS_fnc_diagVehicleIcons_sidecolors select _foreachindex;
			_map drawIcon [
				_texture,	//texture
				_sideColor,	//color
				[(BIS_fnc_diagVehicleIcons_posStart select 0) + _foreachindex * 15,_posy],	//position
				32,	//width
				32,	//height
				_x,	//angle
				"",	//text
				0	//shadow
			];
		} foreach [-90,-45,-30,-15,0];
	} foreach BIS_fnc_diagVehicleIcons_list;
};

//--- Display icons on map
_map ctrlseteventhandler ["draw","_this call BIS_fnc_diagVehicleIcons_code"];