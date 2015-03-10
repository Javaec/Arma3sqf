private ["_ctrlListbox","_cursel","_display","_text","_cfgDifficulties","_skill","_skillTemp","_overviewText","_ctrlText","_pos","_overviewPicture","_ctrlPicture"];
_ctrlListbox = [_this,0,controlnull,[controlnull]] call bis_fnc_param;
_cursel = lbcursel _ctrlListbox;
_display = ctrlparent _ctrlListbox;

//--- Get difficulty description
_text = _ctrlListbox lbtext _cursel;

//--- Identify difficulty
_cfgDifficulties = configfile >> "cfgDifficulties";
_skill = configfile;
for "_i" from 0 to (count _cfgDifficulties - 1) do {
	_skillTemp = _cfgDifficulties select _i;
	if (isclass _skillTemp) then {
		_displayName = gettext (_skillTemp >> "displayname");//[_skillTemp] call bis_fnc_displayname;
		if (_displayname == _text) then {_skill = _skilltemp;};
	};
};

//--- Overview
if (istext (_skill >> "overviewText")) then {
	_overviewText = gettext (_skill >> "overviewText");
	_ctrlText = _display displayctrl 1100;
	_ctrlText ctrlsetstructuredtext parsetext _overviewText;
	_pos = ctrlposition _ctrlText;
	_pos set [3,ctrltextheight _ctrltext];
	_ctrlText ctrlsetposition _pos;
	_ctrlText ctrlcommit 0;
};

//--- Picture
if (istext (_skill >> "overviewPicture")) then {
	_overviewPicture = gettext (_skill >> "overviewPicture");
	_ctrlPicture = _display displayctrl 1200;
	_ctrlPicture ctrlsettext _overviewPicture;

	_color = ["GUI","BCG_RGB"] call bis_fnc_displayColorGet;
	_ctrlPicture ctrlsettextcolor _color;
	_ctrlPicture ctrlcommit 0;
};