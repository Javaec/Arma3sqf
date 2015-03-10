/*
	Author: Joris-Jan van 't Land

	Description:
	Warmup start procedure - condition and statement

	Parameter(s):
	_this select 0: mode (Scalar)
		2: condition (automated sequence)
		3: statement (automated sequence)
	_this select 1: standard UserAction this parameters (Array)
	_this select 2: speaker (Object) [optional: default driver]

	Returns:
	Bool
*/

private ["_mode", "_params", "_speaker", "_return"];
_mode = _this select 0;
_params = _this select 1;
_speaker = [_this, 2, driver _params, [objNull]] call BIS_fnc_Param;
_return = true;

switch (_mode) do 
{
	case 2: 
	{

	};
	
	case 3: 
	{
		["AmbienceCockpitWarmupStart", _speaker, 0.1] call BIS_fnc_genericSentence;
	};
};

_return