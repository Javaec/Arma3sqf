0 fadeSound 0;
titleCut ["", "BLACK FADED", 10e10];

[] spawn {
	waitUntil {time > 0};
	enableEnvironment false;
};

// Limit view distance
setViewDistance 500;

// Create upwards-facing camera
private ["_camera"];
_camera = "Camera" camCreate [10,10,10];
_camera cameraEffect ["INTERNAL", "BACK"];

_camera camPreparePos [10,10,10];
_camera camPrepareTarget [10,10,1000];
_camera camPrepareFOV 0.7;
_camera camCommitPrepared 0;

sleep 1;

private ["_video"];
_video = ["A3\Missions_F_EPA\video\A_in_intro.ogv"] spawn BIS_fnc_playVideo;

if (language != "English") then {
	// Display subtitles
	private ["_subtitles"];
	_subtitles = [] spawn {
		disableSerialization;
		scriptName "initIntro.sqf: _subtitles";
		
		private ["_layer"];
		_layer = "BIS_A_in_intro_subtitles" call BIS_fnc_rscLayer;
		_layer cutRsc ["RscDynamicText", "PLAIN"];
		
		// Set up text control
		private ["_display", "_ctrl"];
		_display = uiNamespace getVariable "BIS_dynamicText";
		_ctrl = _display displayCtrl 9999;
		
		_ctrl ctrlSetFade 1;
		
		_ctrl ctrlSetPosition [
			0 * safeZoneW + safeZoneX,
			0.1 * safeZoneH + safeZoneY,
			safeZoneW,
			safeZoneH
		];
		
		_ctrl ctrlCommit 0;
		
		private ["_showSubtitle"];
		_showSubtitle = {
			disableSerialization;
			
			private ["_ctrl", "_subtitle", "_duration"];
			_ctrl = _this select 0;
			_subtitle = _this select 1;
			_duration = _this select 2;
			
			scriptName format ["initIntro.sqf: _showSubtitle - [%1, %2, %3]", _ctrl, _subtitle, _duration];
			
			// Localize, compose and parse the subtitle
			private ["_localized", "_composed", "_parsed"];
			_localized = _subtitle call BIS_fnc_localize;
			_composed = "<t size = '0.5'>" + _localized + "</t>";
			_parsed = parseText _composed;
			
			// Show subtitle
			_ctrl ctrlSetStructuredText _parsed;
			_ctrl ctrlSetFade 0;
			_ctrl ctrlCommit 0.1;
			
			sleep _duration;
			
			// Fade subtitle
			_ctrl ctrlSetFade 1;
			_ctrl ctrlCommit 0.1;
			
			waitUntil {ctrlCommitted _ctrl};
		};
		
		sleep 5.83;
		
		// Although five years have passed since bloody civil war was brought to an end ...
		[_ctrl, "STR_A3_EPA_Campaign_Intro_01", 4] spawn _showSubtitle;
		sleep 4.17;
		
		// ... thousands of families remain displaced, refugees scattered across countries around the Mediterranean ...
		[_ctrl, "STR_A3_EPA_Campaign_Intro_02", 3] spawn _showSubtitle;
		sleep 3.83;
		
		// ... The FIA are becoming increasingly desperate ...
		[_ctrl, "STR_A3_EPA_Campaign_Intro_03", 3.17] spawn _showSubtitle;
		sleep 4;
		
		// ... with the US-led peacekeeping deployment coming to an end of its mandate ...
		[_ctrl, "STR_A3_EPA_Campaign_Intro_04", 3.17] spawn _showSubtitle;
		sleep 4.17;
		
		// As millions of dollars of military equipment is decommissioned, opinion is split as to the wisdom of the drawdown.
		[_ctrl, "STR_A3_EPA_Campaign_Intro_05", 6] spawn _showSubtitle;
		sleep 6.83;
		
		// In light of CSAT forces stepping up joint military exercises in the Pacific ...
		[_ctrl, "STR_A3_EPA_Campaign_Intro_06", 2.17] spawn _showSubtitle;
		sleep 3;
		
		// ... the US is keen to re-orient its conventional forces.
		[_ctrl, "STR_A3_EPA_Campaign_Intro_07", 3] spawn _showSubtitle;
		sleep 3.17;
		
		// ... the Mediterranean basin representing a strategic fault-line between crumbling European influence ...
		[_ctrl, "STR_A3_EPA_Campaign_Intro_08", 4] spawn _showSubtitle;
		sleep 4.83;
		
		// ... the streets of Paris and Rome were ablaze last night ...
		[_ctrl, "STR_A3_EPA_Campaign_Intro_09", 3] spawn _showSubtitle;
		sleep 3.17;
		
		// ... some argue that the withdrawal could not come at a worse time.
		[_ctrl, "STR_A3_EPA_Campaign_Intro_10", 2.83] spawn _showSubtitle;
		sleep 3;
		
		// ... as AAF forces begin to consolidate their position with the backing of Canton Protocol forces equipment ...
		[_ctrl, "STR_A3_EPA_Campaign_Intro_11", 5] spawn _showSubtitle;
		sleep 5.83;
		
		// ... again was used as a platform to push the legitimacy ...
		[_ctrl, "STR_A3_EPA_Campaign_Intro_12", 3] spawn _showSubtitle;
		sleep 3.17;
		
		// ... parliament was recalled for an urgent debate and vote over the redeployment of UK peacekeeping forces ...
		[_ctrl, "STR_A3_EPA_Campaign_Intro_13", 5.83] spawn _showSubtitle;
		sleep 6;
		
		// Prime Minister Ramsden said he would respect the defeat of his government's motion ...
		[_ctrl, "STR_A3_EPA_Campaign_Intro_14", 3] spawn _showSubtitle;
		sleep 3.83;
		
		// ... which, effectively, ruled out the possibility of any extension to the NATO deployment in the former sovereign territory.
		private ["_finalSub"];
		_finalSub = [_ctrl, "STR_A3_EPA_Campaign_Intro_15", 6.17] spawn _showSubtitle;
		
		waitUntil {scriptDone _finalSub};
	};
	
	waitUntil {scriptDone _subtitles};
};

waitUntil {scriptDone _video};

sleep 1;

_camera cameraEffect ["TERMINATE", "BACK"];
camDestroy _camera;

// Terminate intro
endMission "END1";