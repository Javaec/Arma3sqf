case "BIS_objDisarm": {
	if (_taskState == "") then {
		[
			BIS_player,
			_taskID,
			[
				localize "STR_A3_Showcase_SCUBA_task1_text",
				localize "STR_A3_Showcase_SCUBA_task1_title",
				""
			],
			objNull
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

	case "BIS_objMine1": {
		if (_taskState == "") then {
			[
				BIS_player,
				[_taskID, "BIS_objDisarm"],
				[
					localize "STR_A3_Showcase_SCUBA_task2_text",
					localize "STR_A3_Showcase_SCUBA_task2_title",
					localize "STR_A3_Showcase_SCUBA_task2_wp"
				],
				[position BIS_mine1 select 0, position BIS_mine1 select 1, -2],
				TRUE
			] call BIS_fnc_taskCreate
		} else {
			if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
		}
	};
	
	case "BIS_objMine2": {
		if (_taskState == "") then {
			[
				BIS_player,
				[_taskID, "BIS_objDisarm"],
				[
					localize "STR_A3_Showcase_SCUBA_task3_text",
					localize "STR_A3_Showcase_SCUBA_task3_title",
					localize "STR_A3_Showcase_SCUBA_task2_wp"
				],
				[position BIS_mine2 select 0, position BIS_mine2 select 1, -2]
			] call BIS_fnc_taskCreate
		} else {
			if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
		}
	};
	
	case "BIS_objMine3": {
		if (_taskState == "") then {
			[
				BIS_player,
				[_taskID, "BIS_objDisarm"],
				[
					localize "STR_A3_Showcase_SCUBA_task4_text",
					localize "STR_A3_Showcase_SCUBA_task4_title",
					localize "STR_A3_Showcase_SCUBA_task2_wp"
				],
				[position BIS_mine3 select 0, position BIS_mine3 select 1, -2]
			] call BIS_fnc_taskCreate
		} else {
			if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
		}
	};
	
case "BIS_objAirPatrol": {
	if (_taskState == "") then {
		[
			BIS_player,
			_taskID,
			[
				localize "STR_A3_Showcase_SCUBA_task5_text",
				localize "STR_A3_Showcase_SCUBA_task5_title",
				""
			],
			objNull
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

	case "BIS_objLauncher": {
		if (_taskState == "") then {
			[
				BIS_player,
				[_taskID, "BIS_objAirPatrol"],
				[
					format [localize "STR_A3_Showcase_SCUBA_task6_text", "<br/>", "<marker name = 'tempest'>", "</marker>"],
					localize "STR_A3_Showcase_SCUBA_task6_title",
					localize "STR_A3_Showcase_SCUBA_task6_wp"
				],
				BIS_car
			] call BIS_fnc_taskCreate
		} else {
			if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
		}
	};
	
	case "BIS_objHeli": {
		if (_taskState == "") then {
			[
				BIS_player,
				[_taskID, "BIS_objAirPatrol"],
				[
					localize "STR_A3_Showcase_SCUBA_task7_text",
					localize "STR_A3_Showcase_SCUBA_task7_title",
					localize "STR_A3_Showcase_SCUBA_task7_wp"
				],
				BIS_heli
			] call BIS_fnc_taskCreate
		} else {
			if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
		}
	};
	
case "BIS_objSabotage": {
	if (_taskState == "") then {
		[
			BIS_player,
			_taskID,
			[
				format [localize "STR_A3_Showcase_SCUBA_task8_text", "<br/>", "<marker name = 'BIS_mrkBoat'>", "</marker>"],
				localize "STR_A3_Showcase_SCUBA_task8_title",
				localize "STR_A3_Showcase_SCUBA_task8_wp"
			],
			BIS_ship
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
				localize "STR_A3_Showcase_SCUBA_task9_text",
				localize "STR_A3_Showcase_SCUBA_task9_title",
				localize "STR_A3_Showcase_SCUBA_task9_wp"
			],
			markerPos "start",
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};