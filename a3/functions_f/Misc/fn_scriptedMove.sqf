_this spawn {

	_guy = _this select 0;
	_wps = _this select 1;
	_walkAnim = "AmovPercMwlkSnonWnonDf";
	_animLength = 3.51428;
	_code = {};
	if (count _this > 2) then {_code = _this select 2};
	if (count _this > 3) then {_walkAnim = _this select 3; _animLength = _this select 4};
	
	_guy disableAI "MOVE";

	//calculate total distance to walk and how many times we need to play the walk animation
	_dist = _guy distance (_wps select 0);
	_i = 1;
	while {_i < count _wps} do {
		_dist = _dist + ((_wps select (_i - 1)) distance (_wps select _i));
		_i = _i + 1
	};
	_animLoops = ceil (_dist / _animLength);
	textLogFormat ["SCRIPTED WALK: %1 will walk %2 meters using %3 animations '%4'.", name _guy, _dist, _animLoops, _walkAnim];
	
	[_guy, _wps] spawn {
		_guy = _this select 0;
		_wps = _this select 1;
		_i = 0;
		
		//procedure for smooth turning
		_turningProc = {
			_this spawn {
				_guy = _this select 0;
				_wp = _this select 1;
				_dir = [_guy, _wp] call BIS_fnc_dirTo;
				if (_dir < 0) then {_dir = 360 + _dir};
				_degs = _dir - direction _guy;
				if (abs _degs > 180) then {_degs = _degs + (360 * (_degs / abs _degs) * (-1))};
				_step = _degs / 20;
				while {(abs _degs > abs _step) && BIS_scriptedMoveEnabled} do {
					_guy setDir (direction _guy + _step);
					_degs = _dir - direction _guy;
					sleep 0.025
				};
				_guy setDir ([_guy, _wp] call BIS_fnc_dirTo)
			}
		};
		
		//make sure the unit faces its first waypoint
		[_guy, _wps select 0] call _turningProc;
		
		//turn the unit at each waypoint
		while {_i < count _wps} do {
			waitUntil {[(position _guy) select 0, (position _guy) select 1] distance [(_wps select _i) select 0, (_wps select _i) select 1] < 0.5 || if (_i > 0) then {(_guy distance (_wps select (_i - 1))) > ((_wps select _i) distance (_wps select (_i - 1)))} else {FALSE}};
			[_guy, _wps select (_i + 1)] call _turningProc;
			textLogFormat ["SCRIPTED WALK: %1 just reached WP #%2 (of %3).", name _guy, _i + 1, count _wps];
			_i = _i + 1
		}
	};
	
	waitUntil {[_guy, _wps select 0] call BIS_fnc_relativeDirTo < 30};
	
	//playing walk animations
	_i = 1;
	while {(_i <= _animLoops && !(isPlayer _guy)) && BIS_scriptedMoveEnabled} do {
		_nic = [objNull, _guy, rPLAYMOVE, _walkAnim] call RE;
		_i = _i + 1;
		sleep 0.1
	};
	
	//a code can be executed once the unit finished walking
	waitUntil {speed _guy < 0.25};
	_guy enableAI "MOVE";
	call _code
}