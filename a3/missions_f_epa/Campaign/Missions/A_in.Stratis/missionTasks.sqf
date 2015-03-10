case "BIS_CO": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_A_in_BIS_CO_desc",
					"<marker name = 'BIS_LZ1'>",	// %1
					"</marker>"			// %2
				],
				"STR_A3_A_in_BIS_CO_title",
				"STR_A3_A_in_BIS_CO_marker"
			],
			[BIS_leader, true],
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Player met with his CO
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
			
			[_taskID, position BIS_leader] call BIS_fnc_taskSetDestination;
		};
	};
};

case "BIS_heli": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				"STR_A3_A_in_BIS_heli_desc",
				"STR_A3_A_in_BIS_heli_title",
				"STR_A3_A_in_BIS_heli_marker"
			],
			[BIS_heli, true],
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Player got in the helicopter
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
			
			[_taskID, position BIS_heli] call BIS_fnc_taskSetDestination;
		};
	};
};

case "BIS_camp": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_A_in_BIS_camp_desc",
					"<marker name = 'BIS_camp'>",	// %1
					"</marker>"			// %2
				],
				"STR_A3_A_in_BIS_camp_title",
				""
			],
			nil,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Player arrived at Camp Rogain
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
		};
	};
};

case "BIS_report": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				"STR_A3_A_in_BIS_report_desc",
				"STR_A3_A_in_BIS_report_title",
				"STR_A3_A_in_BIS_report_marker"
			],
			[BIS_logistics, true],
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Player reported in
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
			
			[_taskID, position BIS_logistics] call BIS_fnc_taskSetDestination;
		};
	};
};

case "BIS_truck": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				"STR_A3_A_in_BIS_truck_desc",
				"STR_A3_A_in_BIS_truck_title",
				"STR_A3_A_in_BIS_truck_marker"
			],
			[BIS_truck, true],
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Player got in the truck
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
			
			[_taskID, position BIS_truck] call BIS_fnc_taskSetDestination;
		};
	};
};

case "BIS_check": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_A_in_BIS_check_desc",
					"<marker name = 'BIS_check'>",	// %1
					"</marker>",			// %2
					"<marker name = 'BIS_camp'>",	// %3
					"</marker>",			// %4
					"<marker name = 'BIS_range'>",	// %5
					"</marker>"			// %6
				],
				"STR_A3_A_in_BIS_check_title",
				"STR_A3_A_in_BIS_check_marker"
			],
			_taskID
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
					// Player passed the checkpoint
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
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
					localize "STR_A3_A_in_BIS_range_desc",
					"<marker name = 'BIS_range'>",	// %1
					"</marker>"			// %2
				],
				"STR_A3_A_in_BIS_range_title",
				"STR_A3_A_in_BIS_range_marker"
			],
			_taskID
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
					// Kamino was attacked
					[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_return": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_A_in_BIS_return_desc",
					"<marker name = 'BIS_camp'>",	// %1
					"</marker>"			// %2
				],
				"STR_A3_A_in_BIS_return_title",
				""
			],
			nil,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Retreat was ordered
				[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
		};
	};
};

case "BIS_evac": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_A_in_BIS_evac_desc",
					"<marker name = 'BIS_airBase'>",	// %1
					"</marker>"				// %2
				],
				"STR_A3_A_in_BIS_evac_title",
				""
			],
			nil,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Player ordered to find shelter
				[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
		};
	};
};

case "BIS_shelter": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				"STR_A3_A_in_BIS_shelter_desc",
				"STR_A3_A_in_BIS_shelter_title",
				""
			],
			nil,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Player made it to the forest
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
		};
	};
};