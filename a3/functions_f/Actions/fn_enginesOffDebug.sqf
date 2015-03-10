/*
	Author: Joris-Jan van 't Land

	Description:
	Engines on (debug) action / procedure - condition and statement

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

private ["_mode", "_params", "_return"];
_mode = _this select 0;
_params = _this select 1;
_return = true;

switch (_mode) do 
{
	case 0: 
	{
		_return = ((enginesRPMRTD _params) select 0) > 1;
	};
	
	case 1: 
	{
		//TODO: not after system detects fully on / off?
		[_params, "", false] call BIS_fnc_helicopterStopProcedure; //Stop all automated procedures
		_params setBatteryRTD false;
		_params setThrottleRTD [0, -1];
		_params setWantedRPMRTD [0, 0, -1];
		_params setStarterRTD [false, -1];
		stopEngineRTD _params;
	};
	
	case 2: 
	{

	};
	
	case 3: 
	{
	
	};
};

_return