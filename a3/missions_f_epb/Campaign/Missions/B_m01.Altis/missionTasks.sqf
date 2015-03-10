case "BIS_outpostAttack" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_B_m01_Task_OutpostAttack_description",
				localize "STR_A3_Campaign_B_m01_Task_OutpostAttack_title",
				localize "STR_A3_Campaign_B_m01_Task_OutpostAttack_marker"
			],
			getMarkerPos "BIS_outpost",
			false
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_wait" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_B_m01_Task_Wait_description",
				localize "STR_A3_Campaign_B_m01_Task_Wait_title",
				localize "STR_A3_Campaign_B_m01_Task_Wait_marker"
			],
			position player,
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_targets" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_B_m01_Task_Targets_description",
				localize "STR_A3_Campaign_B_m01_Task_Targets_title",
				localize "STR_A3_Campaign_B_m01_Task_Targets_marker"
			],
			[getMarkerPos "BIS_outpost", 50, 180] call BIS_fnc_relPos,
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_truckProtect" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_B_m01_Task_TruckProtect_description",
				localize "STR_A3_Campaign_B_m01_Task_TruckProtect_title",
				localize "STR_A3_Campaign_B_m01_Task_TruckProtect_marker"
			],
			position BIS_vehicleTruck,
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_mortarEliminate" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_B_m01_Task_MortarEliminate_description",
				localize "STR_A3_Campaign_B_m01_Task_MortarEliminate_title",
				localize "STR_A3_Campaign_B_m01_Task_MortarEliminate_marker"
			],
			getMarkerPos "BIS_frini",
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_friniRetreat" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_B_m01_Task_FriniRetreat_description",
				localize "STR_A3_Campaign_B_m01_Task_FriniRetreat_title",
				localize "STR_A3_Campaign_B_m01_Task_FriniRetreat_marker"
			],
			[getMarkerPos "BIS_outpost", 50, 270] call BIS_fnc_relPos,
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_outpostDefend" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_B_m01_Task_OutpostDefend_description",
				localize "STR_A3_Campaign_B_m01_Task_OutpostDefend_title",
				localize "STR_A3_Campaign_B_m01_Task_OutpostDefend_marker"
			],
			[getMarkerPos "BIS_outpost", 50, 90] call BIS_fnc_relPos,
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_retreat" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_B_m01_Task_Retreat_description",
				localize "STR_A3_Campaign_B_m01_Task_Retreat_title",
				localize "STR_A3_Campaign_B_m01_Task_Retreat_marker"
			],
			getMarkerPos "BIS_forest",
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};
