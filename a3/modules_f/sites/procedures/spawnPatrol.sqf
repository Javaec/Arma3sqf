_site = _this select 0;
_grpType = _this select 1;
_cnt = _this select 2;

_cntr = position _site;
_avgTmout = 10;

_newGrp = grpNull;

_siteSide = switch (_site getVariable "side") do {
	case "BLUFOR": {WEST};
	case "OPFOR": {EAST};
	case "Independent": {RESISTANCE}
};

if (isNil {_site getVariable "garrison"}) then {_site setVariable ["garrison", []]};

for [{_i = 1}, {_i <= _cnt}, {_i = _i + 1}] do {
	if ((_i mod 2) == 0) then {

		_radius = 100 * _i;
		_pos = [(_cntr select 0) - _radius, (_cntr select 1) - _radius];
		
		if (!surfaceIsWater _pos) then {
			_newGrp = [_pos, _siteSide, [_site getVariable "faction", "sentry"] call BIS_pickSiteGroup, [], [], [0.2, 0.5]] call BIS_fnc_spawnGroup;
			
			_site setVariable ["garrison", (_site getVariable "garrison") + [_newGrp]];
		
			_wpPos = [(_cntr select 0) - _radius, (_cntr select 1) - _radius];
			if (!surfaceIsWater _wpPos) then {
				_wp1 = _newGrp addWaypoint [_wpPos, 25];
				_wp1 setWaypointType "MOVE";
				_wp1 setWaypointSpeed "LIMITED";
				_wp1 setWaypointBehaviour "SAFE";
				_wp1 setWaypointTimeout [_avgTmout * 0.5, _avgTmout, _avgTmout * 1.5];
			};
		
			_wpPos = [(_cntr select 0) - _radius, (_cntr select 1) + _radius];
			if (!surfaceIsWater _wpPos) then {
				_wp2 = _newGrp addWaypoint [_wpPos, 25];
				_wp2 setWaypointType "MOVE";
				_wp2 setWaypointSpeed "LIMITED";
				_wp2 setWaypointBehaviour "SAFE";
				_wp2 setWaypointTimeout [_avgTmout * 0.5, _avgTmout, _avgTmout * 1.5];
			};
		
			_wpPos = [(_cntr select 0) + _radius, (_cntr select 1) + _radius];
			if (!surfaceIsWater _wpPos) then {
				_wp3 = _newGrp addWaypoint [_wpPos, 25];
				_wp3 setWaypointType "MOVE";
				_wp3 setWaypointSpeed "LIMITED";
				_wp3 setWaypointBehaviour "SAFE";
				_wp3 setWaypointTimeout [_avgTmout * 0.5, _avgTmout, _avgTmout * 1.5];
			};
		
			_wpPos = [(_cntr select 0) + _radius, (_cntr select 1) - _radius];
			if (!surfaceIsWater _wpPos) then {
				_wp4 = _newGrp addWaypoint [_wpPos, 25];
				_wp4 setWaypointType "MOVE";
				_wp4 setWaypointSpeed "LIMITED";
				_wp4 setWaypointBehaviour "SAFE";
				_wp4 setWaypointTimeout [_avgTmout * 0.5, _avgTmout, _avgTmout * 1.5];
			};
		
			_wp5 = _newGrp addWaypoint [position leader _newGrp, 25];
			_wp5 setWaypointType "CYCLE";
			_wp5 setWaypointSpeed "LIMITED";
			_wp5 setWaypointBehaviour "SAFE";
			_wp5 setWaypointTimeout [0, 0, 0];
		}
		
	} else {
		
		_radius = 100 * _i;
		_pos = [(_cntr select 0) + _radius, (_cntr select 1) + _radius];
		
		if (!surfaceIsWater _pos) then {
			_newGrp = [_pos, _siteSide, [_site getVariable "faction", "sentry"] call BIS_pickSiteGroup, [], [], [0.2, 0.5]] call BIS_fnc_spawnGroup;
			
			_site setVariable ["garrison", (_site getVariable "garrison") + [_newGrp]];
			
			_wpPos = [(_cntr select 0) + _radius, (_cntr select 1) + _radius];
			if (!surfaceIsWater _wpPos) then {
				_wp1 = _newGrp addWaypoint [_wpPos, 25];
				_wp1 setWaypointType "MOVE";
				_wp1 setWaypointSpeed "LIMITED";
				_wp1 setWaypointBehaviour "SAFE";
				_wp1 setWaypointTimeout [_avgTmout * 0.5, _avgTmout, _avgTmout * 1.5];
			};
		
			_wpPos = [(_cntr select 0) - _radius, (_cntr select 1) + _radius];
			if (!surfaceIsWater _wpPos) then {
				_wp2 = _newGrp addWaypoint [_wpPos, 25];
				_wp2 setWaypointType "MOVE";
				_wp2 setWaypointSpeed "LIMITED";
				_wp2 setWaypointBehaviour "SAFE";
				_wp2 setWaypointTimeout [_avgTmout * 0.5, _avgTmout, _avgTmout * 1.5];
			};
		
			_wpPos = [(_cntr select 0) - _radius, (_cntr select 1) - _radius];
			if (!surfaceIsWater _wpPos) then {
				_wp3 = _newGrp addWaypoint [_wpPos, 25];
				_wp3 setWaypointType "MOVE";
				_wp3 setWaypointSpeed "LIMITED";
				_wp3 setWaypointBehaviour "SAFE";
				_wp3 setWaypointTimeout [_avgTmout * 0.5, _avgTmout, _avgTmout * 1.5];
			};
		
			_wpPos = [(_cntr select 0) + _radius, (_cntr select 1) - _radius];
			if (!surfaceIsWater _wpPos) then {
				_wp4 = _newGrp addWaypoint [_wpPos, 25];
				_wp4 setWaypointType "MOVE";
				_wp4 setWaypointSpeed "LIMITED";
				_wp4 setWaypointBehaviour "SAFE";
				_wp4 setWaypointTimeout [_avgTmout * 0.5, _avgTmout, _avgTmout * 1.5];
			};
		
			_wp5 = _newGrp addWaypoint [position leader _newGrp, 25];
			_wp5 setWaypointType "CYCLE";
			_wp5 setWaypointSpeed "LIMITED";
			_wp5 setWaypointBehaviour "SAFE";
			_wp5 setWaypointTimeout [0, 0, 0];
		}

	};

	if (!isNull _newGrp) then {
		[_site, _newGrp] spawn {
			if (isNil {(_this select 0) getVariable "garrison"}) exitWith {};
			
			waitUntil {behaviour leader (((_this select 0) getVariable "garrison") select 0) == "COMBAT"};
			(_this select 1) setBehaviour "AWARE";
			(_this select 1) setSpeedMode "FULL";
			leader (_this select 1) move position (_this select 0);
		}
	}
}