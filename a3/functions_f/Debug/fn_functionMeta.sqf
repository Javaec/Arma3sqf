/*
	Author: Karel Moricky

	Description:
	Returns function's meta data

	Parameter(s):
	_this: STRING - function name (if not defined, name of parent function is used)

	Returns:
	STRING
*/

private ["_scriptName","_metaData","_meta","_path"];

//--- Use parent script name when no argument is passed
_scriptName = if (isnil "_fnc_scriptName") then {""} else {_fnc_scriptName};
_scriptName = [_this,0,_scriptName,[""]] call (uinamespace getvariable "bis_fnc_param");

//-- Get meta data
_metaData = uinamespace getvariable _scriptName + "_meta";
if (isnil {_metaData}) then {_metaData = missionnamespace getvariable [_scriptName + "_meta",{["","",0,false,false,false,"","",""]}]};
_meta = call _metaData;

if (count _meta == 0) then {
	//--- Not found - error
	["Function '%1' not found",_scriptName] call (uinamespace getvariable "bis_fnc_error");
	nil
} else {
	//--- Return
	_meta
};