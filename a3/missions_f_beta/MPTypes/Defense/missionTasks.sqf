case "BIS_waveStart": {
	private ["_logic","_tier"];
	_logic = _this select 0;
	_tier = _this select 1;

	//--- Add a new task
	_lastStand = _logic getvariable ["lastStand",false];
	_evacuated = _logic getvariable ["evacuated",false];
	if !(_lastStand || _evacuated) then {
		[
			"BIS_wave" + str _tier,
			_logic getvariable ["playerSides",[]],
			[
				"STR_A3_moduleMPTypeDefense_wave_desc",
				["STR_A3_moduleMPTypeDefense_wave_title",(_tier) call bis_fnc_ordinalNumber],
				""
			],
			nil,
			true
		] call bis_fnc_setTask;
	};
};
case "BIS_waveEnd": {
	private ["_logic","_tier"];
	_logic = _this select 0;
	_tier = _this select 1;

	//--- Complete the previous tasks
	if (_tier > 1) then {
		_completed = _this select 2;
		[
			"BIS_wave" + str (_tier-1),
			nil,
			nil,
			nil,
			if (_completed) then {"SUCCEEDED"} else {"FAILED"}
		] call bis_fnc_setTask;
	};
};
case "BIS_callHeli": {
	private ["_logic","_side"];
	_logic = _this select 0;
	_side = _this select 1;
	_state = if (count _this > 2) then {
		if (_side == (_this select 2)) then {"SUCCEEDED"} else {"CANCELED"}
	} else {
		false
	};
	[
		_taskID + str _side,
		_side,
		[
			"STR_A3_moduleMPTypeDefense_callHeli_desc",
			"STR_A3_moduleMPTypeDefense_callHeli_title",
			""
		],
		nil,
		_state,
		nil,
		count _this > 2 //--- Show only when change, creation is announced as a new support
	] call bis_fnc_setTask;
};

case "BIS_evac": {
	private ["_logic","_side"];
	_logic = _this select 0;
	_heli = _this select 1;
	_isGlobal = true;
	_state = if (count _this > 2) then {
		_isGlobal = _this select 2;
		if (_isGlobal) then {
			"FAILED"
		} else {
			if (player in _heli) then {"SUCCEEDED"} else {"FAILED"}
		};
	} else {
		true
	};
	_sides = [];

	//--- Don't show the task for sides enemy to the helicopter
	{
		[_x,side _heli,[_x,side _heli] call bis_fnc_areFriendly] call bis_fnc_log;
		if ([_x,side _heli] call bis_fnc_areFriendly) then {_sides set [count _sides,_x];};
	} foreach (_logic getvariable ["playerSides",[]]);
	[
		_taskID,
		_sides,
		[
			"STR_A3_moduleMPTypeDefense_evac_desc",
			"STR_A3_moduleMPTypeDefense_evac_title",
			"STR_A3_moduleMPTypeDefense_evac_marker"
		],
		_heli,
		_state,
		nil,
		nil,
		_isGlobal
	] call bis_fnc_setTask;
};

case "BIS_lastWave": {
	private ["_logic","_lastStand"];
	_logic = _this select 0;

	_lastStand = _logic getvariable ["lastStand",false];
	if (_lastStand) then {
		_state = if (count _this > 1) then {
			if (_this select 1) then {"SUCCEEDED"} else {"FAILED"}
		} else {
			true
		};
		[
			_taskID,
			_logic getvariable ["playerSides",[]],
			[
				"STR_A3_moduleMPTypeDefense_lastWave_desc",
				"STR_A3_moduleMPTypeDefense_lastWave_title",
				""
			],
			nil,
			_state
		] call bis_fnc_setTask;
	};
};