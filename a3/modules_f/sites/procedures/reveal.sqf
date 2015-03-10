{
	if (!(_x in (player getVariable "BIS_knownSites"))) then {
		player setVariable ["BIS_knownSites", (player getVariable "BIS_knownSites") + [_x], TRUE];
		_x call BIS_siteEvent_visited
	}
} forEach _this