case "BIS_regroup" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Showcase_Arma_BIS_Regroup_desc",
				localize "STR_A3_Showcase_Arma_BIS_Regroup_title",
				localize "STR_A3_Showcase_Arma_BIS_Regroup_marker"
			],
			getMarkerPos "BIS_stagingPoint",
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_outpost" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Showcase_Arma_BIS_Outpost_desc",
				localize "STR_A3_Showcase_Arma_BIS_Outpost_title",
				localize "STR_A3_Showcase_Arma_BIS_Outpost_marker"
			],
			getMarkerPos "BIS_outpost",
			false
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_aa" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Showcase_Arma_BIS_Aa_desc",
				localize "STR_A3_Showcase_Arma_BIS_Aa_title",
				localize "STR_A3_Showcase_Arma_BIS_Aa_marker"
			],
			position BIS_aa,
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_arty" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Showcase_Arma_BIS_Arty_desc",
				localize "STR_A3_Showcase_Arma_BIS_Arty_title",
				localize "STR_A3_Showcase_Arma_BIS_Arty_marker"
			],
			position BIS_arty,
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_vehicles" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Showcase_Arma_BIS_Vehicles_desc",
				localize "STR_A3_Showcase_Arma_BIS_Vehicles_title",
				localize "STR_A3_Showcase_Arma_BIS_Vehicles_marker"
			],
			[position BIS_aa, (BIS_aa distance BIS_arty) / 2, [BIS_aa, BIS_arty] call BIS_fnc_dirTo] call BIS_fnc_relPos,
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_support" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Showcase_Arma_BIS_Support_desc",
				localize "STR_A3_Showcase_Arma_BIS_Support_title",
				localize "STR_A3_Showcase_Arma_BIS_Support_marker"
			],
			getMarkerPos "BIS_base",
			false
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_factory" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Showcase_Arma_BIS_Factory_desc",
				localize "STR_A3_Showcase_Arma_BIS_Factory_title",
				localize "STR_A3_Showcase_Arma_BIS_Factory_marker"
			],
			getMarkerPos "BIS_factory",
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_roadBlock" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Showcase_Arma_BIS_RoadBlock_desc",
				localize "STR_A3_Showcase_Arma_BIS_RoadBlock_title",
				localize "STR_A3_Showcase_Arma_BIS_RoadBlock_marker"
			],
			getMarkerPos "BIS_roadBlock",
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_logistics" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Showcase_Arma_BIS_Logistics_desc",
				localize "STR_A3_Showcase_Arma_BIS_Logistics_title",
				localize "STR_A3_Showcase_Arma_BIS_Logistics_marker"
			],
			getMarkerPos "BIS_logistics",
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_minefield" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Showcase_Arma_BIS_Minefield_desc",
				localize "STR_A3_Showcase_Arma_BIS_Minefield_title",
				localize "STR_A3_Showcase_Arma_BIS_Minefield_marker"
			],
			getMarkerPos "BIS_mineThree",
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
				localize "STR_A3_Showcase_Arma_BIS_Retreat_desc",
				localize "STR_A3_Showcase_Arma_BIS_Retreat_title",
				localize "STR_A3_Showcase_Arma_BIS_Retreat_marker"
			],
			getMarkerPos "BIS_pointGamma",
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};
