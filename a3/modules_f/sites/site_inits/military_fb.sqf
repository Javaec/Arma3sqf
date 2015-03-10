_this setVariable ["garrison", []];

_siteSide = _this call BIS_getCorrectSiteSide;

_newGrp = [position _this, _siteSide, [_this getVariable "faction", "motorized"] call BIS_pickSiteGroup, [], [], [0.2, 0.5]] call BIS_fnc_spawnGroup;

_this setVariable ["garrison", (_this getVariable "garrison") + [_newGrp]];

[_newGrp, _this] execFSM "A3\modules_f\sites\behaviour\military_garrison.fsm";