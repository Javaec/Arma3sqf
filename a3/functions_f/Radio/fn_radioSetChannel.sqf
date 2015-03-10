/*
	Author: Joris-Jan van 't Land

	Description:
	Set a specific or random music channel.

	Parameter(s):
	_this select 0: channel (String)
	_this select 1: next (Bool)
	_this select 2: override (Bool)

	Returns:
	Bool
*/

private ["_channel", "_next", "_override"];
_channel = [_this, 0, "", [""]] call BIS_fnc_Param;
_next = [_this, 1, false, [false]] call BIS_fnc_Param;
_override = [_this, 2, false, [false]] call BIS_fnc_Param;

private ["_channels", "_curChan"];
_channels = player getVariable ["HSim_radioMusicGenres", []];

if ((count _channels) > 0) then 
{
	if ((_channel == "") || !(_channel in _channels)) then 
	{
		_channel = _channels call BIS_fnc_selectRandom;
	};

	//Select a random or the next channel
	_curChan = _channels find _channel;
	if (_curChan == -1) then {_curChan = 0;};

	if (_next) then 
	{
		_curChan = _curChan + 1;
		if (_curChan > ((count _channels) - 1)) then {_curChan = 0}; //Wrap
	};

	_channel = _channels select _curChan;

	player setVariable ["HSim_radioMusicChannel", _channel];
	if (!_override) then 
	{
		profileNamespace setVariable ["HSim_radioMusicChannel", _channel];
		saveProfileNamespace;
	} 
	else 
	{
		[] call BIS_fnc_radioSetPlaylist;
	};
};

_channel