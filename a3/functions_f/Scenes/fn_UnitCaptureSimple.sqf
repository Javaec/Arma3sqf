
/*
	File: fn_UnitCaptureSimple.sqf
	Author: Martin [Dram] Melicharek

	Description:
	Records movement data of input unit over a specified period of time. Simplified.
	Pressing the ESC key, the duration ending, or the unit dying ends
	the recording.

	Parameters:
	Unit			- Unit to capture movement data from
	Duration		- Duration to capture for
	OPT:FPS			- OPTIONAL: Frames recorded Per Second (default 20). Limit is 1 - 100
	OPT:Firing		- OPTIONAL: If true, will record the input unit's weapon fire data as well
	OPT:StartTime	- OPTIONAL: Starting time offset for the frame time

	Copies to clipboard:
	Array in format [FrameTime, UnitPosition, UnitDirection] for each frame
	
	Input Examples:
	a) [BIS_Vehicle, 50, 30, true, 10] spawn BIS_fnc_UnitCapture;
			Which would capture data from a unit named BIS_Vehicle, would capture for 50 seconds, would capture at 30 FPS,
			and would also record the unit's weapon fire data as well. Frame time offset would be 10 seconds.
	
	b) [BIS_Vehicle, 50] spawn BIS_fnc_UnitCapture;
			Which would capture data from a unit named BIS_Vehicle, and would capture for 50 seconds.

	Output Example:
	a) [[0,[8208.26,1953.13,296.04],67],[1.021,[8208.26,1953.13,296.04],68]]
			The above output has 2 frames.
	
	b) [[0,[8208.26,1953.13,296.04],67]]
			The above output has 1 frame.
*/

private ["_unit","_duration","_timeStart","_timeFinal","_timeCur","_capturedData","_inputFPS","_sleepTime","_FPS","_sleepDeficit","_sleepDeficitCheckLast","_display","_avgFPS","_avgSleepTime","_captureFiring","_timeOffset"];

_unit = _this select 0;
_duration = _this select 1;
_timeStart = time;
_timeFinal = _timeStart + _duration;
_timeCur = time - _timeStart;
_capturedData = [];
_inputFPS = 20;
_captureFiring = false;

_timeOffset = 0;
if (count _this > 4) then
{
	if ((_this select 4) >= 0) then
	{
		_timeOffset = (_this select 4);
	};
};

if (count _this > 3) then
{
	if ((_this select 3) || !(_this select 3)) then {_captureFiring = _this select 3;};
};

if (count _this > 2) then
{
	_inputFPS = (_this select 2);
	if ((_inputFPS > 100) || (_inputFPS < 1)) then
	{
		if (_captureFiring) then
		{
			hint "Starting Simplified Capture, including weapon fire data...\n\nWARNING: Recording FPS beyond bounds of 1-100, reset to 20\n\nPress ESC to stop capture.";
		}
		else
		{
			hint "Starting Simplified Capture...\n\nWARNING: Recording FPS beyond bounds of 1-100, reset to 20\n\nPress ESC to stop capture.";
		};
		_inputFPS = 20;
	};
};

if (_captureFiring) then
{
	[_unit, _duration, _timeOffset] spawn BIS_fnc_UnitCaptureFiring; // Starts the weapon fire recording script
	hint "Starting Simplified Capture, including weapon fire data...\n\nPress ESC to stop capture.";
}
else
{
	hint "Starting Simplified Capture...\n\nPress ESC to stop capture.";
};

_sleepTime = 1 / _inputFPS;

BIS_EndCapture = false;
BIS_ClipboardCopy_Fire = false; // Here for compatibility with the Weapon Fire Capture script
BIS_ClipboardCopy_Move = false;

_FPS = 0;
_sleepDeficit = 0;
_sleepDeficitCheckLast = time;

_unit addEventHandler ["Killed", {(_this select 0) enablesimulation false;}];
{_x addEventHandler ["HandleDamage", {0}];} forEach (crew _unit);

disableSerialization;
_display = findDisplay 46;

// Stops Capture after pressing the ESC key
_display displaySetEventHandler ["KeyDown", "if ((_this select 1) == 1) then {BIS_EndCapture = true};"];

while { ((time <= _timeFinal) && (alive _unit) && !(BIS_EndCapture)) } do
{
	if (_FPS > 0) then
	{
		_sleepDeficit = (time - _sleepDeficitCheckLast) - (_sleepTime);
		_sleepDeficitCheckLast = time;
		if (_sleepDeficit < 0) then
		{
			_sleepDeficit = 0;
		}
	};
	
	_timeCur = time - _timeStart;
	
	_capturedData = _capturedData + [[(_timeCur + _timeOffset), (getPosASL _unit), (getDir _unit)]];
	sleep (_sleepTime - _sleepDeficit);
	
	_FPS = _FPS + 1;
};

_timeCur = time - _timeStart;
_avgFPS = _FPS / _timeCur;
_avgSleepTime = (_timeCur - _timeStart) / _FPS;

if (_captureFiring) then
{
	hint format ["Simplified Capturing Completed\n----------------\n\nPress F1 to copy movement data to clipboard\nPress F2 to copy weapon fire data to clipboard\n\nTotal captured frames:\n%1\n\nTotal capture time:\n%2\n----------------\n\nAvg. captured FPS:\n%3\n\nAvg. sleep time between frames:\n%4\n----------------\n\nInput FPS:\n%5\n\nInput sleep (from FPS):\n%6", _FPS, _timeCur, _avgFPS, _avgSleepTime, _inputFPS, _sleepTime];
}
else
{
	hint format ["Simplified Capturing Completed\n----------------\n\nPress F1 to copy movement data to clipboard\n\nTotal captured frames:\n%1\n\nTotal capture time:\n%2\n----------------\n\nAvg. captured FPS:\n%3\n\nAvg. sleep time between frames:\n%4\n----------------\n\nInput FPS:\n%5\n\nInput sleep (from FPS):\n%6", _FPS, _timeCur, _avgFPS, _avgSleepTime, _inputFPS, _sleepTime];
};

_unit enablesimulation false; // Freeze the unit

// Copies data to clipboard after pressing the F1 key
_display displaySetEventHandler ["KeyDown", "if ((_this select 1) == 60) then {BIS_ClipboardCopy_Fire = true}; if ((_this select 1) == 59) then {BIS_ClipboardCopy_Move = true};"];

waitUntil {BIS_ClipboardCopy_Move};

copyToClipBoard str _capturedData;

hint format ["Unit's Simplified Movement Data copied to clipboard..."];