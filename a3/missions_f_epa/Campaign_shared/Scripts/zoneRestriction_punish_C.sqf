_t = time;
_mines = [];
while {alive BIS_inf && (BIS_inf getVariable "BIS_deserter")} do {
	{deleteVehicle _x} forEach _mines; _mines = [];
	if (vehicle BIS_inf == BIS_inf) then {
		if (surfaceIsWater position BIS_inf) then {
			BIS_inf setDamage 1
		} else {
			_pos = ([BIS_inf, 2.5, direction BIS_inf] call BIS_fnc_relPos); _pos set [2, 0]; 
			_mine = createMine ["APERSMine", _pos, [], 0]; _mines = _mines + [_mine];
		}
	};
	if (vehicle BIS_inf isKindOf "Land" && vehicle BIS_inf != BIS_inf) then {
		if (vehicle BIS_inf != BIS_inf && !(isNil {(vehicle BIS_inf) getVariable "BIS_getaway"})) exitWith {};
		if (vehicle BIS_inf != BIS_inf) then {vehicle BIS_inf setVariable ["BIS_getaway", TRUE, TRUE]};
		_pos = ([BIS_inf, 15, direction BIS_inf] call BIS_fnc_relPos); _pos set [2, 0]; 
		_mine = createMine ["ATMine", _pos, [], 0]; _mines = _mines + [_mine];
	};
	if (vehicle BIS_inf isKindOf "Ship") then {
		if (vehicle BIS_inf != BIS_inf && !(isNil {(vehicle BIS_inf) getVariable "BIS_getaway"})) exitWith {};
		if (vehicle BIS_inf != BIS_inf) then {vehicle BIS_inf setVariable ["BIS_getaway", TRUE, TRUE]};
		_pos = ([BIS_inf, 15, direction BIS_inf] call BIS_fnc_relPos); _pos set [2, -2]; 
		_mine = createMine ["UnderwaterMine", _pos, [], 0]; _mines = _mines + [_mine];
	};
	if (vehicle BIS_inf isKindOf "Air") then {
		if (vehicle BIS_inf != BIS_inf && !(isNil {(vehicle BIS_inf) getVariable "BIS_getaway"})) exitWith {};
		if (vehicle BIS_inf != BIS_inf) then {vehicle BIS_inf setVariable ["BIS_getaway", TRUE, TRUE]};
		while {fuel vehicle BIS_inf > 0 && (vehicle BIS_inf) isKindOf "Air"} do {
			vehicle BIS_inf setFuel ((fuel vehicle BIS_inf) - 0.05);
			sleep 0.1
		};
	};
	sleep 5;
	vehicle BIS_inf setVariable ["BIS_getaway", nil, TRUE];
	if (time >= _t + 12) then {vehicle BIS_inf setDamage 1; BIS_inf setDamage 1}
};
{deleteVehicle _x} forEach _mines; _mines = [];