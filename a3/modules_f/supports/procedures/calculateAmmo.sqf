_vehType = typeOf vehicle (_this select 0);
_ammoType = _this select 1;
_tgt = _this select 2;
_area = 200;
_batteries = [];
_roundsLeft = 0;

_weaponUsed = "";
{if (_ammoType in getArray (configFile >> "CfgWeapons" >> _x >> "magazines")) then {_weaponUsed = _x}} forEach weapons vehicle (_this select 0);

{
	if (
		!(vehicle _x in _batteries) &&
		typeOf vehicle _x == _vehType &&
		_ammoType in (getArtilleryAmmo [vehicle _x]) &&
		canFire vehicle _x && !isNull gunner vehicle _x &&
		_tgt inRangeOfArtillery [[vehicle _x], _ammoType]
	) then {
		_batteries = _batteries + [vehicle _x]
	}
} forEach units (_this select 0);

/*{_roundsLeft = _roundsLeft + (_x ammo _weaponUsed)} forEach _batteries;*/

{
	_curAmmo = magazinesAmmo _x;
	{
		if ((_x select 0) == _ammoType) exitWith {_roundsLeft = _roundsLeft + (_x select 1)};
	} forEach _curAmmo;
} forEach _batteries;

_roundsLeft