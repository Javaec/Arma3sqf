/*
	Author: Karel Moricky

	Description:
	Replace 'Save' button with 'Heliport' button
*/

disableSerialization;
_display = _this select 0;

//--- Heliport menu
if (missionname == worldname) then {

	_buttonSave = _display displayctrl 103;
	_buttonSave ctrlshow false;

	_buttonSkip = _display displayctrl 1002;
	_buttonSkip ctrlsetfade 0;
	_buttonSkip ctrlcommit 0;
	_buttonSkip ctrlenable true;
	_buttonSkip ctrlshow true;
	_buttonSkip ctrlsettext "Heliport";
	_buttonSkip ctrlseteventhandler [
		"ButtonClick",
		"
			[] spawn BIS_fnc_heliportMenuMain;
			false
		"
	];

	//--- Disable heliport button
	if (!isnil "hsim_heliportEnable") then {
		_buttonSkip ctrlenable hsim_heliportEnable;
	} else {
		_buttonSkip ctrlenable true;
	};
};

true