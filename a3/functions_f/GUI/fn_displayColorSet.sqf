/*
	Author: Karel Moricky

	Description:
	Set display's color

	Parameter(s):
	_this select 0: STRING - display class
	_this select 1: DISPLAY
	_this select 2 (Optional): NUMBER - commit time
	_this select 3 (Optional): CODE - code executed for every control element (which is passed as _this)

	Returns:
	BOOL
*/

private ["_displayClass","_display","_delay","_code"];
disableserialization;

_displayClass =		[_this,0,configfile,[configfile]] call bis_fnc_param;
_display =		[_this,1,displaynull,[displaynull]] call bis_fnc_param;
_delay =		[_this,2,0,[0]] call bis_fnc_param;
_code =			[_this,3,{},[{}]] call bis_fnc_param;

//--- Apply colors
{
	private ["_cfg"];
	_cfg = _x;
	for "_i" from 0 to (count _cfg - 1) do {
		private ["_current"];
		_current = _cfg select _i;

		if (isclass _current) then {
			private ["_type"];

			_type = getnumber (_current >> "type");
			if (_type == 15) then {

				//--- Controls Group - go deeper
				if (getnumber (_current >> "disableCustomColors") == 0) then {
					[_current,_display,_delay,_code] call (uinamespace getvariable _fnc_scriptName);
				};
			} else {
				private ["_idc","_control","_colorText","_colorBackground"];

				//--- Element
				_idc = getnumber (_current >> "idc");
				if (_idc >= 0) then {
					_control = _display displayctrl _idc;

					//--- Text color
					_colorText = getarray (_current >> "colorText");
					{
						if (typename _x == typename "") then {_colorText set [_forEachIndex,call compile _x];};
					} foreach _colorText;
					if (count _colorText > 0) then {_control ctrlsettextcolor _colorText};

					//--- Background color
					_colorBackground = getarray (_current >> "colorBackground");
					{
						if (typename _x == typename "") then {_colorBackground set [_forEachIndex,call compile _x];};
					} foreach _colorBackground;
					if (count _colorBackground > 0) then {_control ctrlsetbackgroundcolor _colorBackground};

					_control ctrlcommit _delay;
					_control call _code;
				};
			};
		};
	};
} foreach [
	_displayClass >> "controlsbackground",
	_displayClass >> "controls",
	_displayClass
];

true