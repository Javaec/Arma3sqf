// Remove the task destination
["BIS_miller", objNull] call BIS_fnc_taskSetDestination;

0 fadeMusic 0.6;
playMusic "AmbientTrack01_F_EPB";

// Fade out
7 fadeSound 0;
titleCut ["", "BLACK OUT", 5];

sleep 7;

// Delete all unneeded entities
{deleteVehicle _x} forEach (allUnits + vehicles - (BIS_CTRGEnd + BIS_conversers));

// Add cinema borders
[0, 0, false] spawn BIS_fnc_cinemaBorder;

enableEnvironment false;

// Move player
BIS_inf enableSimulation false;
BIS_inf allowDamage false;
BIS_inf setDamage 0;
BIS_inf setCaptive true;

private ["_pos", "_dir"];
_pos = markerPos "BIS_playerPos";
_dir = markerDir "BIS_playerPos";
BIS_inf setPos ([_pos, 8, (_dir + 180)] call BIS_fnc_relPos);
BIS_inf setDir _dir;

// Position the truck
BIS_device allowDamage false;
BIS_device setDamage 0;
BIS_device setPos markerPos "BIS_devicePos";
BIS_device setDir markerDir "BIS_devicePos";

// Unhide Miller
[BIS_recon, BIS_recon getVariable "BIS_alt"] call BIS_fnc_setHeight;
BIS_recon hideObject false;
BIS_recon enableSimulation true;

// Position doppleganger
BIS_recon_fake enableSimulation true;
BIS_recon_fake attachTo [BIS_inf, [0,0,0]];

// Unhide ambient SF
{
	[_x, _x getVariable "BIS_alt"] call BIS_fnc_setHeight;
	_x hideObject false;
	_x enableSimulation true;
} forEach [BIS_CTRG1, BIS_CTRG2];

// Play animations
BIS_CTRG1 switchMove ("HubStandingUB_idle" + str ([1,2,3] call BIS_fnc_selectRandom));
BIS_CTRG2 switchMove "InBaseMoves_patrolling2";

// Loop animations
BIS_CTRG1 addEventHandler ["AnimDone", {(_this select 0) switchMove ("HubStandingUB_idle" + str ([1,2,3] call BIS_fnc_selectRandom))}];
BIS_CTRG2 addEventHandler ["AnimDone", {(_this select 0) switchMove "InBaseMoves_patrolling2"}];

// Start player walking
BIS_inf enableSimulation true;
BIS_inf playMove "HubSpectator_walk";

[] spawn {
	scriptName "ending2.sqf: stop player walking";
	
	// Wait until player is close
	waitUntil {BIS_inf distance markerPos "BIS_playerPos" <	0.5};
	
	// Stop walking
	BIS_inf playMoveNow "HubSpectator_stand";
};

sleep 2;

// Ensure it starts in first person view
vehicle BIS_inf switchCamera "INTERNAL";

// Start Miller's animation
BIS_animPhase = 1;
BIS_recon switchMove "Acts_ComingInSpeakingWalkingOut_1";

private ["_animEH"];
_animEH = BIS_recon addEventHandler [
	"AnimDone",
	{
		private ["_unit"];
		_unit = _this select 0;
		
		BIS_animPhase = BIS_animPhase + 1;
		
		if (BIS_animPhase == 12) then {
			// Stop animations entirely
			_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
			_unit setVariable ["BIS_animEH", _animEH];
		} else {
			// Play the next animation
			private ["_anim"];
			_anim = "Acts_ComingInSpeakingWalkingOut_" + str BIS_animPhase;
			_unit switchMove _anim;
		};
	}
];

BIS_recon setVariable ["BIS_animEH", _animEH];

enableEnvironment true;

// Fade in
5 fadeSound 1;
titleCut ["", "BLACK IN", 5];

private ["_playSyncConv"];
_playSyncConv = {
	private ["_prefix", "_timekeys", "_topic", "_actor", "_bikb", "_channel"];
	_prefix = _this select 0;
	_timekeys = _this select 1;
	_topic = _this select 2;
	_actor = _this select 3;
	_bikb = _this select 4;
	_channel = _this select 5;
	
	// Play conversation
	_actor kbAddTopic [_topic, _bikb, ""];
	[_prefix, _timekeys, _topic, 0, _actor, _channel] spawn BIS_HubBriefing_play;
};

// Kerry's synchronized conversation
[
	"c_out2_70_miller_KER_",
	[
		0.765,
		7.592,
		11.459,
		17.887,
		22.551,
		26.161,
		29.988,
		42.510
	],
	"70_Miller_KER_",
	BIS_inf,
	"\A3\Missions_F_EPC\kb\C_out2\c_out2_70_miller.bikb",
	"DIRECT"
] call _playSyncConv;

// Miller's synchronized conversation
[
	"c_out2_70_miller_MIL_",
	[
		2.141,
		8.994,
		15.199,
		24.842,
		29.062,
		30.786,	//31.286,
		36.615,
		45.449
	],
	"70_Miller_MIL_",
	BIS_recon,
	"\A3\Missions_F_EPC\kb\C_out2\c_out2_70_miller.bikb",
	"DIRECT"
] call _playSyncConv;

// Doppleganger's synchronized conversation
[
	"c_out2_70_miller_fake_MIL_",
	[
		2.141,
		8.994,
		15.199,
		24.842,
		29.062,
		30.786,	//31.286,
		36.615,
		45.449
	],
	"70_Miller_Fake_MIL_",
	BIS_recon_fake,
	"\A3\Missions_F_EPC\kb\C_out2\c_out2_70_miller_fake.bikb",
	"DIRECT"
] call _playSyncConv;

// Crossroads' synchronized conversation
[
	"c_out2_75_csat_inbound_BHQ_",
	[
		48.160,	//48.660,
		52.605	//53.105
	],
	"75_CSAT_Inbound_BHQ_",
	BIS_BHQ,
	"\A3\Missions_F_EPC\kb\C_out2\c_out2_75_csat_inbound.bikb",
	"SIDE"
] call _playSyncConv;

// Miller's final conversation
[
	"c_out2_80_return_MIL_",
	[
		56.638,
		58.313,
		63.634
	],
	"80_Return_MIL_",
	BIS_recon,
	"\A3\Missions_F_EPC\kb\C_out2\c_out2_80_return.bikb",
	"DIRECT"
] call _playSyncConv;

// Doppleganger's final conversation
[
	"c_out2_80_return_fake_MIL_",
	[
		56.638,
		58.313,
		63.634
	],
	"80_Return_Fake_MIL_",
	BIS_recon_fake,
	"\A3\Missions_F_EPC\kb\C_out2\c_out2_80_return_fake.bikb",
	"DIRECT"
] call _playSyncConv;

sleep 1;

// Succeed task
"BIS_miller" call BIS_fnc_missionTasks;

sleep 4;

29 fadeMusic 0;

sleep 29;

0 fadeMusic 0;
34 fadeMusic 0.4;
playMusic "BackgroundTrack01_F_EPC";

// Make music flow into credits
BIS_musicIndex = 0;
BIS_musicEH = addMusicEventHandler [
	"MusicStop",
	{
		switch (BIS_musicIndex) do {
			case 0: {
				// Second song
				[] spawn {
					scriptName "ending2.sqf: credits song 2";
					
					sleep 1;
					
					0 fadeMusic 1;
					playMusic "LeadTrack01_F";
				};
			};
			
			case 1: {
				// Remove eventhandler
				removeMusicEventHandler ["MusicStop", BIS_musicEH];
				
				// Third song
				[] spawn {
					scriptName "ending2.sqf: credits song 3";
					
					sleep 1;
					
					0 fadeMusic 1;
					playMusic "LeadTrack01_F_EPC";
				};
			};
		};
		
		// Increase index
		BIS_musicIndex = BIS_musicIndex + 1;
	}
];

sleep 10;

// Unhide planes
{
	if (!(isNil {_x getVariable "BIS_alt"})) then {
		[_x, _x getVariable "BIS_alt"] call BIS_fnc_setHeight;
	};
	
	_x hideObject false;
	_x enableSimulation true;
	
	if (!(isNil {_x getVariable "BIS_velocity"})) then {
		_x setVelocity (_x getVariable "BIS_velocity");
	};
} forEach [BIS_endPlane1D, BIS_endPlane1, BIS_endPlane2D, BIS_endPlane2];

sleep 24;

// Roll credits
"C_EB_1" execVM "credits.sqf";

sleep 1;

// The End Of All Things
"85_The_End_Of_All_Things" call BIS_fnc_missionConversations;