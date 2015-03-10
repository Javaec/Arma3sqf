case "BIS_OP": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_A_m03_BIS_OP_desc",
					"<marker name = 'BIS_OP'>",	// %1
					"</marker>",			// %2
					"<marker name = 'BIS_mike26'>",	// %3
					"</marker>"			// %4
				],
				"STR_A3_A_m03_BIS_OP_title",
				""
			],
			nil,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if ({!(isNil _x)} count ["BIS_compromised", "BIS_courtMartial"] == 0) then {
				// Player followed his leader to the OP
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			} else {
				// Player was compromised or court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
		};
	};
};

case "BIS_towers": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_A_m03_BIS_towers_desc",
					"<marker name = 'BIS_charlie'>",	// %1
					"</marker>"				// %2
				],
				"STR_A3_A_m03_BIS_towers_title",
				""
			]
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if ({!(isNil _x)} count ["BIS_compromised", "BIS_courtMartial", "BIS_reprimand1"] > 0) then {
				// Player was compromised, court-martialed, or failed to take out the towers
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			} else {
				if (BIS_inf call BIS_fnc_taskCurrent != _taskID) then {
					// Set as the current task
					_taskID call BIS_fnc_taskSetCurrent;
				} else {
					// Player neutralized the guard towers
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_mike26": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_A_m03_BIS_mike26_desc",
					"<marker name = 'BIS_bravo'>",	// %1
					"</marker>",			// %2
					"<marker name = 'BIS_mike26'>",	// %3
					"</marker>"			// %4
				],
				"STR_A3_A_m03_BIS_mike26_title",
				""
			]
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (!(isNil "BIS_courtMartial")) then {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			} else {
				if (BIS_inf call BIS_fnc_taskCurrent != _taskID) then {
					// Set as the current task
					_taskID call BIS_fnc_taskSetCurrent;
				} else {
					// Player seized Mike-26
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_reinf": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_A_m03_BIS_reinf_desc",
					"",				// %1 (removed)
					"",				// %2 (removed)
					"<marker name = 'BIS_mike26'>",	// %3
					"</marker>"			// %4
				],
				"STR_A3_A_m03_BIS_reinf_title",
				"STR_A3_A_m03_BIS_reinf_marker"
			],
			BIS_IA_truck1,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Player defeated the reinforcements
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
		};
	};
};