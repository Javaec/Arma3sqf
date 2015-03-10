case "BIS_bravo": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_A_out_BIS_bravo_desc",
					"<marker name = 'BIS_rendezvous'>",	// %1
					"</marker>",				// %2
					"<marker name = 'BIS_bravo'>",		// %3
					"</marker>",				// %4
					"<marker name = 'BIS_range'>",		// %5
					"</marker>"				// %6
				],
				"STR_A3_A_out_BIS_bravo_title",
				""
			],
			nil,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (!(isNil "BIS_courtMartial")) then {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			} else {
				if (isNil "BIS_spotted") then {
					// Player reached Bravo
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				} else {
					// Player revealed the attack too early
					[_taskID, "FAILED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_range": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_A_out_BIS_range_desc",
					"<marker name = 'BIS_range'>",	// %1
					"</marker>",			// %2
					"<marker name = 'BIS_bravo'>",	// %3
					"</marker>"			// %4
				],
				"STR_A3_A_out_BIS_range_title",
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
					// Player captured the military range
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_town": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_A_out_BIS_town_desc",
					"<marker name = 'BIS_range'>",	// %1
					"</marker>",			// %2
					"<marker name = 'BIS_town'>",	// %3
					"</marker>"			// %4
				],
				"STR_A3_A_out_BIS_town_title",
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
					// Player ordered to retreat
					[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_retreat": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				"STR_A3_A_out_BIS_retreat_desc",
				"STR_A3_A_out_BIS_retreat_title",
				"STR_A3_A_out_BIS_retreat_marker"
			],
			_taskID,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Player successfully retreated
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
		};
	};
};

case "BIS_boats": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				"STR_A3_A_out_BIS_boats_desc",
				"STR_A3_A_out_BIS_boats_title",
				"STR_A3_A_out_BIS_boats_marker"
			],
			[BIS_BLU_boat2, true],
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Player got into the Speedboat
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
			
			[_taskID, position BIS_BLU_boat2] call BIS_fnc_taskSetDestination;
		};
	};
};

case "BIS_guerrillas": {
	[
		BIS_inf,
		_taskID,
		[
			"STR_A3_A_out_BIS_guerrillas_desc",
			"STR_A3_A_out_BIS_guerrillas_title",
			""
		],
		nil,
		true
	] call BIS_fnc_taskCreate;
};