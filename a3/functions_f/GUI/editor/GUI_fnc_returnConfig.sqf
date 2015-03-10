private ["_path","_tabCount","_text","_br","_current","_currentClass","_currentValue","_tabGet","_tab","_tabNext","_textTemp"];

_path = _this select 0;
_tabCount = if (count _this > 1) then {_this select 1} else {0};

_br = tostring [13,10];
_symbol_tab = toarray "	" select 0;
_tabGet = {
	private ["_return"];
	_return = "";
	for "_i" from 1 to _this do {
		_return = _return + tostring [9];
	};
	_return
};
_tab = _tabCount call _tabGet;
_tabNext = (_tabCount + 1) call _tabGet;
_text = _tab + "class " + configname _path + _br + _tab + "{" + _br;

for "_i" from 0 to (count _path - 1) do {
	_current = _path select _i;
	_currentClass = configname _current;
	_currentValue = gettext _current;
	if (isarray _current) then {
		_currentValue = getarray _current;
		_currentClass = _currentClass + "[]";
		_textTemp = _br + _tabNext + "{" + _br;
		{
			_textTemp = _textTemp + _tabNext + "	" + str _x;
			if (_forEachIndex < (count _currentValue - 1)) then {_textTemp = _textTemp + ",";};
			_textTemp = _textTemp + _br;
		} foreach _currentValue;
		_textTemp = _textTemp + _tabNext + "}";
		_currentValue = _textTemp;
	};
	if (isnumber _current) then {
		_currentValue = str getnumber _current;
	};
	if (istext _current) then {
		_currentValueArray = toarray _currentValue;
		_currentValueArray = _currentValueArray - [_symbol_tab];
		_currentValue = tostring _currentValueArray;
		_currentValue = str _currentValue;
	};
	if (isclass _current) then {
		_text = _text + ([_current,_tabCount + 1] call GUI_fnc_returnConfig);
	} else {
		_text = _text + _tabNext + _currentClass + " = " + _currentValue + ";" + _br;
	};
};
_text = _text + _tab + "};" + _br;

_text