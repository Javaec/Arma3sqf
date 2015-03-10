
/*
	File: fn_UnitPlayFiring.sqf
	Author: Martin [Dram] Melicharek

	Description:
	Plays back input weapon fire data on input unit.

	Parameters:
	Unit					- Unit to play weapon fire data on
	Data					- Weapon fire data to use
	OPT:IgnoreDisabled		- OPTIONAL: Whether to ignore if the Unit is dead and/or cannot move

	Example (used in a script):
	a)	_capturedFireData = [[2.135,"GAU8","<NULL-object>"]];
		[BIS_Vehicle, _capturedData, true] spawn BIS_fnc_UnitPlayFiring;
			Which would play back the captured data in the _capturedFireData array (containing only one frame in this example)
			onto a unit named BIS_Vehicle. Playback will play even if the unit is dead or disabled.
	
	Note that in a very large captured sequence, it is a better idea to preprocess the data prior to mission start, or
	a short freeze would occur as it reads the data. For example using the following in the mission's init:
	
		UnitData = compile preprocessFile "PlayBackUnit.sqf";

	..And then later start the sequence like this:
	
		// Start the sequence
		_result = [] call UnitData;
*/

private ["_targetUnit","_capturedFireData","_totalFrames","_startedTime","_currentTime","_endSeq","_ignoreDisabled","_tmpTime","_tmpWeapon","_tmpTarget"];

_targetUnit = _this select 0;

_capturedFireData = _this select 1;
_totalFrames = (count _capturedFireData);

_startedTime = time;
_currentTime = time - _startedTime;

_endSeq = false; // True when a premature ending of the sequence is required

_ignoreDisabled = false;
if (count _this > 2) then
{
	if ((_this select 2) || !(_this select 2)) then {_ignoreDisabled = _this select 2;};
};

{
	if !(_endSeq) then
	{
		_currentTime = time - _startedTime;
		_tmpTime = _x select 0;
		_tmpWeapon = _x select 1;
		_tmpTarget = objNull;
		if (count _x > 2) then
		{
			_tmpTarget = _x select 2;
		};
		
		if (_tmpTime > _currentTime) then
		{
			waitUntil {(time - _startedTime >= _tmpTime)};
		};
		
		_targetUnit fireAtTarget [_tmpTarget, _tmpWeapon];

		if !(_ignoreDisabled) then
		{
			if (!(alive _targetUnit) || !(canMove _targetUnit) || (count (crew _targetUnit) == 0)) then
			{
				_endSeq = true;
			};
		};
	};
} forEach _capturedFireData;