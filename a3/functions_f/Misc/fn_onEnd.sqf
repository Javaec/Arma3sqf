/*
	Author: Karel Moricky

	Description:
	Register code to be executed after mission end.

	Parameter(s):
	_this:
		CODE
		ARRAY - code with custom arguments in format [CODE,ARG1,ARG2,...]
		NUMBER - remove code of given index

	Returns:
	NUMBER - index of onEnd code
*/

private ["_input","_index"];

_input = _this;

//--- Executed first time
if (isnil "BIS_fnc_onEnd_listCodes") then {
	BIS_fnc_onEnd_listCodes = [];
	
	[] spawn {
		scriptName "BIS_fnc_onEnd: eventhandler control";
		
		disableSerialization;
		
		// Wait for the display to exist
		waitUntil {!(isNull ([] call BIS_fnc_displayMission))};
		
		([] call bis_fnc_displaymission) displayaddeventhandler [
			"unload",
			"
				_listCodes = +BIS_fnc_onEnd_listCodes;
				{
					if (typename _x == typename []) then {
						(_x select 1) call (_x select 0)
					};
				} foreach _listCodes;
			"
		];
	};
};

_index = switch (typename _input) do {
	case (typename []): {

		//--- Add code with arguments
		_code = [_input,0,{},[{}]] call bis_fnc_param;
		if (typename _code == typename {}) then {
			_index = count BIS_fnc_onEnd_listCodes;
			_args = [_input,1,_index] call bis_fnc_param;
			BIS_fnc_onEnd_listCodes set [_index,[_code,_args]];

			_index
		};
	};
	case (typename {}): {

		//--- Add code without arguments
		_index = count BIS_fnc_onEnd_listCodes;
		BIS_fnc_onEnd_listCodes set [_index,[_input,_index]];
		_index
	};
	case (typename 00): {

		//--- Remove
		if (_input >= 0) then {
			BIS_fnc_onEnd_listCodes set [_input,_input];
		};
		_input
	};
	default {-1}
};

_index