_siteSide = _this call BIS_getCorrectSiteSide;

_newGrp = [position _this, _siteSide, [_this getVariable "faction", "sentry"] call BIS_pickSiteGroup, [], [], [0.2, 0.5]] call BIS_fnc_spawnGroup;