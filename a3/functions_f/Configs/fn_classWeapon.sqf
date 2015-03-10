
/*
	File: fn_classWeapon.sqf
	Author: Vilem

	Description:
	Returns class of weapon given by string.
	
	Parameter(s):
	1: <string> weapon
	
	Returns:
	<config class> weapon class readed from config (test success with isClass)
*/

private ["_return", "_name"];
_name = _this select 0;

if ((typeName _name) == "STRING") then
{
  _return = (configFile >> "cfgWeapons" >> _name);
}
else
{
  _return = (configFile >> "NonExistingClassDummy0005646526");
};
_return 