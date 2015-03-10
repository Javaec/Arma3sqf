/*
	Author: Thomas Ryan

	Description:
	Easily carry out complex fading. Default values will be used if parameters aren't defined or set to nil.

	Parameter(s):
	_this select 0 (Optional): NUMBER - 0: fade out, 1: fade in
	_this select 1 (Optional): STRING - "BLACK": black fade, "WHITE": white fade
	_this select 2 (Optional): NUMBER - Duration of the fade in seconds
	_this select 3 (Optional): NUMBER - 1: blur while fading, 0: don't use blur
	_this select 4 (Optional): STRING - String of the music track you wish to play (will only work with fading in)
	_this select 5 (Optional): STRING - Ending you wish to use (will only work with fading out)
	_this select 6 (Optional): NUMBER - Use 0: failMission, 1: endMission

	Returns:
	Nothing.
*/

private ["_BIS_fadeInOrOut","_BIS_fadeColor","_BIS_fadeDuration","_BIS_blur","_BIS_music","_BIS_ending","_BIS_failMissionOrEndMission"];

_BIS_fadeInOrOut = [_this,0,1,[0,1]] call BIS_fnc_param;
_BIS_fadeColor = [_this,1,"BLACK",["BLACK","WHITE"]] call BIS_fnc_param;
_BIS_fadeDuration = [_this,2,3,[0]] call BIS_fnc_param;
_BIS_blur = [_this,3,0,[0,1]] call BIS_fnc_param;
_BIS_music = [_this,4,"",[""]] call BIS_fnc_param;
_BIS_ending = [_this,5,"",[""]] call BIS_fnc_param;
_BIS_failMissionOrEndMission = [_this,6,1,[0,1]] call BIS_fnc_param;

switch (_BIS_fadeInOrOut) do
{
	case 0:
	{
		if (_BIS_music != "") then
		{
			["Music track ""%1"" defined for fading out.",_BIS_music] call BIS_fnc_error;
		};
		
		_BIS_fadeDuration fadeSound 0;
		_BIS_fadeDuration fadeMusic 0;
		_BIS_fadeDuration fadeSpeech 0;
		
		switch (_BIS_fadeColor) do
		{
			case "BLACK":
			{
				titleCut ["","BLACK OUT",_BIS_fadeDuration];
			};
			
			case "WHITE":
			{
				titleCut ["","WHITE OUT",_BIS_fadeDuration];
			};
		};
		
		if (_BIS_blur == 1) then
		{
			"DynamicBlur" ppEffectEnable true;
			"DynamicBlur" ppEffectAdjust [0];
			"DynamicBlur" ppEffectCommit 0;
			
			"DynamicBlur" ppEffectAdjust [5];
			"DynamicBlur" ppEffectCommit _BIS_fadeDuration;
		};
		
		sleep _BIS_fadeDuration;
		
		if (_BIS_blur == 1) then
		{
			"DynamicBlur" ppEffectEnable false;
		};
		
		if (_BIS_ending != "") then
		{	
			switch (_BIS_failMissionOrEndMission) do
			{
				case 0:
				{
					failMission _BIS_ending;
				};
				
				case 1:
				{
					endMission _BIS_ending;
				};
			};
		};
	};
	
	case 1:
	{
		if (_BIS_ending != "") then
		{
			["Ending ""%1"" defined for fading in.",_BIS_ending] call BIS_fnc_error;
		};
		
		0 fadeSound 0;
		0 fadeSpeech 0;
		
		switch (_BIS_fadeColor) do
		{
			case "BLACK":
			{
				titleCut ["","BLACK FADED",9999];
			};
			
			case "WHITE":
			{
				titleCut ["","WHITE IN",9999];
			};
		};
		
		if (_BIS_blur == 1) then
		{
			"DynamicBlur" ppEffectEnable true;
			"DynamicBlur" ppEffectAdjust [5];
			"DynamicBlur" ppEffectCommit 0;
		};
		
		if (_BIS_music != "") then
		{
			sleep 1;
			
			playMusic _BIS_music;
			
			sleep 1;
		}
		else
		{
			sleep 2;
		};
		
		_BIS_fadeDuration fadeSound 1;
		_BIS_fadeDuration fadeSpeech 1;
		
		switch (_BIS_fadeColor) do
		{
			case "BLACK":
			{
				titleCut ["","BLACK IN",_BIS_fadeDuration];
			};
			
			case "WHITE":
			{
				titleCut ["","WHITE IN",_BIS_fadeDuration];
			};
		};
		
		if (_BIS_blur == 1) then
		{
			"DynamicBlur" ppEffectAdjust [0];
			"DynamicBlur" ppEffectCommit _BIS_fadeDuration;
			
			sleep _BIS_fadeDuration;
			
			"DynamicBlur" ppEffectEnable false;
		};
	};
};