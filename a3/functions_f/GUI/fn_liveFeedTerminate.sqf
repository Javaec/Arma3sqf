/*
	Author: Thomas Ryan
	
	Description:
	Terminate a live feed.
	
	Returns:
	True if successful, false if not.
*/

if (!(isNil "BIS_liveFeed")) then {
	// Transition
	[] spawn {
		scriptName "BIS_fnc_liveFeedTerminate: transition out";
		
		disableSerialization;
		
		waitUntil {!(isNull (uiNamespace getVariable "BIS_fnc_PIP_RscPIP"))};
		
		private ["_disp"];
		_disp = uiNamespace getVariable "BIS_fnc_PIP_RscPIP";
		
		// Display images
		for "_i" from 12 to 0 step - 1 do {
			private ["_ctrl"];
			_ctrl = _disp displayCtrl (2400 + _i);
			
			_ctrl ctrlSetPosition ctrlPosition (_disp displayCtrl 2300);
			_ctrl ctrlCommit 0;
			
			// 30 FPS
			uiSleep 0.03;
			
			_ctrl ctrlSetPosition [0,0,0,0];
			_ctrl ctrlCommit 0;
		};
		
		BIS_liveFeed cameraEffect ["TERMINATE", "BACK"];
		camDestroy BIS_liveFeed;
		
		sleep 1;
		
		// Terminate the feed
		["rendertarget0"] call BIS_fnc_PIP;
		BIS_liveFeed = nil;
	};
};