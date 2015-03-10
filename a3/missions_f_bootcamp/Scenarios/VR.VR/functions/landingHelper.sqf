_pads = [];
_padsPreload = [];

for [{_i = 0}, {_i < 6}, {_i = _i + 1}] do {
	_pad = "VR_Sector_01_60deg_50_grey_F" createVehicle [-1000,-1000,1000];
	_padPreload = "VR_Sector_01_60deg_50_grey_F" createVehicle [-1000,-1000,1000];
	_pads = _pads + [_pad];
	_padsPreload = _padsPreload + [_padPreload];
	_pad setDir (60 * _i);
};

_b = 0;
_oldS = 0;
_oldH = 0;

while {vehicle player != player} do {
	_h = (position vehicle player) select 2;
	_s = abs (vectorMagnitude (velocity vehicle player)) * 3.6;
	{
		_pos = [vehicle player, _h * 2, direction vehicle player + (60 * _forEachIndex)] call BIS_fnc_relPos;
		_pos = [_pos, 25.7, direction vehicle player + (60 * _forEachIndex)] call BIS_fnc_relPos;
		_pos set [2, 0.05];
		_x setPos _pos;
		_x setDir direction vehicle player + (60 * _forEachIndex);
	} forEach _pads;
	if (abs (_s - _oldS) > 1 || abs (_h - _oldH) > 1) then {
		_oldS = _s;
		_oldH = _h;
		_r = 0;
		_g = 0;
		_a = 0;
		if (_s < 50) then {
			_g = (50 - round _s) * 0.02;
			_r = 1 - _g;
		} else {
			_r = 1;
			_g = 0;
		};
		if (_h < 75 && _h >= 50) then {
			_a = (75 - round _h) * 0.002;
		} else {
			if (_h >= 60) then {
				_a = 0;
			} else {
				_a = 0.05;
			};
		};
		_clr = format ["#(argb,8,8,3)color(%1,%2,%3,%4,co)", _r, _g, _b, _a];
		{
			_x setObjectTexture [0, _clr];
			_x setObjectTexture [1, _clr];

		} forEach _padsPreload;
		[_pads, _padsPreload, _clr] spawn {
			waitUntil {{!(1 preloadObject _x)} count (_this select 1) == 0 || !BIS_interruptable};
			if (BIS_interruptable) then {
				{
					_x setObjectTexture [0, (_this select 2)];
					_x setObjectTexture [1, (_this select 2)];
				} forEach (_this select 0);
			};
		};
	};
	sleep 0.01;
};