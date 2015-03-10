case "BIS_tskWait": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				format [localize "STR_A3_Campaign_C_EB_BIS_tskWait_desc", "</marker>", "<marker name = 'BIS_mrkStart'>"],
				localize "STR_A3_Campaign_C_EB_BIS_tskWait_title",
				localize "STR_A3_Campaign_C_EB_BIS_tskWait_WP"
			],
			getMarkerPos "BIS_mrkStart",
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskEscape": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				localize "STR_A3_Campaign_C_EB_BIS_tskEscape_desc",
				localize "STR_A3_Campaign_C_EB_BIS_tskEscape_title",
				""
			],
			objNull,
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskDevice": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				format [localize "STR_A3_Campaign_C_EB_BIS_tskDevice_desc", "</marker>", "<marker name = 'BIS_mrkResearchBase'>"],
				localize "STR_A3_Campaign_C_EB_BIS_tskDevice_title",
				localize "STR_A3_Campaign_C_EB_BIS_tskDevice_WP"
			],
			getMarkerPos "BIS_mrkResearchBase",
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskJoinNATO": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				format [localize "STR_A3_Campaign_C_EB_BIS_tskJoinNATO_desc", "</marker>", "<marker name = 'BIS_mrkNATO'>"],
				localize "STR_A3_Campaign_C_EB_BIS_tskJoinNATO_title",
				localize "STR_A3_Campaign_C_EB_BIS_tskJoinNATO_WP"
			],
			getMarkerPos "BIS_mrkNATO",
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskJoinFIA": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				format [localize "STR_A3_Campaign_C_EB_BIS_tskJoinFIA_desc", "</marker>", "<marker name = 'BIS_mrkFIA'>"],
				localize "STR_A3_Campaign_C_EB_BIS_tskJoinFIA_title",
				localize "STR_A3_Campaign_C_EB_BIS_tskJoinFIA_WP"
			],
			getMarkerPos "BIS_mrkFIA",
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};