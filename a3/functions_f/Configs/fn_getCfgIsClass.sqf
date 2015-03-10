/*
	Author: Jiøí Wainar (Warka)

	Description:
	Return true if it's a class.

	Remark(s):
	* Can by called 2 ways:
		* 1st way (general) works for any config.
		* 2nd way is for comfortable working with mission description.ext.

	Parameter(s):
		_this: CFG
		_this: ARRAY of STRINGS - missionConfigFile classes and an attribute.

	Example:

	* 1st way of calling:

		_isClass = (missionconfigfile >> "Hubs" >> "A1" >> "QuickStart") call Bis_fnc_getCfgIsClass;

	* 2nd way of calling:

		_isClass = ["Hubs"] call Bis_fnc_getCfgIsClass;

	Returns:
		BOOL - true if it's a class
*/

private["_cfg"];

if (typeName _this != "ARRAY") then
{
	_cfg = _this;
}
else
{
	{
		if (_forEachIndex == 0) then
		{
			_cfg = missionConfigFile >> _x;
		}
		else
		{
			_cfg = _cfg >> _x;
		};

	} forEach _this;
};

if !(isClass _cfg) exitWith {false};

true