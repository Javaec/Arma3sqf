/*
	Author: Karel Moricky

	Description:
	Lists all weapons and magazines available in a mission.

	Parameter(s):
		0: BOOL (Optional) - True to copy the result into clipboard (default: false)

	Returns:
	ARRAY
*/

_copy = [_this,0,false,[false]] call bis_fnc_param;
_br = "
";

_weapons = [];
_magazines = [];
{

	//--- Equipment
	_unitWeapons = weapons _x;
	{
		_weaponID = _weapons find _x;
		if (_weaponID < 0) then {
			_weapons set [count _weapons,_x];
			_weapons set [count _weapons,1];
		} else {
			_weapons set [_weaponID + 1,(_weapons select (_weaponID + 1)) + 1]
		};
	} foreach _unitWeapons;

	_unitMagazines = magazines _x;
	{
		_magazineID = _magazines find _x;
		if (_magazineID < 0) then {
			_magazines set [count _magazines,_x];
			_magazines set [count _magazines,1];
		} else {
			_magazines set [_magazineID + 1,(_magazines select (_magazineID + 1)) + 1]
		};
	} foreach _unitMagazines;


	//--- Cargo equipment
	_cargoWeapons = getweaponcargo _x;
	_cargoWeaponNames = _cargoWeapons select 0;
	_cargoWeaponCounts = _cargoWeapons select 1;
	{
		_weaponID = _weapons find _x;
		_weaponCount = _cargoWeaponCounts select _foreachindex;
		if (_weaponID < 0) then {
			_weapons set [count _weapons,_x];
			_weapons set [count _weapons,_weaponCount];
		} else {
			_weapons set [_weaponID + 1,(_weapons select (_weaponID + 1)) + _weaponCount]
		};
	} foreach _cargoWeaponNames;

	_cargomagazines = getmagazinecargo _x;
	_cargomagazineNames = _cargomagazines select 0;
	_cargomagazineCounts = _cargomagazines select 1;
	{
		_magazineID = _magazines find _x;
		_magazineCount = _cargomagazineCounts select _foreachindex;
		if (_magazineID < 0) then {
			_magazines set [count _magazines,_x];
			_magazines set [count _magazines,_magazineCount];
		} else {
			_magazines set [_magazineID + 1,(_magazines select (_magazineID + 1)) + _magazineCount]
		};
	} foreach _cargomagazineNames;

} foreach (allmissionobjects "All");

if (_copy) then {
	_result = "-----------------------------------------------" + _br + missionname + _br + _br + "WEAPONS" + _br;
	for "_i" from 0 to (count _weapons - 1) step 2 do {
		_class = _weapons select (_i);
		_count = _weapons select (_i + 1);
		_result = _result + _class + "	" + str _count + _br;
	};

	_result = _result + _br + "MAGAZINES" + _br;
	for "_i" from 0 to (count _magazines - 1) step 2 do {
		_class = _magazines select (_i);
		_count = _magazines select (_i + 1);
		_result = _result + _class + "	" + str _count + _br;
	};
	copytoclipboard _result;
};

[_weapons,_magazines]