/*
	Await Orders
*/
case "BIS_awaitOrders" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_C_m02_Task_Description_AwaitOrders",
				localize "STR_A3_Campaign_C_m02_Task_Title_AwaitOrders",
				localize "STR_A3_Campaign_C_m02_Task_Marker_AwaitOrders"
			],
			position BIS_inf,
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

/*
	Board Vehicle
*/
case "BIS_boardVehicle" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_C_m02_Task_Description_BoardVehicle",
				localize "STR_A3_Campaign_C_m02_Task_Title_BoardVehicle",
				localize "STR_A3_Campaign_C_m02_Task_Marker_BoardVehicle"
			],
			nil,
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

/*
	Defend vehicles
*/
case "BIS_defendVehicles" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_C_m02_Task_Description_DefendVehicles",
				localize "STR_A3_Campaign_C_m02_Task_Title_DefendVehicles",
				localize "STR_A3_Campaign_C_m02_Task_Marker_DefendVehicles"
			],
			position BIS_vehicleConvoy_2,
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

/*
	Secure warehouses
*/
case "BIS_warehousesSecure" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_C_m02_Task_Description_WarehousesSecure",
				localize "STR_A3_Campaign_C_m02_Task_Title_WarehousesSecure",
				localize "STR_A3_Campaign_C_m02_Task_Marker_WarehousesSecure"
			],
			getMarkerPos "BIS_infantryWaypoint_3",
			false
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

/*
	Wait for reinforcements
*/
case "BIS_warehousesReinforcements" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_C_m02_Task_Description_WarehousesReinforcements",
				localize "STR_A3_Campaign_C_m02_Task_Title_WarehousesReinforcements",
				localize "STR_A3_Campaign_C_m02_Task_Marker_WarehousesReinforcements"
			],
			getMarkerPos "BIS_warehouse",
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

/*
	Help pinned down friendly squad
*/
case "BIS_helpSquad" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_C_m02_Task_Description_HelpSquad",
				localize "STR_A3_Campaign_C_m02_Task_Title_HelpSquad",
				localize "STR_A3_Campaign_C_m02_Task_Marker_HelpSquad"
			],
			getMarkerPos "BIS_convoyWaypoint_4",
			false
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

/*
	Help pinned down friendly squad
*/
case "BIS_meetPinnedLeader" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_C_m02_Task_Description_MeetPinnedLeader",
				localize "STR_A3_Campaign_C_m02_Task_Title_MeetPinnedLeader",
				localize "STR_A3_Campaign_C_m02_Task_Marker_MeetPinnedLeader"
			],
			position BIS_pinnedLeader,
			false
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

/*
	Help pinned down friendly squad
*/
case "BIS_followLeader" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_C_m02_Task_Description_FollowLeader",
				localize "STR_A3_Campaign_C_m02_Task_Title_FollowLeader",
				localize "STR_A3_Campaign_C_m02_Task_Marker_FollowLeader"
			],
			[BIS_leader, true],
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

/*
	Neutralize enemy tank
*/
case "BIS_antitank" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_C_m02_Task_Description_Antitank",
				localize "STR_A3_Campaign_C_m02_Task_Title_Antitank",
				localize "STR_A3_Campaign_C_m02_Task_Marker_Antitank"
			],
			[BIS_tank, random 25, random 360] call BIS_fnc_relPos,
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

/*
	Secure enemy position
*/
case "BIS_secure" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_C_m02_Task_Description_Secure",
				localize "STR_A3_Campaign_C_m02_Task_Title_Secure",
				localize "STR_A3_Campaign_C_m02_Task_Marker_Secure"
			],
			getMarkerPos "BIS_enemy",
			false
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};
