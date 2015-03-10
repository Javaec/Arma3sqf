
/*
	File: fpsMeasurement.sqf
	Author: Vilem Benes

	Description:
	Function to measure fps. Spawns code running for given time.

	Parameter(s):
	_this select 0: scalar - time, length of measurement
	_this select 1: string - identification of measurement (will be printed to screen)
	_this select 2: scalar - (optional) sleep time - time to wait before measurement starts

	Returns:
	_handle to spawned script (-> can be used to waitUntil {scriptDone _handle};)

  Warning - do not use console during fps measurement - it stops time <- fixed?
*/

titleText ["", "PLAIN"];

_handle = _this spawn
{
  private ["_testTime","_fpsmin","_startTime","_startFrameNo","_currFrameNo","_endTime","_endFrameNo"];
  private ["_FPSminArray","_fpsminmed","_handle"];

  currentScene = _this select 1;
  if (isNil ("currentScene")) then {currentScene="";};

  if ((count _this) > 2) then
  {
    player globalChat format["FPS measurement - %1 - sleeping for %2 s.",currentScene, _this select 2];
    Sleep(_this select 2);
  };

  //test length - time in seconds taken as first record in argument
  _testTime = _this select 0;

  if (isnil ("_testTime")) then {_testTime=5;};

  //minimal fps is calculated from worst frame time only
  _fpsmin = 1000;

  _startTime = diag_tickTime;
  _startFrameNo = diag_frameno;

  _currFrameNo = diag_frameno;



  //hint format["FPS measurement start (time: %1 s).",_testTime];
  _FPSminArray = [];
  player globalChat format["FPS measurement - %1 - start (time: %2 s).",currentScene, _testTime];

  while {diag_tickTime < (_startTime + _testTime)} do
  {
  //Sleep (0.1);

  	while {(_currFrameNo + 16) > diag_frameno;} do {Sleep(0.001);}; //we want to call diag_fpsmin with all frames (diag_fpsmin uses last 16 frames)
  	//player globalChat format["%1", diag_frameno];
  	if (_fpsmin > diag_fpsmin) then {_fpsmin = diag_fpsmin};

  	_FPSminArray = [diag_fpsmin] + _FPSminArray;

  _currFrameNo = diag_frameno;
  };

  _endTime = diag_tickTime;
  _endFrameNo = diag_frameno;

  private ["_testTimeAct","_frameCnt"];
  _testTimeAct = (_endTime - _startTime);
  _frameCnt = (_endFrameNo - _startFrameNo);


  _fps = _frameCnt / _testTimeAct;

  //textLogFormat["FPS_minArray (%1) _FPSminArray %2", count _FPSminArray,_FPSminArray];

  _FPSminArraySorted = _FPSminArray call BIS_fnc_sortNum;
  //textLogFormat["FPS_minArray (%1) _FPSminArraySorted %2", count _FPSminArray,_FPSminArraySorted];
  //textLogFormat["FPS_ FPSmin med %1%2", _FPSminArraySorted select (floor ((count _FPSminArraySorted)/2)),count _FPSminArray];

  _fpsminmed = _FPSminArraySorted select (floor ((count _FPSminArraySorted)/2));

  hint "FPS measurement end.";

  _outText =  format["FPS: %1; FPSmm %6 FPSm: %3 - %4 (%5 frames in %2 s) ", _fps,_testTimeAct,_fpsmin,currentScene,_frameCnt,_fpsminmed];
  player globalChat _outText;
  titleText [format ["%1: %2 fps", currentScene, _fps], "PLAIN"];
  _outText = format["FPS-STAT %1 ",_outText];
  BIS_fps_output = _outText;
  diag_log _outText;

  sleep 4;

};

_handle