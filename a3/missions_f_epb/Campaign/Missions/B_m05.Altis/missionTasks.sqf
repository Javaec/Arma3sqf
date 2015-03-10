case "BIS_objRendezvous": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_campaign_b_m05_task01_text",
					"</marker>",
					"<marker name='meet'>"
				],
				localize "STR_A3_campaign_b_m05_task01_title",
				localize "STR_A3_campaign_b_m05_task01_wp"
			],
			markerPos "meet",
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objWait": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				localize "STR_A3_campaign_b_m05_task02_text",
				localize "STR_A3_campaign_b_m05_task02_title",
				localize "STR_A3_campaign_b_m05_task02_wp"
			],
			markerPos "meet",
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objDefend": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				localize "STR_A3_campaign_b_m05_task03_text",
				localize "STR_A3_campaign_b_m05_task03_title",
				localize "STR_A3_campaign_b_m05_task03_wp"
			],
			markerPos "BIS_pursuers",
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objSabotages": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				localize "STR_A3_campaign_b_m05_task04_text",
				localize "STR_A3_campaign_b_m05_task04_title",
				""
			],
			objNull
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objSabotage1": {
	if (_taskState == "") then {
		[
			BIS_inf,
			[_taskID, "BIS_objSabotages"],
			[
				format [
					localize "STR_A3_campaign_b_m05_task05_text",
					"</marker>",
					"<marker name='sentry1'>"
				],
				localize "STR_A3_campaign_b_m05_task05_title",
				localize "STR_A3_campaign_b_m05_task05_wp"
			],
			markerPos "sentry1_area"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objSabotage2": {
	if (_taskState == "") then {
		[
			BIS_inf,
			[_taskID, "BIS_objSabotages"],
			[
				format [
					localize "STR_A3_campaign_b_m05_task06_text",
					"</marker>",
					"<marker name='repair'>"
				],
				localize "STR_A3_campaign_b_m05_task06_title",
				localize "STR_A3_campaign_b_m05_task06_wp"
			],
			markerPos "repair"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objRTB": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_campaign_b_m05_task07_text",
					"</marker>",
					"<marker name='meet'>"
				],
				localize "STR_A3_campaign_b_m05_task07_title",
				localize "STR_A3_campaign_b_m05_task07_wp"
			],
			markerPos "BIS_finalMeet"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};