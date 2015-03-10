startloadingscreen [""];

_class = [_this,0,configfile >> "cfgvehicles",[configfile]] call bis_fnc_param;

_vehicles = _class call bis_fnc_subclasses;
{
	_classname = configname _x;
	_macro = gettext (_x >> "_generalMacro");
	if (_macro == "") then {
		["General macro for vehicle class '%1' is missing.",_classname] call bis_fnc_error;
	} else {
		if (_macro != _classname) then {
			["General macro for vehicle class '%1' is missing, it's inherited from '%2' instead.",_classname,_macro] call bis_fnc_error;
		};
	};
} foreach _vehicles;

endloadingscreen;