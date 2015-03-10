/*
	Author: Joris-Jan van 't Land

	Description:
	APU on action / procedure - condition and statement

	Parameter(s):
	_this select 0: mode (Scalar)
		0: condition
		1: statement
		2: condition (automated sequence)
		3: statement (automated sequence)
		4: condition (automated sequence - bypass)
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

private ["_statement"];
_statement = 
{
	_params animate ["APUSwitch_On", 1];
	_params say ("CockpitSwitch" + (str (ceil (random 5))));

	private ["_APUOn"];
	_APUOn = getNumber (configFile >> "CfgVehicles" >> (typeOf _params) >> "RotorLibHelicopterProperties" >> "APUOn");

	_params setAPURTD [1, _APUOn];
	["AmbienceCockpitAPUOn", _speaker, 0.1] call BIS_fnc_genericSentence;
};

switch (_mode) do 
{
	case 0: 
	{
		_return = (isAPUOnRTD _params) < 0.0001;
	};
	
	case 1: 
	{
		[_params, _speaker] spawn BIS_fnc_helicopterEvaluateAuto; //Start evaluating when to give back automated actions
		[_params] call BIS_fnc_helicopterStopProcedure; //Stop all automated procedures
	
		call _statement;
	};
	
	case 2: 
	{
		_return = ((isAPUOnRTD _params) < 0.0001) && (isBatteryOnRTD _params);
	};
	
	case 3: 
	{
		call _statement;
	};
	
	case 4: 
	{
		_return = (isAPUOnRTD _params) > 0.999;
	};
};

_return