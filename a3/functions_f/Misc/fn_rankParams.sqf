/*
	Author: Karel Moricky

	Description:
	Return information about military rank.

	Parameter(s):
	0:
		NUMBER - rank ID
		STRING - rank system name (e.g. "PRIVATE", "CORPORAL", ...)
		OBJECT - person whos rank is checked
	1: STRING - requited data, can be one of following:
		"displayName" - full localized name (e.g. "Major")
		"displayNameShort" - short localized name (e.g. "Maj.")
		"classname" - system name (e.g. "MAJOR")
		"texture" - path to rank insignia

	Returns:
	STRING
*/
with uinamespace do {
	private ["_rankID","_mode","_result","_rankCfg","_rankCfgLocal","_rank"];

	_rankID = [_this,0,-1,[0,"",objnull]] call bis_fnc_param;
	_mode = [_this,1,"classname",[""]] call bis_fnc_param;
	_result = "";

	if (typename _rankID == typename objnull) then {_rankID = rankid _rankID;};
	//if (typename _rankID == typename "") then {_rankID = -1;};

	if (typename _rankID == typename "") then {

		_cfgRanks = configfile >> "CfgRanks";
		for "_r" from 0 to (count _cfgRanks - 1) do {
			_rankCfgLocal = _cfgRanks select _r;
			_rank = if (isclass _rankCfgLocal) then {
				gettext (_rankCfgLocal >> "rank");
			} else {
				""
			};
			if (_rank == _rankID && _rank != "") exitwith {	
				_rankCfg = _rankCfgLocal;
			};
		};
	} else {
		_rankCfg = configfile >> "CfgRanks" >> str _rankID;
	};
	if (isnil "_rankCfg") exitwith {""};

	switch (tolower _mode) do {
		case "displayname": {gettext (_rankCfg >> "displayName");};
		case "displaynameshort": {gettext (_rankCfg >> "displayNameShort");};
		case "texture": {gettext (_rankCfg >> "texture");};
		case "classname": {gettext (_rankCfg >> "rank");};
		default {["Mode is '%1', must be one of 'displayName', 'displayNameShort', 'className' or 'texture'",_mode] call bis_fnc_error; ""};
	};
};