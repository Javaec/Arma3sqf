_wrecks = [
	"bmp2_wrecked_F",
	"BRDM2_wrecked_F",
	"datsun01T_F",
	"datsun02T_F",
	"hiluxT_F",
	"HMMWV_wrecked_F",
	"Skodovka_wrecked_F",
	"ural_wrecked_F"
];

_loners = [
	"C_man_p_beggar_F",
	"C_man_p_fugitive_F",
	"C_man_p_scavenger_1_F",
	"C_man_hunter_1_F"
];

_chance = floor random 2;

switch (_chance) do {
	case 0: {
		_wreck = (_wrecks select floor random count _wrecks) createVehicle position _this;
		_wreck setDir random 360;
		
		_house = nearestBuilding _wreck;
		
		if (!(isNull _house)) then {
			if (_wreck distance _house < 5) then {
				_wreck setPos ([_house, 5, random 360] call BIS_fnc_relPos)
			}
		}
	};
	
	case 1: {
		_grp = createGroup CIVILIAN;
		_loner = (_loners select floor random count _loners) createUnit [position _this, _grp, "[this] spawn {_loner = (_this select 0); _rndDir = random 360; _loner setDir _rndDir; _loner setFormDir _rndDir; sleep 0.1; _loner action [""SITDOWN"", (_this select 0)]}"];
	};
};