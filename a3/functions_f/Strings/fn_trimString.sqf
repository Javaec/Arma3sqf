/*
	Author: Jiri Wainar

	Description:
	Get a substring out of the string.

	Parameter(s):
		1: STRING - source string

		2: NUMBER (optional, default 0) - start index;
		   * indexing starts at 0

		3: NUMBER (optional, default end of string) - end index
		   * negative number means -X chars from the string end

	Returns:
	STRING
*/

private["_string","_startIdx","_endIdx","_maxIdx","_stringArray","_substringArray","_i","_substring"];

_string   = [_this,0,"",[""]] call bis_fnc_param;
_startIdx = [_this,1,0,[123]] call bis_fnc_param;
_endIdx   = [_this,2,10e10,[123]] call bis_fnc_param;

_stringArray = toArray _string;

_maxId = (count _stringArray) - 1;

//exit if empty string
if (_maxId < 0) exitWith {""};

//check for negative end index
if (_endIdx < 0) then
{
	_endIdx = _maxId + _endIdx;
};
if (_endIdx < 0) then
{
	_endIdx = 0;
};

//check the end index max. value
if ((_endIdx == 10e10) || (_endIdx > _maxId)) then
{
	_endIdx = _maxId;
};

//check the start index min. value
if ((_startIdx < 0) || (_startIdx > _endIdx)) then
{
	_startIdx = 0;
};

_substringArray = [];

for "_i" from _startIdx to _endIdx do
{
	_substringArray = _substringArray + [_stringArray select _i];
};

_substring = toString _substringArray;
_substring