case "BIS_Chaos" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_B_m02_2_Task_Chaos_description",
				localize "STR_A3_Campaign_B_m02_2_Task_Chaos_title",
				localize "STR_A3_Campaign_B_m02_2_Task_Chaos_marker"
			],
			nil,
			false
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_Extraction" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_B_m02_2_Task_Extraction_description",
				localize "STR_A3_Campaign_B_m02_2_Task_Extraction_title",
				localize "STR_A3_Campaign_B_m02_2_Task_Extraction_marker"
			],
			_this,
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_Equipment" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_B_m02_2_Task_Equipment_description",
				localize "STR_A3_Campaign_B_m02_2_Task_Equipment_title",
				localize "STR_A3_Campaign_B_m02_2_Task_Equipment_marker"
			],
			_this,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (typeName _this == "ARRAY") then {
			[_taskID, _this select 0] call BIS_fnc_taskSetState;
			[_taskID, _this select 1] call BIS_fnc_taskSetDestination;
		} else {
			[_taskID, _this] call BIS_fnc_taskSetState;
		};
	};
};

case "BIS_Meet" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_B_m02_2_Task_Meet_description",
				localize "STR_A3_Campaign_B_m02_2_Task_Meet_title",
				localize "STR_A3_Campaign_B_m02_2_Task_Meet_marker"
			],
			_this,
			false
		] call BIS_fnc_taskCreate;
	} else {
		if (typeName _this == "ARRAY") then {
			[_taskID, _this select 0] call BIS_fnc_taskSetState;
			[_taskID, _this select 1] call BIS_fnc_taskSetDestination;
		} else {
			[_taskID, _this] call BIS_fnc_taskSetState;
		};
	};
};
