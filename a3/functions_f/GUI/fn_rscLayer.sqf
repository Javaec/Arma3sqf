/*
	Author: Karel Moricky

	Description:
	Register RSC layer.

	Parameter(s):
	_this select 0: STRING - layer name. Parent function name is used automatically when param is nil.

	Returns:
	NUMBER
*/

private ["_name","_list","_id"];
_name = [_this,0,"",[""]] call bis_fnc_param;
_list = missionnamespace getvariable ["bis_fnc_rscLayer_list",[]];

if (_name == "") then {
	if (_fnc_scriptNameParent != _fnc_scriptName) then {
		_name = _fnc_scriptNameParent;
	};
};
if (_name == "") exitwith {"RSC Layer name cannot be empty string" call bis_fnc_error; -1};

_id = _list find _name;
_id = if (_id < 0) then {
	_id = (count _list + 2) / 2;
	_list set [count _list,_name];
	_list set [count _list,_id];
	_id
} else {
	_list select (_id + 1)
};

missionnamespace setvariable ["bis_fnc_rscLayer_list",_list];
_id