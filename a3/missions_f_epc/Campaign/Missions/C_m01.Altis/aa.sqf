_basePos = position BIS_airTarget;
while {canFire BIS_shilka && alive gunner BIS_shilka} do {
	sleep 3;
	BIS_shilka setVehicleAmmoDef 1;
	BIS_airTarget setPos [(_basePos select 0) + 50 + random 500, _basePos select 1, 175];
	BIS_shilka doWatch position BIS_airTarget;
	sleep 1.5;
	if (random 1 > 0.25) then {
		_null = BIS_shilka fireAtTarget [BIS_airTarget, "autocannon_35mm"]; sleep 0.25;
		_null = BIS_shilka fireAtTarget [BIS_airTarget, "autocannon_35mm"]; sleep 0.25;
		_null = BIS_shilka fireAtTarget [BIS_airTarget, "autocannon_35mm"]; sleep 0.25;
		_null = BIS_shilka fireAtTarget [BIS_airTarget, "autocannon_35mm"]; sleep 0.25;
		_null = BIS_shilka fireAtTarget [BIS_airTarget, "autocannon_35mm"]; sleep 0.25;
		if (random 1 > 0.5) then {_null = BIS_shilka fireAtTarget [BIS_airTarget, "autocannon_35mm"]; sleep 0.25};
		if (random 1 > 0.5) then {_null = BIS_shilka fireAtTarget [BIS_airTarget, "autocannon_35mm"]; sleep 0.25};
		if (random 1 > 0.5) then {_null = BIS_shilka fireAtTarget [BIS_airTarget, "autocannon_35mm"]; sleep 0.25};
		if (random 1 > 0.5) then {_null = BIS_shilka fireAtTarget [BIS_airTarget, "autocannon_35mm"]; sleep 0.25};
		if (random 1 > 0.5) then {_null = BIS_shilka fireAtTarget [BIS_airTarget, "autocannon_35mm"]};
	} else {
		_null = BIS_shilka fireAtTarget [BIS_airTarget, "missiles_titan"];
	};
};