/*
	File: PosToGrid.sqf
	Author: Karel Moricky

	Description:
	Converts array position to map grid position.
	The function is obsolete, is now replaced by engine command mapGridPosition

	Parameter(s):
	_this: Object, Array in format position or String with marker name

	Returns:
	Array in format ["X","Y"]
*/

private ["_pos","_grid","_gridArray","_coordCount","_gridX","_gridY"];
_pos = [[_this],0,[0,0,0]] call bis_fnc_param;
_pos = _pos call bis_fnc_position;
_grid = mapgridposition _pos;
_gridArray = toarray _grid;
_coordCount = count _gridArray / 2;
_gridX = [];
_gridY = [];
{
	if (_foreachindex < _coordCount) then {
		_gridX set [count _gridX,_x];
	} else {
		_gridY set [count _gridY,_x];
	};
} foreach (toarray _grid);
[tostring _gridX,tostring _gridY]