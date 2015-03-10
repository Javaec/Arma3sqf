_mode = [_this,0,"",[""]] call bis_fnc_param;

//--- Exit when the same music mode is already in use
_previousMode = missionnamespace getvariable ["BIS_fnc_moduleMPTypeDefense_mode",""];
BIS_fnc_moduleMPTypeDefense_mode = _mode;

_musicStop = missionnamespace getvariable ["BIS_fnc_moduleMPTypeDefense_musicStop",-1];
if (_musicStop >= 0) then {removemusiceventhandler ["MusicStop",_musicStop];};

switch _mode do {
	case "WaveEnd": {
		if (_mode == _previousMode) exitwith {};
		playmusic ["Track07_ActionDark",109];
		_musicStop = {playmusic ["Track07_ActionDark",20];};
		0 fademusic 0;
		5 fademusic 0.05;
	};
	case "WaveStart": {
		playmusic ["Track02_SolarPower",48];
		0 fademusic 0;
		3 fademusic 0.2;
	};
	default {
		5 fademusic 0;
		sleep 5;
		playmusic "";
	};
};

if (typename _musicStop == typename {}) then {BIS_fnc_moduleMPTypeDefense_musicStop = addmusiceventhandler ["MusicStop",_musicStop];};