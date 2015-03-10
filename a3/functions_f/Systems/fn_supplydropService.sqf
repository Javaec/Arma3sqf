
/*
	File: supplydropService.sqf
	Author: Choze, Vilem

	Description:
	Supply drop service - controls approach and departure of transporting air vehicle and actual cargo drop. Used by Supply drop support request.

	Parameter(s):
	1: <object> unit allowed to use the transport system
	2: <object> vehicle providing transport
	4: <array> positions to be cosen by player; accepted strings are "pickup" and "unload", the second position is defined by the next paramter (OPTIONAL)
	5: <position> (NEEDED ONLY IF PARAMETER #4 IS USED)

	Returns:
	N/A
*/

//MP framework init (used for move command given to transporter vehicle)
if (isnil "RE") then {[] execVM "\A3\modules_f\MP\data\scripts\MPframework.sqf"};

textLogFormat["SOM_ supplydropService.sqf %1 %2",_this,time];

//parameters init
_caller = _this select 0;
_veh = _this select 1;

//making sure valid parameters are used
if (typeName _caller != "OBJECT") exitWith {textLogFormat ["Error: Invalid TSS parameter #1: is %1, expected OBJECT.", typeName _caller]};
if (typeName _veh != "OBJECT") exitWith {textLogFormat ["Error: Invalid TSS parameter #2: is %1, expected OBJECT.", typeName _veh]};
if (count _this > 2) then {
	_override = _this select 2;
	if (typeName _override != "ARRAY") exitWith {textLogFormat ["Error: Invalid TSS parameter #3: is %1, expected ARRAY.", typeName _override]}
};

//setting up initial variables
if (format ["%1", _veh getVariable "supPool"] == "<null>") then {_veh setVariable ["supPool", [], TRUE]};
if (isNil {_veh getVariable "supPool"}) then {textLogFormat ["DROP_ERROR: supPool %1 of %2",_veh, _veh getVariable "supPool"];};
if (format ["%1", _veh getVariable "supPhase"] == "<null>") then {_veh setVariable ["supPhase", 0, TRUE]};
if (format ["%1", _veh getVariable "onMission"] == "<null>") then {_veh setVariable ["onMission", objNull, TRUE]};

//adding the unit to pool
if (!(_caller in (_veh getVariable "supPool"))) then {_veh setVariable ["supPool", (_veh getVariable "supPool") + [_caller], TRUE]};

/*
//parameters array init (global, for use with eventhandler)
_veh setVariable ["secondaryCalling", [_caller, _veh, [0, 0, 0], _override, _allowed, _plannedLZ], TRUE];
*/

textLogFormat["SOM_ transportService.sqf click %1 %2",_this,time];

//alt-mapclick for calling the vehicle
[_caller, _veh, _override] onMapSingleClick 
  {
    if (_alt) then 
      {
        [_this select 0, _this select 1, _pos, _this select 2] execFSM "A3\functions_f\systems\fn_supplydropService.fsm";
        hint "";
      }
  };

//"how-to-use" hint
if (isPlayer _caller && !(_caller in _veh)) then {hint  localize "init.sqf_0"};