if (!(surfaceIsWater position _this)) then {
	_sentence = (["zone_restriction_a_warn_no_leader_KER_0", "zone_restriction_a_warn_no_leader_KER_1", "zone_restriction_a_warn_no_leader_KER_2"] select floor random 3);
	["A_Warn_No_Leader", "Zone_Restriction", [_sentence, _sentence], "DIRECT", nil, nil, 1] spawn BIS_fnc_kbTell;
};

sleep 5;

{
	_rndPos = [position _this, 75 + random 25, random 360] call BIS_fnc_relPos;
	_rndPos set [2, 50];
	
	_shell = "Sh_82mm_AMOS" createVehicle _rndPos;
	_shell setVectorUp [0, -5, -0.01];
	_shell setVelocity [0, 0, -50];
	
	_tmout = 2 + random 2;
	sleep _tmout;
} forEach [1, 2, 3];