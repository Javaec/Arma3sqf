//Parameters
private ["_fogValue", "_fogDecay", "_fogBase", "_seconds"];
_fogValue 	= [_this, 0, 1, [0]] call BIS_fnc_param;
_fogDecay	= [_this, 1, 0.01, [0]] call BIS_fnc_param;
_fogBase	= [_this, 2, 0, [0]] call BIS_fnc_param;
_seconds	= [_this, 3, 10, [0]] call BIS_fnc_param;

//Current fog parameters
private ["_fogParams", "_fogValueOld", "_fogDecayOld", "_fogBaseOld"];
_fogParams		= fogParams;
_fogValueOld 	= _fogParams select 0;
_fogDecayOld	= _fogParams select 1;
_fogBaseOld		= _fogParams select 2;

//Interpolation directions
private ["_fogValueUp", "_fogDecayUp", "_fogBaseUp"];
_fogValueUp = if (_fogValue > _fogValueOld) then { true } else { false };
_fogDecayUp = if (_fogDecay > _fogDecayOld) then { true } else { false };
_fogBaseUp 	= if (_fogBase > _fogBaseOld) then { true } else { false };

while {
	if (_fogValueUp) then { _fogValueOld >= _fogValue } else { _fogValueOld <= _fogValue }
	||
	if (_fogDecayUp) then { _fogDecayOld >= _fogDecay } else { _fogDecayOld <= _fogDecay }
	||
	if (_fogBaseUp) then { _fogBaseOld >= _fogBase } else { _fogBaseOld <= _fogBase }
} do {
	//Interpolation distances
	private ["_fogValueDistance", "_fogDecayDistance", "_fogBaseDistance"];
	_fogValueDistance 	= abs(_fogValue - _fogValueOld);
	_fogDecayDistance	= abs(_fogDecay - _fogDecayOld);
	_fogBaseDistance 	= abs(_fogBase - _fogBaseOld);

	//The change rate
	private "_rate";
	_rateValue 	= _fogValueDistance / _seconds;
	_rateDecay 	= _fogDecayDistance / _seconds;
	_rateBase 	= _fogBaseDistance / _seconds;
	
	_fogValueOld 	= _fogValueOld + _rateValue;
	_fogDecayOld 	= _fogDecayOld + _rateDecay;
	_fogBaseOld 	= _fogBaseOld + _rateBase;
	
	0 setFog [_fogValueOld, _fogDecayOld, _fogBaseOld];
	
	sleep 1;
};

//Log
["Fog interpolated to [%1, %2, %3] in %4 seconds", _fogValue, _fogDecay, _fogBase, _seconds] call BIS_fnc_logFormat;
