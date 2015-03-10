// Build (and reset, if necessary) the list of available warnings
// Leader still alive
if (count (missionNamespace getVariable ["BIS_zoneRestriction_warn_A_hasLeader", []]) == 0) then {
	BIS_zoneRestriction_warn_A_hasLeader = [
		"zone_restriction_a_warn_has_leader_ALP_0",
		"zone_restriction_a_warn_has_leader_ALP_1",
		"zone_restriction_a_warn_has_leader_ALP_2"
	];
};

// Never had a leader
if (count (missionNamespace getVariable ["BIS_zoneRestriction_warn_A_noLeader", []]) == 0) then {
	BIS_zoneRestriction_warn_A_noLeader = [
		"zone_restriction_a_warn_no_leader_KER_0",
		"zone_restriction_a_warn_no_leader_KER_1",
		"zone_restriction_a_warn_no_leader_KER_2"
	];
};

// Leader died
if (count (missionNamespace getVariable ["BIS_zoneRestriction_warn_A_leaderDead", []]) == 0) then {
	BIS_zoneRestriction_warn_A_leaderDead = [
		"zone_restriction_a_warn_leader_dead_MIL_0",
		"zone_restriction_a_warn_leader_dead_MIL_1",
		"zone_restriction_a_warn_leader_dead_MIL_2"
	];
};

private ["_timeOut"];
_timeOut = missionNamespace getVariable ["BIS_zoneRestriction_warn_A_timeOut", 0];

if (time >= _timeOut) then {
	// Prevent messages from playing every time he exits
	BIS_zoneRestriction_warn_A_timeOut = time + 300;
	
	if ({alive _x} count (units group BIS_inf - [BIS_inf]) > 0) then {
		// Player still has a squad leader
		BIS_leader = leader group BIS_inf;
		
		private ["_sentence"];
		_sentence = BIS_zoneRestriction_warn_A_hasLeader call BIS_fnc_selectRandom;
		BIS_zoneRestriction_warn_A_hasLeader = BIS_zoneRestriction_warn_A_hasLeader - [_sentence];
		
		["A_Warn_Has_Leader", "Zone_Restriction", [_sentence, _sentence], "GROUP", nil, nil, 1] spawn BIS_fnc_kbTell;
	} else {
		if (missionName in ["A_in2"]) then {
			// Doesn't make sense to have HQ talk to him
			private ["_sentence"];
			_sentence = BIS_zoneRestriction_warn_A_noLeader call BIS_fnc_selectRandom;
			BIS_zoneRestriction_warn_A_noLeader = BIS_zoneRestriction_warn_A_noLeader - [_sentence];
			
			["A_Warn_No_Leader", "Zone_Restriction", [_sentence, _sentence], "DIRECT", nil, nil, 1] spawn BIS_fnc_kbTell;
		} else {
			if (!(surfaceIsWater position vehicle BIS_inf)) then {
				// HQ warns player
				private ["_sentence"];
				_sentence = BIS_zoneRestriction_warn_A_leaderDead call BIS_fnc_selectRandom;
				BIS_zoneRestriction_warn_A_leaderDead = BIS_zoneRestriction_warn_A_leaderDead - [_sentence];
				
				["A_Warn_Leader_Dead", "Zone_Restriction", [_sentence, _sentence], "SIDE", nil, nil, 1] spawn BIS_fnc_kbTell;
			};
		};
	};
};