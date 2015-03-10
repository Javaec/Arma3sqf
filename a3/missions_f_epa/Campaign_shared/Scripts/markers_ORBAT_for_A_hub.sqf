private [	"_orbatParameters"	];

_orbatParameters = 
[
	//name
	//position
	//presence condition
	//path
	//parent
	//tags
	//tiers
	
	[ 	"BIS_mike26ORBAT", 
		[4402.293,225.54523,3790.1011], 
		"isNil ""BIS_A_m03""",
		"configfile >> ""CfgORBAT"" >> ""BIS"" >> ""I_B_3""",
		"configfile >> ""CfgORBAT"" >> ""BIS"" >> ""I_BCompany""",
		"",
		""
	],
	[ 	"", 
		[2588.6458,-0.0070939213,6563.189], 
		"true",
		"configfile >> ""CfgORBAT"" >> ""BIS"" >> ""I_AAF""",
		"",
		"",
		"2"
	],
	[ 	"BIS_rogainORBAT", 
		[5045.0176,208.91281,5898.228], 
		"false",
		"configfile >> ""CfgORBAT"" >> ""BIS"" >> ""I_B_1""",
		"configfile >> ""CfgORBAT"" >> ""BIS"" >> ""I_BCompany""",
		"",
		"2"
	],
	[ 	"BIS_maxwellORBAT", 
		[3322.9475,225.63905,2966.2275], 
		"true",
		"configfile >> ""CfgORBAT"" >> ""BIS"" >> ""B_Falcon""",
		"",
		"",
		"3"
	],
	[ 	"BIS_tempestORBAT", 
		[1979.5499,2.3424938,3518.2798], 
		"(isNil ""BIS_A_m02"" && isNil ""BIS_A_m05"") || (!(isNil ""BIS_A_m02"") && isNil ""BIS_A_m05"") || (isNil ""BIS_A_m02"" && !(isNil ""BIS_A_m05""))",
		"configfile >> ""CfgORBAT"" >> ""BIS"" >> ""I_B_3_4""",
		"configfile >> ""CfgORBAT"" >> ""BIS"" >> ""I_BCompany""",
		"",
		""
	],		
	[ 	"BIS_villageORBAT", 
		[2028.3776,3.0587914,2725.7329], 
		"isNil ""BIS_A_m02""",
		"configfile >> ""CfgORBAT"" >> ""BIS"" >> ""I_B_3_3""",
		"configfile >> ""CfgORBAT"" >> ""BIS"" >> ""I_BCompany""",
		"",
		""
	],
	[ 	"", 
		[1723.6377,5.5,5613.3076], 
		"true",
		"configfile >> ""CfgORBAT"" >> ""BIS"" >> ""I_FighterSquadron""",
		"configfile >> ""CfgORBAT"" >> ""BIS"" >> ""B_Aegis""",
		"",
		"2"
	],
	[ 	"", 
		[2175.4243,5.9985609,5738.4971], 
		"true",
		"configfile >> ""CfgORBAT"" >> ""BIS"" >> ""I_B_4""",
		"configfile >> ""CfgORBAT"" >> ""BIS"" >> ""B_Aegis""",
		"",
		"2"
	],
	[ 	"", 
		[2095.833,4.6314206,5335.4536], 
		"true",
		"configfile >> ""CfgORBAT"" >> ""BIS"" >> ""I_B_5""",
		"configfile >> ""CfgORBAT"" >> ""BIS"" >> ""B_Aegis""",
		"",
		"2"
	]
];

private [	"_name", "_path", "_parent", "_tags", "_tiers", "_pos", "_condition", "_index", "_orbatname"	];
_index = 0;

{
	_orbatname	= _x select 0; 
	_pos_x		= (_x select 1) select 0;
	_pos_y		= (_x select 1) select 2;
	_pos_z		= (_x select 1) select 1;
	_condition	= _x select 2;
	_path 		= _x select 3;  
	_parent		= _x select 4;
	_tags		= _x select 5;
	_tiers		= _x select 6;
	
	
	if ( _orbatname == "" ) then 
	{ call compile format [ "_orbatname = 'BIS_orbat%1'", _index]; _index = _index + 1;};
	
	call compile format 
	[
		"   if( %2 ) then
			{
				%1 = createagent [ 'ModuleStrategicMapORBAT_F', [_pos_x, _pos_y, _pos_z],[],0,'none' ];
				%1 setVehicleVarName _orbatname;
				%1 setvariable [ 'Path', _path ];
				%1 setvariable [ 'Parent', _parent ];
				%1 setvariable [ 'Tags', _tags ];
				%1 setvariable [ 'Tiers', _tiers ];
			};
		", _orbatname, _condition
	];
	
	
} forEach _orbatParameters;
