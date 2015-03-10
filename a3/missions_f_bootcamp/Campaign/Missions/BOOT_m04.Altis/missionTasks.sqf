case "BIS_locate": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				format [
					localize "STR_A3_BOOT_m04_BIS_locate_desc",
					"<marker name = 'BIS_lost'>",	// %1
					"</marker>"			// %2
				],
				"STR_A3_BOOT_m04_BIS_locate_title",
				""
			],
			nil,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "SUCCEEDED": {
					// Player located the convoy
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_secure": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				format [
					localize "STR_A3_BOOT_m04_BIS_secure_desc",
					"<marker name = 'BIS_secure'>",	// %1
					"</marker>"			// %2
				],
				"STR_A3_BOOT_m04_BIS_secure_title",
				""
			],
			nil,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "SUCCEEDED": {
					// Player secured the convoy
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_ROE": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				"STR_A3_BOOT_m04_BIS_ROE_desc",
				"STR_A3_BOOT_m04_BIS_ROE_title",
				""
			]
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "SUCCEEDED": {
					// Player followed the ROE
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
				
				case "FAILED": {
					// Player failed to follow the ROE
					[_taskID, "FAILED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_take": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				"STR_A3_BOOT_m04_BIS_take_desc",
				"STR_A3_BOOT_m04_BIS_take_title",
				"STR_A3_BOOT_m04_BIS_take_marker"
			],
			markerPos "BIS_take",
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "CURRENT": {
					if (BIS_lacey call BIS_fnc_taskCurrent != _taskID) then {
						// Set as the current task
						_taskID call BIS_fnc_taskSetCurrent;
					};
				};
				
				case "SUCCEEDED": {
					// Player took the first aid kit
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
				
				case "CANCELED": {
					// Player took a different first aid kit
					[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_treat": {
	if (!(_taskExists)) then {
		[
			BIS_lacey,
			_taskID,
			[
				"STR_A3_BOOT_m04_BIS_treat_desc",
				"STR_A3_BOOT_m04_BIS_treat_title",
				"STR_A3_BOOT_m04_BIS_treat_marker"
			],
			markerPos "BIS_treat",
			_this
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			switch (toUpper _this) do {
				case "CURRENT": {
					if (BIS_lacey call BIS_fnc_taskCurrent != _taskID) then {
						// Set as the current task
						_taskID call BIS_fnc_taskSetCurrent;
					};
				};
				
				case "SUCCEEDED": {
					// Player took the first aid kit
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};