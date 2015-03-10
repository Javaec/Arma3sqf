/*
	Author: Thomas Ryan
	
	Description:
	Display a quotation video.
	
	Parameters:
		_this select 0: STRING - Path to quotation video file.
		_this select 1: STRING - String, localized or not, used for subtitles.
*/

BIS_fnc_quotations_playing = false;
BIS_fnc_quotations_sound = false;

// Disable saving, disable HUD and make the screen black
"BIS_fnc_quotations_disabledSave" call BIS_fnc_disableSaving;
showHUD false;
["BIS_fnc_quotations_blackScreen", false] call BIS_fnc_blackOut;

_this spawn {
	disableSerialization;
	scriptName "BIS_fnc_quotations";
	
	waitUntil {!(isNull ([] call BIS_fnc_displayMission))};
	
	if (!(isNil {uiNamespace getVariable "BIS_fnc_quotations_skipEH"})) then {
		([] call BIS_fnc_displayMission) displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "BIS_fnc_quotations_skipEH"];
		uiNamespace setVariable ["BIS_fnc_quotations_skipEH", nil];
	};
	
	// Allow the quotation to be skipped
	private ["_skipEH"];
	_skipEH = ([] call BIS_fnc_displayMission) displayAddEventHandler [
		"KeyDown",
		"
			if (_this select 1 == 57) then {
				([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown', uiNamespace getVariable 'BIS_fnc_quotations_skipEH'];
				uiNamespace setVariable ['BIS_fnc_quotations_skipEH', nil];
				
				playSound ['click', true];
				
				BIS_fnc_quotations_skip = true;
			};
			
			if (_this select 1 != 1) then {true};
		"
	];
	
	uiNamespace setVariable ["BIS_fnc_quotations_skipEH", _skipEH];
	
	if (isNil "BIS_fnc_quotations_skip") then {
		// Create camera
		private ["_camera"];
		_camera = "Camera" camCreate position vehicle player;
		_camera cameraEffect ["INTERNAL", "BACK"];
		
		// Set position
		private ["_pos"];
		_pos = [vehicle player, 1, direction vehicle player] call BIS_fnc_relPos;
		_pos set [2, 1];
		
		_camera camPreparePos _pos;
		
		// Set target
		private ["_target"];
		_target = [vehicle player, 50, direction vehicle player] call BIS_fnc_relPos;
		_target set [2, 1];
		
		_camera camPrepareTarget _target;
		_camera camCommitPrepared 0;
		
		_camera camPreload 3;
		
		// Wait for scene to preload
		waitUntil {camPreloaded _camera || !(isNil "BIS_fnc_quotations_skip")};
		
		// Destroy camera
		_camera cameraEffect ["TERMINATE", "BACK"];
		camDestroy _camera;
		
		[] spawn {
			scriptName "BIS_fnc_quotations: sound control";
			
			waitUntil {BIS_fnc_quotations_playing || !(isNil "BIS_fnc_quotations_skip")};
			
			if (isNil "BIS_fnc_quotations_skip") then {
				private ["_time"];
				_time = time + 2;
				
				waitUntil {time >= _time || !(isNil "BIS_fnc_quotations_skip")};
			};
			
			// Fade in the sound
			enableEnvironment true;
			7 fadeSound 1;
			BIS_fnc_quotations_sound = true;
		};
		
		if (isNil "BIS_fnc_quotations_skip") then {
			private "_DisableGameElements";
			_DisableGameElements = 
			{
				private ["_handler", "_displaynumber"];
				_displaynumber = [] call BIS_fnc_DisplayMission;
				
				// Remove eventhandler if it exists (only happens when restarting)
				if (!(isNil {uiNamespace getVariable "BIS_fnc_quotations_keyHandler"})) then {
					_displaynumber displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "BIS_fnc_quotations_keyHandler"];
					uiNamespace setVariable ["BIS_fnc_quotations_keyHandler", nil];
				};
				
				_handler = _displaynumber displayAddEventHandler 
				[	
					"KeyDown",
					"
						private ['_actions', '_nrofactions', '_returnvalue', '_actionKeys' ];
						_returnvalue = _false;
						_actions = [ 'showmap', 'TimeDec', 'TimeInc', 'Gear', 'Throw', 'Fire', 'ReloadMagazine', 'SwitchWeapon', 'Diary' ]; 
						
						_actionKeys = [];
						{
							_actionkeys = _actionkeys + actionKeys _x;
						} forEach _actions;
					
						if( (_this select 1) in _actionKeys ) then { _returnvalue = true };
						_returnvalue
					"
				];
				
				uiNamespace setVariable ["BIS_fnc_quotations_keyHandler", _handler];
			};
			
			private "_EnableGameElements";
			_EnableGameElements = 
			{
				private [ "_displaynumber" ];
				 _displaynumber = [] call BIS_fnc_DisplayMission;
				_displaynumber displayRemoveEventHandler [ "keydown", uiNamespace getVariable "BIS_fnc_quotations_keyHandler" ];
				uiNamespace setVariable ["BIS_fnc_quotations_keyHandler", nil];
			};
			
			// Disable actions and reset time
			call _DisableGameElements;
			setAccTime 1;
			
			private ["_video", "_string"];
			_video = [_this, 0, "", [""]] call BIS_fnc_param;
			_string = [_this, 1, "", [""]] call BIS_fnc_param;
			
			// Play quotation video
			private ["_quotation"];
			_quotation = [_video, nil, nil, "BIS_fnc_quotations_skip"] spawn BIS_fnc_playVideo;
			if (language != "English") then {titleText [_string call BIS_fnc_localize, "PLAIN DOWN"]};
			BIS_fnc_quotations_playing = true;
			
			waitUntil {scriptDone _quotation || !(isNil "BIS_fnc_quotations_skip")};
			
			// Enable actions
			call _EnableGameElements;
		};
		
		private ["_time"];
		_time = time + 0.5;
		
		waitUntil {time >= _time || !(isNil "BIS_fnc_quotations_skip")};
		
		// Remove skip eventhandler if necessary
		if (!(isNil {uiNamespace getVariable "BIS_fnc_quotations_skipEH"})) then {
			([] call BIS_fnc_displayMission) displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "BIS_fnc_quotations_skipEH"];
			uiNamespace setVariable ["BIS_fnc_quotations_skipEH", nil];
		};
		
		// Enable saving and HUD
		"BIS_fnc_quotations_disabledSave" call BIS_fnc_enableSaving;
		showHUD true;
		
		// Fade in
		"BIS_fnc_quotations_blackScreen" call BIS_fnc_blackIn;
		
		BIS_fnc_quotations_playing = false;
		
		// Remove subtitles if skipped
		if (!(isNil "BIS_fnc_quotations_skip")) then {
			titleText ["", "PLAIN DOWN"];
		};
	};
};