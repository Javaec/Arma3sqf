switch (_this getVariable "side") do {
	case "BLUFOR": {WEST};
	case "OPFOR": {EAST};
	case "Independent": {RESISTANCE};
	case "Civilian": {CIVILIAN};
	case "Empty": {sideUnknown}
};