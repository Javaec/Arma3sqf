{
	if (leader _x == _x && !(_x isKindOf "Air")) then {
		group _x copyWaypoints BIS_planGuard;
		group _x setBehaviour "COMBAT";
		[group _x, 1] setWaypointType "SAD";
		[group _x, 1] setWaypointPosition [position _x, 50];
		[group _x, 1] setWaypointBehaviour "COMBAT";
		[group _x, 1] setWaypointSpeed "NORMAL";
	}
} forEach _this;

{if (side _x == WEST && (vehicle _x) isKindOf "Man") then {_x setBehaviour "COMBAT"; _x setSpeedMode "NORMAL"}} forEach allUnits;

"dir" setmarkerType "mil_arrow";