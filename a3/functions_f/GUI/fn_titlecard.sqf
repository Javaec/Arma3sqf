/*
	Author: Thomas Ryan
	
	Description:
	Display a mission-specific titlecard before the mission begins.
	
	Parameters:
		0: STRING - Path to video file
		1 (Optional): Subtitle visible when language is not English
*/

enableSaving [false, false];

private ["_video","_subtitle"];
_video = [_this, 0, "", [""]] call BIS_fnc_param;
_subtitle = [_this, 1, "", [""]] call BIS_fnc_param;
if (islocalized _subtitle) then {_subtitle = localize _subtitle;};

0 fadeSound 0;
titleCut ["", "BLACK FADED", 10e10];

[] spawn {
	scriptName "BIS_fnc_titlecard: environment and radio control";
	
	waitUntil {time > 0};
	
	// Disable environment
	enableEnvironment false;
	
	// Disable radio
	clearRadio;
	enableRadio false;
	
	waitUntil {!(isNil "BIS_fnc_titlecard_finished")};
	
	// Enable environment and radio
	enableEnvironment true;
	enableRadio true;
};

[_video,_subtitle] spawn {
	scriptName "BIS_fnc_titlecard: eventhandler control";
	
	private ["_video","_subtitle"];
	_video = _this select 0;
	_subtitle = _this select 1;
	
	disableSerialization;
	
	waitUntil {!(isNull ([] call BIS_fnc_displayMission))};
	
	// Compile key
	private ["_key"];
	_key = format ["BIS_%1.%2_titlecard", missionName, worldName];
	
	// Remove eventhandler if it exists (only happens when restarting)
	if (!(isNil {uiNamespace getVariable "BIS_fnc_titlecard_spaceEH"})) then {
		([] call BIS_fnc_displayMission) displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "BIS_fnc_titlecard_spaceEH"];
		uiNamespace setVariable ["BIS_fnc_titlecard_spaceEH", nil];
	};
	
	// Add skipping eventhandler
	private ["_spaceEH"];
	_spaceEH = ([] call BIS_fnc_displayMission) displayAddEventHandler [
		"KeyDown",
		format [
			"
				if (_this select 1 == 57) then {
					([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown', uiNamespace getVariable 'BIS_fnc_titlecard_spaceEH'];
					uiNamepsace setVariable ['BIS_fnc_titlecard_spaceEH', nil];
					
					playSound ['click', true];
					
					activateKey '%1';
					BIS_fnc_titlecard_finished = true;
				};
				
				if (_this select 1 != 1) then {true};
			",
			_key
		]
	];
	
	uiNamespace setVariable ["BIS_fnc_titlecard_spaceEH", _spaceEH];
	
	// Spawn video playing and instructions separately to allow for no delay in skipping
	[_video, _subtitle, _key] spawn {
		scriptName "BIS_fnc_titlecard: video control";
		
		private ["_video", "_subtitle", "_key"];
		_video = _this select 0;
		_subtitle = _this select 1;
		_key = _this select 2;
		
		sleep 1;
		
		if (isNil "BIS_fnc_titlecard_finished") then {
			// Display titlecard video
			private ["_titlecard"];
			_titlecard = [_video, nil, nil, "BIS_fnc_titlecard_finished"] spawn BIS_fnc_playVideo;

			//--- Show localized subtitles
			if (language != "english") then {
				titletext [_subtitle,"plain down",1.5];
			};

			_key spawn {
				scriptName "BIS_fnc_titlecard: instructions control";
				
				private ["_key"];
				_key = _this;
				
				disableSerialization;
				
				sleep 2;
				
				if (!(isKeyActive _key) && isNil "BIS_fnc_titlecard_finished") then {
					// Display instructions
					private ["_layerTitlecard"];
					_layerTitlecard = "BIS_layerTitlecard" call BIS_fnc_rscLayer;
					_layerTitlecard cutRsc ["RscDynamicText", "PLAIN"];
					
					private ["_dispText", "_ctrlText"];
					_dispText = uiNamespace getVariable "BIS_dynamicText";
					_ctrlText = _dispText displayCtrl 9999;
					
					_ctrlText ctrlSetPosition [
						0 * safeZoneW + safeZoneX,
						0.8 * safeZoneH + safeZoneY,
						safeZoneW,
						safeZoneH
					];
					
					// Determine appropriate key highlight
					private ["_keyColor"];
					_keyColor = format [
						"<t color = '%1'>",
						(["GUI", "BCG_RGB"] call BIS_fnc_displayColorGet) call BIS_fnc_colorRGBtoHTML
					];
					
					private ["_skipText"];
					_skipText = format [
						localize "STR_A3_BIS_fnc_titlecard_pressSpace",
						"<t size = '0.75'>",
						_keyColor,
						"</t>",
						"</t>"
					];
					
					_ctrlText ctrlSetStructuredText parseText _skipText;
					_ctrlText ctrlSetFade 1;
					_ctrlText ctrlCommit 0;
					
					_ctrlText ctrlSetFade 0;
					_ctrlText ctrlCommit 1;
					
					// Wait for video to finish
					waitUntil {!(isNil "BIS_fnc_titlecard_finished")};
					
					// Remove instructions
					_ctrlText ctrlSetFade 1;
					_ctrlText ctrlCommit 0;
				};
			};
				
			waitUntil {scriptDone _titlecard || !(isNil "BIS_fnc_titlecard_finished")};
			
			// Ensure it's registered as finished
			BIS_fnc_titlecard_finished = true;

			//--- Remove subtitles
			titletext ["","plain"];
		};
	};
	
	waitUntil {!(isNil "BIS_fnc_titlecard_finished")};
	
	// Remove the event handler if it still exists
	if (!(isNil {uiNamespace getVariable "BIS_fnc_titlecard_spaceEH"})) then {
		([] call BIS_fnc_displayMission) displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "BIS_fnc_titlecard_spaceEH"];
		uiNamespace setVariable ["BIS_fnc_titlecard_spaceEH", nil];
	};
	
	enableSaving [true, true];
	
	3 fadeSound 1;
	titleCut ["", "BLACK IN", 3];
};

true