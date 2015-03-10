case "BIS_tskEquipment": {
	if (_taskState == "") then {
		[
			BIS_player,
			_taskID,
			[
				format [localize "STR_A3_Showcase_FixedWings_BIS_tskEquipment_desc", "</marker>", "<marker name = 'BIS_mrkResupply'>"],
				localize "STR_A3_Showcase_FixedWings_BIS_tskEquipment_title",
				localize "STR_A3_Showcase_FixedWings_BIS_tskEquipment_WP"
			],
			getPos (BIS_SupplyBox),
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskJet": {
	if (_taskState == "") then {
		[
			BIS_player,
			_taskID,
			[
				format [localize "STR_A3_Showcase_FixedWings_BIS_tskJet_desc", "</marker>", "<marker name = 'BIS_mrkHangar'>"],
				localize "STR_A3_Showcase_FixedWings_BIS_tskJet_title",
				localize "STR_A3_Showcase_FixedWings_BIS_tskJet_WP"
			],
			markerPos "BIS_mrkHangar",
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskConvoy": {
	if (_taskState == "") then {
		[
			BIS_player,
			_taskID,
			[
				format [localize "STR_A3_Showcase_FixedWings_BIS_tskConvoy_desc", "</marker>", "<marker name = 'BIS_mrkConvoyMark_Start'>", "<marker name = 'BIS_mrkConvoyMark_End'>"],
				localize "STR_A3_Showcase_FixedWings_BIS_tskConvoy_title",
				localize "STR_A3_Showcase_FixedWings_BIS_tskConvoy_WP"
			],
			[BIS_Convoy_Truck_01,true],
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskSPG": {
	if (_taskState == "") then {
		[
			BIS_player,
			_taskID,
			[
				format [localize "STR_A3_Showcase_FixedWings_BIS_tskSPG_desc", "</marker>", "<marker name = 'BIS_mrkSPG'>"],
				localize "STR_A3_Showcase_FixedWings_BIS_tskSPG_title",
				localize "STR_A3_Showcase_FixedWings_BIS_tskSPG_WP"
			],
			markerPos "BIS_mrkSPG",
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskHeli": {
	if (_taskState == "") then {
		[
			BIS_player,
			_taskID,
			[
				format [localize "STR_A3_Showcase_FixedWings_BIS_tskHeli_desc", "</marker>", "<marker name = 'BIS_mrkHeli'>"],
				localize "STR_A3_Showcase_FixedWings_BIS_tskHeli_title",
				localize "STR_A3_Showcase_FixedWings_BIS_tskHeli_WP"
			],
			[BIS_Heli,true],
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskAAF": {
	if (_taskState == "") then {
		[
			BIS_player,
			_taskID,
			[
				format [localize "STR_A3_Showcase_FixedWings_BIS_tskAAF_desc", "</marker>", "<marker name = 'BIS_mrkAAF'>"],
				localize "STR_A3_Showcase_FixedWings_BIS_tskAAF_title",
				localize "STR_A3_Showcase_FixedWings_BIS_tskAAF_WP"
			],
			markerPos "BIS_mrkAAF",
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskResupply": {
	if (_taskState == "") then {
		[
			BIS_player,
			_taskID,
			[
				format [localize "STR_A3_Showcase_FixedWings_BIS_tskResupply_desc", "</marker>", "<marker name = 'BIS_mrkResupply'>"],
				localize "STR_A3_Showcase_FixedWings_BIS_tskResupply_title",
				localize "STR_A3_Showcase_FixedWings_BIS_tskResupply_WP"
			],
			markerPos "BIS_mrkResupply",
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};

case "BIS_tskRTB": {
	if (_taskState == "") then {
		[
			BIS_player,
			_taskID,
			[
				format [localize "STR_A3_Showcase_FixedWings_BIS_tskRTB_desc", "</marker>", "<marker name = 'BIS_mrkHangar'>"],
				localize "STR_A3_Showcase_FixedWings_BIS_tskRTB_title",
				localize "STR_A3_Showcase_FixedWings_BIS_tskRTB_WP"
			],
			markerPos "BIS_mrkHangar",
			TRUE
		] call BIS_fnc_taskCreate
	} else {
		if (_this == "Current") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState}
	}
};
