private ["_heliport","_missions"];

//_heliport = [_this,0,worldname,[""]] call bis_fnc_param;
//_missions = [hsim_heliportDB,[_heliport,"missions"]] call BIS_fnc_dbClassList;

_missions = [] call BIS_fnc_heliportMissionList;
if (count _missions > 0) then {
	_missions select (count _missions - 1);
} else {
	""
};