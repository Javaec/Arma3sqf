_center = _this select 0;
_radius = _this select 1;

_circum = 2 * pi * _radius;

_steps = 60;
_degStep = 360 / _steps;

_color = format ["#(argb,8,8,3)color(%1,%2,%3,%4,co)", BIS_TT_colorWarning select 0, BIS_TT_colorWarning select 1, BIS_TT_colorWarning select 2, BIS_TT_colorWarning select 3];

for [{_x = 0}, {_x < _steps}, {_x = _x + 1}] do {
	_pos = [_center, _radius, _degStep * _x] call BIS_fnc_relPos;
	_mrkr = "Sign_Sphere100cm_F" createVehicle _pos;
	_mrkr setPos _pos;
	_mrkr setObjectTexture [0, _color];
};