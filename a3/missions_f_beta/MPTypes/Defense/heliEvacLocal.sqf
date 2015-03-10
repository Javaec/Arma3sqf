_mode = [_this,0,-1,[0]] call bis_fnc_param;

switch _mode do {
	//--- Add
	case 0: {
		BIS_fnc_moduleMPTypeDefense_heliEvacLocal_ID = [player,"moduleMPTypeDefense_evac"] call bis_fnc_addCommMenuItem;
	};
	//--- Remove
	case 1: {
		if !(isnil "BIS_fnc_moduleMPTypeDefense_heliEvacLocal_ID") then {
			[player,BIS_fnc_moduleMPTypeDefense_heliEvacLocal_ID] call bis_fnc_removeCommMenuItem;
		};
	};
	//--- Call
	case 2: {
		_side = [_this,1,sideunknown,[sideunknown]] call bis_fnc_param;
		BIS_moduleMPTypeDefense_heliEvacSide = _side;
		publicvariable "BIS_moduleMPTypeDefense_heliEvacSide";
	};
	//--- Show
	case 3: {
		_heli = [_this,1,objnull,[objnull]] call bis_fnc_param;
		_heli enablesimulation true;
		_heli hideobject false;
	};
};