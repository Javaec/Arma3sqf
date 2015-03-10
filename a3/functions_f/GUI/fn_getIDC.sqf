/*
	Author: Karel Moricky

	Description:
	Returns IDC of given display

	Parameter(s):
	_this select 0: CONFIG - config path to display
	_this select 1: STRING - control name

	Returns:
	NUMBER - IDC
*/

private ["_configDisplay","_control","_result"];
_configDisplay = [_this,0,configfile,[configfile]] call bis_fnc_param;
_control = [_this,1,"",[""]] call bis_fnc_param;
_result = 0;
{
	_configDisplay = _x;
	if (isclass _configDisplay) then {
		private ["_idc"];
		_idc = (_configDisplay >> _control >> "idc");
		if (isnumber _idc) then {
			_result = getnumber _idc
		} else {
			_idc = 0;
			for "_c" from 0 to (count _configDisplay - 1) do {
				private ["_configControl"];
				_configControl = (_configDisplay select _c);
				if (isclass _configControl) then {
					private ["_type"];
					_type = getnumber (_configControl >> "type");
					if (_type == 15) then {
						_idc = [_configControl,_control] call bis_fnc_getidc;
					};
				};
				if (_idc != 0) exitwith {_result = _idc};
			};
			_idc
		};
	};
} foreach [
	_configDisplay,
	_configDisplay >> "controls",
	_configDisplay >> "controlsBackground"
];
_result