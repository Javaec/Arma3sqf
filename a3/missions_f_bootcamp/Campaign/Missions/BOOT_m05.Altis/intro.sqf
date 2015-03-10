// Create smoke shell and chemlight
private ["_pos"];
_pos = markerPos "BIS_smoke";
"SmokeShell" createVehicle _pos;
"Chemlight_blue" createVehicle _pos;

// Start landing sequence
[] spawn BIS_landing;

sleep 1;

// Adams' animations
{BIS_adams disableAI _x} forEach ["ANIM", "AUTOTARGET", "MOVE", "TARGET"];
BIS_adams enableMimics false;
BIS_adams setBehaviour "CARELESS";
BIS_adams switchMove "Acts_welcomeOnHUB04_PlayerWalk_4";
BIS_adams doWatch [7385.149,12383.180,0.000];

private ["_animEH"];
_animEH = BIS_adams addEventHandler [
	"AnimDone",
	{
		private ["_unit", "_anim"];
		_unit = _this select 0;
		_anim = _this select 1;
		
		switch (toLower _anim) do {
			// Play next animations
			case "acts_welcomeonhub04_playerwalk_4": {_unit switchMove "Acts_welcomeOnHUB04_PlayerWalk_5"};
			
			case "acts_welcomeonhub04_playerwalk_5": {
				// Stop animations
				_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
				_unit setVariable ["BIS_animEH", nil];
				
				{_unit enableAI _x} forEach ["ANIM", "AUTOTARGET", "TARGET"];
				_unit enableMimics true;
				_unit setBehaviour "SAFE";
			};
		};
	}
];

BIS_adams setVariable ["BIS_animEH", _animEH];

// Player's animations
BIS_lacey playMoveNow "AmovPknlMstpSlowWrflDnon";

// Blur
private ["_blur"];
_blur = ppEffectCreate ["DynamicBlur", 467];
_blur ppEffectEnable true;
_blur ppEffectAdjust [5];
_blur ppEffectCommit 0;

_blur ppEffectAdjust [0];
_blur ppEffectCommit 5;

// Fade in
enableEnvironment true;
5 fadeSound 0.3;
playMusic "AmbientTrack04a_F";
titleCut ["", "BLACK IN", 5];

sleep 5;

ppEffectDestroy _blur;

sleep 3;

"01_Start" spawn BIS_fnc_missionConversations;

sleep 9;

// Wave at the heli
{BIS_adams disableAI _x} forEach ["ANIM", "AUTOTARGET", "TARGET"];
BIS_adams enableMimics false;
BIS_adams setBehaviour "CARELESS";

BIS_adams switchMove "Acts_PercMstpSlowWrflDnon_handup1c";

private ["_animEH"];
_animEH = BIS_adams addEventHandler [
	"AnimDone",
	{
		private ["_unit", "_anim"];
		_unit = _this select 0;
		_anim = _this select 1;
		
		if (_anim == "Acts_PercMstpSlowWrflDnon_handup1c") then {
			_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
			_unit setVariable ["BIS_animEH", nil];
			
			{_unit enableAI _x} forEach ["ANIM", "AUTOTARGET", "TARGET"];
			_unit enableMimics true;
			_unit setBehaviour "SAFE";
		};
	}
];

BIS_adams setVariable ["BIS_animEH", _animEH];

sleep 6;

// Move to the meet
BIS_meet = true;
BIS_adams enableAI "MOVE";

sleep 1;

// Watch the heli
BIS_adams reveal BIS_heli;
BIS_adams doWatch BIS_heli;

// Wait for reinforcements to land
waitUntil {BIS_reinfLanded};

// Succeed task
["BIS_reinf", "SUCCEEDED"] call BIS_fnc_missionTasks;

"05_Situation" call BIS_fnc_missionConversations;

[] spawn {
	scriptName "intro.sqf: heli units control";
	
	// Wait for reinforcement leader to disembark
	waitUntil {!(BIS_reinf1 in BIS_heli)};
	
	// Make him face Adams
	BIS_reinf1 reveal BIS_adams;
	BIS_reinf1 doWatch BIS_adams;
	
	// Make Adams face him
	BIS_adams reveal BIS_reinf1;
	BIS_adams doWatch BIS_reinf1;
	
	// Wait for reinforcements to disembark
	waitUntil {{_x in BIS_heli} count units BIS_reinf == 0};
	
	// Let team mates board the heli
	BIS_wave1 = true;
	{_x setBehaviour "AWARE"} forEach [BIS_team1, BIS_team2];
	BIS_team1 assignAsCargoIndex [BIS_heli, 2];
	BIS_team2 assignAsCargoIndex [BIS_heli, 5];
	[BIS_team1, BIS_team2] orderGetIn true;
};

sleep 2;

"10_CSAT" call BIS_fnc_missionConversations;
"BIS_heli" call BIS_fnc_missionTasks;

// Let Adams get in
BIS_adams doWatch objNull;
BIS_adams setBehaviour "AWARE";
BIS_adams assignAsCargoIndex [BIS_heli, 4];
[BIS_adams] orderGetIn true;

BIS_getIn = true;

// Register that the intro finished
BIS_introEnded = true;