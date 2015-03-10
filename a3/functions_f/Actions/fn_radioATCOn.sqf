/*
	Author: Joris-Jan van 't Land

	Description:
	Radio ATC on action / procedure - condition and statement

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

private ["_mode", "_params", "_override", "_return"];
_mode = _this select 0;
_params = _this select 1;
_override = [_this, 2, false, [false]] call BIS_fnc_Param;
_return = true;

private ["_statement"];
_statement = 
{
	_params animate ["RadioATCSwitch_On", 1];
	_params say ("CockpitSwitch" + (str (ceil (random 5))));

	private ["_handle"];
	_handle = _params spawn 
	{
		private ["_disabled"];
		_disabled = getNumber (configFile >> "CfgWorlds" >> worldName >> "radioATCDisabled");
		if (_disabled != 1) then 
		{	
			//TODO: allow setting ambient radio density?
			private ["_timeLast"];
			_timeLast = time - (random 60);

			//Spawn a special radio object as it's the only way to switch off actively playing sounds
			private ["_radio"];
			_radio = (group BIS_functions_mainscope) createunit ["Logic", [100, 100, 100], [], 0, "none"];
			_radio enableSimulation false;
			_radio hideObject true;
			_radio attachTo [_this, [0, 0, 0], "switch_radio_atc"];
			_this setVariable ["HSim_radioATCRadio", _radio];

			while {(alive _this) && (isBatteryOnRTD _this)} do 
			{
				if (((time - _timeLast) > 60) && ((random 1) > 0.8)) then 
				{
					[_radio, player] say3D ("RadioAmbient" + (str (ceil (random 30))));
					_timeLast = time;
				};
				
				sleep 1;
			};
		};
	};
	_params setVariable ["HSim_radioATC", _handle];
};

switch (_mode) do 
{
	case 0: 
	{
		_return = isNil {_params getVariable "HSim_radioATC"};
	};
	
	case 1: 
	{
		profileNamespace setVariable ["HSim_radioATCOn", true];
		saveProfileNamespace;
	
		call _statement;
	};
	
	case 2: 
	{
		_return = (isNil {_params getVariable "HSim_radioATC"}) && ((profileNamespace getVariable ["HSim_radioATCOn", true]) || _override) && !(_params getVariable ["HSim_radioATCDisabled", false]);
	};
	
	case 3: 
	{
		call _statement;
	};
};

_return