#include "\A3\ui_f\hpp\defineResinclDesign.inc"

disableserialization;
_mode = _this select 0;
_params = _this select 1;
_class = _this select 2;

switch _mode do {
	case "onLoad": {
		_params spawn {
			disableserialization;

			_display = _this select 0;
			_ctrlTime = _display displayctrl IDC_RSCRESPAWNCOUNTER_PLAYERRESPAWNTIME;
			_ctrlDescription = _display displayctrl IDC_RSCRESPAWNCOUNTER_DESCRIPTION;

			_respawnTime = -1;
			_timeOld = time;
			_textOld = "Schnobble";
			_textInit = false;
			_colorIDOld = -1;

			while {!alive player || missionnamespace getVariable ["RscRespawnCounter_Custom", 0] > 0} do {

				//--- Counter
				private "_context";
				_context = missionnamespace getvariable ["RscRespawnCounter_Custom", playerrespawntime];
				if (_context < 3600) then {
					if (_context != _respawnTime) then {
						_respawntime = _context;
						_timeOld = time;
					};
					_time = (_context - (time - _timeOld)) max 0;
					_ctrlTime ctrlsettext ([_time,"MM:SS.MS"] call bis_fnc_secondsToString);
				} else {
					_ctrlTime ctrlsettext "  --:--.---";
				};

				//--- Description
				_text = missionnamespace getvariable ["RscRespawnCounter_description",""];
				if (_text != _textOld) then {
					_delay = if ((_text == "" || _textOld == "") && _textInit) then {0.2} else {0};
					_ctrlDescription ctrlsetstructuredtext parsetext  _text;
					_ctrlDescriptionPos = ctrlposition _ctrlDescription;
					_ctrlDescriptionPos set [3,ctrltextheight _ctrlDescription];
					_ctrlDescription ctrlsetposition _ctrlDescriptionPos;
					_ctrlDescription ctrlcommit _delay;
					_textOld = _text;
					_textInit = true;
				};

				_colorID = missionnamespace getvariable ["RscRespawnCounter_colorID",0];
				if (_colorID != _colorIDOld) then {
					_colorSet = switch _colorID do {
						case 1: {["IGUI","WARNING_RGB"]};
						case 2: {["IGUI","ERROR_RGB"]};
						default {["IGUI","TEXT_RGB"]};
					};
					_color = _colorSet call bis_fnc_displaycolorget;
					_ctrlTime ctrlsettextcolor _color;
					_ctrlDescription ctrlsettextcolor _color;
					_colorIDOld = _colorID;
				};

				sleep 0.01;
			};

		};
	};
};