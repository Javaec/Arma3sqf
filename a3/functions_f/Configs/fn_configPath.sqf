/*
	Author: Karel Moricky

	Description:
	Return config path to given entry.

	Parameter(s):
		0: CONFIG or ARRAY or STRING
		1 (Optional): ARRAY or STRING or CONFIG - type of returned value (default: ARRAY)

	Returns:
		ARRAY - list of classes (e.g., ["configfile","CfgVehicles"])
		STRING - composed path (e.g., "configfile >> 'CfgVehicles'")
		CONFIG - system path (e.g., configfile >> "CfgVehicles")
*/

private ["_config","_returnMode"];
_config = [_this,0,configfile,[configfile,[],""]] call bis_fnc_param;
_returnMode = [_this,1,[],[[],"",configfile]] call bis_fnc_param;

if (typename _config == typename []) then {
	private ["_path","_error"];
	_error = false;
	_path = configfile;
	{
		if (_foreachindex == 0) then {
			private ["_xID"];
			_xID = ["configfile","campaignconfigfile","missionconfigfile"] find tolower _x;
			if (_xID >= 0) then {
				_path = [configfile,campaignconfigfile,missionconfigfile] select _xID;
			} else {
				["%1 is not a valied config, must be configFile, campaignConfigFile or missionConfigFile.",_x] call bis_fnc_error;
				_error = true;
			};
		} else {
			if (isclass (_path >> _x)) then {
				_path = _path >> _x;
			} else {
				["Class %1 not found in %2",_x,_path] call bis_fnc_error;
				_error = true;
			};
		};
		if (_error) exitwith {};
	} foreach _config;
	_path
} else {
	private ["_slash","_fnc_addWord","_configArray","_word","_words","_return","_class"];
	_slash = toarray "/" select 0;

	//--- Function to add a word to array
	_fnc_addWord = {
		_wordString = tostring _word;
		if (_wordstring == str configfile) then {_wordString = "configfile"};
		if (_wordstring == str campaignconfigfile && str campaignconfigfile != "") then {_wordString = "campaignconfigfile"};
		if (_wordstring == str missionconfigfile && str missionconfigfile != "") then {_wordString = "missionconfigfile"};
		_words set [count _words,_wordString];
		_word = [];
	};

	//--- Scan config path
	if (typename _config != typename "") then {_config = str _config;};
	_configArray = toarray _config;
	_word = [];
	_words = [];
	{
		if (_x == _slash) then {
			call _fnc_addWord;
		} else {
			_word set [count _word,_x];
		};
	} foreach _configArray;
	call _fnc_addWord;

	switch (typename _returnMode) do {
		case (typename ""): {
			_return = "";
			{
				_class = _x;
				if ({_class == _x} count ["configfile","campaignconfigfile","missionconfigfile"] == 0) then {_class = str _class;};

				if (_foreachindex > 0) then {_return = _return + " >> ";};
				_return = _return + _class;
			} foreach _words;
			_return
		};
		case (typename configfile): {
			{
				if (_foreachindex == 0) then {
					switch _x do {
						case "missionconfigfile": {_return = missionconfigfile;};
						case "campaignconfigfile": {_return = campaignconfigfile;};
						case "configfile": {_return = configfile;};
						//default {_return = configfile};
					};
				} else {
					_return = _return >> _x;
				};
			} foreach _words;
			if (isnil "_return") then {configfile >> ""} else {_return}
		};
		default {
			_words
		};
	};
};