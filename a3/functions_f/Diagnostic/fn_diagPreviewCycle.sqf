/*
	Author: Karel Moricky

	Description:
	Previews selected class from the list.
	When cheat1 is activated, classnames will be shown instead of display names

	Parameter(s):
	_this select 0: STRING - class container. Can be: "CfgVehicles", "CfgWeapons"
	_this select 1: ARRAY - position of the previewed object
	_this select 2: ARRAY - vector of previewed object in format [pitch,bank]
	_this select 3 (Optional): DISPLAY - parent display

	Returns:
	BOOL
*/

disableserialization;
startloadingscreen [""];
_mode = [_this,0,"cfgVehicles",[""]] call bis_fnc_param;
_pos = [_this,1,[position player,10,0] call bis_fnc_relpos,[[]],3] call bis_fnc_param;
_pitchbank = [_this,2,[0,0],[[]],2] call bis_fnc_param;
_parentDisplay = [_this,3,displaynull,[displaynull]] call bis_fnc_param;

_pos set [2,(_pos select 2) min 1];
bis_fnc_diagPreviewCycle_pos = _pos;
bis_diagPreviewCycle_pitchbank = _pitchbank;

bis_fnc_diagPreviewCycle_cam = if (isnil "BIS_fnc_camera_cam") then {
	_cam = "camera" camcreate _pos;
	_cam cameraeffect ["internal","back"];
	showcinemaborder false;
	_cam
} else {
	objnull
};

if (isnull _parentDisplay) then {
	_parentDisplay = if (isnull (finddisplay 314)) then {[] call bis_fnc_displayMission} else {finddisplay 314};
};
_parentDisplay createdisplay "RscDisplayCommon";

_display = uinamespace getvariable "RscDisplayCommon";

_ctrlList = _display displayctrl 1500;
_ctrlList ctrlsetposition [
	safezoneX,
	safezoneY,
	0.4,
	1
];
_ctrlList ctrlcommit 0;

_ctrllabel = _display displayctrl 1000;
_ctrllabel ctrlsetposition [
	safezoneX + safezoneW - 0.41,
	safezoneY + safezoneH - 0.06,
	0.4,
	0.05
];
_ctrllabel ctrlsetbackgroundcolor [0,0,0,1];
_ctrllabel ctrlcommit 0;

//--- Event handlers
_display displayaddeventhandler [
	"unload",
	"
		uinamespace setvariable ['bis_fnc_diagPreviewCycle_lbcursel',lbcursel ((_this select 0) displayctrl 1500)];
		bis_fnc_diagPreviewCycle_cam cameraeffect ['terminate','back'];
		camdestroy bis_fnc_diagPreviewCycle_cam;
	"
];
_display displayaddeventhandler [
	"keydown",
	"
		_display = _this select 0;
		_key = _this select 1;
		switch (_key) do {
			case 29;
			case 42;
			case 54;
			case 56;
			case 157: {
				{
					_ctrlList = _display displayctrl _x;
					_ctrlList ctrlsetfade round ((ctrlfade _ctrlList + 1) % 2);
					_ctrlList ctrlcommit 0.2;
				} foreach [1500,1100];
				true
			};
		};
		false
	"
];

switch (tolower _mode) do {

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	case "cfgvehicles": {

		_ctrlList ctrladdeventhandler [
			"lbselchanged",
			"
				_vehicle = (_this select 0) lbdata lbcursel (_this select 0);
				_vehicleName = if (cheat1) then {_vehicle} else {[configfile >> 'CfgVehicles' >> _vehicle] call bis_fnc_displayname};
				_pos = bis_fnc_diagPreviewCycle_pos;
				_pitchbank = bis_diagPreviewCycle_pitchbank;
				deletevehicle (missionnamespace getvariable ['bis_fnc_diagPreviewCycle_object',objnull]);
				_object = createvehicle [_vehicle,_pos,[],0,'none'];
				_object setpos _pos;
				_object setdir 180;
				[_object,_pitchbank select 0,_pitchbank select 1] call bis_fnc_setpitchbank;
				_object switchmove 'amovpercmstpsnonwnondnon';
				bis_fnc_diagPreviewCycle_object = _object;

				_size = sizeof _vehicle;
				_campos = [_pos,_size,135] call bis_fnc_relpos;
				_campos set [2,_size / 4];
				bis_fnc_diagPreviewCycle_cam campreparepos _campos;
				bis_fnc_diagPreviewCycle_cam campreparetarget _object;
				bis_fnc_diagPreviewCycle_cam campreparefocus [(_campos distance _object) - _size / 3,1];
				bis_fnc_diagPreviewCycle_cam camcommitprepared 0;

				_display = ctrlparent (_this select 0);
				_ctrllabel = _display displayctrl 1000;
				_ctrllabel ctrlsettext _vehicleName;
			"
		];

		//--- Load vehicles
		_cfgVehicles = configfile >> "cfgvehicles";
		for  "_c" from 0 to (count _cfgVehicles - 1) do {
			_vehicle = _cfgvehicles select _c;
			if (isclass _vehicle) then {
				_scope = getnumber (_vehicle >> "scope");
				if (_scope > 0) then {
					_side = getnumber (_vehicle >> "side");
					_displayName = _vehicle call bis_fnc_displayName;
					_vehicleClass = gettext (_vehicle >> "vehicleclass");

					_lbAdd = _ctrlList lbadd (_vehicleClass + " / " + _displayName);
					_ctrlLIst lbsetdata [_lbAdd,configname _vehicle];
					if (_side >= 0) then {_ctrlLIst lbsetcolor [_lbAdd,_side call bis_fnc_sidecolor];};
				};
			};
			progressloadingscreen (_c / (count _cfgVehicles - 1));
		};
		lbsort _ctrlList;

		_cursel = uinamespace getvariable ["bis_fnc_diagPreviewCycle_lbcursel",0];
		_ctrlList lbsetcursel _cursel;
	};

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	case "cfgweapons": {
		_ctrlList ctrladdeventhandler [
			"lbselchanged",
			"
				_weapon = (_this select 0) lbdata lbcursel (_this select 0);
				_weaponName = if (cheat1) then {_weapon} else {[configfile >> 'CfgWeapons' >> _weapon] call bis_fnc_displayname};
				_pos = bis_fnc_diagPreviewCycle_pos;
				_pitchbank = bis_diagPreviewCycle_pitchbank;
				deletevehicle (missionnamespace getvariable ['bis_fnc_diagPreviewCycle_object',objnull]);
				_object = createvehicle ['groundweaponholder',_pos,[],0,'none'];
				_object addweaponcargo [_weapon,1];
				_object enableSimulation false;
				_object setpos _pos;
				_object setdir 0;
				[_object,_pitchbank select 0,_pitchbank select 1] call bis_fnc_setpitchbank;
			
				bis_fnc_diagPreviewCycle_object = _object;
				_size = sizeof _vehicle;
				_campos = [_pos,1,180] call bis_fnc_relpos;
				_campos set [2,(_campos select 2)+3];
				bis_fnc_diagPreviewCycle_cam campreparepos _campos;
				bis_fnc_diagPreviewCycle_cam campreparetarget _object;
				bis_fnc_diagPreviewCycle_cam campreparefocus [(_campos distance _object),1];
				bis_fnc_diagPreviewCycle_cam campreparefov 0.3;
				bis_fnc_diagPreviewCycle_cam camcommitprepared 0;

				_weaponID = bis_fnc_diagPreviewCycle_allWeapons find (tolower _weapon);
				_sideText = '';
				if (_weaponID >= 0) then {
					_sides = bis_fnc_diagPreviewCycle_allWeapons select (_weaponID + 1);
					{
						_sideName = _x call bis_fnc_sideName;
						_sideColor = (_x call bis_fnc_sideColor) call bis_fnc_colorRGBtoHTML;
						_sideText = _sideText + ""<t align='right' shadow='0' color='"" + _sidecolor + ""'>"" + _sideName + '</t><br />';
					} foreach _sides;
				};

				_display = ctrlparent (_this select 0);
				_ctrllabel = _display displayctrl 1000;
				_ctrllabel ctrlsettext (_weaponName);

				_ctrlsides = _display displayctrl 1100;
				_ctrlsides ctrlsetstructuredtext parsetext _sideText;
				_h = ctrltextheight _ctrlSides;
				_ctrlsides ctrlsetposition [
					safezoneX + safezoneW - 0.3,
					safezoneY,
					0.3,
					_h
				];
				_ctrlsides ctrlcommit 0;
			"
		];

		//--- Load sides
		_allWeapons = [];
		_cfgVehicles = configfile >> "cfgvehicles";
		for  "_c" from 0 to (count _cfgVehicles - 1) do {
			_vehicle = _cfgvehicles select _c;
			if (isclass _vehicle) then {
				_side = getnumber (_vehicle >> "side");
				_weapons = getarray (_vehicle >> "weapons");
				{
					_xLower = tolower _x;
					_weaponID = _allWeapons find _xLower;
					if (_weaponID < 0) then {
						_allWeapons set [count _allWeapons,_xLower];
						_allWeapons set [count _allWeapons,[_side]];
					} else {
						_sides = _allWeapons select (_weaponID + 1);
						if !(_side in _sides) then {_sides set [count _sides,_side];};
					};
				} foreach _weapons;
			};
		};
		bis_fnc_diagPreviewCycle_allWeapons = _allWeapons;

		//--- Load weapons
		_cfgweapons = configfile >> "cfgweapons";
		for  "_c" from 0 to (count _cfgweapons - 1) do {
			_weapon = _cfgweapons select _c;
			if (isclass _weapon) then {
				_scope = getnumber (_weapon >> "scope");
				if (_scope > 0) then {
					_model = gettext (_weapon >> "model");
					if (_model != "") then {
						_type = getnumber (_weapon >> "type");
						_cursor = gettext (_weapon >> "cursor");
						if (_cursor == "") then {_cursor = "X"};
						_displayName = _weapon call bis_fnc_displayName;

						_lbAdd = _ctrlList lbadd (configname _weapon);
						_ctrlList lbsetdata [_lbAdd,configname _weapon];
						if (_type > 4) then {_ctrlLIst lbsetcolor [_lbAdd,[0,0,0,0.5]];};
					};
				};
			};
			progressloadingscreen (_c / (count _cfgweapons - 1));
		};
		lbsort _ctrlList;

		_cursel = uinamespace getvariable ["bis_fnc_diagPreviewCycle_lbcursel",0];
		_ctrlList lbsetcursel _cursel;
	};
};
endloadingscreen;
true