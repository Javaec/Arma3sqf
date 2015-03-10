// Defines
#define VARIABLE_INITIALIZED 	"BIS_pipMonitor_initialized"
#define VARIABLE_CAMERA 	"BIS_pipMonitor_camera"

//Parameters
private ["_action", "_parameters"];
_action		= [_this, 0, "", [""]] call BIS_fnc_param;
_parameters	= [_this, 1, []] call BIS_fnc_param;

switch (toLower _action) do {
	case (toLower "initialize") : {
		private ["_object", "_selectionIndex", "_cameraPosition", "_cameraTarget", "_cameraFov", "_cameraRenderTarget"];
		_object 		= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_selectionIndex 	= [_parameters, 1, -1, [0]] call BIS_fnc_param;
		_cameraPosition 	= [_parameters, 2, [0,0,0], [[]]] call BIS_fnc_param;
		_cameraTarget 		= [_parameters, 3, [0,0,0], [[], objNull]] call BIS_fnc_param;
		_cameraFov 		= [_parameters, 4, 0.7, [0]] call BIS_fnc_param;
		_cameraRenderTarget	= [_parameters, 5, "rendertarget0", [""]] call BIS_fnc_param;
		
		// Do not initialize in dedicated server
		if (isDedicated) exitWith {
			// Log
			"Cannot be executed on a dedicated server" call BIS_fnc_error;
		};
		
		// Make sure pip is enabled
		if (!isPipEnabled) exitWith {
			// Log
			"PIP is disabled in video options" call BIS_fnc_log;
		};
		
		// Validate initialization, do not allow multiple executions
		if (["isInitialized", [_object]] call BIS_fnc_pipMonitor) then {
			// Terminate current instance
			["terminate", [_object]] call BIS_fnc_pipMonitor;
		};
		
		// Flag object as initialized
		_object setVariable [VARIABLE_INITIALIZED, true];
		
		// Create the camera
		["createCamera", [_object, _cameraPosition, _cameraTarget, _cameraFov, _cameraRenderTarget]] call BIS_fnc_pipMonitor;
		
		// Object texture assumes pip
		["setObjectTexture", [_object, _selectionIndex, true]] call BIS_fnc_pipMonitor;
	};
	
	case (toLower "terminate") : {
		private ["_object"];
		_object = [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		// Make sure object was actually initialized
		if !(["isInitialized", [_object]] call BIS_fnc_pipMonitor) exitWith {
			// Log
			["Object (%1) not initialized, no need to terminate", _object] call BIS_fnc_error;
		};
		
		// Object default texture
		["setObjectTexture", [_object, _selectionIndex, false]] call BIS_fnc_pipMonitor;
		
		// Destroy camera
		["destroyCamera", [_object]] call BIS_fnc_pipMonitor;
		
		// Reset variables
		_object setVariable [VARIABLE_INITIALIZED, nil];
		_object setVariable [VARIABLE_CAMERA, nil];
	};
	
	case (toLower "setObjectTexture") : {
		private ["_object", "_selectionIndex", "_isRenderToTexture"];
		_object 		= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_selectionIndex		= [_parameters, 1, 0, [0]] call BIS_fnc_param;
		_isRenderToTexture	= [_parameters, 2, true, [true]] call BIS_fnc_param;
		
		// Set the object texture
		if (_isRenderToTexture) then {
			_object setObjectTexture [_selectionIndex, format ["#(argb,256,256,1)r2t(%1,1.0)", _cameraRenderTarget]];
		} else {
			_object setObjectTexture [_selectionIndex, ""];
		};
	};
	
	case (toLower "isInitialized") : {
		private ["_object"];
		_object = [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		// Return
		!isNil { _object getVariable VARIABLE_INITIALIZED };
	};
	
	case (toLower "isCameraValid") : {
		private ["_object"];
		_object = [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		if (!isNil { _object getVariable VARIABLE_CAMERA } && { !isNull (_object getVariable VARIABLE_CAMERA) }) then {
			true;
		} else {
			false;
		};
	};
	
	case (toLower "isCameraInTransition") : {
		private ["_object"];
		_object = [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		// Return
		!camCommitted (_object getVariable VARIABLE_CAMERA);
	};
	
	case (toLower "createCamera") : {
		private ["_object", "_cameraPosition", "_cameraTarget", "_cameraFov", "_cameraRenderTarget"];
		_object			= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_cameraPosition 	= [_parameters, 1, [0,0,0], [[]]] call BIS_fnc_param;
		_cameraTarget		= [_parameters, 2, [0,0,0], [[], objNull]] call BIS_fnc_param;
		_cameraFov		= [_parameters, 3, 0.7, [0]] call BIS_fnc_param;
		_cameraRenderTarget	= [_parameters, 4, "rendertarget0", [""]] call BIS_fnc_param;
		
		// The camera
		private "_camera";
		_camera = "camera" camCreate _cameraPosition;
		
		// Prepare camera
		_camera camSetPos _cameraPosition;
		_camera camSetTarget _cameraTarget;
		_camera camSetFov _cameraFov;
		
		// Camera effect
		_camera cameraEffect ["internal", "back", _cameraRenderTarget];
		
		// Commit
		_camera camCommit 0;
		
		// Return
		_object setVariable [VARIABLE_CAMERA, _camera];
	};
	
	case (toLower "destroyCamera") : {
		private ["_object"];
		_object = [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		// Make sure camera is valid
		if (["isCameraValid", [_object]] call BIS_fnc_pipMonitor) then {
			// The camera
			private "_camera";
			_camera = ["getCamera", [_object]] call BIS_fnc_pipMonitor;
			
			// Camera effect
			_camera cameraEffect ["terminate", "back", ""];
			
			// Destroy camera
			camDestroy _camera;
		};
	};
	
	case (toLower "getCamera") : {
		private ["_object"];
		_object = [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		// Make sure camera is valid
		if (["isCameraValid", [_object]] call BIS_fnc_pipMonitor) then {
			// Return the camera
			_object getVariable VARIABLE_CAMERA;
		} else {
			// Return
			objNull;
		};
	};
	
	case (toLower "setCamera") : {
		private ["_object", "_camera"];
		_object = [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_camera = [_parameters, 1, objNull, [objNull]] call BIS_fnc_param;
		
		// Replace camera
		_object setVariable [VARIABLE_CAMERA, _camera];
	};
};
