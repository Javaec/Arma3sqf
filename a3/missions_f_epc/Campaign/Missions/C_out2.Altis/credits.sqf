// Determine ending
BIS_C_out2_credits_ending = _this;

// Fade out
5 fadeSound 0;
5 fadeMusic 1;
titleCut ["", "BLACK OUT", 5];

sleep 5;

enableEnvironment false;
enableSentences false;

if (BIS_C_out2_credits_ending == "C_EA_1") then {
	// Delete everything except the player
	{deleteVehicle _x} forEach (allUnits + vehicles - [BIS_inf]);
	
	// Disable radio
	enableRadio false;
};

// Limit view distance
setViewDistance 500;

// Create camera facing upwards
BIS_C_out2_credits_camera = "Camera" camCreate [10,10,10];
BIS_C_out2_credits_camera cameraEffect ["INTERNAL", "BACK"];

BIS_C_out2_credits_camera camPreparePos position vehicle BIS_inf;

BIS_C_out2_credits_camera camPrepareTarget [
	position vehicle BIS_inf select 0,
	position vehicle BIS_inf select 1,
	1000
];

BIS_C_out2_credits_camera camPrepareFOV 0.700;
BIS_C_out2_credits_camera camCommitPrepared 0;

sleep 2;

// Clear radio only in one ending
if (BIS_C_out2_credits_ending == "C_EA_1") then {clearRadio};

// Allow credits to be skipped
[] spawn {
	disableSerialization;
	scriptName "ending2.sqf: credits skip";
	
	// Create credits
	(findDisplay 46) createDisplay "RscCredits";
	[] call BIS_fnc_credits_movie;
	
	private ["_display"];
	_display = [] call BIS_fnc_displayMission;
	
	if (!(isNil {uiNamespace getVariable "BIS_C_out2_credits_skipEH"})) then {
		_display displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "BIS_C_out2_credits_skipEH"];
		uiNamespace setVariable ["BIS_C_out2_credits_skipEH", nil];
	};
	
	private ["_skipEH"];
	_skipEH = _display displayAddEventHandler [
		"KeyDown",
		"
			if ((_this select 1) in [1, 57] && isNil 'BIS_C_out2_credits_skipped') then {
				BIS_C_out2_credits_skipped = true;
				playSound ['click', true];
				
				[] spawn {
					disableSerialization;
					scriptName 'missionFlow.fsm: skip credits';
					
					(('BIS_B_out2_credits_blackScreen') call BIS_fnc_rscLayer) cutText ['', 'BLACK OUT', 3];
					3 fadeMusic 0;
					
					sleep 4;
					
					BIS_C_out2_credits_camera cameraEffect ['TERMINATE', 'BACK'];
					camDestroy BIS_C_out2_credits_camera;
					
					endMission BIS_C_out2_credits_ending;
				};
			};
			
			true
		"
	];
	
	uiNamespace setVariable ["BIS_C_out2_credits_skipEH", _skipEH];
	
	waitUntil {!(isNil "BIS_fnc_credits_movie_script")};
	waitUntil {scriptDone BIS_fnc_credits_movie_script};
	
	// Remove eventhandler
	_display displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "BIS_C_out2_credits_skipEH"];
	uiNamespace setVariable ["BIS_C_out2_credits_skipEH", nil];
	
	// Destroy camera
	BIS_C_out2_credits_camera cameraEffect ["TERMINATE", "BACK"];
	camDestroy BIS_C_out2_credits_camera;
	
	// End mission
	endMission BIS_C_out2_credits_ending;
};