scriptName "Marta\data\scripts\system_radar.sqf";
/*
	File: system_radar.sqf
	Author: Karel Moricky

	Description:
	Radar system using MARTA system

	Parameter(s):
	_this select 0: Object - radar dome
	_this select 1: Array or Side or String - Faction(s) or Side(s) of radar
	_this select 2: Number - radar range (optional parameter, default value is 2000m)
*/

_radar = _this select 0;
_factions = _this select 1;
_radius = if (count _this > 2) then {_this select 2} else {2000};

//--- Only one side or faction passed
if (typename _factions != "ARRAY") then {_factions = [_factions]};

if (isnil {_radar getvariable "radar"}) then {_radar setvariable ["radar",1]};

_id = 0;
_enable = false;
//_radar addeventhandler ["KILLED",{(_this select 0) setvariable ["radar",0]}];

while {alive _radar} do {
	//--- Enable
	if (!_enable && (_radar getvariable "radar") == 1) then {
		_id = ["ADD",[position _radar,_radius],_factions,["Air"]] call BIS_marta_zone;
		_enable = true;
	};

	//--- Disable
	if (_enable && (_radar getvariable "radar") == 0) then {
		["REMOVE",_id] call BIS_marta_zone;
		_enable = false;
	};

	sleep 1;
};

["REMOVE",_id] call BIS_marta_zone;
