//
/*
	Author: Karel Moricky

	Description:
	Copy Scripted Database content into clipoboard for evaluation.
	Text will be formatted as config.

	Parameter(s):
	_this select 0: ARRAY - Database array
	_this select 1: NUMBER (optional) - Number of tabs

	Returns:
	STRING - printed text
*/

private ["_db","_textExport","_br","_tab","_tabAdd","_tabCount","_text","_textArray"];
_db = [_this,0,[],[[],""]] call bis_fnc_param;
_tabCount = [_this,1,0,[0]] call bis_fnc_param;

_textExport = "";
_br = tostring [13,10];
_tab = tostring [9];
_tabAdd = "";
for "_i" from 1 to _tabCount do {_tabAdd = _tabAdd + _tab;};

{
	if (_x call BIS_fnc_dbIsClass) then {
		_textArray = toarray _x;
		_textArray set [0,-1];
		_textArray = _textArray - [-1];
		_text = tostring _textArray;
		_data = _db select (_forEachIndex + 1);
		_textExport = _textExport + _tabAdd + "class " + _text + _br;
		_textExport = _textExport + _tabAdd + "{" + _br;
		_textExport = _textExport + ([_data,_tabCount+1] call BIS_fnc_dbPrint);
		_textExport = _textExport + _tabAdd + "};" + _br;
	};

	if (_x call BIS_fnc_dbIsValue) then {
		_textArray = toarray _x;
		_textArray set [0,-1];
		_textArray = _textArray - [-1];
		_text = tostring _textArray;
		_value = _db select (_forEachIndex + 1);
		_textExport = _textExport + _tabAdd + _text + " = " + str _value + _br;
	};
} foreach _db;

copytoclipboard _textExport;
_textExport;

// + _tabAdd