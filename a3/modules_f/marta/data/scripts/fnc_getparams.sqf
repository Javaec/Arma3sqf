scriptName "Marta\data\scripts\fnc_getParams.sqf";
/*
	File:fnc_getGroup.sqf
	Author: Karel Moricky

	Description:
	Returns group assigned to given marker

	Parameter(s):
	_this select 0: String - Mode

		* GROUP - Find group by marker
			o _this select 1: String - Marker
			o Returned value: Group - group assigned to marker

		* MARKER - Find marker by group
			o _this select 1: Group - Object or Group
			o Returned value: String - marker assigned to group

		* MARKERS - Get list of all markers
			o Returned value: Array - list of MARTA markers
*/
private ["_marker","_logic","_group","_allgroups","_allmarkers","_markerTemp","_id","_result"];
_logic = BIS_marta_mainscope;
_allgroups = _logic getvariable "allgroups";
_result = -1;

switch (_this select 0) do {

	case "GROUP": {
		_marker = _this select 1;
		_group = grpNull;

		_allmarkers = ["MARKERS"] call BIS_marta_getParams;

		//--- Create list of MARTA markers
		for "_i" from 0 to (count _allgroups - 1) do {
			_markerTemp = format ["BIS_marta_%1",_i];
			_allmarkers = _allmarkers + [_markerTemp];
		};

		//--- Find marker and select associated group
		_id = _allmarkers find _marker;
		if (_id >= 0) then {
			_group = _allgroups select _id;
		};
		_result = _group;
	};

	case "MARKER": {
		_group = _this select 1;
		if (typename _group == "OBJECT") then {_group = group _group};
		_id = _allgroups find _group;
		_marker = format ["BIS_marta_%1",_id];
		_result = _marker;
	};

	case "MARKERS": {
		_allmarkers = [];

		//--- Create list of MARTA markers
		for "_i" from 0 to (count _allgroups - 1) do {
			_markerTemp = format ["BIS_marta_%1",_i];
			_allmarkers = _allmarkers + [_markerTemp];
		};

		_result = _allmarkers;
	};

	default {debuglog "Log: MARTA: Error in fnc_getParams.sqf"};
};

//--- Result
_result;





