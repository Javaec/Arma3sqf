/*
	Author: Thomas Ryan
	
	Description:
	Display a live feed.
	
	Parameters:
		_this select 0: OBJECT or ARRAY - Live feed source
		_this select 1: OBJECT or ARRAY - Live feed target
		_this select 2: OBJECT - Player that will see the feed
		_this select 3 (Optional): NUMBER - Live feed effects (-1: reset, 0: normal (default), 1: night vision, 2: thermal imaging)
	
	Returns:
	True if successful, false if not.
*/

// Doesn't need to be run on a dedicated server
if (isDedicated) exitWith {"Not dedicated server compatible" call BIS_fnc_error; false};

private ["_source"];
_source = [_this, 0, objNull, [objNull, []]] call BIS_fnc_param;

// Ensure a valid source is defined
if (typeName _source == typeName objNull) then {
	_source = [_source];
	{if (isNull _x) then {_source = _source - [_x]}} forEach _source;
};

if (count _source == 0) exitWith {"Invalid source defined" call BIS_fnc_error; false};
if (count _source == 1) then {_source = _source select 0};

private ["_target"];
_target = [_this, 1, objNull, [objNull, []]] call BIS_fnc_param;

// Ensure a valid target is defined
if (typeName _target == typeName objNull) then {
	_target = [_target];
	{if (isNull _x) then {_target = _target - [_x]}} forEach _target;
};

if (count _target == 0) exitWith {"Invalid target defined" call BIS_fnc_error; false};
if (count _target == 1) then {_target = _target select 0};

// Terminate previous feed
[] call BIS_fnc_liveFeedTerminate;

private ["_player"];
_player = [_this, 2, objNull, [objNull]] call BIS_fnc_param;
if (isNull _player) exitWith {"Invalid player unit defined" call BIS_fnc_error; false};

if (local _player) then {
	disableSerialization;
	
	// Create feed
	BIS_liveFeed = [
		"rendertarget0",
		[
			_source,
			_target
		],
		_player
	] call BIS_fnc_PIP;
	
	// Apply effects
	private ["_mode"];
	_mode = [_this, 3, 0, [0]] call BIS_fnc_param;
	_mode call BIS_fnc_liveFeedEffects;
	
	[] spawn {
		scriptName "BIS_fnc_liveFeed: transition in";
		
		disableSerialization;
		
		waitUntil {!(isNull (uiNamespace getVariable "BIS_fnc_PIP_RscPIP"))};
		
		private ["_disp"];
		_disp = uiNamespace getVariable "BIS_fnc_PIP_RscPIP";
		
		// Display images
		for "_i" from 12 to 0 step - 1 do {
			private ["_ctrl"];
			_ctrl = _disp displayCtrl (2400 + _i);
			
			_ctrl ctrlSetPosition ctrlPosition (_disp displayCtrl 2300);
			_ctrl ctrlCommit 0;
			
			// 30 FPS
			uiSleep 0.03;
			
			_ctrl ctrlSetPosition [0,0,0,0];
			_ctrl ctrlCommit 0;
		};
	};
};

true