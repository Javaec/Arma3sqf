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
	_this select 2: quick mode (Bool) [optional: default false]

	Returns:
	Bool
*/

private ["_mode", "_params", "_quick", "_return"];
_mode = _this select 0;
_params = _this select 1;
_quick = [_this, 2, false, [false]] call BIS_fnc_Param;
_return = true;

switch (_mode) do 
{
	case 0: 
	{
		private ["_maxRPM"];
		_maxRPM = (getEngineTargetRPMRTD _params) select 0;
		_return = ((enginesRPMRTD _params) select 0) < (0.95 * _maxRPM);
	};
	
	case 1: 
	{
		[_params, _quick] spawn 
		{
			private ["_heli", "_duration", "_starterDuration"];
			_heli = _this select 0;
			if (_this select 1) then {_duration = 0; _starterDuration = 1} else {_duration = 10; _starterDuration = 5};			
		
			//TODO: not after system detects fully on / off?
			[_heli, "", false] call BIS_fnc_helicopterStopProcedure; //Stop all automated procedures
			
			//Disable stress damage temporarily
			private ["_stress"];
			if (IsStressDamageEnabled) then {_stress = true} else {_stress = false};
			if (_stress) then {enableStressDamage false};
			_heli setBatteryRTD true;
			_heli setStarterRTD [true, -1];
			_heli setThrottleRTD [1, -1];
			_heli setRotorBrakeRTD 0;
			_heli setWantedRPMRTD [(getEngineTargetRPMRTD _heli) select 0, _duration, -1];
			sleep _starterDuration; //Starter must be on to reach RPMs
			//TODO: can conflict with anything you do within these 5 seconds, but then again: debug
			_heli setStarterRTD [false, -1];
			decreasetEngineTemperatureRTD _heli;
			if (_stress) then {enableStressDamage true};
		};
	};
	
	case 2: 
	{
		
	};
	
	case 3: 
	{
	
	};
};

_return