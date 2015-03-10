case "BIS_falseRV": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_B_in2_BIS_falseRV_desc",
					"<marker name = 'BIS_falseRV'>",	// %1
					"</marker>"				// %2
				],
				"STR_A3_B_in2_BIS_falseRV_title",
				"STR_A3_B_in2_BIS_falseRV_marker"
			],
			nil,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Player reached the rendezvous
				[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
		};
	};
};

case "BIS_plant": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_B_in2_BIS_plant_desc",
					"<marker name = 'BIS_falseRV'>",	// %1
					"</marker>",				// %2
					"<marker name = 'BIS_plant'>",		// %3
					"</marker>"				// %4
				],
				"STR_A3_B_in2_BIS_plant_title",
				"STR_A3_B_in2_BIS_plant_marker"
			],
			nil,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Player reached the powerplant
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
		};
	};
};

case "BIS_truck": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				"STR_A3_B_in2_BIS_truck_desc",
				"STR_A3_B_in2_BIS_truck_title",
				"STR_A3_B_in2_BIS_truck_marker"
			],
			[BIS_truck, true],
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Player talked to leader
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
			
			[_taskID, position BIS_truck] call BIS_fnc_taskSetDestination;
		};
	};
};

case "BIS_check1": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_B_in2_BIS_check1_desc",
					"<marker name = 'BIS_check1'>",	// %1
					"</marker>",			// %2
					"<marker name = 'BIS_drop'>",	// %3
					"</marker>"			// %4
				],
				"STR_A3_B_in2_BIS_check1_title",
				"STR_A3_B_in2_BIS_check1_marker"
			],
			_taskID,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Player passed the first checkpoint
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
		};
	};
};

case "BIS_drop": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_B_in2_BIS_drop_desc",
					"<marker name = 'BIS_drop'>",	// %1
					"</marker>"			// %2
				],
				"STR_A3_B_in2_BIS_drop_title",
				"STR_A3_B_in2_BIS_drop_marker"
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
					// Player dropped-off the guerrillas
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_RV": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_B_in2_BIS_RV_desc",
					"<marker name = 'BIS_RV'>",		// %1
					"</marker>",				// %2
					"<marker name = 'BIS_factory'>",	// %3
					"</marker>"				// %4
				],
				"STR_A3_B_in2_BIS_RV_title",
				"STR_A3_B_in2_BIS_RV_marker"
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
					// Plans changed
					[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_check2": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_B_in2_BIS_check2_desc",
					"<marker name = 'BIS_check2'>",	// %1
					"</marker>"			// %2
				],
				"STR_A3_B_in2_BIS_check2_title",
				"STR_A3_B_in2_BIS_check2_marker"
			],
			_taskID,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Player passed the second checkpoint
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
		};
	};
};

case "BIS_newRV": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_B_in2_BIS_newRV_desc",
					"<marker name = 'BIS_rescue'>",	// %1
					"</marker>"			// %2
				],
				"STR_A3_B_in2_BIS_newRV_title",
				"STR_A3_B_in2_BIS_newRV_marker"
			],
			"BIS_rescue"
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
					// Miller in trouble
					[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_rescue": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_B_in2_BIS_rescue_desc",
					"<marker name = 'BIS_rescue'>",	// %1
					"</marker>"			// %2
				],
				"STR_A3_B_in2_BIS_rescue_title",
				"STR_A3_B_in2_BIS_rescue_marker"
			],
			_taskID,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Player rescued Miller
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
		};
	};
};

case "BIS_regroup": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_B_in2_BIS_regroup_desc",
					"<marker name = 'BIS_regroup'>",	// %1
					"</marker>"				// %2
				],
				"STR_A3_B_in2_BIS_regroup_title",
				"STR_A3_B_in2_BIS_regroup_marker"
			],
			_taskID,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Player regrouped with Miller
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
		};
	};
};