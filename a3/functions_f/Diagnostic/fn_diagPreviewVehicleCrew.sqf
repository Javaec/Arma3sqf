/*
	Author: Karel Moricky

	Description:
	Creates vehicles with their crew

	Parameter(s):
		0: STRING - vehicle class
		1: ARRAY - number of vehicles in format [rows,columns], total count being rows x columns
		2: NUMBER - distance between vehicles

	Returns:
	NOTHING
*/

_className = [_this,0,"",[""]] call bis_fnc_param;
_countArray = [_this,1,[10,10],[[]]] call bis_fnc_param;
_offset = [_this,5,10,[0]] call bis_fnc_param;

_countX = [_countArray,0,3,[0]] call bis_fnc_paramIn;
_countY = [_countArray,1,3,[0]] call bis_fnc_paramIn;
_count = _countX * _countY;

_class = configfile >> "cfgvehicles" >> _className;
if !(isclass _class) exitwith {["'%1' does not exist in CfgVehicles"] call bis_fnc_errorMsg;};

startloadingscreen [""];
for "_x" from 1 to _countX do {
	for "_y" from 1 to _countY do {
		_pos = [
			(position player select 0) + _offset * _x,
			(position player select 1) + _offset * _y,
			0
		];
		_vehArray = [_pos,0,_className,playerSide] call bis_fnc_spawnVehicle;
		_veh = _vehArray select 0;
		_vehCrew = _vehArray select 1;
		_vehGroup = _vehArray select 2;
		if (count _vehCrew > 0) then {
			_crewType = typeof (_vehCrew select 0);
			while {_veh emptypositions "cargo" > 0} do {
				_unit = _vehGroup createunit [_crewType,_pos,[],0,"none"];
				_unit assignascargo _veh;
				_unit moveincargo _veh;
			};
		};
		progressloadingscreen ((_x / _countX) + (_y / _countX / _countY));
	};
};


endloadingscreen;