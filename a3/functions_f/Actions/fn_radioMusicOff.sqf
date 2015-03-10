/*
	Author: Joris-Jan van 't Land

	Description:
	Radio music off action / procedure - condition and statement

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

private ["_mode", "_params", "_return", "_override"];
_mode = _this select 0;
_params = _this select 1;
_override = [_this, 2, false, [false]] call BIS_fnc_Param;
_return = true;

private ["_statement"];
_statement = 
{
	_params animate ["RadioMusicSwitch_On", 0];
	_params animate ["RadioDisplay_ON", 0];
	_params say ("CockpitSwitch" + (str (ceil (random 5))));
	
	player setVariable ["HSim_radioMusic", false];
	
	playMusic "";
};

switch (_mode) do 
{
	case 0: 
	{
		_return = player getVariable ["HSim_radioMusic", false];
	};
	
	case 1: 
	{
		profileNamespace setVariable ["HSim_radioMusicOn", false];
		saveProfileNamespace;
	
		call _statement;
	};
	
	case 2: 
	{
		_return = !(_params getVariable ["HSim_radioMusicDisabled", false]);
	};
	
	case 3: 
	{
		call _statement;
	};
};

_return