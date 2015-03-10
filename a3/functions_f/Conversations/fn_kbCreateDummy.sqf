private ["_logicFnc"];
_logicFnc = bis_functions_mainscope;

//--- Functions does not exists - terminate
if (isnil "bis_functions_mainscope") exitwith {"BIS_functions_mainscope does not exists" call bis_fnc_error; objnull};

private ["_dummyName","_dummyLogic","_cfgIdentity"];
_dummyName = [_this,0,"",[""]] call bis_fnc_param;

//--- Unit already exists - return it
if (!isnil _dummyName) exitwith {missionnamespace getvariable _dummyName};

//--- Create and save dummy
_dummyLogic = (group _logicFnc) createunit ["Logic",position _logicFnc,[],0,"none"];
missionnamespace setvariable [_dummyName,_dummyLogic];

//--- Assign identity
_cfgIdentity = configfile >> "cfgIdentities" >> _dummyName;
if (isclass _cfgIdentity) then {
	_dummyLogic setidentity (configname _cfgIdentity);
};

_dummyLogic