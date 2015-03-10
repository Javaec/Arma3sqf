_minesType = _this getVariable "minesType";
_minesCnt = parseNumber (_this getVariable "minesCount");
_axisA = parseNumber (_this getVariable "axisA");
_axisB = parseNumber (_this getVariable "axisB");
_dir = direction _this;
_shape = _this getVariable "shape";

_h = 0;

if (_minesType == "UnderwaterMine") then {_h = -2};

_getPos = {};

if (_shape == "rectangle") then {
	_getPos = {
		_pos = [0,0,0];
		_coef = 1; if (random 1 >= 0.5) then {_coef = -1};
		_hpos = [_this, (random _axisB) * _coef, _dir] call BIS_fnc_relPos;
		_coef = 1; if (random 1 >= 0.5) then {_coef = -1};
		_pos = [_hpos, (random _axisA) * _coef, _dir + 90] call BIS_fnc_relPos;
		[_pos select 0, _pos select 1, _h];
	};
} else {
	_getPos = {
		_dir2 = random 360;
		_dir3 = _dir2 - _dir;
		_line1 = sqrt (((_axisA^2) * (_axisB^2)) / ((_axisB^2) + ((_axisA^2) * ((1/(tan _dir3))^2))));
		_line2 = _line1 * (1/(tan _dir3));
		_line = sqrt ((_line1^2) + (_line2)^2);
		_pos = [_this, random _line, _dir2] call BIS_fnc_relPos;
		[_pos select 0, _pos select 1, _h];
	};
};

for [{_x = 0}, {_x < _minesCnt}, {_x = _x + 1}] do {
	_pos = call _getPos;
	if (_minesType == "UnderwaterMineAB") then {_pos = [_pos select 0, _pos select 1, getTerrainHeightASL _pos]};
	_mine = createMine [_minesType, _pos, [], 0];
	_mine setDir _dir;
	{_side = _x; if (_side getFriend (_this call BIS_getCorrectSiteSide) == 1 || (_this getVariable "marked") == "Everyone") then {_side revealMine _mine}} forEach [WEST, EAST, RESISTANCE];
};