_mode = [_this,0,"",[""]] call bis_fnc_param;
_this = [_this,1,[]] call bis_fnc_param;

switch _mode do {
	case "sentence": {
		private ["_from","_params"];
		_from = _this select 0;
		_params = _this select 1;
		_from kbtell _params;
	};
	case "conversationStart": {

		//--- Disable radio protocol
		enablesentences false;

		//--- Decrease music and sound volume
		private ["_volumeCoef"];
		_volumeCoef = _this select 0;
		if (_volumeCoef >= 0) then {
			BIS_fnc_kbTellLocal_volumeSound = soundvolume;
			BIS_fnc_kbTellLocal_volumeMusic = musicvolume;
			if (_volumeCoef >= 0 && _volumeCoef < 1) then {
				0.5 fadesound (BIS_fnc_kbTellLocal_volumeSound * _volumeCoef);
				0.5 fademusic (BIS_fnc_kbTellLocal_volumeMusic * _volumeCoef);
			};
		};
	};
	case "conversationEnd": {
		//--- Enable radio protocol
		enablesentences true;

		//--- Return music and sound volume to original values
		private ["_volumeCoef"];
		_volumeCoef = _this select 0;
		if (_volumeCoef >= 0 && _volumeCoef < 1) then {
			0.5 fadesound (missionnamespace getvariable ["BIS_fnc_kbTellLocal_volumeSound",1]);
			0.5 fademusic (missionnamespace getvariable ["BIS_fnc_kbTellLocal_volumeMusic",1]);
		};
	};
	default {["'%1' is not a valid section"] call bis_fnc_error};
};