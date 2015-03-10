case "BIS_survivors": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_A_in2_BIS_survivors_desc",
					"<marker name = 'BIS_survivors'>",	// %1
					"</marker>"				// %2
				],
				"STR_A3_A_in2_BIS_survivors_title",
				"STR_A3_A_in2_BIS_survivors_marker"
			],
			nil,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (!(isNil "BIS_courtMartial")) then {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			} else {
				if ({!(isNil _x)} count ["BIS_outOfTime", "BIS_atRV"] == 0) then {
					// Player met with the survivors
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				} else {
					// Player took too long and/or bypassed survivors
					[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
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
					localize "STR_A3_A_in2_BIS_RV_desc",
					"<marker name = 'BIS_RV'>",	// %1
					"</marker>"			// %2
				],
				"STR_A3_A_in2_BIS_RV_title",
				"STR_A3_A_in2_BIS_RV_marker"
			],
			nil,
			if (!(isNil "BIS_contact")) then {false} else {true}
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (!(isNil "BIS_courtMartial")) then {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			} else {
				if (isNil "BIS_atRV") then {
					// Set as the current task
					_taskID call BIS_fnc_taskSetCurrent;
				} else {
					// Player rendezvoused with Miller's team
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};