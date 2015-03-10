/*
	Author: Joris-Jan van 't Land

	Description:
	Throttle #1 full action / procedure - condition and statement

	Parameter(s):
	_this select 0: mode (Scalar)
		0: condition
		1: statement
		2: condition (automated sequence)
		3: statement (automated sequence)
		4: condition (automated sequence - bypass)
	_this select 1: standard UserAction this parameters (Array)
	_this select 2: engine (Scalar)
	_this select 3: speaker (Object) [optional: default driver]

	Returns:
	Bool
*/

private ["_mode", "_params", "_engine", "_engineSelect", "_engineCount", "_speaker", "_return"];
_mode = _this select 0;
_params = _this select 1;
if ((count _this) > 2) then {_engine = _this select 2; _engineSelect = _engine} else {_engine = -1; _engineSelect = 0};
_engineCount = count (enginesIsOnRTD _params);
_speaker = [_this, 3, driver _params, [objNull]] call BIS_fnc_Param;
_return = true;

private ["_statement"];
_statement = 
{
	private ["_maxRPM", "_throttleIdleToFull"];
	_maxRPM = (getEngineTargetRPMRTD _params) select _engineSelect;
	_throttleIdleToFull = getNumber (configFile >> "CfgVehicles" >> (typeOf _params) >> "RotorLibHelicopterProperties" >> "throttleIdleToFull");

	_params setThrottleRTD [1, _engine]; 
	_params setWantedRPMRTD [_maxRPM, _throttleIdleToFull, _engine];
	["AmbienceCockpitThrottleFull" + (str (_engine + 1)), _speaker, 0.1] call BIS_fnc_genericSentence;
};

switch (_mode) do 
{
	case 0: 
	{
		_return = if (_engineSelect < _engineCount) then {(abs (((throttleRTD _params) select _engineSelect) - 0.15)) < 0.0001} else {false};
	};
	
	case 1: 
	{
		if (_engineSelect < _engineCount) then 
		{
			[_params, _speaker] spawn BIS_fnc_helicopterEvaluateAuto; //Start evaluating when to give back automated actions
			[_params] call BIS_fnc_helicopterStopProcedure; //Stop all automated procedures
	
			call _statement;
		};
	};
	
	case 2: 
	{
		if (_engineSelect < _engineCount) then 
		{
			private ["_maxRPM"];
			_maxRPM = (getEngineTargetRPMRTD _params) select _engineSelect;

			_return = ((abs (((throttleRTD _params) select _engineSelect) - 0.15)) < 0.0001) && (((enginesRPMRTD _params) select _engineSelect) >= (_maxRPM * 0.59));
		} 
		else 
		{
			_return = false;
		};
	};
	
	case 3: 
	{
		if (_engineSelect < _engineCount) then {call _statement;};
	};
	
	case 4: 
	{
		_return = if (_engineSelect < _engineCount) then {((throttleRTD _params) select _engineSelect) == 1} else {false};
	};
};

_return