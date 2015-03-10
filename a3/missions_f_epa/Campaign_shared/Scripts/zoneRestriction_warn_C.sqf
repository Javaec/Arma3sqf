// Build (and reset, if necessary) the list of available warnings
if (count (missionNamespace getVariable ["BIS_zoneRestriction_warn_C", []]) == 0) then {
	BIS_zoneRestriction_warn_C = [0,1,2];
};

private ["_timeOut"];
_timeOut = missionNamespace getVariable ["BIS_zoneRestriction_warn_C_timeOut", 0];

if (time >= _timeOut) then {
	// Prevent messages from playing every time he exits
	BIS_zoneRestriction_warn_C_timeOut = time + 5;
	
	// Have player warn himself
	private ["_sentence"];
	_sentence = BIS_zoneRestriction_warn_C call BIS_fnc_selectRandom;
	BIS_zoneRestriction_warn_C = BIS_zoneRestriction_warn_C - [_sentence];
	
	["A_Warn_No_Leader", "Zone_Restriction", [["KER", _sentence], ["KER", _sentence]], "DIRECT", nil, nil, 1] spawn BIS_fnc_kbTell;
};