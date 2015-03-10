private ["_unit", "_holder", "_weapon", "_container"];
_unit		= _this select 0;
_holder		= _this select 1;
_weapon 	= _this select 2;
_container	= _holder getVariable ["BIS_container", nil];

//Validate container
if (isNil { _container }) exitWith {
	["Holder (%1) does not have a container", _holder] call BIS_fnc_logFormat;
};

//Container magazines
private ["_magazine", "_count"];
_magazine 	= (getMagazineCargo _container select 0) select 0;
_count 		= (getMagazineCargo _container select 1) select 0;

//Add magazines to player
for "_i" from 1 to _count do {
	player addMagazine _magazine;
};

//Clear container magazines
clearMagazineCargo _container;

//Holder magazines
private ["_magazine", "_count"];
_magazine 	= (getMagazineCargo _holder select 0) select 0;
_count 		= (getMagazineCargo _holder select 1) select 0;

//Add magazines to container
_container addMagazineCargo [_magazine, _count];

//Clear magazines from holder
clearMagazineCargo _holder;

//Manually select weapon
player selectWeapon _weapon;

//Manually reload weapon
reload player;

//Add flashlight, if weapon doesn't have it already
if ({ _x == "acc_flashlight" } count primaryWeaponItems player < 1) then {
	player addPrimaryWeaponItem "acc_flashlight";
};

//Return
true;
