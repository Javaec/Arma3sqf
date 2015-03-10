_site = _this select 0;
_faction = _this select 1;

_correctFaction = switch (_faction) do {
	case "BLU_F": {"Blue"};
	case "OPF_F": {"Red"};
	case "IND_F": {"Green_army"};
	case "Guerilla": {"Green_para"};
};

_site setVariable ["faction", _correctFaction, TRUE];