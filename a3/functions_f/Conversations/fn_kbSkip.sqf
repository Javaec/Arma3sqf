/*
	Author: Karel Moricky

	Description:
	Skip conversation. Currently played sentence will be finished

	Parameter(s):
	_this select 0: STRING - Topic name
	_this select 1 (Optional): STRING - container name (default: current mission ID)

	Returns:
	NUMBER
*/

private ["_topicName","_mission","_wait","_varName"];

_topicName =	[_this,0,"",[""]] call bis_fnc_param;
_mission =	[_this,1,missionname,[""]] call bis_fnc_param;
_wait =		[_this,2,false,[false,[],0]] call bis_fnc_param;

_varName = _topicname + _mission;

//--- Just asking
if (typename _wait == typename []) exitwith {
	private ["_return"];
	_return = bis_functions_mainscope getvariable _varName;
	if (isnil "_return") then {
		_return = -1;
	} else {
		if (count  _wait > 0) then {
			bis_functions_mainscope setvariable [_varName,nil];
		};
	};
	_return
};

//--- Set
if (typename _wait == typename true) then {_wait = [0,1] select _wait;};
bis_functions_mainscope setvariable [_varName,_wait];
_wait