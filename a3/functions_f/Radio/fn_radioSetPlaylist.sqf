/*
	Author: Joris-Jan van 't Land

	Description:
	Set a specific or random music playlist.

	Parameter(s):
	_this select 0: 

	Returns:
	Bool
*/

private ["_cfgMusic", "_channel", "_playlistUnsorted", "_playlist"];
_cfgMusic = configFile >> "CfgMusic";
_channel = player getVariable ["HSim_radioMusicChannel", "Rock"];
_playlistUnsorted = [];
_playlist = [];

//Create a list of all tracks for this channel
for "_i" from 0 to ((count _cfgMusic) - 1) do 
{
	private ["_track", "_class"];
	_track = _cfgMusic select _i;
	if (isClass _track) then 
	{
		if ((getText (_track >> "genre")) == _channel) then 
		{
			_playlistUnsorted set [count _playlistUnsorted, configName _track];
		};
	};
};

//Shuffle the playlist
{
	private ["_track"];
	_track = _playlistUnsorted call BIS_fnc_selectRandom;
	_playlist set [count _playlist, _track];
	_playlistUnsorted = _playlistUnsorted - [_track];
} 
forEach _playlistUnsorted;

player setVariable ["HSim_radioMusicPlaylist", _playlist];

_playlist