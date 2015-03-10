case "BIS_Meet" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_B_m02_1_Task_Meet_description",
				localize "STR_A3_Campaign_B_m02_1_Task_Meet_title",
				localize "STR_A3_Campaign_B_m02_1_Task_Meet_marker"
			],
			position BIS_recon,
			false
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_Undetected" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_B_m02_1_Task_Undetected_description",
				localize "STR_A3_Campaign_B_m02_1_Task_Undetected_title",
				localize "STR_A3_Campaign_B_m02_1_Task_Undetected_marker"
			],
			nil,
			false
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};
