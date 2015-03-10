/*
	Author: Joris-Jan van 't Land

	Description:
	Determines when the helicopter is ready to have automated sequence actions returned.

	Parameter(s):
	_this select 0: helicopter (Object)
	_this select 1: driver (Object) [optional: default driver]

	Returns:
	Boolean
*/

private ["_heli", "_driver"];
_heli = _this select 0;
_driver = [_this, 2, driver _heli, [objNull]] call BIS_fnc_Param;

//Only active once per helo
if (!(_heli getVariable ["HSim_evaluateAuto", false])) then 
{
	_heli setVariable ["HSim_evaluateAuto", true];

	//TODO: multi-engine?
	private ["_maxRPM"];
	_maxRPM = (getEngineTargetRPMRTD _heli) select 0;

	//TODO: fetch from config?
	waitUntil {!(_heli getVariable ["HSim_Procedure_Startup", false]) && !(_heli getVariable ["HSim_Procedure_Shutdown", false])};
	
	//TODO: also check status of rotor brake and batteries?
	waitUntil {(((enginesRPMRTD _heli) select 0) >= (0.95 * _maxRPM)) || (((enginesRPMRTD _heli) select 0) <= 5) || !(alive _heli) || !(alive _driver) || ((vehicle _driver) != _heli)};
	
	if ((alive _heli) && (alive _driver) && ((vehicle _driver) == _heli)) then 
	{
		_heli enableAutoStartUpRTD true;
	};
	
	_heli setVariable ["HSim_evaluateAuto", false];
};

true