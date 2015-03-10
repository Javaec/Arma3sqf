/*
	Author: Karel Moricky

	Description:
	Remove scripted event handler

	Parameter(s):
		0: NAMESPACE, OBJECT, GROUP or LOCATION - namespace in which handler is saved
		1: STRING - handler name
		2: NUMBER - handler ID

	Returns:
	BOOL
*/
private ["_namespace","_name","_handlerID","_handlers"];

_namespace = [_this,0,objnull,[missionnamespace,objnull,grpnull,locationnull]] call bis_fnc_param;
_name = [_this,1,"",[""]] call bis_fnc_param;
_handlerID = [_this,2,-1,[-1]] call bis_fnc_param;

_name = "BIS_fnc_addScriptedEventHandler_" + _name;

_handlers = _namespace getvariable [_name,[]];
if (_handlerID >= 0 && _handlerID < count _handlers) then {
	_handlers set [_handlerID,-1];
	_namespace setvariable [_name,_handlers];

	[missionnamespace,"scriptedEventHandlerRemoved",[_namespace,_name,_handlerID]] call bis_fnc_callScriptedEventHandler;
	true
} else {
	false
};