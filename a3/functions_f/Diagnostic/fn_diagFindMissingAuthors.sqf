startloadingscreen [""];
_cfgVehicles = (configfile >> "cfgvehicles") call bis_fnc_returnchildren;
_cfgVehiclesCount = count _cfgVehicles;
_output = "";
_br = tostring [13,10];
{
	_author = "";
	_scope = getnumber (_x >> "scope");
	if (_scope == 2) then {
		for "_i" from 0 to (count _x - 1) do {
			_param = _x select _i;
			if (configname _param == "author") exitwith {_author = gettext _param;};
		};
		if (_author == "") then {_output = _output + configname _x + _br;};
	};
	progressloadingscreen (_foreachindex / _cfgVehiclesCount);
} foreach _cfgVehicles;
endloadingscreen;

hint "List of objects with missing 'author' attribute copied to clipboard.";
copytoclipboard _output;