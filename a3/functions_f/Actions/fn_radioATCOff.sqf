/*
	Author: Joris-Jan van 't Land

	Description:
	Radio ATC off action / procedure - condition and statement

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
	_params animate ["RadioATCSwitch_On", 0];
	_params say ("CockpitSwitch" + (str (ceil (random 5))));

	terminate (_params getVariable "HSim_radioATC");
	_params setVariable ["HSim_radioATC", nil];
	
	deleteVehicle (_params getVariable "HSim_radioATCRadio");
	_params setVariable ["HSim_radioATCRadio", nil];
};

switch (_mode) do 
{
	case 0: 
	{
		_return = !(isNil {_params getVariable "HSim_radioATC"});
	};
	
	case 1: 
	{
		profileNamespace setVariable ["HSim_radioATCOn", false];
		saveProfileNamespace;
	
		call _statement;
	};
	
	case 2: 
	{
		_return = !(isNil {_params getVariable "HSim_radioATC"}) && !(_params getVariable ["HSim_radioATCDisabled", false]);
	};
	
	case 3: 
	{
		call _statement;
	};
};

_return