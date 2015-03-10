private ["_pos"];

{
	for [{_i = 0}, {_i < (_x select 6)}, {_i = _i + 1}] do {
		_pos = [BIS_compoCenter, _x select 3, _x select 4] call BIS_fnc_relPos;
		_pos set [2, (_x select 2) + ((_x select 5) * _i)];
		_obj = (_x select 0) createVehicle _pos;
		_obj setPosATL _pos;
		_obj setDir (_x select 1);
	};
} forEach _this;