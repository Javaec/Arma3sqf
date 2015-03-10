case "BIS_guerrillas": {
	if (!_taskExists) then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_A_out_BIS_guerrillas_desc",
				localize "STR_A3_campaign_b_in_task_rendezvous",
				localize "STR_A3_A_out_BIS_guerrillas_marker"
			],
			nil,
			false
		] call BIS_fnc_taskCreate;
		[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_help": {
	if (!_taskExists) then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_B_in_Task_Help_description",
				localize "STR_A3_Campaign_B_in_Task_Help_title",
				localize "STR_A3_Campaign_B_in_Task_Help_marker"
			],
			nil,
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_radio": {
	if (!_taskExists) then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_B_in_Task_Radio_description",
				localize "STR_A3_Campaign_B_in_Task_Radio_title",
				localize "STR_A3_Campaign_B_in_Task_Radio_marker"
			],
			[BIS_BLU1, true],
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};
