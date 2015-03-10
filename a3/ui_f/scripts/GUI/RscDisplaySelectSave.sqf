_mode = _this select 0;
_params = _this select 1;
_class = _this select 2;

switch _mode do {

	case "onLoad": {
		
		//--- set player's name
		(_display displayctrl 109) ctrlSetText profileName;
		[_display, 109] call (uinamespace getvariable 'BIS_fnc_setIDCStreamFriendly');
		
		//Sets all texts toUpper
		["RscDisplaySelectSave",["RscText","RscTitle"],["PlayersName"]] call bis_fnc_toUpperDisplayTexts;
		
		_versionCtrl = _display displayctrl 1005;
		_trafficLightCtrl = _display displayctrl 121;
		[_versionCtrl, _trafficLightCtrl] call bis_fnc_versionInfo;
	};

	default {};
};