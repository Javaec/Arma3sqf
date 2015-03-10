/*
	Author: Karel Moricky

	Description:
	Register code to be executed when diary item changes.

	Arguments passed into code are:
		0: DISPLAY - map display
		1: BOOL - true if clicked on subject list, false when on record list (clicking on subject may also trigger record)
		2: STRING - subject name
		3: STRING - record name
		4: ANY - passed arguments (index of onDiaryChanged code when no custom arguments were used)

	Parameter(s):
	_this:
		CODE
		ARRAY - code with custom arguments in format [CODE,ARG1,ARG2,...]
		NUMBER - remove code of given index

	Returns:
	NUMBER - index of onDiaryChanged code
*/

private ["_input","_index"];

_input = _this;

//--- Executed first time
if (isnil "BIS_fnc_onDiaryChanged_listCodes") then {
	BIS_fnc_onDiaryChanged_listCodes = [];
};

_index = switch (typename _input) do {
	case (typename []): {

		//--- Add code with arguments
		_code = [_input,0,{},[{}]] call bis_fnc_param;
		if (typename _code == typename {}) then {
			_index = count BIS_fnc_onDiaryChanged_listCodes;
			_args = [_input,1,_index] call bis_fnc_param;
			BIS_fnc_onDiaryChanged_listCodes set [_index,[_code,_args]];

			_index
		};
	};
	case (typename {}): {

		//--- Add code without arguments
		_index = count BIS_fnc_onDiaryChanged_listCodes;
		BIS_fnc_onDiaryChanged_listCodes set [_index,[_input,_index]];
		_index
	};
	case (typename 00): {

		//--- Remove
		if (_input >= 0) then {
			BIS_fnc_onDiaryChanged_listCodes set [_input,_input];
		};
		_input
	};
	default {-1}
};

_index