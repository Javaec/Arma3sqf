0 fadeSound 0;
titleCut ["", "BLACK IN", 5];
[] spawn {sleep 0.001; showCinemaBorder FALSE};

_camera = "Camera" camCreate [4248.07,3951.21,11.92];
_camera cameraEffect ["Internal", "Back"];

while {TRUE} do {
	
	titleCut ["", "BLACK IN", 5];
	
	_camera camPrepareTarget [73927.67,-65786.86,17001.34];
	_camera camPreparePos [4248.07,3951.21,11.92];
	_camera camPrepareFOV 0.561;
	_camera camCommitPrepared 0;
	
	_camera camPrepareTarget [65108.84,83150.72,854.47];
	_camera camPreparePos [4249.65,3804.83,32.93];
	_camera camPrepareFOV 0.561;
	_camera camCommitPrepared 45;
	
	waitUntil {camCommitted _camera};
	
	_camera camPrepareTarget [12924.14,102423.92,-13578.06];
	_camera camPreparePos [4406.89,3754.21,44.57];
	_camera camPrepareFOV 0.561;
	_camera camCommitPrepared 45;
	
	waitUntil {camCommitted _camera};
	
	sleep 5;
	
};