case "BIS_objAmbush": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_campaign_b_m06_task01_text",
					"</marker>",
					"<marker name='convoy_route_22'>"
				],
				localize "STR_A3_campaign_b_m06_task01_title",
				""
			],
			BIS_supplies,
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objRepair": {
	if (_taskState == "") then {
		[
			BIS_inf,
			[_taskID, "BIS_objAmbush"],
			[
				format [
					localize "STR_A3_campaign_b_m06_task02_text",
					"<br/><br/>"
				],
				localize "STR_A3_campaign_b_m06_task02_title",
				localize "STR_A3_campaign_b_m06_task02_wp"
			],
			BIS_supplies,
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objRegroup": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_campaign_b_m06_task03_text",
					"</marker>",
					"<marker name='cars'>"
				],
				localize "STR_A3_campaign_b_m06_task03_title",
				localize "STR_A3_campaign_b_m06_task03_wp"
			],
			markerPos "cars",
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objCommand_GetIn": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_campaign_b_m06_task04_text",
					"<br/><br/>"
				],
				localize "STR_A3_campaign_b_m06_task04_title",
				localize "STR_A3_campaign_b_m06_task04_wp"
			],
			BIS_offroad,
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objCommand_Move": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_campaign_b_m06_task05_text",
					"<br/><br/>"
				],
				localize "STR_A3_campaign_b_m06_task05_title",
				""
			],
			objNull
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objCommand_Setup": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_campaign_b_m06_task06_text",
					"<br/><br/>"
				],
				localize "STR_A3_campaign_b_m06_task06_title",
				""
			],
			objNull,
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objHideout": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_campaign_b_m06_task07_text",
					"</marker>",
					"<marker name='hideout'>"
				],
				localize "STR_A3_campaign_b_m06_task07_title",
				localize "STR_A3_campaign_b_m06_task07_wp"
			],
			markerPos "hideout"
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
					localize "STR_A3_campaign_b_m06_task08_text",
					"</marker>",
					"<marker name='hideout'>"
				],
				localize "STR_A3_campaign_b_m06_task08_title",
				localize "STR_A3_campaign_b_m06_task08_wp"
			],
			markerPos "hideout"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objRetreat": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_campaign_b_m06_task09_text",
					"</marker>",
					"<marker name='home'>"
				],
				localize "STR_A3_campaign_b_m06_task09_title",
				localize "STR_A3_campaign_b_m06_task09_wp"
			],
			markerPos "home",
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};