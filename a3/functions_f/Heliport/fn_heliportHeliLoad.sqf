private ["_path","_cfgHelis","_cfgCategory","_category","_item"];

_path = "Helicopters";
_cfgHelis = [hsim_heliportDB,[worldname,_path]] call BIS_fnc_dbClassReturn;
{
	_item = _x;
	if (_item call BIS_fnc_dbIsClass) then {
		[_item] call BIS_fnc_heliportHeliAdd;
	};
} foreach _cfgHelis;