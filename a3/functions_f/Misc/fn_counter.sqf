/*
	Author: Karel Moricky

	Description:
	Modify givem counter (create it if doesn't exist yet)

	Parameter(s):
	_this select 0:
		STRING - variable name of counter
		ARRAY in format [variableName,nameSpace], where nameSpace can be object, group or missionNameSpace/uiNameSpace
	_this select 1 (Optional): NUMBER - added value
	_this select 2 (Optional): NUMBER - modulo value

	Returns:
	NUMBER - counter's value
*/

private ["_varData","_varName","_varSpace","_add","_mod","_var"];

_varData =	[_this,0,"",["",[]]] call bis_fnc_param;
_add =		[_this,1,0,[0,false]] call bis_fnc_param;
_mod =		[_this,2,-1,[0]] call bis_fnc_param;

_varName = [_varData,0,"",[""]] call bis_fnc_paramin;
_varSpace = [_varData,1,missionnamespace,[missionnamespace,grpnull,objnull]] call bis_fnc_paramin;

//--- Get
_var = _varSpace getvariable _varName;
if (isnil "_var") then {_var = 0};
if (typename _var != typename 0) exitwith {["%1 is %2, must be %3",_varName,typename _var,typename 0] call bis_fnc_error; 0};

//--- Modify
if (typename _add == typename false) then {
	if (_add) then {

		//--- Clean
		_varSpace setvariable [_varName,nil];
		nil
	} else {

		//--- Return without modification
		_varSpace setvariable [_varName,_var];
		_var
	};
} else {

	//--- Add
	_var = _var + _add;
	if (_mod > 0) then {_var = _var % _mod};
	_varSpace setvariable [_varName,_var];
	_var
};