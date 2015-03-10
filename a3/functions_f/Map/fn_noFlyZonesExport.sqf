private ["_tabAdd","_tabCount","_tab","_br","_trigger","_class","_position","_area","_timeout","_type","_textPosition","_textArea","_textExport","_listTriggers","_triggerCounter"];

_tabAdd = "";
_tabCount = if (count _this > 0) then {_this select 0} else {0};
_tab = tostring [9];
for "_i" from 1 to _tabCount do {_tabAdd = _tabAdd + _tab;};
_br = tostring [13,10] + _tabAdd;
_textExport = _tabAdd;

_triggerCounter = 0;
_listTriggers = position bis_functions_mainscope nearobjects ["emptydetector",100000];
{
	_trigger = _x;
	_class = triggertext _trigger;
	_position = position _trigger;
	_area = triggerarea _trigger;
	_area set [3,[0,1] select (_area select 3)];
	_timeout = triggertimeout _trigger;
	_type = _timeout select 0;

	if (_class == "") then {
		_class = format ["EmptyDetector%1",_triggerCounter];
		_triggerCounter = _triggerCounter + 1;
	};

	_textPosition = "{";
	{
		_textPosition = _textPosition + str _x;
		if (_forEachIndex < count _position - 1) then {_textPosition = _textPosition + ","};
	} foreach _position;
	_textPosition = _textPosition + "};";

	_textArea = "{";
	{
		_textArea = _textArea + str _x;
		if (_forEachIndex < count _area - 1) then {_textArea = _textArea + ","};
	} foreach _area;
	_textArea = _textArea + "};";
	

	_textExport = _textExport + format ["class %1",_class] + _br;
	_textExport = _textExport + "{" + _br;
	_textExport = _textExport + _tab + format ["position[] = %1",_textPosition] + _br;
	_textExport = _textExport + _tab + format ["area[] = %1",_textArea] + _br;
	if (_type > 0) then {_textExport = _textExport + _tab + format ["type = %1;",_type] + _br};
	_textExport = _textExport + "};" + _br;

} foreach _listTriggers;

copytoclipboard _textExport;
hint parsetext _textExport;