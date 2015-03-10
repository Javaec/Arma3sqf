/*
	File: inString.sqf
	Author: Mika Hannola
	
	Description:
	Find a string within a string.
	
	Parameter(s):
	_this select 0: <string> string to be found
	_this select 1: <string> string to search from
	_this select 2 (Optional): <boolean> search is case sensitive (default: false)
	
	Returns:
	Boolean (true when string is found).
	
	How to use:
	_found = ["string", "String", true] call BIS_fnc_inString;
*/

private ["_find", "_string", "_casesensitive", "_found", "_findarray", "_stringarray", "_findcount", "_stringcount", "_match", "_y", "_i", "_x", "_forEachIndex"];

_find = [_this, 0, "", [""]] call BIS_fnc_param;
_string = [_this, 1, "", [""]] call BIS_fnc_param;
_casesensitive = [_this, 2, false, [false]] call BIS_fnc_param;

_found = false;
_findarray = toArray _find;
_stringarray = toArray _string;
_findcount = count _findarray;
_stringcount = count _stringarray;

scopeName "main";
if (_findcount <= _stringcount) then
{
	for "_y" from 0 to (_stringcount - _findcount) do
	{
		_match = [];
		for "_i" from 0 to (_findcount - 1) do
		{
			_match set [count _match, _stringarray select (_y + _i)];
		};
		if (_casesensitive) then
		{
			_found = true;
			{
				if (_x != (_match select _forEachIndex)) then
				{
					_found = false;
				};
			} forEach _findarray;
		}
		else
		{
			if (_find == toString _match) then
			{
				_found = true;
			};
		};
		if (_found) then {breakTo "main";};
	};
};

_found;