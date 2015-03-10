/*
	Author: Jiri Wainar

	Description:
	Return true if unit knows about nearby enemy unit or driven vehicle.

	Parameter(s):
	_this: unit that is inspected

	Returns:
	_knowsAboutEnemy:bool

	Example:
	_knowsAboutEnemy:bool = _unit call BIS_fnc_enemyDetected;
	_knowsAboutEnemy:bool = [_unit(,_distance)] call BIS_fnc_enemyDetected;
*/

count (_this call BIS_fnc_enemyTargets) > 0