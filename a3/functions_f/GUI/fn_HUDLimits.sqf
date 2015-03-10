/*
	Author: Karel Moricky

	Description:
	Set HUD limits and prevents overwriting existing values

	Parameter(s):
	_this select 0: ARRAY - speed limit [priority,min,max,]
	_this select 1: ARRAY - altitude limit [priority,min,max]
	_this select 2: ARRAY - direction limit [priority,min,max,target]

	Returns:
	ARRAY - current value of HUDMovementLevels

	Note:
	* priority
		* default value is 0, which means no limits were assigned
		* using 0 as priority will hide the limits, no matter the priorities
		* same or higher priority will replace currently set priority
		* using negative value will reset the values, if absolute value is same or higher than current level
*/

private ["_speed","_alt","_dir","_levels","_speedPriority","_altPriority","_dirPriority"];

_speed = [_this,0,[],[[]]] call bis_fnc_param;
_alt = [_this,1,[],[[]]] call bis_fnc_param;
_dir = [_this,2,[]] call bis_fnc_param;

if (isnil "BIS_fnc_HUDMovementLevels_priority") then {BIS_fnc_HUDMovementLevels_priority = [0,0,0];};
_levels = HUDMovementLevels;

//--- Set speed limits
_speedPriority = [_speed,0,0,[0]] call bis_fnc_paramIn;
if (abs _speedPriority >= (BIS_fnc_HUDMovementLevels_priority select 0)) then {
	private ["_speedMin","_speedMax"];
	if (_speedPriority <= 0) then {_speed = [-1,0,0]};
	_speedMin = [_speed,1,0,[0]] call bis_fnc_paramIn;
	_speedMax = [_speed,2,0,[0]] call bis_fnc_paramIn;
	_levels set [0,_speedMin];
	_levels set [1,_speedMax];
	BIS_fnc_HUDMovementLevels_priority set [0,_speedPriority];
};

//--- Set altitude limits
_altPriority = [_alt,0,0,[0]] call bis_fnc_paramIn;
if (abs _altPriority >= (BIS_fnc_HUDMovementLevels_priority select 1)) then {
	private ["_altMin","_altMax"];
	if (_altPriority <= 0) then {_alt = [-1,0,0]};
	_altMin = [_alt,1,0,[0]] call bis_fnc_paramIn;
	_altMax = [_alt,2,0,[0]] call bis_fnc_paramIn;
	_levels set [2,_altMin];
	_levels set [3,_altMax];
	BIS_fnc_HUDMovementLevels_priority set [1,_altPriority];
};

//--- Set directions limits
_dirPriority = [_dir,0,0,[0]] call bis_fnc_paramIn;
if (abs _dirPriority >= (BIS_fnc_HUDMovementLevels_priority select 2)) then {
	private ["_dirMin","_dirMax","_dirPos"];
	if (_dirPriority <= 0) then {_dir = [-1,0,0]};

	_dirMin = [_dir,1,0,[0]] call bis_fnc_paramIn;
	_dirMax = [_dir,2,0,[0]] call bis_fnc_paramIn;
	_dirPos = [_dir,3,[0,0,0]] call bis_fnc_paramIn;
	_dirPos = _dirPos call bis_fnc_position;

	_levels set [4,_dirMin];
	_levels set [5,_dirMax];
	_levels set [6,_dirPos];
	BIS_fnc_HUDMovementLevels_priority set [2,_dirPriority];
};

setHUDMovementLevels _levels;
_levels