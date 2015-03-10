case "BIS_objWait": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_campaign_c_m01_task01_text",
					"<marker name = 'BIS_FUP'>",
					"</marker>"
				],
				localize "STR_A3_campaign_c_m01_task01_title",
				""
			],
			nil,
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objGetIn": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_campaign_c_m01_task02_text",
					"<marker name = 'BIS_lakka'>",
					"</marker>"
				],
				localize "STR_A3_campaign_c_m01_task02_title",
				localize "STR_A3_campaign_c_m01_task02_wp"
			],
			position BIS_truck
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objMove": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_campaign_c_m01_task03_text",
					"<marker name = 'BIS_lakka'>",
					"</marker>"
				],
				localize "STR_A3_campaign_c_m01_task03_title",
				localize "STR_A3_campaign_c_m01_task03_wp"
			],
			markerPos "BIS_lakka"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objSeize": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_campaign_c_m01_task04_text",
					"</marker>",
					"<marker name = 'BIS_complex'>",
					"<marker name = 'BIS_APCs'>"
				],
				localize "STR_A3_campaign_c_m01_task04_title",
				localize "STR_A3_campaign_c_m01_task04_wp"
			],
			markerPos "BIS_complex"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_objJoin": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_campaign_c_m01_task06_text",
					"<marker name = 'BIS_airbase'>",
					"</marker>"
				],
				localize "STR_A3_campaign_c_m01_task06_title",
				localize "STR_A3_campaign_c_m01_task06_wp"
			],
			markerPos "BIS_airbase"
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

	case "BIS_objLZ": {
		if (_taskState == "") then {
			[
				BIS_inf,
				[_taskID, "BIS_objJoin"],
				[
					format [
						localize "STR_A3_campaign_c_m01_task08_text",
						"</marker>",
						"<marker name = 'BIS_LZ'>",
						"<marker name = 'BIS_heliBase'>"
					],
					localize "STR_A3_campaign_c_m01_task08_title",
					localize "STR_A3_campaign_c_m01_task08_wp"
				],
				markerPos "BIS_LZ"
			] call BIS_fnc_taskCreate
		} else {
			if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
		}
	};

	case "BIS_objAssemble": {
		if (_taskState == "") then {
			[
				BIS_inf,
				[_taskID, "BIS_objJoin"],
				[
					format [
						localize "STR_A3_campaign_c_m01_task09_text",
						"<marker name = 'BIS_LZ'>",
						"</marker>"
					],
					localize "STR_A3_campaign_c_m01_task09_title",
					localize "STR_A3_campaign_c_m01_task09_wp"
				],
				markerPos "BIS_LZ",
				TRUE
			] call BIS_fnc_taskCreate
		} else {
			if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
		}
	};

	case "BIS_objLift": {
		if (_taskState == "") then {
			[
				BIS_inf,
				[_taskID, "BIS_objJoin"],
				[
					format [
						localize "STR_A3_campaign_c_m01_task05_text",
						"</marker>",
						"<marker name = 'BIS_LZ'>",
						"<marker name = 'BIS_heliBase'>"
					],
					localize "STR_A3_campaign_c_m01_task05_title",
					localize "STR_A3_campaign_c_m01_task05_wp"
				],
				markerPos "BIS_LZ"
			] call BIS_fnc_taskCreate
		} else {
			if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
		}
	};

case "BIS_objAA": {
	if (_taskState == "") then {
		[
			BIS_inf,
			_taskID,
			[
				format [
					localize "STR_A3_campaign_c_m01_task07_text",
					"<marker name = 'BIS_AA'>",
					"</marker>"
				],

				localize "STR_A3_campaign_c_m01_task07_title",
				localize "STR_A3_campaign_c_m01_task07_wp"
			],
			markerPos "BIS_AA",
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};