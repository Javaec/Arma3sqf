/*
	Author: Nelson Duarte

	Description:
	Plays music, depending on the player groups status

	Parameter(s):
	_this select 0:	STRING 	- The sub-function to call
	_this select 1:	ARRAY 	- Parameters to be sent to sub-function
	
	Returns:
	Dependent on sub-function
*/

#define DEFAULT_VOLUME 		0.2
#define DEFAULT_TRANSITION	5
#define DEFAULT_RADIUS		500
#define DEFAULT_EXECUTIONRATE	5
#define DEFAULT_NOREPEAT	true

//Parameters
private ["_function", "_parameters"];
_function	= [_this, 0, "initialize", [""]] call BIS_fnc_param;
_parameters	= [_this, 1, [], [[]]] call BIS_fnc_param;

//Type
switch (_function) do {
	/**
	 * Initialize jukebox
	 *
	 * _this select 0: ARRAY 	- List of stealth music names
	 * _this select 1: ARRAY 	- List of combat music names
	 * _this select 2: ARRAY 	- List of safe music names
	 * _this select 3: NUMBER 	- The music volume
	 * _this select 4: NUMBER 	- The transition time (fade-in/out)
	 * _this select 5: NUMBER	- The battlefield radius
	 * _this select 6: NUMBER	- The execution rate in seconds, the delay between each battlefield evaluation
	 * _this select 7: BOOLEAN	- Whether music tracks can or not repeat, one after the other, when possible
	**/
	case "initialize" : {
		//Parameters
		private ["_musicStealth", "_musicCombat", "_musicSafe", "_volume", "_transition"];
		_musicStealth	= [_parameters, 0, ["readContainerFromConfig", ["stealth"]] call BIS_fnc_jukebox, [[]]] call BIS_fnc_param;
		_musicCombat	= [_parameters, 1, ["readContainerFromConfig", ["combat"]] call BIS_fnc_jukebox, [[]]] call BIS_fnc_param;
		_musicSafe	= [_parameters, 2, ["readContainerFromConfig", ["safe"]] call BIS_fnc_jukebox, [[]]] call BIS_fnc_param;
		_volume		= [_parameters, 3, DEFAULT_VOLUME, [0]] call BIS_fnc_param;
		_transition	= [_parameters, 4, DEFAULT_TRANSITION, [0]] call BIS_fnc_param;
		_radius		= [_parameters, 5, DEFAULT_RADIUS, [0]] call BIS_fnc_param;
		_executionRate	= [_parameters, 6, DEFAULT_EXECUTIONRATE, [0]] call BIS_fnc_param;
		_noRepeat	= [_parameters, 7, DEFAULT_NOREPEAT, [true]] call BIS_fnc_param;
		
		//If jukebox is already initialized, we re-initialize it
		if (["isInitialized"] call BIS_fnc_jukeBox) then {
			//Terminate jukebox
			["terminate"] call BIS_fnc_jukeBox;
			
			//Log
			"Re-initializing jukebox" call BIS_fnc_log;
		};
		
		//On each frame
		private "_onEachFrame";
		_onEachFrame = addMissionEventHandler ["Draw3D", {
			//Call on each frame
			["onEachFrame"] call BIS_fnc_jukeBox;
		}];
		
		//Loaded
		private "_loaded";
		_loaded = addMissionEventHandler ["Loaded", {
			//Music
			private "_music";
			_music = ["selectMusic"] call BIS_fnc_jukeBox;
			
			//Play
			["playMusic", [_music]] call BIS_fnc_jukeBox;
			
			//Log
			["[BIS_fnc_jukebox] Mission loaded, playing music: %1", _music] call BIS_fnc_logFormat;
		}];
		
		//Music started
		private "_musicStart";
		_musicStart = addMusicEventHandler ["MusicStart", {
			//Music
			private "_music";
			_music = [_this, 0, "", [""]] call BIS_fnc_param;
			
			//The current music being played
			missionNameSpace setVariable ["BIS_jukeBox_music", _music];
			
			//Log
			["[BIS_fnc_jukebox] Music started: %1", _music] call BIS_fnc_logFormat;
		}];
		
		//Music stopped
		private "_musicStop";
		_musicStop = addMusicEventHandler ["MusicStop", {
			//Music
			private "_music";
			_music = ["selectMusic"] call BIS_fnc_jukeBox;
			
			//Play
			["playMusic", [_music]] call BIS_fnc_jukeBox;
			
			//Log
			["[BIS_fnc_jukebox] Music stopped: %1", _music] call BIS_fnc_logFormat;
		}];
		
		//Store initialization flag
		missionNameSpace setVariable ["BIS_jukeBox_initialized", true];
		
		//Store music containers
		missionNameSpace setVariable ["BIS_jukeBox_musicStealth", _musicStealth];
		missionNameSpace setVariable ["BIS_jukeBox_musicCombat", _musicCombat];
		missionNameSpace setVariable ["BIS_jukeBox_musicSafe", _musicSafe];
		
		//Store misc properties
		missionNameSpace setVariable ["BIS_jukeBox_volume", _volume];
		missionNameSpace setVariable ["BIS_jukeBox_transition", _transition];
		missionNameSpace setVariable ["BIS_jukeBox_radius", _radius];
		missionNameSpace setVariable ["BIS_jukeBox_executionRate", _executionRate];
		missionNameSpace setVariable ["BIS_jukeBox_noRepeat", _noRepeat];
		
		//Store event handlers
		missionNameSpace setVariable ["BIS_jukeBox_onEachFrame", _onEachFrame];
		missionNameSpace setVariable ["BIS_jukeBox_loaded", _loaded];
		missionNameSpace setVariable ["BIS_jukeBox_musicStart", _musicStart];
		missionNameSpace setVariable ["BIS_jukeBox_musicStop", _musicStop];
		
		//Store the known status
		missionNameSpace setVariable ["BIS_jukeBox_status", ["status"] call BIS_fnc_jukeBox];
		
		//Music changing flag
		missionNameSpace setVariable ["BIS_jukeBox_musicChanging", false];
		
		//The music being played
		missionNameSpace setVariable ["BIS_jukeBox_music", ["selectMusic"] call BIS_fnc_jukeBox];
		
		//The starting music
		["playMusic", [missionNameSpace getVariable ["BIS_jukeBox_music", ""]]] call BIS_fnc_jukeBox;
		
		//Log
		["Jukebox started with music: %1", missionNameSpace getVariable "BIS_jukeBox_music"] call BIS_fnc_logFormat;
		"JukeBox initialized" call BIS_fnc_log;
	};
	
	/**
	 * Terminate function
	**/
	case "terminate" : {
		//Remove event handlers
		removeMissionEventHandler ["Draw3D", missionNameSpace getVariable "BIS_jukeBox_onEachFrame"];
		removeMissionEventHandler ["Loaded", missionNameSpace getVariable "BIS_jukeBox_loaded"];
		removeMusicEventHandler ["MusicStart", missionNameSpace getVariable "BIS_jukeBox_musicStart"];
		removeMusicEventHandler ["MusicStop", missionNameSpace getVariable "BIS_jukeBox_musicStop"];
		
		//Reset variables
		{
			missionNameSpace setVariable [_x, nil];
		} forEach [
			"BIS_jukeBox_initialized",
			"BIS_jukeBox_onEachFrame",
			"BIS_jukeBox_loaded",
			"BIS_jukeBox_musicStart",
			"BIS_jukeBox_musicStop",
			"BIS_jukeBox_status",
			"BIS_jukeBox_musicStealth",
			"BIS_jukeBox_musicCombat",
			"BIS_jukeBox_musicSafe",
			"BIS_jukeBox_volume",
			"BIS_jukeBox_transition",
			"BIS_jukeBox_radius",
			"BIS_jukeBox_executionRate",
			"BIS_jukeBox_noRepeat",
			"BIS_jukeBox_forceBehaviour",
			"BIS_jukeBox_musicChanging",
			"BIS_jukeBox_music"
		];
		
		//Log
		"JukeBox terminated" call BIS_fnc_log;
	};
	
	case "readContainerFromConfig" : {
		//Parameters
		private ["_themeWanted"];
		_themeWanted = [_parameters, 0, "", [""]] call BIS_fnc_param;
		
		//The valid music
		//We only use music that has 'theme' defined, and is a valid theme
		private "_container";
		_container = [];
		
		//Loop all music tracks
		//Store valid music in new container
		{
			//The track
			_track = _x;
			
			//Make sure it is class
			if (isClass _track) then {
				//The class name and theme
				private ["_class", "_theme"];
				_class = configName _track;
				_theme = getText (configFile >> "CfgMusic" >> _class >> "theme");
				
				//Theme defined?
				//If so, add to correct container
				if (_theme == _themeWanted) then {
					_container set [count _container, _class];
				};
			};
		} forEach ((configFile >> "CfgMusic") call BIS_fnc_returnChildren);
		
		//Return
		_container;
	};
	
	/**
	 * Check whether Jukebox has been initialized already
	**/
	case "isInitialized" : {
		if (!isNil { missionNameSpace getVariable "BIS_jukeBox_initialized" }) then {
			true;
		} else {
			false;
		};
	};
	
	/**
	 * Force jukebox behaviour
	 *
	 * _this select 0: STRING - The forced behaviour ('safe', 'stealth', 'combat')
	**/
	case "forceBehaviour" : {
		//Parameters
		private "_behaviour";
		_behaviour = [_parameters, 0, "", [""]] call BIS_fnc_param;
		
		//Validate behaviour
		if (_behaviour == "stealth" || _behaviour == "combat" || _behaviour == "safe") then {
			//Flag
			missionNameSpace setVariable ["BIS_jukeBox_forceBehaviour", _behaviour];
			
			//Log
			["Behaviour is now forced: %1", _behaviour] call BIS_fnc_logFormat;
		} else {
			//Destroy
			missionNameSpace setVariable ["BIS_jukeBox_forceBehaviour", nil];
			
			//Log
			"Behaviour is not forced anymore" call BIS_fnc_log;
		};
	};
	
	/**
	 * Return current status
	 * 
	 * STRING: 'safe', 'stealth', 'combat', or 'error'
	**/
	case "status" : {
		private "_status";
		_status = if (!isNil { missionNameSpace getVariable "BIS_jukeBox_forceBehaviour" }) then {
			missionNameSpace getVariable "BIS_jukeBox_forceBehaviour";
		} else {
			switch (true) do {
				case (["isStealth"] call BIS_fnc_jukeBox) : { "stealth"; };
				case (["isCombat"] call BIS_fnc_jukeBox) : { "combat"; };
				case (["isSafe"] call BIS_fnc_jukeBox) : { "safe"; };
				case DEFAULT { "error"; };
			};
		};
		
		//Return
		_status;
	};
	
	/**
	 * 
	**/
	case "randomMusic" : {
		//Parameters
		private ["_container"];
		_container = [_parameters, 0, [], [[]]] call BIS_fnc_param;
		
		//We have a current music set up?
		private "_musicCurrent";
		_musicCurrent = missionNameSpace getVariable ["BIS_jukebox_music", ""];
		
		//Should we repeat tracks?
		private "_noRepeat";
		_noRepeat = missionNameSpace getVariable ["BIS_jukebox_noRepeat", DEFAULT_NOREPEAT];
		
		//New music
		private "_musicNew";
		_musicNew = "";
		
		//Container has items?
		if (count _container > 1) then {
			//Remove last music from list, in case we do not want to repeat
			if (_noRepeat && { _musicCurrent in _container }) then {
				_container = _container - [_musicCurrent];
			};
			
			//Select new music
			_musicNew = _container call BIS_fnc_selectRandom;
		} else {
			if (count _container > 0) then {
				//Select the only music available
				_musicNew = _container select 0;
			};
		};
		
		//Return
		_musicNew;
	};
	
	/**
	 * Return new music to play, depending on current status
	 * 
	 * STRING: New music class name, may be empty
	**/
	case "selectMusic" : {
		//Containers
		private ["_musicStealth", "_musicCombat", "_musicSafe"];
		_musicStealth	= missionNameSpace getVariable ["BIS_jukebox_musicStealth", []];
		_musicCombat	= missionNameSpace getVariable ["BIS_jukebox_musicCombat", []];
		_musicSafe	= missionNameSpace getVariable ["BIS_jukebox_musicSafe", []];
		
		//The current status
		private "_status";
		_status = ["status"] call BIS_fnc_jukeBox;
		
		//The new music container
		private "_musicNew";
		_musicNew = switch (_status) do {
			case "stealth" : { ["randomMusic", [_musicStealth]] call BIS_fnc_jukebox; };
			case "combat" : { ["randomMusic", [_musicCombat]] call BIS_fnc_jukebox; };
			case "safe" : { ["randomMusic", [_musicSafe]] call BIS_fnc_jukebox; };
			case DEFAULT { ""; };
		};
		
		//Log
		["Selecting music: %1", _musicNew] call BIS_fnc_logFormat;
		
		//Return
		_musicNew;
	};
	
	/**
	 * Play music
	 *
	 * _this select 0: NUMBER - The music volume
	**/
	case "playMusic" : {
		//Parameters
		private ["_music"];
		_music = [_parameters, 0, ["selectMusic"] call BIS_fnc_jukeBox, [""]] call BIS_fnc_param;
		
		//Properties
		private ["_volume", "_transition"];
		_volume		= missionNameSpace getVariable ["BIS_jukeBox_volume", DEFAULT_VOLUME];
		_transition	= missionNameSpace getVariable ["BIS_jukeBox_transition", DEFAULT_TRANSITION];
		
		//Make sure music is valid
		if (_music != "") then {
			//Music changing flag
			missionNameSpace setVariable ["BIS_jukeBox_musicChanging", true];
			
			//Fade out volume
			_transition fadeMusic 0;
			
			//New thread
			private "_fade";
			_fade = [_music, _transition, _volume] spawn {
				scriptName "Jukebox: Fade thread";
				
				//Parameters
				private ["_music", "_transition", "_volume"];
				_music		= [_this, 0, "", [""]] call BIS_fnc_param;
				_transition	= [_this, 1, DEFAULT_TRANSITION, [0]] call BIS_fnc_param;
				_volume		= [_this, 2, DEFAULT_VOLUME, [0]] call BIS_fnc_param;
				
				//Wait for volume fade
				sleep _transition;
				
				//Fade volume up
				_transition fadeMusic _volume;
				
				//Play new music
				playMusic _music;
				
				//The minimum time a track needs to play and not be overridden by a change in behaviour
				//By default is the double of the transition time
				sleep (_transition * 2);
				
				//Music changing flag
				missionNameSpace setVariable ["BIS_jukeBox_musicChanging", false];
				
				//Log
				"[BIS_fnc_jukebox] Changing music done" call BIS_fnc_log;
			};
			
			//Log
			["Changing music: %1", _music] call BIS_fnc_logFormat;
		} else {
			//Log
			"Unable to change music, given string is empty, this might be because of an empty behaviour music container" call BIS_fnc_log;
		};
	};
	
	/**
	 * Returns number of enemies in proximity
	 *
	 * _this select 0: NUMBER - The battlefield bubble size
	**/
	case "nearEnemies" : {
		//Properties
		private "_radius";
		_radius = missionNameSpace getVariable ["BIS_jukeBox_radius", DEFAULT_RADIUS];
		
		//Enemies container
		private "_enemies";
		_enemies = [];
		
		{
			private "_enemy";
			_enemy = _x;
			
			if (side group player getFriend side group _enemy < 0.6 && { _x distance _enemy < _radius } count units group player > 0) then {
				_enemies set [count _enemies, _enemy];
			};
		} forEach allUnits;
		
		//Return
		_enemies;
	};
	
	/**
	 * Returns whether player has contact on nearby enemies
	**/
	case "hasContact" : {
		private "_hasContact";
		_hasContact = false;
		
		{
			private "_enemy";
			_enemy = _x;
			
			if ({ _x knowsAbout _enemy >= 2 } count units group player > 0) exitWith {
				_hasContact = true;
			};
		} forEach (["nearEnemies"] call BIS_fnc_jukeBox);
		
		//Return
		_hasContact;
	};
	
	/**
	 * Returns whether player is a contact to nearby enemies
	**/
	case "isContact" : {
		private "_isContact";
		_isContact = false;
		
		{
			private "_enemy";
			_enemy = _x;
			
			if ({ _enemy knowsAbout _x >= 2 } count units group player > 0) exitWith {
				_isContact = true;
			};
		} forEach (["nearEnemies"] call BIS_fnc_jukeBox);
		
		//Return
		_isContact;
	};
	
	/**
	 * Returns if we should play stealth music
	**/
	case "isStealth" : {
		private ["_isContact", "_hasContact"];
		_isContact 	= ["isContact"] call BIS_fnc_jukeBox;
		_hasContact	= ["hasContact"] call BIS_fnc_jukeBox;
		
		private "_isStealth";
		_isStealth = _hasContact && !_isContact;
		
		//Return
		_isStealth;
	};
	
	/**
	 * Returns if we should play combat music
	**/
	case "isCombat" : {
		private ["_isContact", "_hasContact"];
		_isContact = ["isContact"] call BIS_fnc_jukeBox;
		_hasContact = ["hasContact"] call BIS_fnc_jukeBox;
		
		private "_isCombat";
		_isCombat = _hasContact && _isContact;
		
		//Return
		_isCombat;
	};
	
	/**
	 * Returns if we should play safe music
	**/
	case "isSafe" : {
		private ["_isStealth", "_isCombat"];
		_isStealth 	= ["isStealth"] call BIS_fnc_jukeBox;
		_isCombat 	= ["isCombat"] call BIS_fnc_jukeBox;
		
		private "_isSafe";
		_isSafe = !_isStealth && !_isCombat;
		
		//Return
		_isSafe;
	};
	
	/**
	 * On each frame
	 * 
	 * _this select 0: NUMBER - The execution rate, in seconds
	**/
	case "onEachFrame" : {
		//Properties
		private "_executionRate";
		_executionRate = missionNameSpace getVariable ["BIS_jukeBox_executionRate", DEFAULT_EXECUTIONRATE];
		
		private "_lastCheckTime";
		_lastCheckTime = missionNameSpace getVariable ["BIS_jukeBox_loopTime", 0];
		
		private "_nextCheckTime";
		_nextCheckTime = _lastCheckTime + _executionRate;
		
		private "_timeNow";
		_timeNow = time;
		
		if (_timeNow >= _nextCheckTime) then {
			//Set new time
			missionNameSpace setVariable ["BIS_jukeBox_loopTime", _timeNow];
			
			//New status
			private "_statusNew";
			_statusNew = ["status"] call BIS_fnc_jukeBox;
			
			//Current status
			private "_statusOld";
			_statusOld = missionNameSpace getVariable ["BIS_jukeBox_status", "error"];
			
			//Whether there is already a music transition going on at this moment
			private "_musicChanging";
			_musicChanging = missionNameSpace getVariable ["BIS_jukeBox_musicChanging", false];
			
			//Different status
			//Make sure we are not transitioning a music already
			if (_statusNew != _statusOld && !_musicChanging) then {
				//Set new status
				missionNameSpace setVariable ["BIS_jukeBox_status", _statusNew];
				
				//Change track
				["playMusic"] call BIS_fnc_jukeBox;
				
				//Log
				["StatusNew: %1, StatusOld: %2", _statusNew, _statusOld] call BIS_fnc_logFormat;
			};
		};
	};
	
	/**
	 * Error
	**/
	case DEFAULT {
		//Error
		["Function (%1) is invalid", _function] call BIS_fnc_error;
	};
};
