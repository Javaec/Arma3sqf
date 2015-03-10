_object = _this;
_object setVariable ["effects",[]];

while {alive player} do {
	_pos01 = getPos _object;
	_source01 = "#particlesource" createVehicleLocal _pos01;
	_source01 setParticleClass "PointBubbles1";
	_source01 attachto [_object,[0,0,0]];
	_source01s = "#particlesource" createVehicleLocal _pos01;
	_source01s setParticleClass "PointBubbles2";
	_source01s attachto [_object,[0,0,0]];
	_object setVariable ["effects",[_source01,_source01s]];
	sleep (0.2 + random 0.8);
	deleteVehicle _source01;
	_object setVariable ["effects",[_source01s]];
	sleep (0.1 + random 0.8);
	deleteVehicle _source01s;
	_object setVariable ["effects",[]];
	sleep (4 + random 20);
};