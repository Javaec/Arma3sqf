disableSerialization;

// Defines
#define TRANSITION_TIME 	3
#define SCENE_TIME_START 	10
#define SCENE_TIME 		5
#define SOUND_WIND_SMALL	"WindSmall"
#define SOUND_WIND_NORMAL	"WindNormal"
#define SOUND_WIND_BIG		"WindBig"

// Parameters
private ["_isInstructor"];
_isInstructor = [_this, 0, false, [true]] call BIS_fnc_param;

// PP function
private "_fn_PostProcessing";
_fn_PostProcessing = {
	private ["_action", "_parameters"];
	_action 	= [_this, 0, "", [""]] call BIS_fnc_param;
	_parameters 	= [_this, 1, [], [[]]] call BIS_fnc_param;
	
	switch (toLower _action) do {
		case (toLower "create") : {
			private "_radialBlur";
			_radialBlur = ppEffectCreate ["RadialBlur", 100];
			_radialBlur ppEffectEnable false;
			_radialBlur ppEffectAdjust [0.01, 0.01, 0.025, 0.025];
			_radialBlur ppEffectCommit 0;
			
			// Return
			_radialBlur;
		};
		case (toLower "destroy") : {
			private ["_effect"];
			_effect = [_parameters, 0, -1, [0]] call BIS_fnc_param;
			
			// Destroy effect
			ppEffectDestroy _effect;
		};
		case (toLower "enabled") : {
			private ["_effect", "_enabled"];
			_effect	= [_parameters, 0, -1, [0]] call BIS_fnc_param;
			_enabled = [_parameters, 1, true, [true]] call BIS_fnc_param;
			
			// Enable or disable effect
			_effect ppEffectEnable _enabled;
			_effect ppEffectCommit 0;
		};
	};
};

// Abort function
private "_fn_Abort";
_fn_Abort = {
	disableSerialization;
	
	private ["_Camera", "_Pp", "_PpFunction", "_display", "_event"];
	_Camera		= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_Pp		= [_this, 1, -1, [0]] call BIS_fnc_param;
	_PpFunction	= [_this, 2, {}, [{}]] call BIS_fnc_param;
	_display	= [_this, 3, displayNull, [displayNull]] call BIS_fnc_param;
	_event		= [_this, 4, -1, [0]] call BIS_fnc_param;
	
	// Fade screen to and from black
	cutText ["", "BLACK FADED", 99];
	[] spawn { sleep 2; cutText ["", "BLACK IN", 5]; };
	
	// Fade music
	2 fadeMusic 0;
	[] spawn { sleep 60; 5 fadeMusic 0.5; };

	// Destroy post processing effect
	["destroy", [_Pp]] call _PpFunction;

	// Terminate camera
	_Camera cameraEffect ["Terminate", "BACK"];
	camDestroy _Camera;
	
	// Remove display key down event handler
	_display displayRemoveEventHandler ["KeyDown", _event];
};

// Screen and sound
0 fadeSound 0;
0 fadeMusic 0;
cutText ["", "BLACK FADED", 99];

// Wait for game to pre load
["BIS_introPreload", "onPreloadFinished", {
	// Remove event handler
	["BIS_introPreload", "onPreloadFinished"] call BIS_fnc_removeStackedEventHandler;
	
	// Set variable
	missionNamespace setVariable ["BIS_readyForIntro", true];
}] call BIS_fnc_addStackedEventHandler;

// Wait
waitUntil {
	!isNil { missionNamespace getVariable "BIS_readyForIntro" }
	&&
	{ !isNull (findDisplay 46) }
};

// The display
private "_display";
_display = findDisplay 46;

// Abort key down event handler
private "_abortEvent";
_abortEvent = _display displayAddEventHandler ["KeyDown", {
	if ((_this select 1) == 57) then {
		BIS_introAborted = true;
		[format ["%1%2", localize "str_a3_firing_drills_timing_rof_2", "..."], 0 * safeZoneW + safeZoneX, 0.8 * safeZoneH + safeZoneY, 3] spawn BIS_fnc_dynamicText;
		true;
	} else {
		false;
	};
}];

// The camera
private "_camera";
_camera = "camera" camCreate positionCameraToWorld [0,0,0];
_camera cameraEffect ["Internal", "BACK"];

// Avoid cinema borders
showCinemaBorder false;

// Fade screen and sound/music
SCENE_TIME_START fadeSound 1;
SCENE_TIME_START fadeMusic 0.5;
cutText ["", "BLACK IN", SCENE_TIME_START];

// The post processing
private "_pp";
_pp = ["create"] call _fn_PostProcessing;

// Splash text
[] spawn {
	disableSerialization;
	
	private ["_layer"];
	_layer = "BIS_layerCredits" call BIS_fnc_rscLayer;
	_layer cutRsc ["RscDynamicText", "PLAIN"];
	
	private ["_display", "_ctrl"];
	_display = uiNamespace getVariable "BIS_dynamicText";
	_ctrl = _display displayCtrl 9999;
	_ctrl ctrlSetFade 1;
	_ctrl ctrlCommit 0;
	
	// Compose & parse string
	private ["_string", "_parsed"];
	_string = "<t align = 'center'><t size = '1.25' font = 'PuristaBold'>" + (toUpper (localize "STR_A3_Bohemia_Interactive")) + "</t><br/><t size = '0.75'>" + (toUpper (localize "STR_A3_MP_Bootcamp_Name")) + "</t>";
	_parsed = parseText _string;
	
	_ctrl ctrlSetPosition [
		0 * safeZoneW + safeZoneX,
		0.5 * safeZoneH + safeZoneY,
		safeZoneW,
		safeZoneH
	];
	_ctrl ctrlSetStructuredText _parsed;
	_ctrl ctrlCommit 0;
	_ctrl ctrlSetFade 0;
	_ctrl ctrlCommit 3;
	waitUntil { ctrlCommitted _ctrl; };
	sleep 5;
	_ctrl ctrlSetFade 1;
	_ctrl ctrlCommit 3;
};

// Music
playMusic ["BackgroundTrack01_F", 30];

//**************************************
// First camera state
//**************************************
_camera camPrepareTarget [-53950.65,-50814.48,-28197.09];
_camera camPreparePos [14509.27,16357.93,88.13];
_camera camPrepareFOV 0.722;
_camera camCommitPrepared 0;

_camera camPrepareTarget [14655.67,-80999.88,-22884.77];
_camera camPreparePos [14262.08,16331.22,41.46];
_camera camPrepareFOV 0.722;
_camera camCommitPrepared SCENE_TIME_START;

// Wait
waitUntil {
	camCommitted _camera;
};

// Abort
if (!isNil { BIS_introAborted }) exitWith {
	[_camera, _pp, _fn_PostProcessing, _display, _abortEvent] call _fn_Abort;
};

//**************************************
// Grenades Firing Range
//**************************************
// Enable post processing
["enabled", [_pp, true]] call _fn_PostProcessing;

// Play wind sound
playSound SOUND_WIND_SMALL;

_camera camPreparePos [14132.44,15925.37,4.04];
_camera camPrepareTarget [-64317.42,-43233.61,-18574.59];
_camera camCommitPrepared TRANSITION_TIME;
waitUntil { camCommitted _camera };

// Disable post processing effect
["enabled", [_pp, false]] call _fn_PostProcessing;

// Show text about content on screen
["Grenades", "Firing Range"] spawn BIS_fnc_infoText;	// Localize

sleep 1;

_camera camPrepareTarget [-6043.70,-80905.20,-14708.65];
_camera camPreparePos [14100.70,15930.52,5.79];
_camera camPrepareFOV 0.701;
_camera camCommitPrepared (SCENE_TIME - 1);
waitUntil { camCommitted _camera };

sleep 1;

// Abort
if (!isNil { BIS_introAborted }) exitWith {
	[_camera, _pp, _fn_PostProcessing, _display, _abortEvent] call _fn_Abort;
};

//**************************************
// Weapons Firing Range
//**************************************
// Enable post processing
["enabled", [_pp, true]] call _fn_PostProcessing;

// Play wind sound
playSound SOUND_WIND_SMALL;

_camera camPrepareTarget [19029.03,-82995.79,-14415.29];
_camera camPreparePos [14193.46,15836.23,18.27];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared (TRANSITION_TIME / 2);
waitUntil { camCommitted _camera };

_camera camPreparePos [14271.88,15748.18,2.72];
_camera camPrepareTarget [-72372.59,-33586.93,-7646.46];
_camera camCommitPrepared (TRANSITION_TIME / 2);
waitUntil { camCommitted _camera };

// Disable post processing effect
["enabled", [_pp, false]] call _fn_PostProcessing;

// Show text about content on screen
["Weapons", "Firing Range"] spawn BIS_fnc_infoText;	// Localize

sleep 1;

_camera camPrepareTarget [-83110.66,-1507.23,-14839.84];
_camera camPreparePos [14265.48,15724.44,6.58];
_camera camPrepareFOV 0.701;
_camera camCommitPrepared (SCENE_TIME - 1);
waitUntil { camCommitted _camera };

sleep 1;

// Abort
if (!isNil { BIS_introAborted }) exitWith {
	[_camera, _pp, _fn_PostProcessing, _display, _abortEvent] call _fn_Abort;
};

//**************************************
// Infantry Obstacle Course
//**************************************
// Enable post processing
["enabled", [_pp, true]] call _fn_PostProcessing;

// Play wind sound
playSound SOUND_WIND_SMALL;

_camera camPrepareTarget [-58239.15,81312.67,-21625.47];
_camera camPreparePos [14230.56,15902.27,27.17];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared (TRANSITION_TIME / 3);
waitUntil { camCommitted _camera };

_camera camPrepareTarget [111375.06,38083.18,-8430.19];
_camera camPreparePos [14171.11,16181.06,15.83];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared (TRANSITION_TIME / 3);
waitUntil { camCommitted _camera };

_camera camPrepareTarget [110539.75,-8780.22,-9832.01];
_camera camPreparePos [14224.18,16244.06,1.53];
_camera camPrepareFOV 0.400;
_camera camCommitPrepared (TRANSITION_TIME / 3);
waitUntil { camCommitted _camera };

_camera camPrepareTarget [110539.75,-8780.22,-9832.01];
_camera camPreparePos [14224.18,16244.06,1.53];
_camera camPrepareFOV 0.400;
_camera camCommitPrepared 0;
waitUntil { camCommitted _camera };

// Disable post processing effect
["enabled", [_pp, false]] call _fn_PostProcessing;

// Show text about content on screen
["Infantry", "Obstacle Course"] spawn BIS_fnc_infoText;	// Localize

sleep 1;

_camera camPrepareTarget [57850.10,-70806.66,-22709.63];
_camera camPreparePos [14230.07,16257.83,9.76];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared (SCENE_TIME - 1);
waitUntil { camCommitted _camera };

sleep 1;

// Abort
if (!isNil { BIS_introAborted }) exitWith {
	[_camera, _pp, _fn_PostProcessing, _display, _abortEvent] call _fn_Abort;
};

//**************************************
// Vehicles Obstacle Course
//**************************************
// Enable post processing
["enabled", [_pp, true]] call _fn_PostProcessing;

// Play wind sound
playSound SOUND_WIND_SMALL;

_camera camPrepareTarget [84649.61,85807.77,-16478.98];
_camera camPreparePos [14594.22,16407.03,109.23];
_camera camPrepareFOV 0.650;
_camera camCommitPrepared (TRANSITION_TIME / 2);
waitUntil { camCommitted _camera };

_camera camPrepareTarget [107583.05,53268.96,-11680.33];
_camera camPreparePos [15138.40,16977.36,2.32];
_camera camPrepareFOV 0.509;
_camera camCommitPrepared (TRANSITION_TIME / 2);
waitUntil { camCommitted _camera };

// Disable post processing effect
["enabled", [_pp, false]] call _fn_PostProcessing;

// Show text about content on screen
["Vehicles", "Obstacle Course"] spawn BIS_fnc_infoText;	// Localize

sleep 1;

_camera camPrepareTarget [111758.45,27994.17,-23171.31];
_camera camPreparePos [15112.40,16999.41,19.29];
_camera camPrepareFOV 0.701;
_camera camCommitPrepared (SCENE_TIME - 1);
waitUntil { camCommitted _camera };

sleep 1;

// Abort
if (!isNil { BIS_introAborted }) exitWith {
	[_camera, _pp, _fn_PostProcessing, _display, _abortEvent] call _fn_Abort;
};

//**************************************
// Vehicles Firing Range
//**************************************
// Enable post processing
["enabled", [_pp, true]] call _fn_PostProcessing;

// Play wind sound
playSound SOUND_WIND_SMALL;

_camera camPreparePos [14123.33,17226.99,4.31];
_camera camPrepareTarget [-57894.98,-49839.53,-17727.95];
_camera camCommitPrepared TRANSITION_TIME;
waitUntil { camCommitted _camera };

// Disable post processing effect
["enabled", [_pp, false]] call _fn_PostProcessing;

// Show text about content on screen
["Vehicles", "Firing Range"] spawn BIS_fnc_infoText;	// Localize

sleep 1;

_camera camPrepareTarget [-28181.47,-72426.95,-13164.16];
_camera camPreparePos [14090.11,17233.24,5.17];
_camera camPrepareFOV 0.276;
_camera camCommitPrepared (SCENE_TIME - 1);
waitUntil { camCommitted _camera };

sleep 1;

// Abort
if (!isNil { BIS_introAborted }) exitWith {
	[_camera, _pp, _fn_PostProcessing, _display, _abortEvent] call _fn_Abort;
};

//**************************************
// Karts track
//**************************************
// Enable post processing
["enabled", [_pp, true]] call _fn_PostProcessing;

// Play wind sound
playSound SOUND_WIND_SMALL;

_camera camPrepareTarget [42098.24,-77973.59,-14049.31];
_camera camPreparePos [14044.18,16963.66,75.39];
_camera camPrepareFOV 0.486;
_camera camCommitPrepared (TRANSITION_TIME / 3);
waitUntil { camCommitted _camera };

_camera camPrepareTarget [65275.04,-63901.79,-29993.64];
_camera camPreparePos [14072.31,16567.96,41.63];
_camera camPrepareFOV 0.486;
_camera camCommitPrepared (TRANSITION_TIME / 3);
waitUntil { camCommitted _camera };

_camera camPrepareTarget [105214.15,-23667.84,-9449.51];
_camera camPreparePos [14101.40,16442.15,2.44];
_camera camPrepareFOV 0.486;
_camera camCommitPrepared (TRANSITION_TIME / 3);
waitUntil { camCommitted _camera };

// Disable post processing effect
["enabled", [_pp, false]] call _fn_PostProcessing;

// Show text about content on screen
["Karts", "Racing Track"] spawn BIS_fnc_infoText;	// Localize

sleep 1;

_camera camPrepareTarget [-57965.56,-51645.33,-12879.86];
_camera camPreparePos [14130.89,16440.84,1.24];
_camera camPrepareFOV 0.377;
_camera camCommitPrepared (SCENE_TIME - 1);
waitUntil { camCommitted _camera };

sleep 1;

//**************************************
// The End
//**************************************
[_camera, _pp, _fn_PostProcessing, _display, _abortEvent] call _fn_Abort;
