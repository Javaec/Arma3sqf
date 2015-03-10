/*
	Author: Karel Moricky

	Description:
	Trigger countdown

	Parameter(s):
		0: NUMBER - countdown in seconds
		1: BOOL - true to set the value globally

	Returns:
	NUMBER
*/

private ["_countdown","_isGlobal"];
_countdown = [_this,0,0,[0,true]] call bis_fnc_param;
_isGlobal = [_this,1,true,[true]] call bis_fnc_param;

switch (typename _countdown) do {
	case (typename 0): {
		private ["_servertime"];
		_servertime = if (ismultiplayer) then {servertime} else {time};
		switch true do {
			case (_countdown < 0): {
				missionnamespace setvariable ["bis_fnc_countdown_time",nil];
				if (_isGlobal) then {publicvariable "bis_fnc_countdown_time";};
				-1
			};
			case (_countdown == 0): {
				private ["_time"];
				_time = missionnamespace getvariable "bis_fnc_countdown_time";
				if (isnil "_time") then {
					-1
				} else {
					(_time - _servertime) max 0
				};
			};
			case (_countdown > 0): {
				private ["_time"];
				_time = _servertime + _countdown;
				missionnamespace setvariable ["bis_fnc_countdown_time",_time];
				if (_isGlobal) then {publicvariable "bis_fnc_countdown_time";};
				_time
			};
			default {
				-1
			};
		};
	};
	case (typename true): {
		([] call bis_fnc_countdown) > 0
	};
	default {
		-1
	};
};