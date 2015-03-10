#define	GUI_DISPLAY	(uinamespace getvariable "BIS_RscGUIEditor_main")
#define GUI_CONTROL	(GUI_DISPLAY displayctrl _idc)

_mode = _this select 0;
_modeBool = [false,true] select _mode;
_input = _this select 1;

_button = _input select 1;
_x = _input select 2;
_y = _input select 3;
_shift = _input select 4;
_ctrl = _input select 5;
_alt = _input select 6;

switch _button do {

	//--- LMB
	case 0: {
		if (!_modeBool && GUI_LMB && GUI_idcActive >= 0) then {[1] call GUI_fnc_export;}; //--- History
		GUI_LMB = _modeBool;
		GUI_LMB_pos = [_x,_y];
		GUI_idcActive_pos = nil;
	};

	//--- RMB
	case 1: {
		GUI_RMB = _modeBool;
		GUI_RMB_pos = [_x,_y];

		if (GUI_idcActive < 0) then {
			if (isnull (uinamespace getvariable ["BIS_RscGUIEditor_elementAdd",controlnull])) then {
				[] call GUI_fnc_elementAdd;
			};
		} else {
			if (_ctrl) then {
				if (isnull (uinamespace getvariable ["BIS_RscGUIEditor_elementEditCustom",controlnull])) then {
					[] call GUI_fnc_elementEditCustom;
				};
			} else {
				if (isnull (uinamespace getvariable ["BIS_RscGUIEditor_elementEdit",controlnull])) then {
					[] call GUI_fnc_elementEdit;
				};
			};
		};
	};
};