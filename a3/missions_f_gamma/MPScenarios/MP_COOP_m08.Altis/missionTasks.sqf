case "BIS_obj1": {
	if (_taskState == "") then {
		[
			BIS_grpNomad,
			_taskID,
			[
				localize "STR_A3_Showcase_Tanks_task3_text",
				localize "STR_A3_Showcase_Tanks_task3_title",
				localize "STR_A3_Showcase_Tanks_task3_wp"
			],
			position BIS_molosArea,
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};