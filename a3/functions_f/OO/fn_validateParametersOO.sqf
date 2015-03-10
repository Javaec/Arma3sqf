
/*
	File: fn_validateParametersOO.sqf
	Author: Joris-Jan van 't Land

	Description:
	Validating the parameters of a certain method in a class

	Parameter(s):
	_this select 0: String (class name)
	_this select 1: String (method name)
	_this select 2: Any (to-be-validated parameters)
	
	Returns:
	validation flag: Boolean
*/

private ["_className", "_class"];
_className = [_this, 0, "", [""]] call BIS_fnc_Param;
_class = configFile >> "CfgOO" >> _className;
if ((configName _class) == "") exitWith {("Class " + _className + " does not exist in CfgOO!") call BIS_fnc_error; false};

private ["_methodName", "_method"];
_methodName = [_this, 1, "", [""]] call BIS_fnc_Param;
_method = _class >> "Methods" >> _methodName;
if ((configName _method) == "") exitWith {("Method " + _methodName + " does not exist in CfgOO!") call BIS_fnc_error; false};

private ["_debugPrefix", "_params", "_paramsString", "_paramTypes", "_return"];
_debugPrefix = (_className + "." + _methodName);
_params = _this select 2;
_paramsString = str _params;
_paramTypes = getArray (_method >> "parameterTypes");
_return = true;

if ((count _paramTypes) > 0) then 
{
	if ((isNil "_params") && ((count _paramTypes) > 0)) exitWith {("[" + _debugPrefix + "] no parameters provided, " + (str (count _paramTypes)) + " expected!") call BIS_fnc_error; _return = false};

	if (((count _paramTypes) > 1) && ((_paramTypes select 0) != "ARRAY")) then 
	{
		if (((count _paramTypes) > 1) && ((typeName _params) != "ARRAY")) exitWith {("[" + _debugPrefix + "] 1 parameter provided, " + (str (count _paramTypes)) + " expected!") call BIS_fnc_error; _return = false};
		if ((count _params) < (count _paramTypes)) exitWith {("[" + _debugPrefix + "] " + (str (count _params)) + " parameters provided, " + (str (count _paramTypes)) + " expected!") call BIS_fnc_error; _return = false};
		
		for "_i" from 0 to ((count _paramTypes) - 1) do 
		{
			if ((_paramTypes select _i) != (typeName (_params select _i))) exitWith {("[" + _debugPrefix + "] parameter (" + (str _i) + ") is supposed to be of type: " + (_paramTypes select _i)) call BIS_fnc_error; _return = false};
		};
	} 
	else 
	{
		if ((typeName _params) != (_paramTypes select 0)) exitWith {("[" + _debugPrefix + "] parameter is supposed to be of type: " + (_paramTypes select 0)) call BIS_fnc_error; _return = false};
	};
} 
else 
{
	_paramsString = "";
};

("" + _className + "." + _methodName + "(" + _paramsString + ")") call BIS_fnc_log;

_return