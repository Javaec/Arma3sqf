/*
	Author: Joris-Jan van 't Land

	Description:
	Batteries on action / procedure - condition and statement

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
	_params animate ["BatteriesSwitch_On", 1];
	_params say ("CockpitSwitch" + (str (ceil (random 5))));
	["AmbienceCockpitBatteriesOn", _speaker, 0.1] call BIS_fnc_genericSentence;
	if ([2, _params] call BIS_fnc_radioATCOn) then {[3, _params] call BIS_fnc_radioATCOn};
	if ([2, _params] call BIS_fnc_radioMusicNext) then {[3, _params] call BIS_fnc_radioMusicNext};
};

switch (_mode) do 
{
	//TODO: remove? Engine-based
	case 0: 
	{
		_return = !(isBatteryOnRTD _params);
	};
	
	case 1: 
	{
		[_params, _speaker] spawn BIS_fnc_helicopterEvaluateAuto; //Start evaluating when to give back automated actions
		[_params] call BIS_fnc_helicopterStopProcedure; //Stop all automated procedures
	
		call _statement;
	};
	
	case 2: 
	{
	
	};
	
	case 3: 
	{
		_params setBatteryRTD true;
		call _statement;
	};
	
	case 4: 
	{
		_return = isBatteryOnRTD _params;
	};
};

_return