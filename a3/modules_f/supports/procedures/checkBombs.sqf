_ret = FALSE;

{
	_wpn = _x;
	_mags = getArray (configFile >> "CfgWeapons" >> _wpn >> "magazines");
	{
		_mag = _x;
		_ammo = getText (configFile >> "CfgMagazines" >> _mag >> "ammo");
		_sim = getText (configFile >> "CfgAmmo" >> _ammo >> "simulation");
		if (_sim == "shotMissile" && _this ammo _wpn > 0) then {_ret = TRUE};
	} forEach _mags
} forEach weapons _this;

_ret