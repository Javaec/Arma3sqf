private ["_path","_cfgUpgrades","_category","_config"];

_path = "Upgrades";
_cfgUpgrades = [hsim_heliportDB,[worldname,_path]] call BIS_fnc_dbClassList;
{
	_category = _x;
	_config = [hsim_heliportDB,[worldname,_path,_category,"config"]] call BIS_fnc_dbValueReturn;
	_cfgCategory = [hsim_heliportDB,[worldname,_path,_category]] call BIS_fnc_dbClassList;
	{
		[_category,_x,_config] call BIS_fnc_heliportUpgradeAdd;
	} foreach _cfgCategory;
} foreach _cfgUpgrades;