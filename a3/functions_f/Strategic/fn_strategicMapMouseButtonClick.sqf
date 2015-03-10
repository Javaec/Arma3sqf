_var = [_this,0,"BIS_fnc_strategicMapOpen",[""]] call bis_fnc_param;
_this = [_this,1,[controlnull],[[]]] call bis_fnc_param;

//--- Accept only LMB
_button = _this select 1;
if (_button != 0) exitwith {};

_varMouseDisable = format ["%1_mouseClickDisable",_var];
_varORBATonClick = format ["%1_ORBATonClick",_var];
_varSelected = format ["%1_selected",_var];
_varDisplay = format ["%1_display",_var];

if !(missionnamespace getvariable [_varMouseDisable,true]) then {
	disableserialization;
	_display = ctrlparent (_this select 0);
	_isMainMap = _display == finddisplay 12 && false;
	if (_isMainMap) then {
		_display = [] call bis_fnc_displayMission;
		(finddisplay 12 displayctrl 51) ctrlenable false; //--- Disable the map to prevent cursor blinking
	};
	_selected = missionnamespace getvariable [_varSelected,[]];
	switch (count _selected) do {

		//--- ORBAT
		case 4;
		case 5: {
			missionnamespace setvariable [_varMouseDisable,true];
			_class = _selected select 0;
			_input = _selected select 1;
			_parent = _input select 0;
			_tags = _input select 1;
			_tiers = _input select 2;

			_fade = _display displayctrl 1099;
			_fade ctrlsetfade 0;
			_fade ctrlcommit 0.3;
			uisleep 0.3;
			if (isnull _display) exitwith {};

			//--- Show and animate ORBAT
			missionnamespace setvariable [_varDisplay,[_display]];
			_ORBATonClick = missionnamespace getvariable [_varORBATonClick,{}];
			_displayORBAT = [_parent,_display,_tags,_tiers,_ORBATonClick] call bis_fnc_ORBATOpen;
			if (_class != _parent) then {
				[_class,0,1] call bis_fnc_ORBATanimate;
			};
			if (_isMainMap) then {
				//--- Re-enable the main map after closing
				_displayORBAT displayaddeventhandler ["unload","(finddisplay 12 displayctrl 51) ctrlenable true;"];
			};

			//--- Fade back
			waituntil {isnull _displayORBAT};
			_fade ctrlsetfade 1;
			_fade ctrlcommit 0.3;
			uisleep 0.1; //--- Delay to prevent double-clicking
			missionnamespace setvariable [_varMouseDisable,false];
		};

		//--- Mission
		case 10;
		case 9: {
			missionnamespace setvariable [_varMouseDisable,true];
			_code = _selected select 1;
			_title = _selected select 2;
			_start = [
				format [localize "str_a3_bis_fnc_strategicmapmousebuttonclick_prompt",_title],
				"Mission",
				true,
				true,
				_display,
				true
			] call bis_fnc_guimessage;
			if (_start) then {
				missionnamespace setvariable [_varMouseDisable,true];
				_fade = _display displayctrl 1099;
				_fade ctrlsetfade 0;
				_fade ctrlcommit 2;
				uisleep 2;
				_selected spawn _code;
				uisleep 0.1;
				_display closedisplay 2;
			} else {
				missionnamespace setvariable [_varMouseDisable,false];
			};
		};
	};
};