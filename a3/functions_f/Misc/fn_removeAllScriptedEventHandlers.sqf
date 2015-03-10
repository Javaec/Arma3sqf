/*
	Author: Karel Moricky

	Description:
	Remove all scripted event handlers of given type

	Parameter(s):
		0: NAMESPACE, OBJECT, GROUP or LOCATION - namespace in which handler is saved
		1: STRING - handler name

	Returns:
	BOOL
*/
private ["_namespace","_name","_handlers"];

_namespace = [_this,0,objnull,[missionnamespace,objnull,grpnull,locationnull]] call bis_fnc_param;
_name = [_this,1,"",[""]] call bis_fnc_param;

_name = "BIS_fnc_addScriptedEventHandler_" + _name;

_handlers = _namespace getvariable [_name,[]];
{
	_handlers set [_foreachindex,-1];
	[missionnamespace,"scriptedEventHandlerRemoved",[_namespace,_name,_foreachindex]] call bis_fnc_callScriptedEventHandler;
} foreach _handlers;
_namespace setvariable [_name,_handlers];

true