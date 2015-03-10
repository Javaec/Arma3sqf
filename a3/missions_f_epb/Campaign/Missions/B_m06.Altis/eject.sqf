_grp = _this;

{
	_x disableCollisionWith vehicle _x;
	unassignVehicle _x;
	_x action ["Eject", vehicle _x];
	_x spawn {
		_para = "NonSteerable_Parachute_F" createVehicle [100 + random 200, 100 + random 200, 100];
		_para hideObject TRUE;
		_para setPos [100 + random 200, 100 + random 200, 100];
		sleep 2;
		_vel = velocity _this;
		_para hideObject FALSE;
		_para setPos position _this;
		_this moveInDriver _para;
		_para setVelocity _vel;
	};
	sleep 1.5;
} forEach units _grp