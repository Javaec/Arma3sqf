case "BIS_locate": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				"STR_A3_BOOT_m03_BIS_locate_desc",
				"STR_A3_BOOT_m03_BIS_locate_title",
				""
			],
			nil,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "SUCCEEDED": {
					// Player located the AAF
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_getIn": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				"STR_A3_BOOT_m03_BIS_getIn_desc",
				"STR_A3_BOOT_m03_BIS_getIn_title",
				"STR_A3_BOOT_m03_BIS_getIn_marker"
			],
			[BIS_truck, true],
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "SUCCEEDED": {
					// Player got in as the driver
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
			
			// Stop the icon following the truck
			[_taskID, position BIS_truck] call BIS_fnc_taskSetDestination;
		};
	};
};

case "BIS_drive": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				format [
					localize "STR_A3_BOOT_m03_BIS_drive_desc",
					"<marker name = 'BIS_drive'>",	// %1
					"</marker>"			// %2
				],
				"STR_A3_BOOT_m03_BIS_drive_title",
				"STR_A3_BOOT_m03_BIS_drive_marker"
			],
			markerPos "BIS_drive"
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "CURRENT": {
					// Set as the current task
					_taskID call BIS_fnc_taskSetCurrent;
				};
				
				case "SUCCEEDED": {
					// Player got in as the driver
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_getOut": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				"STR_A3_BOOT_m03_BIS_getOut_desc",
				"STR_A3_BOOT_m03_BIS_getOut_title",
				""
			],
			nil,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "SUCCEEDED": {
					// Player got out
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_search": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				"STR_A3_BOOT_m03_BIS_search_desc",
				"STR_A3_BOOT_m03_BIS_search_title",
				"STR_A3_BOOT_m03_BIS_search_marker"
			],
			markerPos "BIS_search",
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "SUCCEEDED": {
					// Player found the weapons cache
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
					localize "STR_A3_BOOT_m03_BIS_return_desc",
					"<marker name = 'BIS_return'>",	// %1
					"</marker>"			// %2
				],
				"STR_A3_BOOT_m03_BIS_return_title",
				"STR_A3_BOOT_m03_BIS_return_marker"
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