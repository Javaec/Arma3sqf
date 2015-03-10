_new = _this select 0;
_player = _this select 1;
// init

if !(isplayer _new) exitwith {["Attempting to use the function on AI unit %1, can be used only on players."] call bis_fnc_error;};

// titleCut["","BLACK OUT",0.01];

_camera = "camera" camCreate [(position _player select 0)-0.75, (position _player select 1)-0.75,(position _player select 2) + 0.5];
_camera cameraEffect ["internal","back"];

0 fadeMusic 0.9;
playMusic "Ambient02_Vague_Shapes";

// === 14:54:42
_camera camSetFOV 0.800;
_camera camCommit 0;
waituntil {camCommitted _camera};

_preload = _new spawn {waitUntil {(preloadCamera getPos _this) && (2 preloadObject _this)}};

// === 14:56:09
_camera camSetTarget vehicle _player;
_camera camSetRelPos [-0.82,-3.12,3.38];
_camera camSetFOV 0.800;
_camera camCommit 4;

sleep 3.5;
titleCut["","BLACK OUT",0.5];
waituntil {camCommitted _camera};

// Shora na vojaka
_camera camSetTarget vehicle _new;
_camera camSetRelPos [-3.5,2.96,6.48];
_camera camSetFOV 0.7;
_camera camCommit 0;
titleCut["","BLACK IN",1];
sleep 1;

terminate _preload;

// priblizeni
_camera camSetRelPos [-0.82,-3.12,3.38];
_camera camSetFOV 0.250;
_camera camCommit 3;
waituntil {camCommitted _camera};

// exit
//(["HealthPP_black"] call bis_fnc_rscLayer) cutText ["","BLACK IN",0.5];
BIS_DeathBlur ppEffectAdjust [0.0];
BIS_DeathBlur ppEffectCommit 0.5;
0.5 fadeSound 1;
vehicle _new switchCamera "INTERNAL";
_new cameraEffect ["terminate","back"];
camDestroy _camera;