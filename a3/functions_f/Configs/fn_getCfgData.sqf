/*
	Author: Jiøí Wainar (Warka)

	Description:
	Smart-return number, text or array value from config.

	Remark(s):
	* Can by called 2 ways:
		* 1st way (general) works for any config.
		* 2nd way is for comfortable working with mission description.ext.

	Parameter(s):
		_this: CFG
		_this: ARRAY of STRINGS - missionConfigFile classes and an attribute.

	Example:

	* 1st way of calling:

		_value = (configfile >> "BulletBubbles" >> "BulletBubbles1") call BIS_fnc_getCfgData;
		_value = (missionconfigfile >> "Hubs" >> "A1" >> "QuickStart" >> "trigger") call BIS_fnc_getCfgData;

	* 2nd way of calling:

		_value = ["Hubs","A1","QuickStart","trigger"] call BIS_fnc_getCfgData;

	Returns:
		STRING or NUMBER or ARRAY or nil (if value not found)
*/

private["_cfg","_value"];

if (typeName _this != "ARRAY") then
{
	_cfg = _this;
}
else
{
	{
		if (_forEachIndex == 0) then
		{
			if (typeName _x == "CONFIG") then
			{
				_cfg = _x;
			}
			else
			{
				_cfg = missionConfigFile >> _x;
			};

		}
		else
		{
			_cfg = _cfg >> _x;
		};

	} forEach _this;
};

switch (true) do
{
	case (isNumber _cfg): 	{_value = getNumber _cfg};
	case (isText _cfg): 	{_value = getText _cfg};
	case (isArray _cfg): 	{_value = getArray _cfg;};

	default 		{_value = nil};
};

//make sure returning 'nil' works
if (isNil "_value") exitWith {nil};

_value