private ["_text","_textArray","_listSeparators","_listLines","_lineCurrent"];

_text = _this select 0;
_listSeparators = if (count _this > 1) then {_this select 1} else {[59,61]};
_listSpaces = [9,10,13,32];
_textArray = toarray _text;

//--- Analyze content
_listLines = [];
_lineCurrent = [];
{
	_lineCurrent = _lineCurrent + [_x];
	if (_x in _listSeparators || _forEachIndex == (count _textArray - 1)) then {
		_lineCurrent = _lineCurrent - _listSeparators;
		_lineCurrent = _lineCurrent - _listSpaces;
		_listLines = _listLines + [tostring _lineCurrent];
		_lineCurrent = [];
	};
} foreach _textArray;

//--- Remove spaces
_listLines = _listLines - [""];

//--- Set variables
{
	if (_x == "#define") then {
		_var = _listLines select (_forEachIndex + 1);
		_value = _listLines select (_forEachIndex + 2);
		missionnamespace setvariable [_var,_value];
	};
} foreach _listLines;

_listLines