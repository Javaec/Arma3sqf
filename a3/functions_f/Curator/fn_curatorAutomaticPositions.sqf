private ["_pos","_size","_findPos","_var","_varInfantry","_varGround","_varAir","_varWater","_positionsInfantry","_positionsGround","_positionsAir","_positionsWater"];

_pos = _this select 0;
_size = _this select 1;

_var = ("BIS_fnc_moduleMPTypeDefense_" + str _pos + "_" + str _size + "_") call bis_fnc_filterstring;
_varInfantry = _var + "positionsInfantry";
_varGround = _var + "positionsGround";
_varAir = _var + "positionsAir";
_varWater = _var + "positionsWater";

_findPos = {
	private ["_array","_isWater","_pos","_xIsWater"];
	_array = _this select 0;
	_isWater = _this select 1;
	{
		_pos = _x select 0;
		_xIsWater = surfaceiswater _pos;
		if (_isWater) then {_xIsWater = !_xIsWater};
		if (_xIsWater) then {_pos = -1;};
		_array set [_foreachindex,_pos];	
	} foreach _array;
	_array = _array - [-1];
	_array
};

_positionsInfantry = missionnamespace getvariable _varInfantry;
if (isnil {_positionsInfantry}) then {
	_positionsInfantry = selectbestplaces [_pos,_size,"forest",1,10];
	_positionsInfantry = [_positionsInfantry,false] call _findPos;
	missionnamespace setvariable [_varInfantry,_positionsInfantry];
	publicvariable _varInfantry;
};

_positionsGround = missionnamespace getvariable _varGround;
if (isnil {_positionsGround}) then {
	_positionsGround = _pos nearroads _size;
	missionnamespace setvariable [_varGround,_positionsGround];
	publicvariable _varGround;
};

_positionsAir = missionnamespace getvariable _varAir;
if (isnil {_positionsAir}) then {
	_positionsAir = selectbestplaces [_pos,_size,"1",1,10];
	missionnamespace setvariable [_varAir,_positionsAir];
	publicvariable _varAir;
};

_positionsWater = missionnamespace getvariable _varWater;
if (isnil {_positionsWater}) then {
	_positionsWater = selectbestplaces [_pos,_size,"sea",1,10];
	_positionsWater = [_positionsWater,true] call _findPos;
	missionnamespace setvariable [_varWater,_positionsWater];
	publicvariable _varWater;
};

[_positionsInfantry,_positionsGround,_positionsAir,_positionsWater]