_unit = _this select 0;
_preset = _this select 1;
_animDeath = 0.6; if (count _this > 2) then {_animDeath = _this select 2};

[_unit, FALSE, _animDeath] call BIS_fnc_VREffectKilled;

removeAllWeapons _unit;

switch (_preset) do {
	case 0: {};
	case 1: {
		_unit addVest "V_TacVest_blk";
	};
	case 2: {
		_unit addVest "V_PlateCarrier1_blk";
		_unit addHeadgear "H_HelmetB_black";
	};
	case 3: {
		_unit addVest "V_PlateCarrier1_blk";
		_unit addHeadgear "H_HelmetB_black";
		_unit addBackpack "B_FieldPack_ocamo_AA";
		clearMagazineCargo unitBackpack _unit;
		_unit addMagazine "Titan_AA";
		_unit addWeapon "launch_O_Titan_F";
	};
};

_unit addMagazines ["30Rnd_556x45_Stanag", 5];
_unit addWeapon "arifle_SDAR_F";