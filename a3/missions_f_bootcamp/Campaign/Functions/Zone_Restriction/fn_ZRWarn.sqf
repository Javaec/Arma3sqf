// Build (and reset, if necessary) the list of available warnings
if (count (missionNamespace getVariable ["BIS_fnc_ZRWarn_Bootcamp", []]) == 0) then {
	BIS_fnc_ZRWarn_Bootcamp = [0,1,2];
};

private ["_timeOut"];
_timeOut = missionNamespace getVariable ["BIS_fnc_ZRWarn_Bootcamp_timeOut", 0];

if (time >= _timeOut) then {
	if (vehicle BIS_lacey == vehicle BIS_adams) then {
		// Longer delay
		BIS_fnc_ZRWarn_Bootcamp_timeOut = time + 15;
		
		// Only one sentence is appropriate
		BIS_fnc_ZRWarn_Bootcamp = BIS_fnc_ZRWarn_Bootcamp - [0];
		["Warn_Has_Leader", "Zone_Restriction", [["ADA", 0], ["ADA", 0]], "VEHICLE", nil, nil, 1] spawn BIS_fnc_kbTell;
	} else {
		// Shorter delay
		BIS_fnc_ZRWarn_Bootcamp_timeOut = time + 5;
		
		// Choose a random sentence
		private ["_sentence"];
		_sentence = BIS_fnc_ZRWarn_Bootcamp call BIS_fnc_selectRandom;
		BIS_fnc_ZRWarn_Bootcamp = BIS_fnc_ZRWarn_Bootcamp - [_sentence];
		
		if (leader BIS_lacey == BIS_adams) then {
			// Adams is in the player's group
			["Warn_Has_Leader", "Zone_Restriction", [["ADA", _sentence], ["ADA", _sentence]], "GROUP", nil, nil, 1] spawn BIS_fnc_kbTell;
		} else {
			// Adams is not in the player's group
			["Warn_Has_Leader", "Zone_Restriction", [["ADA", _sentence], ["ADA", _sentence]], "SIDE", nil, nil, 1] spawn BIS_fnc_kbTell;
		};
	};
};

true