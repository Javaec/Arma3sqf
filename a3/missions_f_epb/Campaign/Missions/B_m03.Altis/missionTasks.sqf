case "BIS_objHighway": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_campaign_b_m03_task01_text",
					"</marker>",
					"<marker name = 'BIS_warn1_6'>"
				],
				localize "STR_A3_campaign_b_m03_task01_title",
				""
			],
			objNull
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objRendezvous": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_campaign_b_m03_task02_text",
					"</marker>",
					"<marker name = 'BIS_rendezvous'>",
					"<marker name = 'BIS_rendezvous_1'>"
				],
				localize "STR_A3_campaign_b_m03_task02_title",
				localize "STR_A3_campaign_b_m03_task02_wp"
			],
			objNull
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objFuelTruck": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_campaign_b_m03_task03_text",
					"</marker>",
					"<marker name = 'BIS_support1'>"
				],
				localize "STR_A3_campaign_b_m03_task03_title",
				localize "STR_A3_campaign_b_m03_task03_wp"
			],
			markerPos "BIS_support1"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objDepot": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_campaign_b_m03_task04_text",
					"<marker name='BIS_fuelDump'>",
					"</marker>"
				],
				localize "STR_A3_campaign_b_m03_task04_title",
				localize "STR_A3_campaign_b_m03_task04_wp"
			],
			markerPos "BIS_fuelDump",
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objExfil_fuel": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				localize "STR_A3_campaign_b_m03_task05_text",
				localize "STR_A3_campaign_b_m03_task05_title",
				localize "STR_A3_campaign_b_m03_task05_wp"
			],
			markerPos "BIS_dropOff"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objHVT": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_campaign_b_m03_task06_text",
					"</marker>",
					"<marker name='ice'>"
				],
				localize "STR_A3_campaign_b_m03_task06_title",
				localize "STR_A3_campaign_b_m03_task06_wp"
			],
			markerPos "ice"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objHVT_manual": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				localize "STR_A3_campaign_b_m03_task07_text",
				localize "STR_A3_campaign_b_m03_task07_title",
				localize "STR_A3_campaign_b_m03_task07_wp"
			],
			BIS_tgt
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objExfil_HVT": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_campaign_b_m03_task08_text",
					"</marker>",
					"<marker name='BIS_dropOff'>"
				],
				localize "STR_A3_campaign_b_m03_task08_title",
				localize "STR_A3_campaign_b_m03_task08_wp"
			],
			markerPos "BIS_dropOff",
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};