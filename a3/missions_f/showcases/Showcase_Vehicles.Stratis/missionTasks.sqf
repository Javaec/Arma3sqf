case "BIS_objSteal": {
	if (_taskState == "") then {
		[
			BIS_player,
			_taskID,
			[
				format [localize "STR_A3_Showcase_Vehicles_task1_text", "<marker name = 'target'>", "</marker>"],
				localize "STR_A3_Showcase_Vehicles_task1_title",
				localize "STR_A3_Showcase_Vehicles_task1_wp"
			],
			position BIS_car,
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objDestroy": {
	if (_taskState == "") then {
		[
			BIS_player,
			_taskID,
			[
				format [localize "STR_A3_Showcase_Vehicles_task2_text", "<marker name = 'destr'>", "</marker>"],
				localize "STR_A3_Showcase_Vehicles_task2_title",
				localize "STR_A3_Showcase_Vehicles_task2_wp"
			],
			markerPos "destr"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objCleanup": {
	if (_taskState == "") then {
		[
			BIS_player,
			_taskID,
			[
				localize "STR_A3_Showcase_Vehicles_task3_text",
				localize "STR_A3_Showcase_Vehicles_task3_title",
				localize "STR_A3_Showcase_Vehicles_task3_wp"
			],
			position BIS_tower,
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objExfil": {
	if (_taskState == "") then {
		[
			BIS_player,
			_taskID,
			[
				localize "STR_A3_Showcase_Vehicles_task4_text",
				localize "STR_A3_Showcase_Vehicles_task4_title",
				localize "STR_A3_Showcase_Vehicles_task4_wp"
			],
			markerPos "out",
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};