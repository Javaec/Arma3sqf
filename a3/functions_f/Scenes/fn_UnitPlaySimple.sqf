
/*
	File: fn_UnitPlaySimple.sqf
	Author: Martin [Dram] Melicharek

	Description:
	Plays back input movement data on input unit. Simplified.

	Parameters:
	Unit					- Unit to play movement data on
	Data					- Movement data to use
	OPT:[Object, Variable]	- OPTIONAL: Variable to set on specified Object once playback has finished
	OPT:IgnoreDisabled		- OPTIONAL: Whether to ignore if the Unit is dead and/or cannot move
	OPT:Debug				- OPTIONAL: Whether to give debug information on played frames per second
	OPT:Sleep				- OPTIONAL: Time to Sleep between frames. This is if you want to be recording another unit
							  and playing back movement data on another as well. Limit is 0-1 seconds.
	OPT:SkipTime			- OPTIONAL: Amount of time to skip at the start of playback. For example if you wish to
							  play the data from halfway instead of the start.

	Examples (used in a script):
	a)	_capturedData = [[0,[8208.26,1953.13,296.04],67]];
		[BIS_Vehicle, _capturedData, [BIS_Object, "DoneRecording"], true, false, 0.2, 5] spawn BIS_fnc_UnitPlay;
			Which would play back the captured data in the _capturedData array (containing only one frame in this example)
			onto a unit named BIS_Vehicle. Playback will play even if the unit is dead or disabled. Debug information would
			not show and playing back would update once every 0.2 seconds. Once the playback finished, an object named
			BIS_Object would have a variable called "DoneRecording" set to TRUE. Playback would skip the first 5 seconds
			of data.
	
	b)	_capturedData = [[0,[8208.26,1953.13,296.04],67]];
		[BIS_Vehicle, _capturedData, [], false, true] spawn BIS_fnc_UnitPlay;
			Which would play back the captured data in the _capturedData array (containing only one frame in this example)
			onto a unit named BIS_Vehicle. Playback will play only while the unit is alive and can move. Debug information
			would show.
	
	c)	_capturedData = [[0,[8208.26,1953.13,296.04],67]];
		[BIS_Vehicle, _capturedData] spawn BIS_fnc_UnitPlay;
			Which would play back the captured data in the _capturedData array (containing only one frame in this example)
			onto a unit named BIS_Vehicle.
	
	Note that in a very large captured sequence, it is a better idea to preprocess the data prior to mission start, or
	a short freeze would occur as it reads the data. For example using the following in the mission's init:
	
		UnitData = compile preprocessFile "PlayBackUnit.sqf";

	..And then later start the sequence like this:
	
		// Start the sequence
		_result = [] call UnitData;
*/

private ["_skipTime","_targetUnit","_capturedData","_totalFrames","_startedTime","_currentTime","_lastPlayedFrame","_secondPassed","_FPS","_totalFPS","_endFrameTime","_ignoreDisabled","_endSeq","_debug","_sleep","_totalData","_selectedData","_currentData","_currentDataNext","_frameTime","_tmpTime","_tmpTimeNext","_tmpPos","_tmpDir","_tmpPosNext","_tmpDirNext","_tmpTimeDiff","_tmpPosX","_tmpPosY","_tmpPosZ","_tmpDirX"];

_targetUnit = _this select 0;

// Disable move AI
_targetUnit disableAI "MOVE";
driver _targetUnit disableAI "MOVE";

_capturedData = _this select 1;
_totalFrames = (count _capturedData);

_skipTime = 0;
if (count _this > 6) then
{
	if ((_this select 6) >= 0) then
	{
		_skipTime = (_this select 6);
	}
};

_startedTime = (time - _skipTime);
_currentTime = time - _startedTime;
_lastPlayedFrame = 0;

_endSeq = false; // True when a premature ending of the sequence is required
_ignoreDisabled = false;
if (count _this > 3) then
{
	if ((_this select 3) || !(_this select 3)) then {_ignoreDisabled = _this select 3;};
};

// Debug
_secondPassed = 0;
_FPS = 0;
_totalFPS = 0;
_endFrameTime = 0;
_debug = false;
if (count _this > 4) then
{
	if ((_this select 4) || !(_this select 4)) then {_debug = _this select 4;};
};

_sleep = 0;
if (count _this > 5) then
{
	if (((_this select 5) >= 0) && ((_this select 5) <= 1)) then
	{
		_sleep = (_this select 5);
		if (_debug) then {hint format ["Optional sleep time set to %1s", _sleep];};
	}
	else
	{
		if (_debug) then {hint "Optional sleep time set beyond 0-1s, setting to 0s (default)";};
		_sleep = 0;
	};
}
else
{
	if (_debug) then {hint "Optional sleep time not specified, using 0s (default)";};
};

// Plays the pre-recorded data
_totalData = count _capturedData;
_selectedData = 0;
_currentData = [];
_currentDataNext = [];
_frameTime = 0;
_tmpTime = 0;
_tmpTimeNext = 0;

while { ((_selectedData <= _totalData) && !(_endSeq)) } do
{
	if (_debug) then
	{
		_secondPassed = _secondPassed + (time - _endFrameTime);
		_endFrameTime = time;
	};
	_currentData = (_capturedData select _selectedData);
	if ((_selectedData + 1) <= _totalData) then
	{
		_currentDataNext = (_capturedData select (_selectedData + 1));
	};
	_currentTime = time - _startedTime;
	_tmpTime = _currentData select 0;
	_tmpTimeNext = _currentDataNext select 0;
	
	_tmpPos = _currentData select 1;
	_tmpDir = _currentData select 2;
	
	_tmpPosNext = _currentDataNext select 1;
	_tmpDirNext = _currentDataNext select 2;
	
	while { ((_tmpTimeNext >= _currentTime) && !(_endSeq)) } do
	{
			_tmpTimeDiff = (_currentTime - _tmpTime) / (_tmpTimeNext - _tmpTime);
			
			_tmpPosX = _tmpTimeDiff * ((_tmpPosNext select 0) - (_tmpPos select 0)) + (_tmpPos select 0);
			_tmpPosY = _tmpTimeDiff * ((_tmpPosNext select 1) - (_tmpPos select 1)) + (_tmpPos select 1);
			_tmpPosZ = _tmpTimeDiff * ((_tmpPosNext select 2) - (_tmpPos select 2)) + (_tmpPos select 2);
			_tmpPosNew = [_tmpPosX, _tmpPosY, _tmpPosZ];
			
			_tmpDirX = _tmpTimeDiff * (_tmpDirNext - _tmpDir) + _tmpDir;
			_tmpDirNew = _tmpDirX;

			_targetUnit setPosASL _tmpPosNew;
			_targetUnit setDir _tmpDirNew;
			
			if (_debug) then
			{
				_FPS = _FPS + 1;
				_totalFPS = _totalFPS + 1;
			};
			
			// Wait for next frame
			_frameTime = time;
			waitUntil {_frameTime < time};
			
			if (_sleep > 0) then {sleep _sleep;};
			
			_currentTime = time - _startedTime;
	};
	if (_tmpTime == 0) then
	{
		_tmpPos = _currentData select 1;
		_tmpDir = _currentData select 2;
	
		_targetUnit setPosASL _tmpPos;
		_targetUnit setDir _tmpDir;
		
		if (_debug) then
		{
			_FPS = _FPS + 1;
			_totalFPS = _totalFPS + 1;
		};
		
		if (_sleep > 0) then {sleep _sleep;};
	};
	
	if ((_secondPassed >= 1.0) && (_debug)) then
	{
		hint format ["FPS is %1\nCalculated in %2s\nTotal Frames is %3", _FPS, _secondPassed, _totalFrames];
		_secondPassed = 0;
		_FPS = 0;
	};
	
	_selectedData = _selectedData + 1;
	if (_tmpTimeNext >= _currentTime) then
	{
		_frameTime = time;
		waitUntil {_frameTime < time};
	};
	
	// Check if unit is still alive and functions
	if !(_ignoreDisabled) then
	{
		if (!(alive _targetUnit) || !(canMove _targetUnit) || (count (crew _targetUnit) == 0)) then
		{
			_endSeq = true;
		};
	};
};
if (time > _startedTime) then {_totalFPS = _totalFPS / (time - _startedTime);};
if (_debug) then {hint format ["Avg. FPS was %1\nCalculated over %2s", _totalFPS, (time - _startedTime)];};

// Re-enable move AI
_targetUnit enableAI "MOVE";
driver _targetUnit enableAI "MOVE";

if (count _this > 2) then
{
	if (count (_this select 2) > 0) then
	{
		((_this select 2) select 0) setVariable [((_this select 2) select 1), true];
	};
};