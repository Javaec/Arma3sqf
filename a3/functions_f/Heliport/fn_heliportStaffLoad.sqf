private ["_logicFnc","_path","_cfgUpgrades","_category","_item","_config","_positionSlot","_position","_direction","_logic","_upgrade"];
_logicFnc = bis_functions_mainscope;

_path = "Staff";
_cfgUpgrades = [hsim_heliportDB,[worldname,_path]] call BIS_fnc_dbClassReturn;
{
	_category = _x;
	if (_x call BIS_fnc_dbIsClass) then {
		_cfgCategory = [hsim_heliportDB,[worldname,_path,_category]] call BIS_fnc_dbClassReturn;
		{
			_item = _x;
			if (_item call BIS_fnc_dbIsClass) then {
				[_category,_item] call BIS_fnc_heliportStaffAdd;
			};
		} foreach _cfgCategory;
	};
} foreach _cfgUpgrades;