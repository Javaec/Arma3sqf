/*
	Author: Josef Zemanek

	Description:
	VR unit spawn effect.

	Parameter(s):
		0: OBJECT - Spawned unit
		1: BOOL (Optional) - Reverse effect (hiding), default FALSE

	Returns:
	Nothing
*/

private ["_unit", "_reverse", "_relDir", "_pos", "_block1", "_block2"];

_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_reverse = [_this,1,FALSE,[TRUE]] call BIS_fnc_param;

if (isDedicated) exitWith {};

if !(_reverse) then {
	_unit hideObject TRUE;
	_unit spawn {sleep 0.6; _this hideObject FALSE};
} else {
	_unit hideObject FALSE;
	_unit spawn {sleep 0.6; _this hideObject TRUE};
};

_relDir = [_unit, player] call BIS_fnc_dirTo;

_pos = [getPosATL _unit, 1, _relDir] call BIS_fnc_relPos;
_pos vectorAdd [0,0,1];

_block = "UserTexture_1x2_F" createVehicle _pos;
_block setPosATL _pos;

_unit say3D "Spawn";

_block setDir (_relDir + 180);
if !(_reverse) then {
	_block spawn {
		_i = 0;
		_var = 1 + floor random 3;
		while {_i <= 20} do {
			_i2 = str _i;
			if (_i < 10) then {_i2 = "0" + _i2};
			_this setObjectTexture [0, format ["\A3\Ui_f\data\IGUI\RscTitles\Static\EntityTransit\Variant%2\VR_EntityTransit_%1.paa", _i2, _var]];
			_i = _i + 1;
			sleep 0.05;
		};
		deleteVehicle _this;
	};
} else {
	_block spawn {
		_i = 20;
		_var = 1 + floor random 3;
		while {_i >= 0} do {
			_i2 = str _i;
			if (_i < 10) then {_i2 = "0" + _i2};
			_this setObjectTexture [0, format ["\A3\Ui_f\data\IGUI\RscTitles\Static\EntityTransit\Variant%2\VR_EntityTransit_%1.paa", _i2, _var]];
			_i = _i - 1;
			sleep 0.05;
		};
		deleteVehicle _this;
	};
};