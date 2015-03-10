case "BIS_tskRearm": {
	if (!(_taskExists)) then {
		[
			BIS_player,
			_taskID,
			[
				format [
					localize "STR_A3_Showcase_Gunships_BIS_tskRearm_desc",
					"<marker name = 'BIS_mrkEnd'>",	// %1
					"</marker>"			// %2
				],
				"STR_A3_Showcase_Gunships_BIS_tskRearm_title",
				"STR_A3_Showcase_Gunships_BIS_tskRearm_marker"
			],
			"BIS_mrkEnd"
		] call BIS_fnc_taskCreate;
	} else {
		if (!(isNil "BIS_courtMartial")) then {
			// Player was court-martialed
			[_taskID, "FAILED"] call BIS_fnc_taskSetState;
		} else {
			// Player completed all objectives
			[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
		};
	};
};

case "BIS_tskHeli": {
	if (!(_taskExists)) then {
		[
			BIS_player,
			_taskID,
			[
				format [
					localize "STR_A3_Showcase_Gunships_BIS_tskHeli_desc",
					"<marker name = 'BIS_mrkHeli'>",	// %1
					"</marker>"				// %2
				],
				"STR_A3_Showcase_Gunships_BIS_tskHeli_title",
				"STR_A3_Showcase_Gunships_BIS_tskHeli_marker"
			],
			[BIS_Mi48, true],
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (isNil "BIS_courtMartial") then {
				// Player got into the helicopter
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			} else {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			};
			
			[_taskID, position BIS_Mi48] call BIS_fnc_taskSetDestination;
		};
	};
};

case "BIS_tskPyrgos": {
	if (!(_taskExists)) then {
		[
			BIS_player,
			_taskID,
			[
				format [
					localize "STR_A3_Showcase_Gunships_BIS_tskPyrgos_desc",
					"<marker name = 'BIS_mrkPyrgos'>",	// %1
					"</marker>",				// %2
					"<marker name = 'BIS_mrkNavalAttack'>",	// %3
					"</marker>"				// %4
				],
				"STR_A3_Showcase_Gunships_BIS_tskPyrgos_title",
				"STR_A3_Showcase_Gunships_BIS_tskPyrgos_marker"
			],
			getMarkerPos "BIS_mrkPyrgos"
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (!(isNil "BIS_courtMartial")) then {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			} else {
				if (BIS_player call BIS_fnc_taskCurrent != _taskID) then {
					// Set as the current task
					_taskID call BIS_fnc_taskSetCurrent;
				} else {
					// Player defended Pyrgos
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_tskNavalBase": {
	if (!(_taskExists)) then {
		[
			BIS_player,
			_taskID,
			[
				format [
					localize "STR_A3_Showcase_Gunships_BIS_tskNavalBase_desc",
					"<marker name = 'BIS_mrkNavalBase'>",	// %1
					"</marker>"				// %2
				],
				"STR_A3_Showcase_Gunships_BIS_tskNavalBase_title",
				"STR_A3_Showcase_Gunships_BIS_tskNavalBase_marker"
			],
			getMarkerPos "BIS_mrkNavalBase",
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (!(isNil "BIS_courtMartial")) then {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			} else {
				if (!(BIS_task03Done)) then {
					// Set as the current task
					_taskID call BIS_fnc_taskSetCurrent;
				} else {
					// Player destroyed the naval base
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_tskSaD": {
	if (!(_taskExists)) then {
		[
			BIS_player,
			_taskID,
			[
				format [
					localize "STR_A3_Showcase_Gunships_BIS_tskSaD_desc",
					"<marker name = 'BIS_mrkPyrgos'>",	// ToDo: Localize
					"</marker>",				// ToDo: Localize
					"<marker name = 'BIS_mrkArtillery'>",	// ToDo: Localize
					"</marker>"				// ToDo: Localize
				],
				"STR_A3_Showcase_Gunships_BIS_tskSaD_title",
				"STR_A3_Showcase_Gunships_BIS_tskSaD_marker"
			],
			"BIS_mrkArtillery"
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (!(isNil "BIS_courtMartial")) then {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			} else {
				if (!(BIS_task04Done)) then {
					// Set as the current task
					_taskID call BIS_fnc_taskSetCurrent;
				} else {
					// Player destroyed the naval base
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_tskSave": {
	if (!(_taskExists)) then {
		[
			BIS_player,
			_taskID,
			[
				format [
					localize "STR_A3_Showcase_Gunships_BIS_tskSave_desc",
					"<marker name = 'BIS_mrkRecon'>",	// %1
					"</marker>"				// %2
				],
				"STR_A3_Showcase_Gunships_BIS_tskSave_title",
				"STR_A3_Showcase_Gunships_BIS_tskSave_marker"
			],
			"BIS_mrkRecon",
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (BIS_missionScope getVariable "Recon" == "Dead" || !(isNil "BIS_courtMartial")) then {
				// Player failed to rescue the team or was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			} else {
				// Player rescued the recon team
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			};
			
			[_taskID, markerPos "BIS_mrkRecon"] call BIS_fnc_taskSetDestination;
		};
	};
};

case "BIS_tskRTB": {
	if (!(_taskExists)) then {
		[
			BIS_player,
			_taskID,
			[
				format [
					localize "STR_A3_Showcase_Gunships_BIS_tskRTB_desc",
					"<marker name = 'BIS_mrkEnd'>",	// %1
					"</marker>"			// %2
				],
				"STR_A3_Showcase_Gunships_BIS_tskRTB_title",
				"STR_A3_Showcase_Gunships_BIS_tskRTB_marker"
			],
			getMarkerPos "BIS_mrkEnd",
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (!(isNil "BIS_courtMartial")) then {
				// Player was court-martialed
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			} else {
				// Player returned to base
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			};
		};
	};
};