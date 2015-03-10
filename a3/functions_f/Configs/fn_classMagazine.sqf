
/*
	File: fn_magazineClass.sqf
	Author: Vilem

	Description:
	Returns class of magazine given by string.
	
	Parameter(s):
	1: <string> magazine
	
	Returns:
	<config class> magazine class readed from config (test success with isClass)
*/

private ["_return", "_name"];
_name = _this select 0;

if ((typeName _name) == "STRING") then
{
  _return = (configFile >> "cfgMagazines" >> _name);
}
else
{
  _return = (configFile >> "NonExistingClassDummy0005646526");
};
_return 