_logic = _this select 0;
_activated = _this select 2;
if (_activated && local _logic) then {
	_unit = _logic getvariable ["bis_fnc_curatorAttachObject_object",objnull];

	//--- Check if the unit is suitable
	_error = "";
	switch true do {
		case (isnull _unit): {_error = localize "str_a3_BIS_fnc_showCuratorFeedbackMessage_506";};
		case !(alive _unit): {_error = localize "str_a3_BIS_fnc_moduleArsenal_errorDead";};
		case (isplayer _unit): {_error = localize "str_a3_BIS_fnc_showCuratorFeedbackMessage_307";};
		case (isnull group _unit || !(side group _unit in [east,west,resistance,civilian])): {_error = localize "str_a3_BIS_fnc_moduleArsenal_errorBrain";};
		case (vehicle _unit != _unit || effectivecommander _unit != _unit): {_error = localize "str_a3_BIS_fnc_moduleArsenal_errorVehicle";};
	};

	if (_error == "") then {
		([] call bis_fnc_rscLayer) cuttext ["","black out",0.5];
		["#(argb,8,8,3)color(0,0,0,1)",false,nil,0,[0.5,0]] call bis_fnc_textTiles;
		["Open",[true,nil,_unit]] call bis_fnc_arsenal;
		([] call bis_fnc_rscLayer) cuttext ["","plain"];
	} else {
		[objnull,_error] call bis_fnc_showCuratorFeedbackMessage;
	};
	deletevehicle _logic;
};