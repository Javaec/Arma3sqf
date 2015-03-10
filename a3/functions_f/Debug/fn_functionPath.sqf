/*
	Author: Karel Moricky

	Description:
	Returns path to function file

	Parameter(s):
	_this: STRING - function name (if not defined, name of parent function is used)

	Returns:
	STRING
*/

private ["_scriptName","_meta"];

//--- Use parent script name when no argument is passed
_scriptName = if (isnil "_fnc_scriptName") then {""} else {_fnc_scriptName};
_scriptName = [_this,0,_scriptName,[""]] call bis_fnc_param;

//-- Get meta data
//_meta = uinamespace getvariable [_scriptName + "_meta",[]];
//if (isnil "_meta") exitwith {_meta = missionnamespace getvariable [_scriptName + "_meta",[]]};
_meta = _scriptName call bis_fnc_functionMeta;

if (count _meta > 0) then {
	//--- Return
	_meta select 0
} else {
	//--- Not found - error
	["Function '%1' not found",_scriptName] call bis_fnc_error;
	nil
};