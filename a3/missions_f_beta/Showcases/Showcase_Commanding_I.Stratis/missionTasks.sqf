case "BIS_tskBeach": {
	if (_taskState == "") then {
		[
			BIS_player,
			_taskID,
			[
				format [localize "STR_A3_Showcase_Commanding_I_tskBeach_Description", "</marker>", "<marker name = 'BIS_mrkBeach'>"],
				localize "STR_A3_Showcase_Commanding_I_tskBeach_Title",
				localize "STR_A3_Showcase_Commanding_I_tskBeach_WP"
			],
			markerPos "BIS_mrkBeach",
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskVillage": {
	if (_taskState == "") then {
		[
			BIS_player,
			_taskID,
			[
				format [localize "STR_A3_Showcase_Commanding_I_tskVillage_Description", "</marker>", "<marker name = 'BIS_mrkTakeCommand'>"],
				localize "STR_A3_Showcase_Commanding_I_tskVillage_Title",
				localize "STR_A3_Showcase_Commanding_I_tskVillage_WP"
			],
			markerPos "BIS_mrkTakeCommand"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskDefend": {
	if (_taskState == "") then {
		[
			BIS_player,
			_taskID,
			[
				format [localize "STR_A3_Showcase_Commanding_I_tskDefend_Description", "</marker>", "<marker name = 'BIS_mrkGirna'>", "<marker name = 'BIS_mrkAttack'>"],
				localize "STR_A3_Showcase_Commanding_I_tskDefend_Title",
				localize "STR_A3_Showcase_Commanding_I_tskDefend_WP"
			],
			markerPos "BIS_mrkGirna",
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskRetreat": {
	if (_taskState == "") then {
		[
			BIS_player,
			_taskID,
			[
				format [localize "STR_A3_Showcase_Commanding_I_tskRetreat_Description", "</marker>", "<marker name = 'BIS_mrkRetreat'>"],
				localize "STR_A3_Showcase_Commanding_I_tskRetreat_Title",
				localize "STR_A3_Showcase_Commanding_I_tskRetreat_WP"
			],
			markerPos "BIS_mrkRetreat",
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};
