case "BIS_pointMan": {
	if (!(_taskID call BIS_fnc_taskExists)) then {
		[
			BIS_player,
			_taskID,
			[
				"STR_A3_Showcase_Infantry_BIS_pointMan_desc",
				"STR_A3_Showcase_Infantry_BIS_pointMan_title",
				"STR_A3_Showcase_Infantry_BIS_pointMan_marker"
			],
			"BIS_medicPos",
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			// Task canceled when the point man is found
			[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
		};
	};
};

case "BIS_village": {
	if (!(_taskID call BIS_fnc_taskExists)) then {
		[
			BIS_player,
			_taskID,
			[
				format [
					localize "STR_A3_Showcase_Infantry_BIS_village_desc",
					"<marker name = 'BIS_village'>",	// %1
					"</marker>"				// %2
				],
				"STR_A3_Showcase_Infantry_BIS_village_title",
				"STR_A3_Showcase_Infantry_BIS_village_marker"
			],
			"BIS_village"
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (!(isNil "BIS_bravoDead")) then {
				// Cancel if Bravo are dead
				[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
			} else {
				if (BIS_player call BIS_fnc_taskCurrent != _taskID) then {
					// Set as current task after pointman scene
					_taskID call BIS_fnc_taskSetCurrent;
				} else {
					// Succeeded when town secured
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_defend": {
	if (!(_taskID call BIS_fnc_taskExists)) then {
		[
			BIS_player,
			_taskID,
			[
				"STR_A3_Showcase_Infantry_BIS_defend_desc",
				"STR_A3_Showcase_Infantry_BIS_defend_title",
				"STR_A3_Showcase_Infantry_BIS_defend_marker"
			],
			[
				BIS_BLU1,
				true
			],
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (!(isNil "BIS_bravoDead")) then {
				// Cancel if Bravo is dead
				[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
			} else {
				if (alive BIS_BLU1) then {
					// Succeed if the Doc is alive
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				} else {
					// Fail if he's dead
					[_taskID, "FAILED"] call BIS_fnc_taskSetState;
				};
			};
			
			// Stop the task from following the Doc
			[_taskID, position BIS_BLU1] call BIS_fnc_taskSetDestination;
		};
	};
};

case "BIS_spotters": {
	if (!(_taskID call BIS_fnc_taskExists)) then {
		[
			BIS_player,
			_taskID,
			[
				format [
					localize "STR_A3_Showcase_Infantry_BIS_spotters_desc",
					"<marker name = 'BIS_village'>",	// %1
					"</marker>"				// %2
				],
				"STR_A3_Showcase_Infantry_BIS_spotters_title",
				"STR_A3_Showcase_Infantry_BIS_spotters_marker"
			],
			nil,
			true
		] call BIS_fnc_taskCreate;
	} else {
		if (!(_taskID call BIS_fnc_taskCompleted)) then {
			if (!(isNil "BIS_mortarDead")) then {
				// Mortar was taken out instead
				[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
			} else {
				if (isNil "BIS_bravoDead") then {
					// Succeed task if Bravo is alive
					[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				} else {
					// Fail if they are dead
					[_taskID, "FAILED"] call BIS_fnc_taskSetState;
				};
			};
		};
	};
};

case "BIS_RTB": {
	if (!(_taskID call BIS_fnc_taskExists)) then {
		[
			BIS_player,
			_taskID,
			[
				"STR_A3_Showcase_Infantry_BIS_RTB_desc",
				"STR_A3_Showcase_Infantry_BIS_RTB_title",
				"STR_A3_Showcase_Infantry_BIS_RTB_marker"
			],
			"BIS_retreat",
			true
		] call BIS_fnc_taskCreate;
	} else {
		// Task can only be succeeded
		[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
	};
};