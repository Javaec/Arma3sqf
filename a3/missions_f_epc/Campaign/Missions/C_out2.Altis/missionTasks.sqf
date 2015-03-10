case "BIS_NATO": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_C_out2_BIS_NATO_desc",
					"<marker name = 'BIS_NATO'>",	// %1
					"</marker>"			// %2
				],
				format [
					"A: %1",
					localize "STR_A3_C_out2_BIS_NATO_title"
				],
				"STR_A3_C_out2_BIS_NATO_marker"
			],
			_taskID
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			if (!(isNil "BIS_courtMartial")) then {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			} else {
				if (!(isNil "BIS_choseNATO")) then {
					// Player regrouped with NATO
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				} else {
					// Player assisted CTRG
					[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_CTRG": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				"STR_A3_C_out2_BIS_CTRG_desc",
				format [
					"B: %1",
					localize "STR_A3_C_out2_BIS_CTRG_title"
				],
				"STR_A3_C_out2_BIS_CTRG_marker"
			],
			_taskID
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			if (!(isNil "BIS_courtMartial")) then {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			} else {
				if (!(isNil "BIS_choseCTRG")) then {
					if (!(isNil "BIS_atJames")) then {
						// Player found James
						[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
					} else {
						// Change task waypoint text
						private ["_desc"];
						_desc = _taskID call BIS_fnc_taskDescription;
						[_taskID, [_desc select 0, _desc select 1, toUpper (localize "STR_A3_B_CTRG_soldier_M_medic_F0")]] call BIS_fnc_taskSetDescription;
						
						// Change task destination
						[_taskID, [BIS_james, true]] call BIS_fnc_taskSetDestination;
						
						// Set as the current task
						_taskID call BIS_fnc_taskSetCurrent;
					};
				} else {
					// Player sided with NATO
					[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
				};
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
				"STR_A3_C_out2_BIS_regroup_desc",
				"STR_A3_C_out2_BIS_regroup_title",
				"STR_A3_C_out2_BIS_regroup_marker"
			],
			[BIS_BHQ, true],
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Player met with the commander
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
			
			[_taskID, position BIS_BHQ] call BIS_fnc_taskSetDestination;
		};
	};
};

case "BIS_destroy": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_C_out2_BIS_destroy_desc",
					"<marker name = 'BIS_destroy'>",	// %1
					"</marker>",				// %2
					"<marker name = 'BIS_arty'>",		// %3
					"</marker>",				// %4
					"<marker name = 'BIS_air'>",		// %5
					"</marker>",				// %6
					"<marker name = 'BIS_armor'>",		// %7
					"</marker>"				// %8
				],
				"STR_A3_C_out2_BIS_destroy_title",
				"STR_A3_C_out2_BIS_destroy_marker"
			],
			_taskID,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			if (!(isNil "BIS_courtMartial")) then {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			} else {
				if (isNil "BIS_outOfAmmo") then {
					// Player destroyed the retreating forces
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				} else {
					// Artillery ran out of ammo
					[_taskID, "FAILED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_device": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_C_out2_BIS_device_desc",
					"<marker name = 'BIS_research'>",	// %1
					"</marker>"				// %2
				],
				"STR_A3_C_out2_BIS_device_title",
				"STR_A3_C_out2_BIS_device_marker"
			],
			"BIS_research",
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Player stole the device
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
		};
	};
};

case "BIS_miller": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_C_out2_BIS_miller_desc",
					"<marker name = 'BIS_miller'>",	// %1
					"</marker>"			// %2
				],
				"STR_A3_C_out2_BIS_miller_title",
				"STR_A3_C_out2_BIS_miller_marker"
			],
			_taskID,
			if (!(isNil "BIS_atJames")) then {false} else {true}
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskCompleted)) then {
			if (!(isNil "BIS_courtMartial")) then {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			} else {
				if (BIS_inf call BIS_fnc_taskCurrent != _taskID) then {
					// Set as the current task
					_taskID call BIS_fnc_taskSetCurrent;
				} else {
					// Player found Miller
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};