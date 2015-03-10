case "BIS_assemble": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				format [
					localize "STR_A3_BOOT_m02_BIS_assemble_desc",
					"<marker name = 'BIS_assemble'>",	// %1
					"</marker>"				// %2
				],
				"STR_A3_BOOT_m02_BIS_assemble_title",
				"STR_A3_BOOT_m02_BIS_assemble_marker"
			],
			markerPos "BIS_assemble",
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "SUCCEEDED": {
					// Player assembled the target
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_return": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				format [
					localize "STR_A3_BOOT_m02_BIS_return_desc",
					"<marker name = 'BIS_return'>",	// %1
					"</marker>"			// %2
				],
				"STR_A3_BOOT_m02_BIS_return_title",
				"STR_A3_BOOT_m02_BIS_return_marker"
			],
			markerPos "BIS_return",
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "SUCCEEDED": {
					// Player returned
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_stanceTargets": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				"STR_A3_BOOT_m02_BIS_stanceTargets_desc",
				"STR_A3_BOOT_m02_BIS_stanceTargets_title",
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

case "BIS_scope": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				format [
					localize "STR_A3_BOOT_m02_BIS_scope_desc",
					"<marker name = 'BIS_crate'>",	// %1
					"</marker>"			// %2
				],
				"STR_A3_BOOT_m02_BIS_scope_title",
				"STR_A3_BOOT_m02_BIS_scope_marker"
			],
			markerPos "BIS_crate",
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "SUCCEEDED": {
					// Player took the RCO
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_scopeTargets": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				"STR_A3_BOOT_m02_BIS_scopeTargets_desc",
				"STR_A3_BOOT_m02_BIS_scopeTargets_title",
				"STR_A3_BOOT_m02_BIS_scopeTargets_marker"
			],
			nil,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "SUCCEEDED": {
					// Player shot the distant targets
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_sign": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				format [
					localize "STR_A3_BOOT_m02_BIS_sign_desc",
					"<marker name = 'BIS_sign'>",	// %1
					"</marker>"			// %2
				],
				"STR_A3_BOOT_m02_BIS_sign_title",
				"STR_A3_BOOT_m02_BIS_sign_marker"
			],
			markerPos "BIS_sign",
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "SUCCEEDED": {
					// Player reached the sign
					[_taskID, "SUCCEEDED", false] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_tank": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				format [
					localize "STR_A3_BOOT_m02_BIS_tank_desc",
					"<marker name = 'BIS_tank'>",	// %1
					"</marker>"			// %2
				],
				"STR_A3_BOOT_m02_BIS_tank_title",
				"STR_A3_BOOT_m02_BIS_tank_marker"
			],
			markerPos "BIS_tank",
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
					// Player reached the tank
					[_taskID, "SUCCEEDED", false] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_flag": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				format [
					localize "STR_A3_BOOT_m02_BIS_flag_desc",
					"<marker name = 'BIS_flag'>",	// %1
					"</marker>"			// %2
				],
				"STR_A3_BOOT_m02_BIS_flag_title",
				"STR_A3_BOOT_m02_BIS_flag_marker"
			],
			markerPos "BIS_flag",
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
					// Player reached the flag
					[_taskID, "SUCCEEDED", false] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_return2": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				format [
					localize "STR_A3_BOOT_m02_BIS_return2_desc",
					"<marker name = 'BIS_return'>",	// %1
					"</marker>"			// %2
				],
				"STR_A3_BOOT_m02_BIS_return2_title",
				"STR_A3_BOOT_m02_BIS_return2_marker"
			],
			markerPos "BIS_return",
			nil, nil, false
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "CURRENT": {
					// Set as the current task
					_taskID call BIS_fnc_taskSetCurrent;
				};
				
				case "SUCCEEDED": {
					// Player returned again
					[_taskID, "SUCCEEDED", false] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_allTargets": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				"STR_A3_BOOT_m02_BIS_allTargets_desc",
				"STR_A3_BOOT_m02_BIS_allTargets_title",
				""
			],
			nil,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "SUCCEEDED": {
					// Player shot all targets
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};