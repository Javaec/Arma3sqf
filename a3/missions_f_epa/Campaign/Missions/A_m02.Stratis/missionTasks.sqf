case "BIS_overwatch": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_A_m02_BIS_overwatch_desc",
					"<marker name = 'BIS_village'>",	// %1
					"</marker>"				// %2
				],
				"STR_A3_A_m02_BIS_overwatch_title",
				"STR_A3_A_m02_BIS_overwatch_marker"
			],
			"BIS_overwatch",
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Point man died
				[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
		};
	};
};

case "BIS_pointMan": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_A_m02_BIS_pointMan_desc",
					"<marker name = 'BIS_medicPos'>",	// %1
					"</marker>"				// %2
				],
				"STR_A3_A_m02_BIS_pointMan_title",
				"STR_A3_A_m02_BIS_pointMan_marker"
			],
			"BIS_medicPos",
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Task canceled when the point man is found
				[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
		};
	};
};

case "BIS_village": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_A_m02_BIS_village_desc",
					"<marker name = 'BIS_village'>",	// %1
					"</marker>",				// %2
					"<marker name = 'BIS_bravo'>",		// %3
					"</marker>"				// %4
				],
				"STR_A3_A_m02_BIS_village_title",
				"STR_A3_A_m02_BIS_village_marker"
			],
			"BIS_villageMarker"
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (!(isNil "BIS_courtMartial")) then {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			} else {
				if (!(isNil "BIS_bravoDead")) then {
					// Cancel if Bravo are dead
					[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
				} else {
					if (BIS_inf call BIS_fnc_taskCurrent != _taskID) then {
						// Set as current task after pointman scene
						_taskID call BIS_fnc_taskSetCurrent;
					} else {
						// Succeeded when town secured
						[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
					};
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
				"STR_A3_A_m02_BIS_defend_desc",
				"STR_A3_A_m02_BIS_defend_title",
				"STR_A3_A_m02_BIS_defend_marker"
			],
			[BIS_BLU1, true],
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (!(isNil "BIS_courtMartial")) then {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			} else {
				if (!(isNil "BIS_bravoDead")) then {
					// Cancel if Bravo is dead
					[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
				} else {
					if (alive BIS_BLU1) then {
						// Succeed if the Doc is alive
						[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
					} else {
						// Fail if he's dead
						[_taskID, "FAILED"] call BIS_fnc_taskSetState;
					};
				};
			};
			
			// Stop the task from following the Doc
			[_taskID, position BIS_BLU1] call BIS_fnc_taskSetDestination;
		};
	};
};

case "BIS_UAV": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				"STR_A3_A_m02_BIS_UAV_desc",
				"STR_A3_A_m02_BIS_UAV_title",
				"STR_A3_A_m02_BIS_UAV_marker"
			],
			[BIS_operator, true],
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (!(isNil "BIS_courtMartial")) then {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			} else {
				if (!(isNil "BIS_bravoDead")) then {
					// Bravo were killed
					[_taskID, "FAILED"] call BIS_fnc_taskSetState;
				} else {
					if (isNil "BIS_UAV") then {
						// Player ignored the UAV
						[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
					} else {
						// Player deployed the UAV
						[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
					};
				};
			};
			
			[_taskID, [BIS_operator, true]] call BIS_fnc_taskSetDestination;
		};
	};
};

case "BIS_spotters": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_A_m02_BIS_spotters_desc",
					"<marker name = 'BIS_village'>",	// %1
					"</marker>",				// %2
					"<marker name = 'BIS_spotters'>",	// %3
					"</marker>"				// %4
				],
				"STR_A3_A_m02_BIS_spotters_title",
				""
			]
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (!(isNil "BIS_courtMartial")) then {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			} else {
				if (!(isNil "BIS_mortarDead")) then {
					// Mortar was taken out instead
					[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
				} else {
					if (isNil "BIS_bravoDead") then {
						if (isNil "BIS_spottersDead") then {
							// Set as the current task
							_taskID call BIS_fnc_taskSetCurrent;
						} else {
							// Succeed task if Bravo is alive
							[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
						};
					} else {
						// Fail if they are dead
						[_taskID, "FAILED"] call BIS_fnc_taskSetState;
					};
				};
			};
		};
	};
};

case "BIS_RTB": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_A_m02_BIS_RTB_desc",
					"<marker name = 'BIS_village'>",	// %1
					"</marker>",				// %2
					"<marker name = 'BIS_maxwell'>",	// %3
					"</marker>"				// %4
				],
				"STR_A3_A_m02_BIS_RTB_title",
				"STR_A3_A_m02_BIS_RTB_marker"
			],
			"BIS_maxwell",
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