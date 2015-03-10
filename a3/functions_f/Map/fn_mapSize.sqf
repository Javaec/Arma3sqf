/*
	Author: Karel Moricky

	Description:
	Returns map size.

	Parameter(s):
		0 (Optional): STRING - world name (current world used as default)

	Returns:
	NUMBER
*/
private ["_map","_mapSize"];
_map = [_this,0,worldname,[""]] call bis_fnc_param;
_mapSize = [configfile >> "cfgworlds" >> _map,"mapSize"] call bis_fnc_returnConfigEntry;
if (isnil {_mapSize}) exitwith {-1}; //--- Terminate when the world is empty
_mapSize = _mapSize call bis_fnc_parsenumber;

if (_mapSize == 0) then {["mapSize param not defined for '%1'",_map] call bis_fnc_error; -1};
_mapSize