_this setVariable ["garrison", []];

_siteSide = _this call BIS_getCorrectSiteSide;

_newGrp = [[position _this, 7, random 360] call BIS_fnc_relPos, _siteSide, [_this getVariable "faction", "sentry"] call BIS_pickSiteGroup, [], [], [0.2, 0.5]] call BIS_fnc_spawnGroup;
_newVeh = [position _this, direction _this, [_this getVariable "faction", "AA_battery"] call BIS_pickSiteUnit, _newGrp] call BIS_fnc_spawnVehicle;

_newGrp selectLeader effectiveCommander (_newVeh select 0);

_this setVariable ["garrison", (_this getVariable "garrison") + [_newGrp]];

[_newGrp, _this] execFSM "A3\modules_f\sites\behaviour\military_garrison.fsm";

[_this, "sentry", 2] call BIS_spawnSitePatrol