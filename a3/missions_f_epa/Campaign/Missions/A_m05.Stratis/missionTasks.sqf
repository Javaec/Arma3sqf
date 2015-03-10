case "BIS_insert": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_A_m05_BIS_insert_desc",
					"",				// %1 (removed)
					"",				// %2 (removed)
					"<marker name = 'BIS_insert'>",	// %3
					"</marker>",			// %4
					"<marker name = 'BIS_town'>",	// %5
					"</marker>"			// %6
				],
				"STR_A3_A_m05_BIS_insert_title",
				"STR_A3_A_m05_BIS_insert_marker"
			],
			_taskID,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (!(isNil "BIS_courtMartial")) then {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			} else {
				if (isNil "BIS_premature") then {
					// Player's team inserted on the beach
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				} else {
					// Player compromised the assault
					[_taskID, "FAILED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_position": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_A_m05_BIS_position_desc",
					"<marker name = 'BIS_position'>",	// %1
					"</marker>",				// %2
					"<marker name = 'BIS_town'>",		// %3
					"</marker>"				// %4
				],
				"STR_A3_A_m05_BIS_position_title",
				"STR_A3_A_m05_BIS_position_marker"
			],
			_taskID
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (!(isNil "BIS_courtMartial")) then {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			} else {
				if (!(isNil "BIS_premature")) then {
					// Player compromised the assault
					[_taskID, "FAILED"] call BIS_fnc_taskSetState;
				} else {
					if (BIS_inf call BIS_fnc_taskCurrent != _taskID) then {
						// Set as the current task
						_taskID call BIS_fnc_taskSetCurrent;
					} else {
						// Player's team moved into position
						[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
					};
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
					localize "STR_A3_A_m05_BIS_town_desc",
					"<marker name = 'BIS_town'>",	// %1
					"</marker>"			// %2
				],
				localize "STR_A3_A_m05_BIS_town_title",
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
					// The town was cleared
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_identify": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				"STR_A3_A_m05_BIS_identify_desc",
				"STR_A3_A_m05_BIS_identify_title",
				"STR_A3_A_m05_BIS_identify_marker"
			],
			[BIS_target, true],
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Player found the target
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
			
			[_taskID, position BIS_target] call BIS_fnc_taskSetDestination;
		};
	};
};

case "BIS_truck": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				"STR_A3_A_m05_BIS_truck_desc",
				"STR_A3_A_m05_BIS_truck_title",
				"STR_A3_A_m05_BIS_truck_marker"
			],
			[BIS_IA_truck1, true],
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (!(isNil "BIS_courtMartial")) then {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			} else {
				if (!(isNil "BIS_extracted")) then {
					// Player ignored the truck
					[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
				} else {
					// Player got in the truck
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_extract": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_A_m05_BIS_extract_desc",
					"<marker name = 'BIS_maxwell'>",	// %1
					"</marker>"				// %2
				],
				"STR_A3_A_m05_BIS_extract_title",
				"STR_A3_A_m05_BIS_extract_marker"
			],
			"BIS_maxwell",
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (!(isNil "BIS_courtMartial")) then {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			} else {
				if (!(isNil "BIS_extracted")) then {
					// Player extracted from the town
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				} else {
					if (BIS_inf call BIS_fnc_taskCurrent != _taskID) then {
						// Set as the current task
						_taskID call BIS_fnc_taskSetCurrent;
					};
				};
			};
		};
	};
};