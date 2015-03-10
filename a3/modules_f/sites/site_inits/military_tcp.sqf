_closeRoads = (position _this) nearRoads 10;

if (count _closeRoads == 0) exitWith {["[SITES] Warning: No roads close enough to %1", _this] call BIS_fnc_logFormat};

_this setVariable ["garrison", []];

_occupation = 0.5;

if (isNil {_this getVariable "buildingOccupationIndex"}) then {_occupation = (0.3 + random 0.7)} else {_occupation = parseNumber (_this getVariable "buildingOccupationIndex")};
{[_x, _this, _occupation] call BIS_occupySiteBuilding} forEach (position _this nearObjects ["House", 200]);

_closestRoad = _closeRoads select 0;
{if ((position _x distance position _this) < (position _closestRoad distance position _this)) then {_closestRoad = _x}} forEach _closeRoads;

_cpDir = direction _closestRoad;
_dir1 = direction _closestRoad; _dir2 = direction _this;
if (_dir1 - _dir2 < 0) then {_dir1 = direction _this; _dir2 = direction _closestRoad};
if (abs (_dir1 - _dir2) > 90) then {_cpDir = ((direction _closestRoad) - 180)};

_siteSide = _this call BIS_getCorrectSiteSide;
_grp1 = createGroup _siteSide;
_grp2 = createGroup _siteSide;

_dir1 = [_closestRoad, _this] call BIS_fnc_dirTo;
_dir2 = direction _closestRoad;
if (abs (_dir1 - _dir2) > 90) then {_dir2 = _dir2 + 180};
_relDir = abs (_dir1 - _dir2);
_dist = ((cos _relDir) * (_closestRoad distance _this));

_centerPos = [_closestRoad, _dist, _dir2] call BIS_fnc_relPos;

_guard1 = _grp1 createUnit [[_this getVariable "faction", "rifleman"] call BIS_pickSiteUnit, [_centerPos, abs (((boundingBox _closestRoad) select 0) select 0), _cpDir - 90] call BIS_fnc_relPos, [], 0, "NONE"];
_guard1 setFormDir _cpDir; _guard1 setDir _cpDir; 
_guard2 = _grp2 createUnit [[_this getVariable "faction", "autorifleman"] call BIS_pickSiteUnit, [_centerPos, abs (((boundingBox _closestRoad) select 0) select 0), _cpDir + 90] call BIS_fnc_relPos, [], 0, "NONE"];
_guard2 setFormDir _cpDir; _guard2 setDir _cpDir;

_this setVariable ["garrison", (_this getVariable "garrison") + [_grp1, _grp2]];

_mrkrName = ("BIS_site_" + str ((BIS_missionScope getVariable "sites") find _this));

_mrkrName setMarkerPos _centerPos;