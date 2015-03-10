/*
	Author: Karel Moricky

	Description:
	Returns grid params and stores it into uiNameSpace

	Parameter(s):
	_this select 0: STRING - category name
	_this select 1: STRING - grid name

	Returns:
	ARRAY - format [[x,y,w,h],gridW,gridH]
*/

private ["_tagName","_gridName","_gridVar","_grid"];

_tagName = [_this,0,"GUI",[""]] call bis_fnc_param;
_gridName = [_this,1,"GRID",[""]] call bis_fnc_param;
_varBase = _tagName + "_" + _gridName + "_";
_vars = ["X","Y","W","H"];
_values = [-1,-1,-1,-1];
_exists = true;
{
	_value = profilenamespace getvariable (_varBase + _x);
	if (isnil {_value}) exitwith {_exists = false;};
	_values set [_foreachindex,_value call bis_fnc_parsenumber];
} foreach _vars;

if (_exists) then {
	_values
} else {
	["Grid '%1' not found in 'CfgGrids' >> '%2'",_gridName,_tagName] call bis_fnc_error;
	[]
};