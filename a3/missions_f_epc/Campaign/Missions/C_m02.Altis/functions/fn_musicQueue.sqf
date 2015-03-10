//Parameters
private ["_action", "_parameters"];
_action 	= [_this, 0, "", [""]] call BIS_fnc_param;
_parameters	= [_this, 1, []] call BIS_fnc_param;

//Sub-functions
switch (toLower _action) do {
	case (toLower "initialize") : {
		//Do not allow multiple executions
		//If we detect such, we terminate and initialize again
		if (!isNil { missionNamespace getVariable "BIS_musicQueue_initialized" }) then {
			//Terminate
			["terminate"] call BIS_fnc_C_m02_musicQueue;
		};
		
		//Global variables
		missionNamespace setVariable ["BIS_musicQueue_initialized", true];
		missionNamespace setVariable ["BIS_musicQueue_queue", []];
		missionNamespace setVariable ["BIS_musicQueue_musicPlaying", ""];
		missionNamespace setVariable ["BIS_musicQueue_indexPlaying", 0];
		missionNamespace setVariable ["BIS_musicQueue_musicStartHandler", addMusicEventHandler ["MusicStart", { ["musicStart", _this] call BIS_fnc_C_m02_musicQueue; }]];
		missionNamespace setVariable ["BIS_musicQueue_musicStopHandler", addMusicEventHandler ["MusicStop", { ["musicStop", _this] call BIS_fnc_C_m02_musicQueue; }]];
		missionNamespace setVariable ["BIS_musicQueue_loadedHandler", addMissionEventHandler ["Loaded", { ["loaded", _this] call BIS_fnc_C_m02_musicQueue; }]];
		
		//Log
		"Initialized" call BIS_fnc_log;
	};
	
	case (toLower "terminate") : {
		//Remove event handlers
		removeMusicEventHandler ["MusicStart", missionNamespace getVariable "BIS_musicQueue_musicStartHandler"];
		removeMusicEventHandler ["MusicStop", missionNamespace getVariable "BIS_musicQueue_musicStopHandler"];
		removeMusicEventHandler ["Loaded", missionNamespace getVariable "BIS_musicQueue_loadedHandler"];
		
		//Reset variables
		missionNamespace setVariable ["BIS_musicQueue_initialized", nil];
		missionNamespace setVariable ["BIS_musicQueue_queue", nil];
		missionNamespace setVariable ["BIS_musicQueue_musicPlaying", nil];
		missionNamespace setVariable ["BIS_musicQueue_indexPlaying", nil];
		missionNamespace setVariable ["BIS_musicQueue_musicStartHandler", nil];
		missionNamespace setVariable ["BIS_musicQueue_musicStopHandler", nil];
		missionNamespace setVariable ["BIS_musicQueue_loadedHandler", nil];
		
		//Log
		"Terminated" call BIS_fnc_log;
	};
	
	case (toLower "add") : {
		//Parameters
		private ["_music", "_index"];
		_music 	= [_parameters, 0, "", [""]] call BIS_fnc_param;
		_index	= [_parameters, 1, -1, [-1]] call BIS_fnc_param;
		
		//The queue
		private "_queue";
		_queue = missionNamespace getVariable ["BIS_musicQueue_queue", []];
		
		//Add music to queue
		if (_index != -1) then {
			_queue set [_index, _music];
		} else {
			_queue set [count _queue, _music];
		};
		
		//Store in namespace
		missionNamespace setVariable ["BIS_musicQueue_queue", _queue];
		
		//If no music currently playing we start the new added one
		if (missionNamespace getVariable ["BIS_musicQueue_musicPlaying", ""] == "") then {
			//The new music
			private "_music";
			_music = _queue select (missionNamespace getVariable ["BIS_musicQueue_indexPlaying", 0]);
			
			//Play new music
			playMusic _music;
		};
		
		//Log
		["Music started (%1)", _music] call BIS_fnc_logFormat;
	};
	
	case (toLower "musicStart") : {
		//Parameters
		private ["_music", "_id"];
		_music 	= [_parameters, 0, "", [""]] call BIS_fnc_param;
		_id		= [_parameters, 1, -1, [-1]] call BIS_fnc_param;
		
		//Store
		missionNamespace setVariable ["BIS_musicQueue_musicPlaying", _music];
		missionNamespace setVariable ["BIS_musicQueue_indexPlaying", (missionNamespace getVariable ["BIS_musicQueue_indexPlaying", 0]) + 1];
		
		//Log
		["Music started (%1)", _music] call BIS_fnc_logFormat;
	};
	
	case (toLower "musicStop") : {
		//Parameters
		private ["_music", "_id"];
		_music 	= [_parameters, 0, "", [""]] call BIS_fnc_param;
		_id		= [_parameters, 1, -1, [-1]] call BIS_fnc_param;
		
		//The queue
		private "_queue";
		_queue = missionNamespace getVariable ["BIS_musicQueue_queue", []];
		
		//The current music index
		private "_index";
		_index = missionNamespace getVariable ["BIS_musicQueue_indexPlaying", 0];
		
		//We have more music to play?
		if (count _queue >= _index + 1) then {
			//The new music
			private "_music";
			_music = _queue select (_index + 1);
			
			//Play new music
			playMusic _music;
		} else {
			missionNamespace setVariable ["BIS_musicQueue_musicPlaying", ""];
		};
		
		//Log
		["Music stopped (%1)", _music] call BIS_fnc_logFormat;
	};
	
	case (toLower "loaded") : {
		//Parameters
		private ["_music", "_id"];
		_music 	= [_parameters, 0, "", [""]] call BIS_fnc_param;
		_id		= [_parameters, 1, -1, [-1]] call BIS_fnc_param;
		
		//The queue
		private "_queue";
		_queue = missionNamespace getVariable ["BIS_musicQueue_queue", []];
		
		//The current music index
		private "_index";
		_index = missionNamespace getVariable ["BIS_musicQueue_indexPlaying", 0];
		
		//Valid index?
		if (_index != -1 && count _queue >= _index + 1) then {
			//The new music
			private "_music";
			_music = _queue select _index;
			
			//Play new music
			playMusic _music;
		};
		
		//Log
		"Game loaded" call BIS_fnc_log;
	};
	
	case DEFAULT {
		//Error
		["Unknown action: %1", _action] call BIS_fnc_error;
	};
};
