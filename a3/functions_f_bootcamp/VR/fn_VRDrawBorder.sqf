/*
	Author: Josef Zemanek

	Description:
	Visualizes area border (used primarily for VR missions).

	Parameter(s):
		0: ARRAY - center position
		1: NUMBER - radius

	Returns:
	Array of objects used for the wall (so they can be easily deleted)
*/

private ["_pos1", "_rds", "_steps", "_radStep", "_pos2", "_wall", "_ret"];
_pos1 = [_this,0,position player,[[]]] call BIS_fnc_param;
_rds = [_this,1,800,[0]] call BIS_fnc_param;
_ret = [];

_steps = floor ((2 * pi * _rds) / 40);
_radStep = 360 / _steps;

for [{_i = 0}, {_i < 360}, {_i = _i + _radStep}] do {
	//for [{_x = 0}, {_x <= 300}, {_x = _x + 100}] do {
	for [{_x = 0}, {_x <= 0}, {_x = _x + 100}] do {
		_pos2 = [_pos1, _rds, _i] call BIS_fnc_relPos;
		_pos2 set [2, _x];
		_wall = "VR_Billboard_01_F" createVehicle _pos2;
		_wall setPos _pos2;
		_wall setDir _i;
		_ret = _ret + [_wall];
	};
};

//{_x setObjectTexture [0, "#(argb,8,8,3)color(1,0,0,0.5,co)"]} forEach _ret;

_ret