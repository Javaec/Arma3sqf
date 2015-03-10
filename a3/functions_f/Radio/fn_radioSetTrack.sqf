/*
	Author: Joris-Jan van 't Land

	Description:
	Set a specific or random music track.

	Parameter(s):
	_this select 0: track (String)
	_this select 1: override (Bool)
	_this select 2: Bool (first track? -> start randomly within the track)

	Returns:
	Array (duration (s): Scalar, start time (s): Scalar)
*/

private ["_track", "_override", "_firstTrack", "_duration", "_start"];
_track = [_this, 0, "", [""]] call BIS_fnc_Param;
_override = [_this, 1, false, [false]] call BIS_fnc_Param;
_firstTrack = [_this, 2, false, [false]] call BIS_fnc_Param;

if (_track == "") then 
{
	//Select and play the last track on the playlist
	private ["_playlist"];
	_playlist = player getVariable ["HSim_radioMusicPlaylist", []];
	if ((count _playlist) > 0) then 
	{
		_track = _playlist select ((count _playlist) - 1);
		_duration = getNumber (configFile >> "CfgMusic" >> _track >> "duration");
		if (_duration == 0) then {_duration = 120};
		if (_firstTrack) then {_start = round (random (_duration * 0.8))} else {_start = 0};
		
		//Remove track from the playlist
		//Generate new playlist if necessary
		_playlist resize ((count _playlist) - 1);
		if ((count _playlist) == 0) then {[] call BIS_fnc_radioSetPlaylist} else {player setVariable ["HSim_radioMusicPlaylist", _playlist]};
	} 
	else 
	{
		_track = "";
		_duration = 20;
		_start = 0;
	};
} 
else 
{
	//See if track exists
	private ["_cfgTrack"];
	_cfgTrack = configFile >> "CfgMusic" >> _track;
	if ((configName _cfgTrack) != "") then 
	{	
		//Find matching channel
		private ["_genre"];
		_genre = getText (_cfgTrack >> "genre");
		_duration = getNumber (_cfgTrack >> "duration");
		
		//Set channel
		[_genre, false, true] call BIS_fnc_radioSetChannel;
		
		//Build playlist
		[] call BIS_fnc_radioSetPlaylist;
	};
	
	_start = 0;
};

player setVariable ["HSim_radioMusicTrack", _track];
player setVariable ["HSim_radioMusicTrackDuration", _duration];
player setVariable ["HSim_radioMusicTrackStart", _start];

playMusic [_track, _start];

[_track, _duration, _start]