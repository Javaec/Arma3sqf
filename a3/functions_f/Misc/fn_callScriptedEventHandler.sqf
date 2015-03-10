/*
	Author: Karel Moricky

	Description:
	Call scripted event handlers

	Parameter(s):
		0: NAMESPACE, OBJECT, GROUP or LOCATION - namespace in which handler is saved
		1: STRING - handler name
		2: ARRAY - arguments passed to the code
		3 (Optional): BOOL - true to expect returned value from all codes

	Returns:
	ARRAY - list of returned values
*/
private ["_namespace","_name","_args","_isReturn","_result","_handlers"];

_namespace = [_this,0,objnull,[missionnamespace,objnull,grpnull,locationnull]] call bis_fnc_param;
_name = [_this,1,"",[""]] call bis_fnc_param;
_args = [_this,2,[],[[]]] call bis_fnc_param;
_isReturn = [_this,3,false,[false]] call bis_fnc_param;

_name = "BIS_fnc_addScriptedEventHandler_" + _name;
_result = [];

_handlers = _namespace getvariable [_name,[]];
{
	if (typename _x == typename {}) then {
		private ["_exec"];
		_exec = {
			["_namespace","_name","_args","_result","_handlers"];
			(_this select 0) call (_this select 1)
		};
		if (_isReturn) then {
			_handler = [_args,_x] call _exec;
			if (isnil {_handler}) then {_handler = true;};
			_result set [count _result,_handler];
		} else {
			[_args,_x] call _exec;
		};
	};
} foreach _handlers;

_result