case "BIS_reinf": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				format [
					localize "STR_A3_BOOT_m05_BIS_reinf_desc",
					"<marker name = 'BIS_reinf'>",	// %1
					"</marker>"			// %2
				],
				"STR_A3_BOOT_m05_BIS_reinf_title",
				""
			],
			nil,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "SUCCEEDED": {
					// Reinforcements arrived
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_heli": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				"STR_A3_BOOT_m05_BIS_heli_desc",
				"STR_A3_BOOT_m05_BIS_heli_title",
				"STR_A3_BOOT_m05_BIS_heli_marker"
			],
			[BIS_heli, true],
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "SUCCEEDED": {
					// Player got in the helicopter
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
			
			[_taskID, position BIS_heli] call BIS_fnc_taskSetDestination;
		};
	};
};

case "BIS_truck": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				"STR_A3_BOOT_m05_BIS_truck_desc",
				"STR_A3_BOOT_m05_BIS_truck_title",
				"STR_A3_BOOT_m05_BIS_truck_marker"
			],
			[BIS_truck, true],
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "SUCCEEDED": {
					// Player got in the Hunter
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
				
				case "FAILED": {
					// The truck was destroyed
					[_taskID, "FAILED"] call BIS_fnc_taskSetState;
				};
			};
			
			[_taskID, position BIS_truck] call BIS_fnc_taskSetDestination;
		};
	};
};

case "BIS_investigate": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				"STR_A3_BOOT_m05_BIS_investigate_desc",
				"STR_A3_BOOT_m05_BIS_investigate_title",
				"STR_A3_BOOT_m05_BIS_investigate_marker"
			],
			_taskID,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "SUCCEEDED": {
					// Player investigated the situation
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};