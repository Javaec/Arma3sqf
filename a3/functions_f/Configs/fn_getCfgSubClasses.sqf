/*
	Author: Jiøí Wainar (Warka)

	Description:
	Return all child classes of given class.

	Remark(s):
	* Can by called 2 ways:
		* 1st way (general) works for any config.
		* 2nd way is for comfortable working with mission description.ext.

	Parameter(s):
		_this: CFG
		_this: ARRAY of STRINGS - missionConfigFile classes and an attribute.

	Example:

	* 1st way of calling:

		_subclasses = (missionconfigfile >> "Hubs" >> "A1" >> "QuickStart") call Bis_fnc_getCfgSubClasses;

	* 2nd way of calling:

		_subclasses = ["Hubs"] call Bis_fnc_getCfgSubClasses;

	Returns:
		ARRAY (of STRINGS with sub-classes names)
*/

private["_classes","_cfg","_value","_itemCount"];

_classes = [];

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
	}
	forEach _this;
};

_itemCount = (count _cfg) - 1;

for "_i" from 0 to _itemCount do
{
	if (isClass (_cfg select _i)) then
	{
		_classes = _classes + [configName (_cfg select _i)];
	};
};

_classes