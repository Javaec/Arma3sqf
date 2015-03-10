titleCut ["", "BLACK FADED", 10e10];

_camera = "camera" camCreate position player;
_camera cameraEffect ["internal", "back"];

_camera camPrepareTarget [-63246.21,74580.90,-4250.56];
_camera camPreparePos [10836.02,7566.66,44.62];
_camera camPrepareFOV 0.379;
_camera camCommitPrepared 0;

sleep 0.01;
showCinemaBorder FALSE;

waitUntil {preloadCamera [10836.02,7566.66,44.62]};
0 fadeMusic 0;
playMusic ["Track01_Proteus", 16];
5 fadeMusic 0.5;
titleCut ["", "BLACK IN", 5];