_plane = _this select 0;
_crateCode = compile (((_this select 3) select 0) getVariable 'BIS_SUPP_crateInit');

_plane removeAction (_this select 2);

BIS_SUPP_chute = createVehicle [['B_Parachute_02_F', 'O_Parachute_02_F', 'I_Parachute_02_F'] select ([WEST, EAST, RESISTANCE] find side group driver _plane), [100, 100, 200], [], 0, 'FLY'];
BIS_SUPP_chute setPos [position _plane select 0, position _plane select 1, (position _plane select 2) - 50];

BIS_SUPP_crate = createVehicle [['B_supplyCrate_F', 'O_supplyCrate_F', 'IG_supplyCrate_F'] select ([WEST, EAST, RESISTANCE] find side group driver _plane), position BIS_SUPP_chute, [], 0, 'NONE'];
BIS_SUPP_crate call _crateCode;

BIS_SUPP_crate attachTo [BIS_SUPP_chute, [0, 0, -1.3]];

_null = [BIS_SUPP_chute, BIS_SUPP_crate] spawn {
	waitUntil {position (_this select 1) select 2 < 0.5 || isNull (_this select 0)};
	detach (_this select 1);
	(_this select 1) setPos [position (_this select 0) select 0, position (_this select 0) select 1, 0]
};