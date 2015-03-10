_site = _this select 0;
_side = _this select 1;

_correctSide = switch (_side) do {
	case WEST: {"BLUFOR"};
	case EAST: {"OPFOR"};
	case RESISTANCE: {"Independent"};
	case CIVILIAN: {"Civilian"};
	case sideUnknown: {"Empty"};
};

_site setVariable ["side", _correctSide, TRUE];