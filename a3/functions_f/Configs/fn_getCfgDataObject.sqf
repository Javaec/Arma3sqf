/*
	Author: Jiøí Wainar (Warka)

	Description:
	Get the object defined in cfg by its name (global variable).

	Remark(s):
	* Can by called 2 ways:
		* 1st way (general) works for any config.
		* 2nd way is for comfortable working with mission description.ext.

	Parameter(s):
		_this: CFG
		_this: ARRAY of STRINGS - missionConfigFile classes and an attribute.

	Example:

	* 1st way of calling:

		_value = (missionconfigfile >> "Hubs" >> "A1" >> "QuickStart" >> "trigger") call BIS_fnc_getCfgDataObject;

	* 2nd way of calling:

		_value = ["Hubs","A1","QuickStart","trigger"] call BIS_fnc_getCfgDataObject;

	Returns:
		OBJECT or OBJNULL
*/

private["_value"];

_value = _this call BIS_fnc_getCfgData;

if (isNil "_value") exitWith
{
	//"Attribute not found in cfg!" call BIS_fnc_error;

	objNull
};

if (typeName _value != "STRING") exitWith
{
	//"An object referenced in cfg must be defined as a string!" call BIS_fnc_error;

	objNull
};

_value = missionNamespace getVariable [_value,objNull];

if (isNull _value) exitWith
{
	//"Object doesn't exist!" call BIS_fnc_error;

	objNull
};

_value