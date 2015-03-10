/*
	Author: Karel Moricky

	Description:
	Add scripted event handler

	Parameter(s):
		0: NAMESPACE, OBJECT, GROUP or LOCATION - namespace in which handler is saved
		1: STRING - handler name
		2: CODE or STRING - code executed upon calling

	Returns:
	NUMBER - handler ID
*/
private ["_namespace","_name","_code","_handlers","_handlerID"];

_namespace = [_this,0,objnull,[missionnamespace,objnull,grpnull,locationnull]] call bis_fnc_param;
_name = [_this,1,"",[""]] call bis_fnc_param;
_code = [_this,2,{},[{},""]] call bis_fnc_param;

_name = "BIS_fnc_addScriptedEventHandler_" + _name;
if (typename _code == typename "") then {_code = compile _code;};

_handlers = _namespace getvariable [_name,[]];
_handlerID = count _handlers;
_handlers set [_handlerID,_code];
_namespace setvariable [_name,_handlers];

[missionnamespace,"scriptedEventHandlerAdded",[_namespace,_name,_handlerID]] call bis_fnc_callScriptedEventHandler;

_handlerID