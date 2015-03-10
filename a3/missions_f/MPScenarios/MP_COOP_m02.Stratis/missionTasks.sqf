case "objOfficers": {
	if (_taskState == "") then {
		[
			BIS_grpMain,
			_taskID,
			[
				localize "STR_A3_MP_COOP_m02_task1_text",
				localize "STR_A3_MP_COOP_m02_task1_title",
				""
			],
			objNull
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

	case "objOfficer1": {
		if (_taskState == "") then {
			[
				BIS_grpMain,
				[_taskID, "objOfficers"],
				[
					localize "STR_A3_MP_COOP_m02_task2_text",
					localize "STR_A3_MP_COOP_m02_task2_title",
					localize "STR_A3_MP_COOP_m02_task2_wp"
				],
				position BIS_target1,
				TRUE
			] call BIS_fnc_taskCreate
		} else {
			if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
		}
	};

	case "objOfficer2": {
		if (_taskState == "") then {
			[
				BIS_grpMain,
				[_taskID, "objOfficers"],
				[
					localize "STR_A3_MP_COOP_m02_task3_text",
					localize "STR_A3_MP_COOP_m02_task3_title",
					localize "STR_A3_MP_COOP_m02_task2_wp"
				],
				position BIS_target2
			] call BIS_fnc_taskCreate
		} else {
			if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
		}
	};

	case "objOfficer3": {
		if (_taskState == "") then {
			[
				BIS_grpMain,
				[_taskID, "objOfficers"],
				[
					localize "STR_A3_MP_COOP_m02_task4_text",
					localize "STR_A3_MP_COOP_m02_task4_title",
					localize "STR_A3_MP_COOP_m02_task2_wp"
				],
				position BIS_target3
			] call BIS_fnc_taskCreate
		} else {
			if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
		}
	};

case "objExfil": {
	if (_taskState == "") then {
		[
			BIS_grpMain,
			_taskID,
			[
				localize "STR_A3_MP_COOP_m02_task5_text",
				localize "STR_A3_MP_COOP_m02_task5_title",
				localize "STR_A3_MP_COOP_m02_task5_wp"
			],
			markerPos "end"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};