BIS_expoGroup = createGroup WEST;
"I_pilot_F" createUnit  [position player, BIS_expoGroup,"this assignasdriver BIS_expoAlca;this moveindriver BIS_expoAlca"];
player action ["lightOn", BIS_expoAlca];
Sleep 1;
player action ["lightOn", BIS_expoAlca];

//driver BIS_expoAlca setBehaviour "CARELESS";
 
//BIS_expoPilot assignasdriver BIS_expoAlca; 
//BIS_expoPilot moveindriver BIS_expoAlca;


private[ "_takingoff", "_touchandgo1" ];

BIS_expoAlca setVariable ["takingOffFinished", false];
BIS_expoAlca setVariable ["touchAndGoFinished", false];

_touchandgo1 = call compile preprocessFileLineNumbers "recpath1.sqf";
_takingoff = call compile preprocessFileLineNumbers "recpath2.sqf";


BIS_expotakingoffseq = 
[
	BIS_expoAlca, 
	_takingoff, 
	[BIS_expoAlca, "takingOffFinished"], 
	false, 
	false, 
	0, 
	0
] spawn BIS_fnc_unitPlay;

Sleep 30;

[[position BIS_expoAlca select 0, position BIS_expoAlca select 1, 50], position BIS_expoAlca] call BIS_fnc_sn_flare;
[[position BIS_mrkRunwayEnd select 0, position BIS_mrkRunwayEnd select 1, 50], position BIS_mrkRunwayEnd] call BIS_fnc_sn_flare;

Sleep 30;
/*
driver BIS_expoAlca disableAI "MOVE";
driver BIS_expoAlca disableAI "TARGET"; 
driver BIS_expoAlca disableAI "AUTOTARGET";
*/  
BIS_expoAlca action ["LandGearUp", BIS_expoAlca];
BIS_expoAlca action ["flapsUp", BIS_expoAlca];


waituntil{ BIS_expoAlca getVariable "takingOffFinished" };

while {alive BIS_expoAlca} do
{
	BIS_expotouchandgoseq =
	[
		BIS_expoAlca, 
		_touchandgo1, 
		[BIS_expoAlca, "touchAndGoFinished"], 
		false, 
		false, 
		0, 
		0
	] spawn BIS_fnc_unitPlay;
	
	Sleep 20;
	["Flaps down" ] call BIS_fnc_LogFormat;
	
	driver BIS_expoAlca disableAI "MOVE";
	driver BIS_expoAlca disableAI "TARGET"; 
	driver BIS_expoAlca disableAI "AUTOTARGET";  
	driver BIS_expoAlca enableSimulation false;
	unassignVehicle driver BIS_expoAlca;
	                                                           
	BIS_expoAlca action ["flapsDown", BIS_expoAlca];
	Sleep 2;
	BIS_expoAlca action ["flapsDown", BIS_expoAlca];
	
	player action ["lightOn", BIS_expoAlca];
	Sleep 1;
	player action ["lightOn", BIS_expoAlca];
	
	_x = [] spawn { while { !(BIS_expoAlca getVariable "touchAndGoFinished") } do {driver BIS_expoAlca action ["lightOn", BIS_expoAlca]; sleep 0.01} };
	
	[[position BIS_mrkRunwayLight select 0, position BIS_mrkRunwayLight select 1, 50], position BIS_mrkRunwayLight] call BIS_fnc_sn_flare;
	[[position BIS_mrkRunwayEnd select 0, position BIS_mrkRunwayEnd select 1, 50], position BIS_mrkRunwayEnd] call BIS_fnc_sn_flare;
	Sleep 5;
	BIS_safemaneuvre = [] spawn 
	{  
		WaitUntil{BIS_attendantDisabled};
		if( (getpos BIS_expoAlca select 2) > 15 ) then
		{
			driver BIS_expoAlca enableAI "MOVE";
			driver BIS_expoAlca enableAI "TARGET"; 
			driver BIS_expoAlca enableAI "AUTOTARGET";  
			driver BIS_expoAlca enableSimulation true;
			driver BIS_expoAlca assignAsDriver BIS_expoAlca;
			BIS_expoAlca setVelocity [   sin (getdir BIS_expoAlca) * 150,   cos (getdir BIS_expoAlca) * 150,   0  ];  
			//BIS_expoAlca forceSpeed 50000;
			BIS_expoAlca flyInHeight 200;
			terminate BIS_expotouchandgoseq; 
			xx = group BIS_expoAlca addWaypoint [position BIS_exposafepoint, 100];
			BIS_expoAlca move (position BIS_expoSafePoint);
			WaitUntil{([BIS_expoSafePoint, BIS_expoAlca] call BIS_fnc_distance2D) < 300 };
			BIS_expoAlca setVariable ["touchAndGoFinished", true];
		};
	};
	Sleep 10;
	["Landing gear" ] call BIS_fnc_LogFormat;
	BIS_expoAlca action ["LandGear", BIS_expoAlca];
	Sleep 2;
	BIS_expoAlca action ["LandGear", BIS_expoAlca];
	
	waituntil{ BIS_expoAlca getVariable "touchAndGoFinished" };
	BIS_expoAlca setVariable ["touchAndGoFinished", false];
	terminate BIS_safemaneuvre;
};
