/*
	Author: Jiri Wainar

	Description:
	Return list of nearby enemy targets for given unit.

	Parameter(s):
	_this: unit that is inspected

	Returns:
	_targets:array (empty array if unit doesn't know about any enemy)

	Example:
	_targets:array = _unit call BIS_fnc_enemyTargets;
	_targets:array = [_unit(,_distance)] call BIS_fnc_enemyTargets;
*/

private["_pivot","_distance","_targets","_enemies","_enemySides","_side","_unit"];

_pivot    = [_this,0,objNull,[objNull]] call bis_fnc_param;
_distance = [_this,1,300,[123]] call bis_fnc_param;

_targets  = _pivot nearTargets _distance;

_enemies = [];

_enemySides = _pivot call BIS_fnc_enemySides;

{
	_unit = (_x select 4);
	_side = (_x select 2);

	if ((_side in _enemySides) && (count crew _unit > 0)) then
	{
		if ((side driver _unit) in _enemySides) then
		{
			_enemies set [count _enemies, _unit];
		};
	};
}
forEach _targets;

_enemies