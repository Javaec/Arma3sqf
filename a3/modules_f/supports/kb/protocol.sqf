BIS_convMenu = [];

switch (_sentenceId) do {
	case "Transport_Request": {
		_this kbTell [_from, _topic, "Transport_Acknowledged", BIS_SUPP_channels select ([WEST, EAST, RESISTANCE] find side group _this)];
	};
	case "Artillery_Request": {
		_this kbTell [_from, _topic, "Artillery_Acknowledged", BIS_SUPP_channels select ([WEST, EAST, RESISTANCE] find side group _this)];
	};
	case "Drop_Request": {
		_this kbTell [_from, _topic, "Drop_Acknowledged", BIS_SUPP_channels select ([WEST, EAST, RESISTANCE] find side group _this)];
	};
	case "CAS_Heli_Request": {
		_this kbTell [_from, _topic, "CAS_Heli_Acknowledged", BIS_SUPP_channels select ([WEST, EAST, RESISTANCE] find side group _this)];
	};
	case "CAS_Bombing_Request": {
		_this kbTell [_from, _topic, "CAS_Bombing_Acknowledged", BIS_SUPP_channels select ([WEST, EAST, RESISTANCE] find side group _this)];
	};
};

BIS_convMenu