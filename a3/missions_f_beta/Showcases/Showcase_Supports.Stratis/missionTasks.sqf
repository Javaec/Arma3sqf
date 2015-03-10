case "BIS_objBase": {
	if (_taskState == "") then {
		[
			BIS_player,
			_taskID,
			[
				localize "STR_A3_Showcase_Supports_task1_text",
				localize "STR_A3_Showcase_Supports_task1_title",
				""
			],
			objNull
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

	case "BIS_objAA": {
		if (_taskState == "") then {
			[
				BIS_player,
				[_taskID, "BIS_objBase"],
				[
					localize "STR_A3_Showcase_Supports_task2_text",
					localize "STR_A3_Showcase_Supports_task2_title",
					localize "STR_A3_Showcase_Supports_task2_wp"
				],
				markerPos "BIS_AA"
			] call BIS_fnc_taskCreate
		} else {
			if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
		}
	};

	case "BIS_objHeli": {
		if (_taskState == "") then {
			[
				BIS_player,
				[_taskID, "BIS_objBase"],
				[
					localize "STR_A3_Showcase_Supports_task3_text",
					localize "STR_A3_Showcase_Supports_task3_title",
					""
				],
				objNull
			] call BIS_fnc_taskCreate
		} else {
			if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
		}
	};

	case "BIS_objInf": {
		if (_taskState == "") then {
			[
				BIS_player,
				[_taskID, "BIS_objBase"],
				[
					localize "STR_A3_Showcase_Supports_task4_text",
					localize "STR_A3_Showcase_Supports_task4_title",
					""
				],
				objNull
			] call BIS_fnc_taskCreate
		} else {
			if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
		}
	};