/*
	Author: Josef Zemanek

	Description:
	Visualizes surface grid (used primarily for VR missions).
	NOTE: Only one instance of grid visualisation can run at any given time. Calling this function multiple times will only move the grid center

	Parameter(s):
		0:	ARRAY - center position (should be multiple of 4 in both axis to correspond with the tiles on the ground, like [1000,1000] or [2400,2400])
			or
			BOOL - use FALSE to disable grid visualisation
		1:	(Optional) ARRAY - grid color [R,G,B,A], default black [0,0,0,1];


	Returns:
	Nothing
*/

private ["_input"];
_input = [_this,0,[position player select 0, position player select 1],[[], TRUE]] call BIS_fnc_param;
BIS_VR_groundGridDraw_color = [_this,1,[0,0,0,1],[[]]] call BIS_fnc_param;

if (!isNil "BIS_VR_groundGridDraw" && if (typeName _input == typeName TRUE) then {!_input} else {TRUE}) then {
	removeMissionEventHandler ["Draw3D", BIS_VR_groundGridDraw];
};

if (typeName _input == typeName []) then {
	BIS_VR_groundGridDraw_center = _input;
	BIS_VR_groundGridDraw = addMissionEventHandler ["Draw3D", {
		_rad = 148;
		_step = 4;
		_color = BIS_VR_groundGridDraw_color;
		_alphaStep = 10e-5;
		if (cameraOn == player) then {
			_alphaStep = 1/301;
		};
		_pos = [(BIS_VR_groundGridDraw_center select 0) - _rad, (BIS_VR_groundGridDraw_center select 1) - _rad];
		for [{_x = -_rad}, {_x < _rad}, {_x = _x + _step}] do {
			drawLine3D [[(_pos select 0) - _rad, (_pos select 1) + _x, 0], [(_pos select 0) + _rad, (_pos select 1) + _x, 0.01], [_color select 0, _color select 1, _color select 2, 1 - (_alphaStep * abs ((_pos select 1) + _x - (position player select 1)))]];
			drawLine3D [[(_pos select 0) + _x, (_pos select 1) - _rad, 0], [(_pos select 0) + _x, (_pos select 1) + _rad, 0.01], [_color select 0, _color select 1, _color select 2, 1 - (_alphaStep * abs ((_pos select 0) + _x - (position player select 0)))]];
		};
		_pos = [(BIS_VR_groundGridDraw_center select 0) + _rad, (BIS_VR_groundGridDraw_center select 1) - _rad];
		for [{_x = -_rad}, {_x < _rad}, {_x = _x + _step}] do {
			drawLine3D [[(_pos select 0) - _rad, (_pos select 1) + _x, 0], [(_pos select 0) + _rad, (_pos select 1) + _x, 0.01], [_color select 0, _color select 1, _color select 2, 1 - (_alphaStep * abs ((_pos select 1) + _x - (position player select 1)))]];
			drawLine3D [[(_pos select 0) + _x, (_pos select 1) - _rad, 0], [(_pos select 0) + _x, (_pos select 1) + _rad, 0.01], [_color select 0, _color select 1, _color select 2, 1 - (_alphaStep * abs ((_pos select 0) + _x - (position player select 0)))]];
		};
		_pos = [(BIS_VR_groundGridDraw_center select 0) - _rad, (BIS_VR_groundGridDraw_center select 1) + _rad];
		for [{_x = -_rad}, {_x < _rad}, {_x = _x + _step}] do {
			drawLine3D [[(_pos select 0) - _rad, (_pos select 1) + _x, 0], [(_pos select 0) + _rad, (_pos select 1) + _x, 0.01], [_color select 0, _color select 1, _color select 2, 1 - (_alphaStep * abs ((_pos select 1) + _x - (position player select 1)))]];
			drawLine3D [[(_pos select 0) + _x, (_pos select 1) - _rad, 0], [(_pos select 0) + _x, (_pos select 1) + _rad, 0.01], [_color select 0, _color select 1, _color select 2, 1 - (_alphaStep * abs ((_pos select 0) + _x - (position player select 0)))]];
		};
		_pos = [(BIS_VR_groundGridDraw_center select 0) + _rad, (BIS_VR_groundGridDraw_center select 1) + _rad];
		for [{_x = -_rad}, {_x < _rad}, {_x = _x + _step}] do {
			drawLine3D [[(_pos select 0) - _rad, (_pos select 1) + _x, 0], [(_pos select 0) + _rad, (_pos select 1) + _x, 0.01], [_color select 0, _color select 1, _color select 2, 1 - (_alphaStep * abs ((_pos select 1) + _x - (position player select 1)))]];
			drawLine3D [[(_pos select 0) + _x, (_pos select 1) - _rad, 0], [(_pos select 0) + _x, (_pos select 1) + _rad, 0.01], [_color select 0, _color select 1, _color select 2, 1 - (_alphaStep * abs ((_pos select 0) + _x - (position player select 0)))]];
		};
	}];
};