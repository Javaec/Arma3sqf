BIS_fnc_heliportDialogInit = {
	disableserialization;

	_display = _this select 0;
	_config = configfile >> _display;
	_configMain = configfile >> "RscDisplayMain";
	_config
};

BIS_fnc_heliportDialogExit = {
	disableserialization;

	_display = _this select 0;
	_config = configfile >> _display;
	closedialog ([_config] call BIS_fnc_getIDD);

};