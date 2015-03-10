scriptName "Marta\data\scripts\main.sqf";
/*
	File: main.sqf
	Author: Karel Moricky

	Description:
	Init script - Marked Targets

	Parameter(s):
	_this: the Marta logic unit which triggered this script.
*/


_logic = _this select 0;
_logic setpos [1000,10,0];
_logic setvariable ["allgroups",[],true];
_logic setvariable ["zones",[]];
_logic setvariable ["WPgroups_current",[],true];
publicvariable "BIS_marta_mainscope";

//--- Execute Functions
/*
if (isnil "bis_fnc_init") then {
	_logicFnc = (group _logic) createunit ["FunctionsManager",position player,[],0,"none"];
};
*/

//--- Is MP Framework running? --- Obsolete, Functions are executing Framework now
//if (isnil "RE") then {[] execVM "\A3\modules_f\MP\data\scripts\MPframework.sqf"};

waituntil {!isnil "BIS_fnc_init"};

textLogFormat["MARTA-PRELOAD_ main.sqf sleep..."];
//sleep 0.1;

//--- Get custom params ----------------------------------------------------------------------------------
//--- Debug
_debug = if (isnil {_logic getvariable "debug"}) then {false} else {true};
_logic setvariable ["debug",_debug,true];

//--- Rules
_factionsRules = [
	["o_",east call bis_fnc_sidecolor],
	["b_",west call bis_fnc_sidecolor],
	["n_",resistance call bis_fnc_sidecolor],
	["n_",civilian call bis_fnc_sidecolor]
];
_rules = if (isnil {_logic getvariable "rules"}) then {_factionsRules} else {_logic getvariable "rules"};
_logic setvariable ["rules",_rules,true];

//--- Pause
_pause = if (isnil {_logic getvariable "pause"}) then {false} else {_logic getvariable "pause"};
_logic setvariable ["pause",_pause,true];

//--- Delay
_delay = if (isnil {_logic getvariable "delay"}) then {0.5} else {_logic getvariable "delay"};
_logic setvariable ["delay",_delay,true];

//--- Step
_step = if (isnil {_logic getvariable "step"}) then {0.5} else {_logic getvariable "step"};
_logic setvariable ["step",_step,true];

//--- Duration of no longer known markers
_duration = if (isnil {_logic getvariable "duration"}) then {300} else {_logic getvariable "duration"};
_logic setvariable ["duration",_duration,true];

//--- Minimal squad size
_minsize = if (isnil {_logic getvariable "minsize"}) then {1} else {_logic getvariable "minsize"};
_logic setvariable ["minsize",_minsize,true];

//--- Offset
_offset = if (isnil {_logic getvariable "offset"}) then {50} else {_logic getvariable "offset"};
_logic setvariable ["offset",_offset,true];

//--- Groups with displayed waypoints
_WPgroups = if (isnil {_logic getvariable "WPgroups"}) then {[]} else {_logic getvariable "WPgroups"};
_logic setvariable ["WPgroups",_WPgroups,true];

//--- Codes which executes when is group detected and hidden
_codeIn = if (isnil {_logic getvariable "codein"}) then {[]} else {_logic getvariable "codein"};
_logic setvariable ["codein",_codeIn,true];
_codeOut = if (isnil {_logic getvariable "codeout"}) then {[]} else {_logic getvariable "codeout"};
_logic setvariable ["codeout",_codeOut,true];


//--- Create island triggers
/*
BIS_marta_trigEdW = createTrigger["EmptyDetector",[1,1]];
BIS_marta_trigEdW setTriggerArea[100000,100000,0,true];
BIS_marta_trigEdW setTriggerActivation["EAST","WEST D",true];
BIS_marta_trigGdW = createTrigger["EmptyDetector",[1,1]];
BIS_marta_trigGdW setTriggerArea[100000,100000,0,true];
BIS_marta_trigGdW setTriggerActivation["GUER","WEST D",true];
BIS_marta_trigCdW = createTrigger["EmptyDetector",[1,1]];
BIS_marta_trigCdW setTriggerArea[100000,100000,0,true];
BIS_marta_trigCdW setTriggerActivation["CIV","WEST D",true];

BIS_marta_trigWdE = createTrigger["EmptyDetector",[1,1]];
BIS_marta_trigWdE setTriggerArea[100000,100000,0,true];
BIS_marta_trigWdE setTriggerActivation["WEST","EAST D",true];
BIS_marta_trigGdE = createTrigger["EmptyDetector",[1,1]];
BIS_marta_trigGdE setTriggerArea[100000,100000,0,true];
BIS_marta_trigGdE setTriggerActivation["GUER","EAST D",true];
BIS_marta_trigCdE = createTrigger["EmptyDetector",[1,1]];
BIS_marta_trigCdE setTriggerArea[100000,100000,0,true];
BIS_marta_trigCdE setTriggerActivation["CIV","EAST D",true];

BIS_marta_trigWdG = createTrigger["EmptyDetector",[1,1]];
BIS_marta_trigWdG setTriggerArea[100000,100000,0,true];
BIS_marta_trigWdG setTriggerActivation["WEST","GUER D",true];
BIS_marta_trigEdG = createTrigger["EmptyDetector",[1,1]];
BIS_marta_trigEdG setTriggerArea[100000,100000,0,true];
BIS_marta_trigEdG setTriggerActivation["EAST","GUER D",true];
BIS_marta_trigCdG = createTrigger["EmptyDetector",[1,1]];
BIS_marta_trigCdG setTriggerArea[100000,100000,0,true];
BIS_marta_trigCdG setTriggerActivation["CIV","GUER D",true];

BIS_marta_trigWdC = createTrigger["EmptyDetector",[1,1]];
BIS_marta_trigWdC setTriggerArea[100000,100000,0,true];
BIS_marta_trigWdC setTriggerActivation["WEST","CIV D",true];
BIS_marta_trigEdC = createTrigger["EmptyDetector",[1,1]];
BIS_marta_trigEdC setTriggerArea[100000,100000,0,true];
BIS_marta_trigEdC setTriggerActivation["EAST","CIV D",true];
BIS_marta_trigGdC = createTrigger["EmptyDetector",[1,1]];
BIS_marta_trigGdC setTriggerArea[100000,100000,0,true];
BIS_marta_trigGdC setTriggerActivation["GUER","CIV D",true];

waituntil {!isnil {list BIS_marta_trigGdC}}; //---Wait until triggers are loaded
*/

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//_spawn = [nil, nil, "per", rEXECFSM,"A3\modules_f\Marta\data\fsms\marta_local.fsm"] call RE;
[["A3\modules_f\Marta\data\fsms\marta_local.fsm"],"BIS_fnc_execFSM",nil,true] call BIS_fnc_MP;
//_fsm = [] execfsm "A3\modules_f\Marta\data\fsms\marta_local.fsm";
//diag_debugfsm _fsm;
