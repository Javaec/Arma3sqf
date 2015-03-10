
/*
	File: fn_addClassOO.sqf
	Author: Joris-Jan van 't Land

	Description:
	Registering a class for the OO scripting shell

	Parameter(s):
	_this: String (class in CfgOO)
	
	Returns:
	-
*/

private ["_className", "_class", "_return"];
_className = [_this, 0, "", [""]] call BIS_fnc_Param;
_class = configFile >> "CfgOO" >> _className;
_return = true;

if ((configName _class) == "") exitWith {("Class " + _this + " does not exist in CfgOO!") call BIS_fnc_error; false};

//TODO: Check the class was not already loaded!

private ["_methods"];
_methods = _class >> "Methods";

if ((configName _methods) != "") then 
{
	//Precompile all methods
	for "_i" from 0 to ((count _methods) - 1) do 
	{
		private ["_method", "_methodName", "_methodVar", "_methodScript"];
		_method = _methods select _i;
		
		_methodName = configName _method;
		if ((typeName _methodName) != (typeName "")) exitWith {"Method name should be a String!" call BIS_fnc_error; _return = false};
		if (_methodName == "") exitWith {"Method name cannot be empty!" call BIS_fnc_error; _return = false};
		
		_methodVar = "BIS_OO_" + _className + "_" + _methodName;
		
		_methodScript = getText (_method >> "script");
		if ((typeName _methodScript) != (typeName "")) exitWith {"Method script should be a String!" call BIS_fnc_error; _return = false};
		if (_methodScript == "") exitWith {"Method script cannot be empty!" call BIS_fnc_error; _return = false};

		//Find the correct default return value
		//Cannot use str here, because it doesn't always generate the desired result
		private ["_returnValue"];
		switch (getText (_method >> "returnType")) do 
		{
			case "SCALAR": {_returnValue = "-1"};
			case "STRING": {_returnValue = """"""};
			case "BOOL": {_returnValue = "false"};
			case "ARRAY": {_returnValue = "[]"};
			case "OBJECT": {_returnValue = "objNull"};
			case "CONFIG": {_returnValue = "configFile"};
			default {_returnValue = "false"}; //Default in case no return type (void) is defined / safer than nil for now
		};
		
		//Automatically call parameter validation whenever a method is called
		private ["_compileString"];
		_compileString = _methodVar + " = compile ('";
		_compileString = _compileString + "if (!([""" + _className + """, """ + _methodName + """, _this] call BIS_fnc_validateParametersOO)) exitWith {" + _returnValue + "}; ";
		_compileString = _compileString + (preprocessFileLineNumbers _methodScript);
		_compileString = _compileString + "')";
		
		call (compile _compileString);
	};
};

("Loaded class: " + _className) call BIS_fnc_log;

_return