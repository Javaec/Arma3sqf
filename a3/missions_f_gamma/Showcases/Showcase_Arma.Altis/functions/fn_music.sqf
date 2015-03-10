//Parameters
private ["_music", "_startTime", "_restartTime", "_fadeTime", "_fadeVolume"];
_music		= [_this, 0, "", [""]] call BIS_fnc_param;
_startTime	= [_this, 1, 0, [0]] call BIS_fnc_param;
_restartTime	= [_this, 2, 0, [0]] call BIS_fnc_param;
_fadeTime	= [_this, 3, 5, [0]] call BIS_fnc_param;
_fadeVolume	= [_this, 4, 0.25, [0]] call BIS_fnc_param;

//Music given?
//If not, we exit here
if (_music == "") exitWith {
	//Fade music
	_fadeTime fadeMusic 0;
	
	//Remove event handler
	if (!isNil { missionnamespace getvariable "BIS_musicEvent" }) then {
		removeMusicEventHandler ["MusicStop", missionnamespace getvariable "BIS_musicEvent"];
	};
	
	//Reset properties
	missionNamespace setVariable ["BIS_restartTime", nil];
	missionnamespace setVariable ["BIS_musicEvent", nil];
	
	//Log
	"Music event handler has been removed, replay disabled" call BIS_fnc_log;
};

//Add event handler if not added yet
if (isNil { missionnamespace getvariable "BIS_musicEvent" }) then {
	//Music event handler
	private "_event";
	missionnamespace setvariable ["BIS_musicEvent", addMusicEventHandler ["MusicStop", {
		//Next music
		private ["_music", "_restartTime"];
		_music		= _this select 0;
		_restartTime	= missionNamespace getVariable ["BIS_restartTime", 0];
		
		//Play next music
		playMusic [_music, _restartTime];
		
		//Log
		["Music (%1) replaying and started at (%2)", _music, _restartTime] call BIS_fnc_logFormat;
	}]];
	
	//Log
	["Music event handler has been added, replay enabled - Music (%1), Restart Time (%2)", _music, _restartTime] call BIS_fnc_logFormat;
};

//Fade music
_fadeTime fadeMusic _fadeVolume;

//Start music
playMusic [_music, _startTime];

//Properties
missionNamespace setVariable ["BIS_restartTime", _restartTime];

//Return
true;
