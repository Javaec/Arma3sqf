case "BIS_solar": {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_C_out1_Task_Description_Solar",
				localize "STR_A3_Campaign_C_out1_Task_Title_Solar",
				localize "STR_A3_Campaign_C_out1_Task_Marker_Solar"
			],
			getMarkerPos "BIS_solar",
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_regroup": {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_C_out1_Task_Description_Regroup",
				localize "STR_A3_Campaign_C_out1_Task_Title_Regroup",
				localize "STR_A3_Campaign_C_out1_Task_Marker_Regroup"
			],
			getMarkerPos "BIS_rally",
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_base": {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_C_out1_Task_Description_Base",
				localize "STR_A3_Campaign_C_out1_Task_Title_Base",
				localize "STR_A3_Campaign_C_out1_Task_Marker_Base"
			],
			getMarkerPos "BIS_base",
			false
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_transport": {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_C_out1_Task_Description_Transport",
				localize "STR_A3_Campaign_C_out1_Task_Title_Transport",
				localize "STR_A3_Campaign_C_out1_Task_Marker_Transport"
			],
			[BIS_amv, true],
			false
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_defend": {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_C_out1_Task_Description_Defend",
				localize "STR_A3_Campaign_C_out1_Task_Title_Defend",
				localize "STR_A3_Campaign_C_out1_Task_Marker_Defend"
			],
			getMarkerPos "BIS_defend",
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};