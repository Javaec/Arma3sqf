/*
	Author: Jiøí Wainar (Warka)

	Description:
	Get an array from cfg. If the retrieved value is not an array, retype it to an array.

	Remark(s):
	* Can by called 2 ways:
		* 1st way (general) works for any config.
		* 2nd way is for comfortable working with mission description.ext.

	Parameter(s):
		_this: CFG
		_this: ARRAY of STRINGS - missionConfigFile classes and an attribute.

	Example:

	* 1st way of calling:

		_value = (missionconfigfile >> "Hubs" >> "A1" >> "position") call BIS_fnc_getCfgDataArray;

	* 2nd way of calling:

		_value = ["Hubs","A1","position"] call BIS_fnc_getCfgDataArray;

	Returns:
		ARRAY or nil
*/

private["_value"];

_value = _this call BIS_fnc_getCfgData;

if (isNil "_value") exitwith
{
	//["Attribute cannot be found in cfg! Input: %1",_this] call BIS_fnc_error;
	[]
};

if (typeName _value != "ARRAY") then
{
	_value = [_value];
};

_value