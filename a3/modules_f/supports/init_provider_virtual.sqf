_module = _this select 0;

if (!isNil {_module getVariable "BIS_SUPP_vehicles"}) then {
	if (typeName (_module getVariable "BIS_SUPP_vehicles") == typeName "") then {
		_module setVariable ["BIS_SUPP_vehicles", call compile (_module getVariable "BIS_SUPP_vehicles"), TRUE];
	}
};

if (!isNil {_module getVariable "BIS_SUPP_vehicleInit"}) then {
	if (typeName (_module getVariable "BIS_SUPP_vehicleInit") == typeName "") then {
		_module setVariable ["BIS_SUPP_vehicleInit", compile (_module getVariable "BIS_SUPP_vehicleInit"), TRUE];
	}
};

if (isNil {_module getVariable "BIS_SUPP_cooldown"}) then {
	_module setVariable ["BIS_SUPP_cooldown", 0, TRUE];
};

if (isNil {_module getVariable "BIS_SUPP_lastCall"}) then {
	_module setVariable ["BIS_SUPP_lastCall", -1e6, TRUE];
};