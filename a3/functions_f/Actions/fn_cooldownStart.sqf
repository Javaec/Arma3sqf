/*
	Author: Joris-Jan van 't Land

	Description:
	Cool down start action / procedure - condition and statement

	Parameter(s):
	_this select 0: mode (Scalar)
		0: condition
		1: statement
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
	case 0: 
	{
	
	};
	
	case 1: 
	{
	
	};

	case 2: 
	{
		private ["_maxRPM"];
		_maxRPM = (getEngineTargetRPMRTD _params) select 0;

		_return = ((enginesRPMRTD _params) select 0) <= (_maxRPM * 0.67);
	};
	
	case 3: 
	{
		["AmbienceCockpitCooldownStart", _speaker, 0.1] call BIS_fnc_genericSentence;
	};
};

_return