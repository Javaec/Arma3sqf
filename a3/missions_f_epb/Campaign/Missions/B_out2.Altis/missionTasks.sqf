case "BIS_arty": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_B_out2_BIS_arty_desc",
					"<marker name = 'BIS_arty'>",	// %1
					"</marker>"			// %2
				],
				"STR_A3_B_out2_BIS_arty_title",
				"STR_A3_B_out2_BIS_arty_marker"	// ToDo: Localize
			],
			[BIS_arty, true],
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Player destroyed the artillery
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
			
			[_taskID, position BIS_arty] call BIS_fnc_taskSetDestination;
		};
	};
};

case "BIS_command": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_B_out2_BIS_command_desc",
					"<marker name = 'BIS_command'>",	// %1
					"</marker>"				// %2
				],
				"STR_A3_B_out2_BIS_command_title",
				"STR_A3_B_out2_BIS_command_marker"
			],
			_taskID
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (!(isNil "BIS_courtMartial")) then {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			} else {
				if (isNil "BIS_commandClear") then {
					// Set as the current task
					_taskID call BIS_fnc_taskSetCurrent;
				} else {
					// Player cleared the command complex
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_defend": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_B_out2_BIS_defend_desc",
					"<marker name = 'BIS_poliakko'>",	// %1
					"</marker>"				// %2
				],
				"STR_A3_B_out2_BIS_defend_title",
				""
			],
			nil,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Player defended Poliakko
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
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
				format [
					localize "STR_A3_B_out2_BIS_retreat_desc",
					"<marker name = 'BIS_poliakko'>",	// %1
					"</marker>"				// %2
				],
				"STR_A3_B_out2_BIS_retreat_title",
				"STR_A3_B_out2_BIS_retreat_marker"
			],
			"BIS_airfield",
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// NATO forces intervened
				[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
		};
	};
};

case "BIS_crashSite": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_B_out2_BIS_crashSite_desc",
					"",	// %1 (removed)
					""	// %2 (removed)
				],
				"STR_A3_B_out2_BIS_crashSite_title",
				"STR_A3_B_out2_BIS_crashSite_marker"
			],
			[BIS_crashHeli, true],
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Player secured the crash site
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
		};
	};
};