// Defines
#define VARIABLE_CAMERA 			"BIS_focusOnObject_camera"
#define VARIABLE_CAMERA_CHANGING		"BIS_focusOnObject_cameraChanging"
#define VARIABLE_CAMERA_TYPE			"BIS_focusOnObject_cameraType"
#define VARIABLE_CAMERA_INITIAL_POSITION	"BIS_focusOnObject_cameraInitialPosition"
#define VARIABLE_CAMERA_INITIAL_DIRECTION	"BIS_focusOnObject_cameraInitialDirection"
#define VARIABLE_CAMERA_INITIAL_TARGET		"BIS_focusOnObject_cameraInitialTarget"
#define VARIABLE_MEN				"BIS_focusOnObject_men"
#define VARIABLE_WHITEBOARD_TEXTURE		"BIS_whiteboardTexture"
#define WHITEBOARD_TEXTURE_DEFAULT		"\A3\Structures_F\Civ\InfoBoards\Data\MapBoard_Default_CO.paa"
#define CAMERA_DISTANCE				1.6
#define CAMERA_DIRECTION			180
#define CAMERA_HEIGHT				0.7
#define CAMERA_TARGET_HEIGHT			0.175
#define CAMERA_FOV_DEFAULT			0.7
#define CAMERA_TRANSITION			0.5
#define CAMERA_TRANSITION_IN_SOUND		"border_in"
#define CAMERA_TRANSITION_OUT_SOUND		"border_out"
#define CAMERA_TRANSITION_BLUR			0.005
#define SCREEN_FOV_OFFSET_VERYSMALL		0.54
#define SCREEN_FOV_OFFSET_SMALL			0.45
#define SCREEN_FOV_OFFSET_NORMAL		0.35
#define SCREEN_FOV_OFFSET_LARGE			0.30
#define SCREEN_FOV_OFFSET_VERYLARGE		0.25
#define SCREEN_SAFEZONE_H_VERYSMALL		2.12
#define SCREEN_SAFEZONE_H_SMALL			1.81
#define SCREEN_SAFEZONE_H_NORMAL		1.42
#define SCREEN_SAFEZONE_H_LARGE			1.17
#define SCREEN_SAFEZONE_H_VERYLARGE		1

// Parameters
private ["_action", "_parameters"];
_action		= [_this, 0, "", [""]] call BIS_fnc_param;
_parameters 	= [_this, 1, [], [[]]] call BIS_fnc_param;

switch (toLower _action) do {
	case (toLower "initialize") : {
		private ["_object", "_type"];
		_object	= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_type	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		
		// Avoid multiple executions
		if (!isNil { missionNamespace getVariable VARIABLE_CAMERA }) exitWith {
			// Log
			"Already initialized, terminate first" call BIS_fnc_error;
		};
		
		// The camera
		private "_camera";
		_camera = "camera" camCreate positionCameraToWorld [0,0,0];
		
		// Players eye direction
		private ["_eyeDirection", "_direction"];
		_eyeDirection 	= eyeDirection player;
		_direction	= (_eyeDirection select 0) atan2 (_eyeDirection select 1);
		
		// Camera properties
		_camera setDir _direction;
		_camera camSetPos positionCameraToWorld [0,0,0];
		_camera camCommit 0;
		
		// Switch to the new camera
		_camera cameraEffect ["Internal", "BACK"];
		
		// Avoid cinema borders
		showCinemaBorder false;
		
		// Replace texture
		_object setObjectTexture [0, WHITEBOARD_TEXTURE_DEFAULT];
		
		// New camera transformation
		private ["_position", "_target", "_direction"];
		_position 	= _object modelToWorld [0, -CAMERA_DISTANCE, CAMERA_HEIGHT];
		_target		= _object modelToWorld [0, CAMERA_DISTANCE, CAMERA_TARGET_HEIGHT];
		_direction	= getDir _object + CAMERA_DIRECTION;
		
		// Store required data
		missionNamespace setVariable [VARIABLE_CAMERA, _camera];
		missionNamespace setVariable [VARIABLE_CAMERA_TYPE, cameraView];
		missionNamespace setVariable [VARIABLE_CAMERA_CHANGING, true];
		missionNamespace setVariable [VARIABLE_CAMERA_INITIAL_POSITION, positionCameraToWorld [0, 0, 0]];
		missionNamespace setVariable [VARIABLE_CAMERA_INITIAL_TARGET, positionCameraToWorld [0, 0, 50]];
		missionNamespace setVariable [VARIABLE_CAMERA_INITIAL_DIRECTION, [(missionNamespace getVariable VARIABLE_CAMERA_INITIAL_POSITION), (missionNamespace getVariable VARIABLE_CAMERA_INITIAL_TARGET)] call BIS_fnc_dirTo];
		missionNamespace setVariable [VARIABLE_MEN, position _object nearObjects ["Man", 25]];
		
		// Hide all man objects around
		{
			_x hideObject true;
		} forEach (missionNamespace getVariable VARIABLE_MEN);
		
		// Fov offset depending on UI size
		private "_fovOffset";
		_fovOffset = switch (true) do {
			case (safeZoneH >= SCREEN_SAFEZONE_H_VERYSMALL) : { SCREEN_FOV_OFFSET_VERYSMALL };
			case (safeZoneH >= SCREEN_SAFEZONE_H_SMALL) : { SCREEN_FOV_OFFSET_SMALL };
			case (safeZoneH >= SCREEN_SAFEZONE_H_NORMAL) : { SCREEN_FOV_OFFSET_NORMAL };
			case (safeZoneH >= SCREEN_SAFEZONE_H_LARGE) : { SCREEN_FOV_OFFSET_LARGE };
			case (safeZoneH >= SCREEN_SAFEZONE_H_VERYLARGE) : { SCREEN_FOV_OFFSET_VERYLARGE };
			case default { 0 };
		};
		
		// Lerp camera position and direction
		_camera camPreparePos _position;
		_camera camPrepareTarget _target;
		_camera camPrepareDir _direction;
		_camera camPrepareFov (CAMERA_FOV_DEFAULT * safeZoneH - _fovOffset);
		_camera camPrepareFocus [CAMERA_DISTANCE, 1];
		_camera camCommitPrepared CAMERA_TRANSITION;
		
		// PP
		["ppPlay"] call BIS_fnc_focusOnObject;
		
		// Play focusing sound
		playSound CAMERA_TRANSITION_IN_SOUND;
		
		// Wait for transition to end
		waitUntil {
			camCommitted _camera;
		};
		
		// Set pitch and bank
		private ["_pitchBank", "_pitch", "_bank"];
		_pitchBank 	= _object call BIS_fnc_getPitchBank;
		_pitch 		= _pitchBank select 0;
		_bank		= _pitchBank select 1;
		[_camera, _pitch, _bank] call BIS_fnc_setPitchBank;
		
		// Reset flag
		missionNamespace setVariable [VARIABLE_CAMERA_CHANGING, nil];
		
		// Open interface
		switch (toLower _type) do {
			case (toLower "TimeTrial") : { ["uiOpen", [_object]] call BIS_fnc_timeTrial; };
			case (toLower "FiringRange") : { ["uiOpen", [_object]] call BIS_fnc_firingRange; };
		};
		
		// Wait until interface is closed
		waitUntil {
			!dialog;
		};
		
		// Replace texture
		_object setObjectTexture [0, _object getvariable VARIABLE_WHITEBOARD_TEXTURE];
		
		// Terminate
		["terminate"] call BIS_fnc_focusOnObject;
	};
	
	case (toLower "terminate") : {
		// Avoid terminating while camera is in transition
		if (!isNil { missionNamespace getVariable VARIABLE_CAMERA_CHANGING } && { missionNamespace getVariable VARIABLE_CAMERA_CHANGING }) exitWith {
			// Log
			"cannot terminate while camera is in transition" call BIS_fnc_error;
		};
		
		// The camera
		private ["_camera", "_cameraType"];
		_camera 	= missionNamespace getVariable VARIABLE_CAMERA;
		_cameraType	= missionNamespace getVariable VARIABLE_CAMERA_TYPE;
		
		// New camera transformation
		private ["_position", "_target", "_direction"];
		_position 	= missionNamespace getVariable VARIABLE_CAMERA_INITIAL_POSITION;
		_target		= missionNamespace getVariable VARIABLE_CAMERA_INITIAL_TARGET;
		_direction	= missionNamespace getVariable VARIABLE_CAMERA_INITIAL_DIRECTION;
		
		// Lerp camera position and direction
		_camera camPreparePos _position;
		_camera camPrepareTarget _target;
		_camera camPrepareDir _direction;
		_camera camPrepareFov CAMERA_FOV_DEFAULT;
		_camera camPrepareFocus [-1, -1];
		_camera camCommitPrepared CAMERA_TRANSITION;
		
		// PP
		["ppPlay"] call BIS_fnc_focusOnObject;
		
		// Play focusing sound
		playSound CAMERA_TRANSITION_OUT_SOUND;
		
		// Wait for transition to end
		waitUntil {
			camCommitted _camera;
		};
		
		// Switch back to player
		_camera cameraEffect ["Terminate", "BACK"];
		player switchCamera _cameraType;
		
		// Destroy camera
		camDestroy _camera;
		
		// Unhide men
		{
			_x hideObject false;
		} forEach (missionNamespace getVariable VARIABLE_MEN);
		
		// Reset variables
		missionNamespace setVariable [VARIABLE_CAMERA, nil];
		missionNamespace setVariable [VARIABLE_CAMERA_CHANGING, nil];
		missionNamespace setVariable [VARIABLE_CAMERA_TYPE, nil];
		missionNamespace setVariable [VARIABLE_CAMERA_INITIAL_POSITION, nil];
		missionNamespace setVariable [VARIABLE_CAMERA_INITIAL_TARGET, nil];
		missionNamespace setVariable [VARIABLE_CAMERA_INITIAL_DIRECTION, nil];
		missionNamespace setVariable [VARIABLE_MEN, nil];
	};
	
	case (toLower "ppPlay") : {
		// The pp effect
		private "_radialBlur";
		_radialBlur = ppEffectCreate ["RadialBlur", 100];
		_radialBlur ppEffectEnable true;
		_radialBlur ppEffectAdjust [CAMERA_TRANSITION_BLUR, CAMERA_TRANSITION_BLUR, 0.05, 0.05];
		_radialBlur ppEffectCommit 0;
		
		// Once the effect finishes transition we destroy it
		_radialBlur spawn {
			sleep CAMERA_TRANSITION;
			ppEffectDestroy _this;
		};
	};
	
	case default {
		["Invalid action: %1", _action] call BIS_fnc_log;
	};
};
