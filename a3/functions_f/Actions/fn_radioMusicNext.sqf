/*
	Author: Joris-Jan van 't Land

	Description:
	Radio music next action / procedure - condition and statement

	Parameter(s):
	_this select 0: mode (Scalar)
		0: condition
		1: statement
		2: condition (automated sequence)
		3: statement (automated sequence)
	_this select 1: standard UserAction this parameters (Array)

	Returns:
	Bool
*/

private ["_mode", "_params", "_override", "_return"];
_mode = _this select 0;
_params = _this select 1;
_override = [_this, 2, false, [false]] call BIS_fnc_Param;
_return = true;

private ["_statement"];
_statement = 
{
	_params animate ["RadioATCSwitch_On", 1];
	_params animate ["RadioDisplay_ON", 1];
	_params say ("CockpitSwitch" + (str (ceil (random 5))));

	//Either start the music radio, or switch channel
	if (!(player getVariable ["HSim_radioMusic", false])) then 
	{
		private ["_handle"];
		_handle = _params spawn 
		{
			scriptName "BIS_fnc_radioMusicNext: radio music program";

			player setVariable ["HSim_radioMusic", true];
			
			//Initialize genres
			private ["_genres", "_cfgGenres"];
			_genres = [];
			_cfgGenres = configFile >> "CfgMusic" >> "Genres";
			for "_i" from 0 to ((count _cfgGenres) - 1) do 
			{
				private ["_genre"];
				_genre = _cfgGenres select _i;
				if (isClass _genre) then 
				{
					_genres set [count _genres, configName _genre];
				};
			};
			player setVariable ["HSim_radioMusicGenres", _genres];
			
			//Random everything
			[profileNamespace getVariable ["HSim_radioMusicChannel", ""]] call BIS_fnc_radioSetChannel;
			[] call BIS_fnc_radioSetPlaylist;
		
			private ["_manualNext"];
			_manualNext = false;
			while {(alive _this) && ((vehicle player) == _this) && (player getVariable ["HSim_radioMusic", false]) && (isBatteryOnRTD _this)} do 
			{
				private ["_channel", "_track"];
				_channel = player getVariable ["HSim_radioMusicChannel", ""];
			
				//Only select a new track if this is an automated switch to the next track
				if (!_manualNext) then {[] call BIS_fnc_radioSetTrack;};
				
				private ["_duration", "_delay", "_timeNow"];
				_track = player getVariable ["HSim_radioMusicTrack", ""];
				_duration = player getVariable ["HSim_radioMusicTrackDuration", 0];
				_delay = _duration - (player getVariable ["HSim_radioMusicTrackStart", 0]);
				_timeNow = time;
				
				waitUntil 
				{
					((time - _timeNow) >= _delay) || 
					((vehicle player) != _this) || 
					!(player getVariable ["HSim_radioMusic", false]) || 
					((player getVariable ["HSim_radioMusicChannel", ""]) != _channel) || 
					((player getVariable ["HSim_radioMusicTrack", ""]) != _track) || 
					!(isBatteryOnRTD _this)
				};
				
				if ((player getVariable ["HSim_radioMusicTrack", ""]) != _track) then {_manualNext = true;} else {_manualNext = false;};
			};
			[3, _this] call BIS_fnc_radioMusicOff;
		};
	} 
	else 
	{
		[profileNamespace getVariable ["HSim_radioMusicChannel", ""], true] call BIS_fnc_radioSetChannel;
		[] call BIS_fnc_radioSetPlaylist;
	};
};

switch (_mode) do 
{
	case 0: 
	{
		
	};
	
	case 1: 
	{
		profileNamespace setVariable ["HSim_radioMusicOn", true];
		saveProfileNamespace;
	
		call _statement;
	};
	
	case 2: 
	{
		_return = !(_params getVariable ["HSim_radioMusicDisabled", false]) && ((profileNamespace getVariable ["HSim_radioMusicOn", true]) || _override);
	};
	
	case 3: 
	{
		call _statement;
	};
};

_return