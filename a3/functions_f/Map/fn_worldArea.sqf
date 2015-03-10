/*
	Author: Karel Moricky

	Description:
	Creates (or returns if it already exists) trigger with size of map

	Parameter(s):
	NOTHING

	Returns:
	OBJECT
*/

if (isnil "hsim_worldArea") then {
	_worldPath = configfile >> "cfgworlds" >> worldname;
	_mapSize = getnumber (_worldPath >> "mapSize");
	if (_mapSize == 0) then {["mapSize param not defined for '%1'",worldname] call bis_fnc_halt};
	_mapSize = _mapSize / 2;

	_mapCenter = [
		_mapSize,
		_mapSize
	];

	hsim_worldArea = createtrigger ["emptydetector",_mapCenter];
	hsim_worldArea settriggerarea [_mapSize,_mapSize,0,true];
	hsim_worldArea
} else {
	hsim_worldArea
};