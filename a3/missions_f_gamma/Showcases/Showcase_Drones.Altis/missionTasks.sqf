case "BIS_tskRegroup": {
	if (!(_taskExists)) then {
		[
			BIS_player,
			_taskID,
			[
				format [
					localize "STR_A3_Showcase_Drones_BIS_tskRegroup_desc",
					"<marker name = 'BIS_mrkRegroup'>",	// %1
					"</marker>"				// %2
				],
				"STR_A3_Showcase_Drones_BIS_tskRegroup_title",
				"STR_A3_Showcase_Drones_BIS_tskRegroup_marker"
			],
			getMarkerPos "BIS_mrkRegroup",
			TRUE
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (BIS_Task03Done || !(isNil "BIS_courtMartial")) then {
				// Player didn't regroup with his team or was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			} else {
				// Player rendezvoused with his team
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				
				// Choose the next task
				{if (!(_x call BIS_fnc_taskCompleted)) exitWith {_x call BIS_fnc_missionTasks}} forEach ["BIS_tskAA", "BIS_tskRV"];
			};
		};
	};
};

case "BIS_tskAA": {
	if (!(_taskExists)) then {
		[
			BIS_player,
			_taskID,
			[
				format [
					localize "STR_A3_Showcase_Drones_BIS_tskAA_desc",
					"</marker>",				// %1
					"<marker name = 'BIS_mrkNeochori'>"	// %2
				],
				"STR_A3_Showcase_Drones_BIS_tskAA_title",
				""
			]
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (BIS_Task03Done || !(isNil "BIS_courtMartial")) then {
				// Player retreated or was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			} else {
				if (!(BIS_Task01Done)) then {
					// Set as the current task
					_taskID call BIS_fnc_taskSetCurrent;
				} else {
					// Player destroyed the AA
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
					
					if (BIS_player call BIS_fnc_taskCurrent == _taskID) then {
						// Choose the next task
						"BIS_tskRV" call BIS_fnc_missionTasks;
					};
				};
			};
		};
	};
};

case "BIS_tskCommander": {
	if (!(_taskExists)) then {
		[
			BIS_player,
			_taskID,
			[
				format [
					localize "STR_A3_Showcase_Drones_BIS_tskCommander_desc",
					"</marker>",				// %1
					"<marker name = 'BIS_mrkNeochori'>"	// %2
				],
				"STR_A3_Showcase_Drones_BIS_tskCommander_title",
				""
			]
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if ((BIS_Task03Done && !(BIS_Task01Done)) || !(isNil "BIS_courtMartial")) then {
				// Player retreated or was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			} else {
				private ["_HVTStatus"];
				_HVTStatus = toUpper (BIS_missionScope getVariable "HVT");
				
				if (_HVTStatus == "KILLED") then {
					// Player killed the commander
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				} else {
					// The commander escaped
					[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_tskRV": {
	if (!(_taskExists)) then {
		[
			BIS_player,
			_taskID,
			[
				format [
					localize "STR_A3_Showcase_Drones_BIS_tskRV_desc",
					"<marker name = 'BIS_mrkTeam01'>",	// %1
					"</marker>"				// %2
				],
				"STR_A3_Showcase_Drones_BIS_tskRV_title",
				"STR_A3_Showcase_Drones_BIS_tskRV_marker"
			],
			"BIS_mrkTeam01"
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (!(isNil "BIS_courtMartial")) then {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			} else {
				if (!(BIS_Task03Done)) then {
					// Set as the current task
					_taskID call BIS_fnc_taskSetCurrent;
				} else {
					// Player made it to the RV
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};