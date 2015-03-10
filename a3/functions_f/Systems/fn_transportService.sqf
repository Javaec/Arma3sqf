
/*
	File: transportService.sqf
	Author: Choze

	Description:
	Transportation system

	Parameter(s):
	1: <object> unit allowed to use the transport system
	2: <object> vehicle providing transport
	3: <array> positions to be chosen by player; accepted strings are "pickup" and "unload", the second position is defined by the next paramter (OPTIONAL)
	4: <position> (NEEDED ONLY IF PARAMETER #3 IS USED)

	Returns:
	N/A
*/

//MP framework init (used for move command given to transporter vehicle)
if (isnil "RE") then {[] execVM "\A3\modules_f\MP\data\scripts\MPframework.sqf"};

textLogFormat["SOM_ transportService.sqf %1 %2",_this,time];

//parameters init
_caller = _this select 0;
_veh = _this select 1;
_passedPos = _this select 2;
_mainScope = _this select 3;
_secopScope = _this select 4;

_supportType = "transport";
if (count _this > 5) then {_supportType = _this select 5};
_plannedLZ = [0, 0, 0];
_allowed = ["pickup", "unload"];

//making sure valid parameters are used
if (typeName _caller != "OBJECT") exitWith {textLogFormat ["Error: Invalid TSS parameter #1: is %1, expected OBJECT.", typeName _caller]};
if (typeName _veh != "OBJECT") exitWith {textLogFormat ["Error: Invalid TSS parameter #2: is %1, expected OBJECT.", typeName _veh]};
if (!(isnil {_mainScope getVariable "TSS_allowed"})) then {
	_allowed = _mainScope getVariable "TSS_allowed";
	if (!(typeName _allowed == "ARRAY")) exitWith {textLogFormat ["Error: Invalid TSS parameter #4: is %1, expected ARRAY.", typeName _allowed]};
	if ((isnil {_mainScope getVariable "TSS_plannedLZ"}) && count _allowed < 2) exitWith {debugLog "Error: Missing TSS parameter #5 (fixed position)."};
	_plannedLZ = _mainScope getVariable "TSS_plannedLZ";
	if (typeName _plannedLZ != "ARRAY") exitWith {textLogFormat ["Error: Invalid TSS parameter #5: is %1, expected ARRAY.", typeName _plannedLZ]}
};

//setting up initial variables
if (format ["%1", _veh getVariable "supPool"] == "<null>") then {_veh setVariable ["supPool", [], TRUE]; if (!(_caller in (_veh getVariable "supPool"))) then {_veh setVariable ["supPool", (_veh getVariable "supPool") + [_caller], TRUE]}};
if (format ["%1", _veh getVariable "supPhase"] == "<null>") then {_veh setVariable ["supPhase", 0, TRUE]};
if (format ["%1", _veh getVariable "onMission"] == "<null>") then {_veh setVariable ["onMission", objNull, TRUE]};
if (format ["%1", _veh getVariable "stuck"] == "<null>") then {_veh setVariable ["stuck", FALSE, TRUE]};

//adding the unit to pool
//if (!(_caller in (_veh getVariable "supPool"))) then {_veh setVariable ["supPool", (_veh getVariable "supPool") + [_caller], TRUE]};

//initiate the support run if it was called from the commanding menu
BIS_transportServiceFSM = [_caller, _veh, _passedPos, _allowed, _plannedLZ, _supportType] execFSM "A3\functions_f\systems\fn_transportService.fsm";

textLogFormat["SOM_ transportService.sqf click %1 %2",_this,time];

//updating positions on-the-fly
[_caller, _veh, _allowed, _plannedLZ, _supportType, _secopScope, _passedPos] spawn {
	_caller = _this select 0; _veh = _this select 1; _allowed = _this select 2; _plannedLZ = _this select 3; _supportType = _this select 4; _secopScope = _this select 5; _passedPos = _this select 6; 
	
	waitUntil {(!(isNil {_secopScope getVariable "coordsUpdate"})) || !(_caller in (_veh getVariable "supPool"))};
	if (!(_caller in (_veh getVariable "supPool"))) exitWith {};
	_lastMarkedPos = _passedPos;
	
	while {_caller in (_veh getVariable "supPool")} do {
		if (_lastMarkedPos distance (_secopScope getVariable "coordsUpdate") > 0) then {
			_lastMarkedPos = _secopScope getVariable "coordsUpdate";
			BIS_transportServiceFSM = [_caller, _veh, _lastMarkedPos, _allowed, _plannedLZ, _supportType] execFSM "A3\functions_f\systems\fn_transportService.fsm"
		};
		sleep 1
	}
};