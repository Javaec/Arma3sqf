case "BIS_objGetIn": {
	if (_taskState == "") then {
		[
			BIS_player,
			_taskID,
			[
				localize "STR_A3_Showcase_Tanks_task1_text",
				localize "STR_A3_Showcase_Tanks_task1_title",
				localize "str_ac_getin"
			],
			position BIS_tank2,
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objMeeting": {
	if (_taskState == "") then {
		[
			BIS_player,
			_taskID,
			[
				localize "STR_A3_Showcase_Tanks_task2_text",
				localize "STR_A3_Showcase_Tanks_task2_title",
				localize "STR_A3_Showcase_Tanks_task2_wp"
			],
			markerPos "join"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_obj1": {
	if (_taskState == "") then {
		[
			BIS_player,
			_taskID,
			[
				localize "STR_A3_Showcase_Tanks_task3_text",
				localize "STR_A3_Showcase_Tanks_task3_title",
				localize "STR_A3_Showcase_Tanks_task3_wp"
			],
			position BIS_molosArea
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};