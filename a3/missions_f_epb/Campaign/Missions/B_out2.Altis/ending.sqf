enableEnvironment false;
format ["%1_disabledSave", missionName] call BIS_fnc_disableSaving;

// Remove NVGs
{BIS_inf unlinkItem _x} forEach ["NVGoggles", "NVGoggles_INDEP", "NVGoggles_OPFOR"];

// Delete unnecessary units
{deleteVehicle _x} forEach ((allUnits + vehicles) - BIS_endUnits);

// Heal everyone
{if (alive _x) then {_x setDamage 0}} forEach [BIS_air, BIS_inf];

BIS_inf allowDamage false;
BIS_inf setCaptive true;
BIS_inf enableSimulation false;

if (primaryWeapon BIS_inf == "") then {
	// Ensure player has a rifle
	BIS_inf addWeapon "arifle_Mk20_ACO_F";
	BIS_inf selectWeapon primaryWeapon BIS_inf;
};

BIS_inf switchMove "HubSpectator_stand";

[0, 0, false] spawn BIS_fnc_cinemaBorder;
setAccTime 1;

// Set the correct time of day (Aug 8 2035 5 45)
setDate [2035, 8, 8, 5, 45];
simulWeatherSync;

// Create smoke stacks
{"test_EmptyObjectForSmoke" createVehicle _x} forEach [
	[12059.717,12780.997,0],
	[11719.021,13663.311,0],
	[12483.856,14334.682,0]
];

// Unhide ambient helicopters
{
	[_x, _x getVariable "BIS_alt"] call BIS_fnc_setHeight;
	_x hideObject false;
	_x enableSimulation true;
} forEach [BIS_ambHeli1, BIS_ambHeli2];

// Move player and pilot into position
{BIS_air disableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];

BIS_inf setPos markerPos "BIS_inf_pos";
BIS_inf setDir markerDir "BIS_inf_pos";
BIS_air setPos markerPos "BIS_air_pos";
BIS_air setDir markerDir "BIS_air_pos";

BIS_air switchMove "AmovPercMstpSlowWrflDnon";
BIS_air doWatch objNull;

// Position doppleganger
BIS_BHQ_fake enableSimulation true;
BIS_BHQ_fake attachTo [BIS_inf, [0,0,0]];

sleep 4;

clearRadio;

// Show sometime later screen
private ["_sometimeLater"];
_sometimeLater = ["\A3\Missions_F_EPB\video\B_out2_sometime_later.ogv"] spawn BIS_fnc_playVideo;
if (language != "English") then {titleText [localize "STR_A3_B_in2_sometime_hours_later", "PLAIN DOWN"]};

0 fadeMusic 0.6;
playMusic "LeadTrack01_F_EPB";

sleep 8;

// Pilot animation
BIS_air switchMove "Acts_NATOCommanderArrival_Larkin_1";

sleep 2;

// Start sequence
[] spawn BIS_landing;

sleep 1;

BIS_stayOnGround = {
	private ["_heli"];
	_heli = _this;
	
	private ["_pos", "_vecDir", "_vecUp"];
	_pos = getPosATL _heli;
	_vecDir = vectorDir _heli;
	_vecUp = vectorUp _heli;
	
	// Force them to last position every frame
	addMissionEventHandler [
		"Draw3D",
		format [
			"
				%1 setPosATL %2;
				%1 setVectorDirAndUp [%3, %4];
			",
			_heli,
			_pos,
			_vecDir,
			_vecUp
		]
	];
};

[] spawn {
	scriptName "ending.sqf: officer heli control";
	
	// Wait for officer heli to land
	waitUntil {BIS_officerHeli getVariable ["BIS_sequenceFinished", false]};
	
	// Keep heli on ground
	BIS_officerHeli spawn BIS_stayOnGround;
	deleteVehicle BIS_dummyCargo;
};

[] spawn {
	scriptName "ending.sqf: heli 2 team control";
	
	// Wait for heli 2 to land
	waitUntil {BIS_heli2 getVariable ["BIS_sequenceFinished", false]};
	
	// Keep heli on ground
	BIS_heli2 spawn BIS_stayOnGround;
	
	// Make SF team disembark
	{group _x leaveVehicle BIS_heli2} forEach BIS_heli2Team;
	doGetOut BIS_heli2Team;
};

// Officer animation
BIS_BHQ switchMove "Acts_NATOCommanderArrival_Commander_1";
BIS_BHQ attachTo [BIS_officerHeli, [-0.41,2,-2.2]];
BIS_BHQ setDir 274;

BIS_inf enableSimulation true;

enableEnvironment true;
5 fadeSound 0.6;
titleCut ["", "BLACK IN", 5];

sleep 5;

[] spawn BIS_fnc_camp_showOSD;

sleep 5;

20 fadeMusic 0;

sleep 3.5;

// Open door
BIS_officerHeli animateDoor ["Door_L", 1];

sleep 1.25;

0 fadeSpeech 1;
0 fadeRadio 1;

// Make officer get out
detach BIS_BHQ;
BIS_BHQ enableSimulation true;

_prefix = "b_out2_75_failed_invasion_BHQ_";
_timekeys = 	[
			0.258620,//	1.622250	BHQ0
			8.960998,//	11.795737	BHQ1
			12.010693,//	16.121736	BHQ2
			21.079170,//	21.952431	BHQ3
			27.917473,//	31.168690	BHQ4
			31.571733,//	37.187471	BHQ5
			39.216123,//	41.459732	BHQ6
			41.741862//	45.422992	BHQ7                        
		];

_topic = "75_failed_invasion_BHQ_";
_actor = BIS_BHQ;	

_actor kbAddTopic [ _topic, "\a3\Missions_F_EPB\kb\B_out2\b_out2_75_failed_invasion.bikb", ""];
[_prefix, _timekeys, _topic, 4.7, _actor] spawn BIS_HubBriefing_play;

_prefix = "b_out2_75_failed_invasion_KER_";
_timekeys = 	[
			1.827130,//	8.275825	KER0
			16.746453,//	20.938105	KER1
			22.409213,//	27.353212	KER2
			37.684558//	38.342863	KER3
		];

_topic = "75_failed_invasion_BHQ_";
_actor = BIS_inf;	

_actor kbAddTopic [ _topic, "\a3\Missions_F_EPB\kb\B_out2\b_out2_75_failed_invasion.bikb", ""];
					
[_prefix, _timekeys, _topic, 4.7, _actor] spawn BIS_HubBriefing_play;

// Fake officer
_prefix = "b_out2_75_failed_invasion_fake_BHQ_";
_timekeys = 	[
			0.258620,//	1.622250	BHQ0
			8.960998,//	11.795737	BHQ1
			12.010693,//	16.121736	BHQ2
			21.079170,//	21.952431	BHQ3
			27.917473,//	31.168690	BHQ4
			31.571733,//	37.187471	BHQ5
			39.216123,//	41.459732	BHQ6
			41.741862//	45.422992	BHQ7                        
		];

_topic = "75_failed_invasion_fake_BHQ_";
_actor = BIS_BHQ_fake;	

_actor kbAddTopic [ _topic, "\a3\Missions_F_EPB\kb\B_out2\b_out2_75_failed_invasion_fake.bikb", ""];
[_prefix, _timekeys, _topic, 4.7, _actor] spawn BIS_HubBriefing_play;

sleep 30.5;

// Start ending music
0 fadeMusic 0;
15 fadeMusic 0.5;
playMusic ["LeadTrack01_F_EPB", 30];

// Make music flow into credits
BIS_musicIndex = 0;
BIS_musicEH = addMusicEventHandler [
	"MusicStop",
	{
		switch (BIS_musicIndex) do {
			case 0: {
				// Second song
				[] spawn {
					scriptName "ending.sqf: credits song 2";
					
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
					scriptName "ending.sqf: credits song 3";
					
					sleep 1;
					
					0 fadeMusic 1;
					playMusic "LeadTrack02a_F_EPB";
				};
			};
		};
		
		// Increase index
		BIS_musicIndex = BIS_musicIndex + 1;
	}
];

sleep 16.25;

10 fadeMusic 1;
10 fadeSound 0;

sleep 1;

titleCut ["", "BLACK OUT", 5];

sleep 1.25;

// Make player walk with them
BIS_inf playMoveNow "HubSpectator_Walk";

sleep 4.75;

clearRadio;

sleep 2;

// Show to be continued screen
private ["_toBeContinued"];
_toBeContinued = ["\A3\Missions_F_EPA\video\A_out_to_be_continued.ogv"] spawn BIS_fnc_playVideo;
if (language != "English") then {titleText [localize "STR_A3_A_out_To_Be_Continued", "PLAIN DOWN"]};
waitUntil {scriptDone _toBeContinued};

// Limit view distance
setViewDistance 500;

// Create camera facing upwards
BIS_B_out2_credits_camera = "Camera" camCreate [10,10,10];
BIS_B_out2_credits_camera cameraEffect ["INTERNAL", "BACK"];

BIS_B_out2_credits_camera camPreparePos position vehicle BIS_inf;

BIS_B_out2_credits_camera camPrepareTarget [
	position vehicle BIS_inf select 0,
	position vehicle BIS_inf select 1,
	1000
];

BIS_B_out2_credits_camera camPrepareFOV 0.700;
BIS_B_out2_credits_camera camCommitPrepared 0;

sleep 2;

// Allow credits to be skipped
[] spawn {
	disableSerialization;
	scriptName "missionFlow.fsm: credits skip";
	
	// Create credits
	(findDisplay 46) createDisplay "RscCredits";
	[] call BIS_fnc_credits_movie;
	
	private ["_display"];
	_display = [] call BIS_fnc_displayMission;
	
	if (!(isNil {uiNamespace getVariable "BIS_B_out2_credits_skipEH"})) then {
		_display displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "BIS_B_out2_credits_skipEH"];
		uiNamespace setVariable ["BIS_B_out2_credits_skipEH", nil];
	};
	
	private ["_skipEH"];
	_skipEH = _display displayAddEventHandler [
		"KeyDown",
		"
			if ((_this select 1) in [1, 57] && isNil 'BIS_B_out2_credits_skipped') then {
				BIS_B_out2_credits_skipped = true;
				playSound ['click', true];
				
				[] spawn {
					disableSerialization;
					scriptName 'missionFlow.fsm: skip credits';
					
					(('BIS_B_out2_credits_blackScreen') call BIS_fnc_rscLayer) cutText ['', 'BLACK OUT', 3];
					3 fadeMusic 0;
					
					sleep 4;
					
					BIS_B_out2_credits_camera cameraEffect ['TERMINATE', 'BACK'];
					camDestroy BIS_B_out2_credits_camera;
					
					endMission 'END1';
				};
			};
			
			true
		"
	];
	
	uiNamespace setVariable ["BIS_B_out2_credits_skipEH", _skipEH];
	
	waitUntil {!(isNil "BIS_fnc_credits_movie_script")};
	waitUntil {scriptDone BIS_fnc_credits_movie_script};
	
	// Remove eventhandler
	_display displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "BIS_B_out2_credits_skipEH"];
	uiNamespace setVariable ["BIS_B_out2_credits_skipEH", nil];
	
	// Destroy camera
	BIS_B_out2_credits_camera cameraEffect ["TERMINATE", "BACK"];
	camDestroy BIS_B_out2_credits_camera;
	
	// End mission
	endMission "END1";
};