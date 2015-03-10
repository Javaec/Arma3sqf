startloadingscreen [""];

_br = tostring [13,10];
_data = "//--- " + GUI_title + _br;
_defines = [];
_defineChars = [];
_charsMax = 0;
_allowedChars = toarray "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_";
_idcOffset = 0;
_titleArray = toarray GUI_title;
{_idcOffset = _idcOffset + _x * _foreachindex;} foreach _titleArray;

for "_i" from (count GUI_listElements - 1) to 0 step -1 do {

	_idc = GUI_listElements select _i;
	_idcLayer = _idc call GUI_fnc_elementLayer;
	if (_idcLayer > 0) then {
		_idcDataCustom = _idc call GUI_fnc_elementDataCustom;
		_idcCustom = false;
		{
			_dataCustom = [_x] call GUI_fnc_stringSplit;
			if ({_x == "idc"} count _dataCustom > 0) exitwith {_idcCustom = true;};
		} foreach _idcDataCustom;

		if !(_idcCustom) then {
			_idcParent = _idc call GUI_fnc_elementParent;
			_idcClass = _idc call GUI_fnc_elementClass;
			_idcClass = format [_idcClass,GUI_title];
			if (_idcClass == "") then {
				_idcClass = _idcParent + "_" + str _idc;
			};

			_idcClass = _idcClass call GUI_fnc_elementClassFiltered;

			_define = format ["#define IDC_%1_%2",toupper GUI_title,toupper _idcClass];
			_charsCount = count toarray _define;
			_charsMax = _charsCount max _charsMax;
			_defineChars set [count _defineChars,_charsCount];
			_defines set [_idc,[_define,_idc,_charsCount]];
		};
	};
};
_charsMax = _charsMax + 1;
{
	if !(isnil "_x") then {
		_define = _x select 0;
		_idc = _x select 1;
		_charsCount = _x select 2;

		_spaceCount = _charsMax - _charsCount;
		if (_charsCount % 8 == 7) then {_spaceCount = _spaceCount + 1};
		_space = "";
		for "_s" from 1 to _spaceCount step 8 do {_space = _space + "	";};
		_data = _data + _define + _space + str (_idc + _idcOffset) + _br;
	};
} foreach _defines;

copytoclipboard _data;
debuglog "Log: GUI: Export define macros";

endloadingscreen;