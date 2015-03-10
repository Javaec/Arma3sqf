case "BIS_move1": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				"STR_A3_BOOT_m01_BIS_move1_desc",
				"STR_A3_BOOT_m01_BIS_move1_title",
				"STR_A3_BOOT_m01_BIS_move1_marker"
			],
			nil,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "SUCCEEDED": {
					// Player moved to the marker
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_shoot1": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				"STR_A3_BOOT_m01_BIS_shoot1_desc",
				"STR_A3_BOOT_m01_BIS_shoot1_title",
				""
			],
			nil,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "SUCCEEDED": {
					// Player shot the targets
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_target1": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				"STR_A3_BOOT_m01_BIS_target1_desc",
				"STR_A3_BOOT_m01_BIS_target1_title",
				""
			],
			nil,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "SUCCEEDED": {
					// Player located the first target
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_target2": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				"STR_A3_BOOT_m01_BIS_target2_desc",
				"STR_A3_BOOT_m01_BIS_target2_title",
				""
			],
			nil,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "SUCCEEDED": {
					// Player located the second target
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_prepare": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				"STR_A3_BOOT_m01_BIS_prepare_desc",
				"STR_A3_BOOT_m01_BIS_prepare_title",
				"STR_A3_BOOT_m01_BIS_prepare_marker"
			],
			markerPos "BIS_prepare",
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "SUCCEEDED": {
					// Player reached the marker
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_course1": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				"STR_A3_BOOT_m01_BIS_course1_desc",
				"STR_A3_BOOT_m01_BIS_course1_title",
				"STR_A3_BOOT_m01_BIS_course1_marker"
			],
			markerPos "BIS_course1",
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "SUCCEEDED": {
					// Player reached the marker
					[_taskID, "SUCCEEDED", false] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_course2": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				"STR_A3_BOOT_m01_BIS_course2_desc",
				"STR_A3_BOOT_m01_BIS_course2_title",
				"STR_A3_BOOT_m01_BIS_course2_marker"
			],
			markerPos "BIS_course2",
			nil, nil,
			false
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "CURRENT": {
					// Set as the current task
					_taskID call BIS_fnc_taskSetCurrent;
				};
				
				case "SUCCEEDED": {
					// Player reached the marker
					[_taskID, "SUCCEEDED", false] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_course3": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				"STR_A3_BOOT_m01_BIS_course3_desc",
				"STR_A3_BOOT_m01_BIS_course3_title",
				"STR_A3_BOOT_m01_BIS_course3_marker"
			],
			markerPos "BIS_course3",
			nil, nil,
			false
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "CURRENT": {
					// Set as the current task
					_taskID call BIS_fnc_taskSetCurrent;
				};
				
				case "SUCCEEDED": {
					// Player reached the marker
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};