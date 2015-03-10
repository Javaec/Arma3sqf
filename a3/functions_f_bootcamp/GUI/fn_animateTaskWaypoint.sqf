/*
	Author: Josef Zemanek

	Description:
	Animates task waypoint up & down

	Parameter(s):
		0: OBJECT - Unit who's waypoints will be animated

	Returns:
	NONE
*/

_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;

_null = _unit spawn {
	_incr = 0;
	_curTask = "";
	_step = 0;
	_dest = [0,0,0];
	_dist = 0;
	_i = 1;
	while {TRUE} do {
		_wiggle = FALSE;
		if ((_this call BIS_fnc_taskCurrent) != "") then {
			_curTask = _this call BIS_fnc_taskCurrent;
			_destData = (_curTask call BIS_fnc_taskDestination) select 0;
			if (typeName _destData == typeName 0) then {
				_wiggle = TRUE;
				_dest = (_curTask call BIS_fnc_taskDestination);
				_dist = _this distance _dest;
				_step = _dist * 0.001 * _i;
			};
		};
		if (_wiggle) then {
			if (_incr >= (_dist * 0.015) && _step > 0) then {_i = -1};
			if (_incr <= 0) then {_i = 1;};
			_incr = _incr + _step;
			[_curTask, [_dest select 0, _dest select 1, _incr]] call BIS_fnc_taskSetDestination;
		};
		sleep 0.01;
	};
};