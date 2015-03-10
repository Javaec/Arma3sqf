/*--------------------------------------------------------------------------------------------------

	Author: Jiøí Wainar

	Description:
	Checks if unit has a backpack with special equipment and ev. replaces it empty backpack.

	Example:

	[player] call BIS_fnc_camp_fixUnitBackpack;

--------------------------------------------------------------------------------------------------*/

//disable debug logging
private["_fnc_log_disable"]; _fnc_log_disable = true;

private["_unit","_backpack","_backpackNew","_backpackItems"];

_unit 	  	= [_this, 0, objNull, ["",objNull]] call bis_fnc_param; if (isNull _unit) exitWith {""};
_backpack 	= backpack _unit; if (_backpack == "") exitWith {""};
_backpackNew 	= _backpack call BIS_fnc_basicBackpack; if (_backpackNew == "") exitWith {""};

//no need to change backpack
if (_backpack == _backpackNew) exitWith {""};

//replace the backpack and transit it's cargo (last param = true)
[_unit,["backpack",_backpackNew],false,true] call BIS_fnc_camp_addEquipment;

_backpackNew