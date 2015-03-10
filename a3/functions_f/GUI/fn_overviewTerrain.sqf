private ["_ctrlListbox","_cursel","_display","_ctrlPicture","_ctrlDescription","_class","_config","_picture","_description"];

disableserialization;
_ctrlListbox = _this select 0;
_cursel = _this select 1;

//--- Get display
_display = ctrlparent _ctrlListbox;
_ctrlPicture = _display displayctrl 1005;
_ctrlDescription = _display displayctrl 1100;

//--- Control not loaded yet - wait a moment
if (isnull _ctrlPicture && count _this == 2) exitwith {(_this + [0]) spawn bis_fnc_overviewTerrain;};

//--- Get terrain
_class = _ctrlListbox lbdata _cursel;
_config = configfile >> "cfgworlds" >> _class;

//--- Change picture
_picture = gettext (_config >> "pictureShot");
if (_picture != "") then {
	_ctrlPicture ctrlsettext _picture;
} else {
	_ctrlPicture ctrlsettext "A3\Ui_f\data\GUI\Rsc\RscDisplaySelectIsland\island_picture_dummy_ca.paa";
};

//--- Change description (removed)
//_description = gettext (_config >> "overviewText");
//_ctrlDescription ctrlsetstructuredtext parsetext _description;

//--- Change author
[_display,_config] call bis_fnc_overviewAuthor;