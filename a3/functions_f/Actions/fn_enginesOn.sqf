/*
	Author: Joris-Jan van 't Land

	Description:
	Engines on action / procedure - condition and statement

	Parameter(s):
	_this select 0: mode (Scalar)
		0: condition
		1: statement
		2: condition (automated procedure)
		3: statement (automated procedure)
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
		//TODO: multi-engine support?
		private ["_maxRPM"];
		_maxRPM = (getEngineTargetRPMRTD _params) select 0;
		_return = ((enginesRPMRTD _params) select 0) < (0.95 * _maxRPM);
	};
	
	case 1: 
	{
		private ["_handle"];
		_handle = [_params, "Startup", _speaker] execVM "hsim\air_h\data\scripts\procedures\procedure.sqf";
	};
	
	case 2: 
	{
		private ["_maxRPM"];
		_maxRPM = (getEngineTargetRPMRTD _params) select 0;
		_return = ((enginesRPMRTD _params) select 0) >= (0.95 * _maxRPM);
	};
	
	case 3: 
	{
		["AmbienceCockpitEnginesOn", _speaker, 0.1] call BIS_fnc_genericSentence;
	};
};

_return