/*
	File: fn_credits_movieSupport.sqf
	Author: Borivoj Hlava

	Description:
	Movie credits supporters preprocessor.

	Parameter(s):
	None.
	
	Returned value:
	_array: Array
	_array select 0: String - Position name (and tags) as structured text.
	_array select 1: String - Names (and tags) as structured text - 1st paragraph.
	_array select 2: String - Names (and tags) as structured text - 2nd paragraph.
	_array select 3: String - Names (and tags) as structured text - 3rd paragraph.
	_array select 4: Number - Required space coeficient (numberOfNamesInOneParagraph * textSizeCoef)
*/

private ["_config","_item","_pos","_arrayPart1","_names","_arrayPart2","_size","_x","_array", "_count","_i","_j","_arrayPart","_countNames","_stringPart"];

_config = configFile >> "CfgCredits" >> "CreditsMovie";
_item = getArray (_config >> "supporters");

// --- Position
_pos = (_item select 0) select 0;
_color = [profilenamespace getvariable ['GUI_BCG_RGB_R',0.69],profilenamespace getvariable ['GUI_BCG_RGB_G',0.69],profilenamespace getvariable ['GUI_BCG_RGB_B',0.69]];
_color = _color call BIS_fnc_colorRGBtoHTML;
_arrayPart1 = "<t align='center' size='1.5' color='" + _color + "'>" + _pos + "</t>";
_array = [_arrayPart1];

// --- Name arrays
_names = _item select 1;
_count = 50;	
_countNames = floor (((count _names)/3) + 0.99);

_i = 0;
_j = 0;
_stringPart = "<t align='center' size='0.75' color='#ffffff'>";		// names font parameters - size must be changed in _size parameter too
_arrayPart2 = [];
{
	if (_countNames > _count) then {
		if (_i < _count) then {
			_stringPart = _stringPart + _x + "<br/>";
			_i = _i + 1;
		} else {
			_arrayPart2 = _arrayPart2 + [_stringPart + "<br/></t>"];
			_stringPart = "<t align='center' size='0.75' color='#ffffff'>" + _x + "<br/>";
			_i = 1;
			_j = _j + 1;
			if (_j == 3) then {
				_j = 0;
				_countNames = _countNames - _count;
			}
		};
	} else {
		if (_i < _countNames) then {
			_stringPart = _stringPart + _x + "<br/>";
			_i = _i + 1;
		} else {
			_arrayPart2 = _arrayPart2 + [_stringPart + "<br/></t>"];
			_stringPart = "<t align='center' size='0.75' color='#ffffff'>" + _x + "<br/>";
			_i = 1;
			_j = _j + 1;
			if (_j == 3) then {
				_j = 0;
				_countNames = _countNames - _count;
			}
		};
	};
} forEach _names;
_arrayPart2 = _arrayPart2 + [_stringPart + "<br/></t>"];

_array = _array + [_arrayPart2];

_array 