_this setVariable ["garrison", []];

private ["_occupation"];

if (isNil {_this getVariable "buildingOccupationIndex"}) then {_occupation = (0.3 + random 0.7)} else {_occupation = parseNumber (_this getVariable "buildingOccupationIndex")};
{[_x, _this, _occupation] call BIS_occupySiteBuilding} forEach (position _this nearObjects ["House", parseNumber (_this getVariable "axisA")]);

_siteSide = _this call BIS_getCorrectSiteSide;

_newGrp = [position _this, _siteSide, [_this getVariable "faction", "motorized"] call BIS_pickSiteGroup, [], [], [0.2, 0.5]] call BIS_fnc_spawnGroup;
_newGrp setFormation "DIAMOND";

_this setVariable ["garrison", (_this getVariable "garrison") + [_newGrp]];

_newGrp = [[position _this, 50, random 360] call BIS_fnc_relPos, _siteSide, [_this getVariable "faction", "motorized"] call BIS_pickSiteGroup, [], [], [0.2, 0.5]] call BIS_fnc_spawnGroup;
_newGrp setFormation "DIAMOND";

_this setVariable ["garrison", (_this getVariable "garrison") + [_newGrp]];

[_newGrp, _this] execFSM "A3\modules_f\sites\behaviour\military_garrison.fsm";

[_this, "sentry", 2] call BIS_spawnSitePatrol