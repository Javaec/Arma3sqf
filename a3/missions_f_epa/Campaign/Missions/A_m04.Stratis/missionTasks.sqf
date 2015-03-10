case "BIS_regroup" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				format [
					localize "STR_A3_Campaign_A_m04_Regroup_Description",
					"</marker>",
					"<marker name = 'BIS_maxwell'>",
					"<marker name = 'BIS_alpha'>"
				],
				localize "STR_A3_Campaign_A_m04_Regroup_Title",
				localize "STR_A3_Campaign_A_m04_Regroup_Waypoint"
			],
			getMarkerPos "BIS_alpha",
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_backpack" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Campaign_A_m04_Backpack_Description",
				localize "STR_A3_Campaign_A_m04_Backpack_Title",
				localize "STR_A3_Campaign_A_m04_Backpack_Waypoint"
			],
			getMarkerPos "BIS_backpack",
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_meet" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				format [
					localize "STR_A3_Campaign_A_m04_Meet_Description",
					"</marker>",
					"<marker name = 'BIS_nikos'>",
					"<marker name = 'BIS_maxwell'>"
				],
				localize "STR_A3_Campaign_A_m04_Meet_Title",
				localize "STR_A3_Campaign_A_m04_Meet_Waypoint"
			],
			getMarkerPos "BIS_nikos",
			false
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_supplies" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				format [
					localize "STR_A3_Campaign_A_m04_Supplies_Description",
					"</marker>",
					"<marker name = 'BIS_nikos'>",
					"<marker name = 'BIS_lzConnor'>"
				],
				localize "STR_A3_Campaign_A_m04_Supplies_Title",
				localize "STR_A3_Campaign_A_m04_Supplies_Waypoint"
			],
			getMarkerPos "BIS_lzConnor",
			false
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_maxwell" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				format [
					localize "STR_A3_Campaign_A_m04_Maxwell_Description",
					"</marker>",
					"<marker name = 'BIS_lzConnor'>",
					"<marker name = 'BIS_maxwell'>"
				],
				localize "STR_A3_Campaign_A_m04_Maxwell_Title",
				localize "STR_A3_Campaign_A_m04_Maxwell_Waypoint"
			],
			getMarkerPos "BIS_maxwell",
			false
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_agiosIoannis" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				format [
					localize "STR_A3_Campaign_A_m04_AgiosIoannis_Description",
					"</marker>",
					"<marker name = 'BIS_agiosIoannis'>"
				],
				localize "STR_A3_Campaign_A_m04_AgiosIoannis_Title",
				localize "STR_A3_Campaign_A_m04_AgiosIoannis_Waypoint"
			],
			getMarkerPos "BIS_agiosIoannis",
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_lzConnor" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				format [
					localize "STR_A3_Campaign_A_m04_LzConnor_Description",
					"</marker>",
					"<marker name = 'BIS_lzConnor'>"
				],
				localize "STR_A3_Campaign_A_m04_LzConnor_Title",
				localize "STR_A3_Campaign_A_m04_LzConnor_Waypoint"
			],
			getMarkerPos "BIS_lzConnor",
			false
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_agiosCephas" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				format [
					localize "STR_A3_Campaign_A_m04_AgiosCephas_Description",
					"</marker>",
					"<marker name = 'BIS_agiosCephas'>"
				],
				localize "STR_A3_Campaign_A_m04_AgiosCephas_Title",
				localize "STR_A3_Campaign_A_m04_AgiosCephas_Waypoint"
			],
			getMarkerPos "BIS_agiosCephas",
			false
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "BIS_houses" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				format [
					localize "STR_A3_Campaign_A_m04_Houses_Description",
					"</marker>",
					"<marker name = 'BIS_agiosCephasHouses'>",
					"<marker name = 'BIS_agiosCephas'>"
				],
				localize "STR_A3_Campaign_A_m04_Houses_Title",
				localize "STR_A3_Campaign_A_m04_Houses_Waypoint"
			],
			getMarkerPos "BIS_agiosCephasHouses",
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};
