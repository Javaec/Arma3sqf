_vehType = typeOf vehicle (_this select 0);
_ammoType = _this select 1;
_rounds = _this select 2;
_tgt = _this select 3;
_area = 200;
_batteries = [];
_batteriesSorted = [];
_distributed = 0;

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

{_x setVariable ["BIS_SUPP_rounds", 0, TRUE]} forEach _batteries;

for [{_x = (count _batteries) - 1}, {_x >= 0}, {_x = _x - 1}] do {
	_batteriesSorted = _batteriesSorted + [_batteries select _x]
};

while {_distributed < _rounds} do {
	{
		if (_distributed < _rounds) then {_x setVariable ["BIS_SUPP_rounds", (_x getVariable "BIS_SUPP_rounds") + 1, TRUE]; _distributed = _distributed + 1};
	} forEach _batteriesSorted;
};

{if ((_x getVariable "BIS_SUPP_rounds") == 0) then {_batteries = _batteries - [_x]}} forEach _batteries;

_batteries