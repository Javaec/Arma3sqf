case "BIS_Chaos" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Showcase_Night2_BIS_Chaos_desc",
				localize "STR_A3_Showcase_Night2_BIS_Chaos_title",
				localize "STR_A3_Showcase_Night2_BIS_Chaos_marker"
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
				localize "STR_A3_Showcase_Night2_BIS_Extraction_desc",
				localize "STR_A3_Showcase_Night2_BIS_Extraction_title",
				localize "STR_A3_Showcase_Night2_BIS_Extraction_marker"
			],
			_this,
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};
