case "BIS_patrol": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_C_in2_BIS_patrol_desc",
					"<marker name = 'BIS_katalaki'>",	// %1
					"</marker>"				// %2
				],
				"STR_A3_C_in2_BIS_patrol_title",
				"STR_A3_C_in2_BIS_patrol_marker"
			],
			_taskID,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Ordered to regroup
				[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
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
					localize "STR_A3_C_in2_BIS_regroup_desc",
					"<marker name = 'BIS_regroup'>",	// %1
					"</marker>"				// %2
				],
				"STR_A3_C_in2_BIS_regroup_title",
				"STR_A3_C_in2_BIS_regroup_marker"
			],
			_taskID,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Found dead squad
				[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
		};
	};
};

case "BIS_mech": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				"STR_A3_C_in2_BIS_mech_desc",
				"STR_A3_C_in2_BIS_mech_title",
				"STR_A3_C_in2_BIS_mech_marker"
			],
			[BIS_APC1, true],
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Boarded the APC
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
			
			[_taskID, position BIS_APC1] call BIS_fnc_taskSetDestination;
		};
	};
};

case "BIS_FIA": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_C_in2_BIS_FIA_desc",
					"<marker name = 'BIS_FIA'>",	// %1
					"</marker>"			// %2
				],
				"STR_A3_C_in2_BIS_FIA_title",
				"STR_A3_C_in2_BIS_FIA_marker"
			],
			_taskID,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Player met his FIA team
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
		};
	};
};

case "BIS_defenses": {
	if (!(_taskExists)) then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_C_in2_BIS_defenses_desc",
					"<marker name = 'BIS_defenses'>",	// %1
					"</marker>"				// %2
				],
				"STR_A3_C_in2_BIS_defenses_title",
				"STR_A3_C_in2_BIS_defenses_marker"
			],
			_taskID,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Player secured the defenses
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
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
				"STR_A3_C_in2_BIS_defend_desc",
				"STR_A3_C_in2_BIS_defend_title",
				""
			],
			nil,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Player defeated the attack
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
		};
	};
};