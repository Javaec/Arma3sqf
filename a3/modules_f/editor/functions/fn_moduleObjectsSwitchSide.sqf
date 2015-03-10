private ["_logic","_units","_sideId","_sides","_side","_groups","_grp"];

_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_units = [_this,1,[],[[]]] call bis_fnc_param;

//--- Extract the user defined side from module arguments
_sideId = parsenumber (_logic getvariable ["side","0"]) max 0 min 3;
_sides = [east,west,resistance,civilian];
_side = _sides select _sideId;

//--- Detect groups of affected units
_groups = [];
{
	_grp = group _x;
	if (!(_grp in _groups) && side _grp != _side && side _grp in _sides) then {_groups set [count _groups,_grp];};
} foreach _units;

//--- Create new groups and move all units to them
createcenter _side;
{
	_leader = leader _x;
	_grp = creategroup _side;
	units _x joinsilent _grp;
	_grp selectleader _leader;
	deletegroup _x;
} foreach _groups;

true