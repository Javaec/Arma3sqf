/*
	Author: Jiri Wainar

	Description:
	Init for setting-up persistent identities.

	Example:
	[] call BIS_fnc_camp_setIdentityInit;
*/

if (["BIS_PER_IDENT_FreeNames"] call BIS_fnc_camp_hasImplicitValue) then
{
	private["_west","_east","_guer","_i","_cfg","_name","_added"];

	_west = [];
	_east = [];
	_guer = [];

	_cfg = (configfile >> "CfgWorlds" >> "GenericNames" >> "NATOMen" >> "LastNames");
	_added = [];
	for "_i" from 0 to (count _cfg - 1) do
	{
		_name = getText(_cfg select _i);

		if !(_name in _added) then
		{
			_west set [count _west, ["",_name]];
			_added set [count _added, _name];
		};
	};
	_west = _west call BIS_fnc_arrayShuffle;

	_cfg = (configfile >> "CfgWorlds" >> "GenericNames" >> "TakistaniMen" >> "LastNames");
	_added = [];
	for "_i" from 0 to (count _cfg - 1) do
	{
		_name = getText(_cfg select _i);

		if !(_name in _added) then
		{
			_east set [count _east, ["",_name]];
			_added set [count _added, _name];
		};
	};
	_east = _east call BIS_fnc_arrayShuffle;

	_cfg = (configfile >> "CfgWorlds" >> "GenericNames" >> "GreekMen" >> "LastNames");
	_added = [];
	for "_i" from 0 to (count _cfg - 1) do
	{
		_name = getText(_cfg select _i);

		if !(_name in _added) then
		{
			_guer set [count _guer, ["",_name]];
			_added set [count _added, _name];
		};
	};
	_guer = _guer call BIS_fnc_arrayShuffle;

	BIS_PER_IDENT_FreeNames =
	[
		["WEST",_west],
		["GUER",_guer],
		["EAST",_east]
	]
};
if (["BIS_PER_IDENT_FreeNamesVO"] call BIS_fnc_camp_hasImplicitValue) then
{
	BIS_PER_IDENT_FreeNamesVO =
	[
		[
			"WEST",
			[
				["Adams",localize "str_a3_cfgidentities_adams0"],
				["Bennett",localize "str_a3_natomen_lastnames68"],
				["Campbell",localize "str_a3_natomen_lastnames77"],
				["Dixon","Dixon"],
				["Everett",localize "str_a3_cfgidentities_pb_b_bravo050"],
				["Franklin",localize "str_a3_cfgidentities_pb_b_fox0"],
				["Givens",localize "str_a3_cfgidentities_pb_b_bravo040"],
				["Hawkins",localize "str_a3_cfgidentities_pb_b_hawkeye0"],
				["Lopez",localize "str_a3_cfgidentities_pb_b_golfone0"],
				["Martinez",localize "str_a3_natomen_lastnames103"],
				["OConnor",localize "str_a3_natomen_lastnames89"],
				["Patterson","Patterson"],
				["Sykes","Sykes"],
				["Walker",localize "str_a3_natomen_lastnames111"]
			]
			call BIS_fnc_arrayShuffle
		],
		[
			"GUER",
			[
				["Anthis","Anthis"],
				["Costa","Costa"],
				["Dimitirou","Dimitirou"],
				["Elias","Elias"],
				["Gekas","Gekas"],
				["Kouris","Kouris"],
				["Leventis","Leventis"],
				["Markos","Markos"],
				["Nikas","Nikas"],
				["Nicolo","Nicolo"],
				["Panas","Panas"],
				["Petros","Petros"],
				["Rosi","Rosi"],
				["Samaras","Samaras"],
				["Thanos","Thanos"],
				["Vega","Vega"]
			]
			call BIS_fnc_arrayShuffle
		],
		[
			"EAST",
			[
				["Amin",localize "str_a3_takistanimen_lastnames23"],
				["Masood",localize "str_a3_takistanimen_lastnames24"],
				["Fahim",localize "str_a3_takistanimen_lastnames7"],
				["Habibi",localize "str_a3_takistanimen_lastnames35"],
				["Kushan",localize "str_a3_takistanimen_lastnames48"],
				["Jawadi",localize "str_a3_takistanimen_lastnames39"],
				["Nazari",localize "str_a3_takistanimen_lastnames13"],
				["Siddiqi",localize "str_a3_takistanimen_lastnames5"],
				["Takhtar",localize "str_a3_takistanimen_lastnames10"],
				["Wardak",localize "str_a3_takistanimen_lastnames6"],
				["Yousuf",localize "str_a3_takistanimen_lastnames36"]
			]
			call BIS_fnc_arrayShuffle
		]
	]
};