/*
	File: advHintCredits.sqf
	Author: Borivoj Hlava

	Description:
	Advanced hint credits preprocessor.

	Parameter(s):
	None.
	
	Returned value:
	String - credits.
*/

_list = libraryCredits;
_text = "";

_invChar02 = "<img image='#(argb,8,8,3)color(0,0,0,0)' size='0.2' />";
_dot = "<img image='\A3\ui_f\data\igui\rscingameui\Rschint\indent_square.paa' size = '0.25' shadow = '0'/> ";
_smallSpace = format ["<br/>%1<br/>", _invChar02];
_keyColor = (["GUI", "BCG_RGB"] call BIS_fnc_displayColorGet) call BIS_fnc_colorRGBtoHTML;
_element = format ["<t color = '%1'>", _keyColor];

{
	_name = _x select 0;
	_data = _x select 1;
	
	_dataArray = toArray _data;
	_link = false;
	_tempDataArray1 = [];
	_tempDataArray2 = [];
	{
		if (!_link) then {	//no link found so far
			if (_x == 104) then {//leter "h" found
				if (((count _dataArray) > (_forEachIndex + 7)) && {(_dataArray select (_forEachIndex+1)) == 116} && {(_dataArray select (_forEachIndex+2)) == 116} && 
					{(_dataArray select (_forEachIndex+3)) == 112} &&{(_dataArray select (_forEachIndex+4)) == 58} && {(_dataArray select (_forEachIndex+5)) == 47} && 
					{(_dataArray select (_forEachIndex+6)) == 47}) then {	//-- are next six letters "ttp://"?
					
					_tempDataArray1 = + _dataArray;
					_tempDataArray1 resize _forEachIndex;
					_tempDataArray2 = _tempDataArray2 + [_x];
					_link = true;
				};
			};
		} else {	//link already found
			_tempDataArray2 = _tempDataArray2 + [_x];
		};
	} forEach _dataArray;
	
	if (_link) then {	//link was found
		_data = (toString _tempDataArray1) + _element + "<a href='" + (toString _tempDataArray2) + "'>" + (toString _tempDataArray2) + "</a></t>";
	};
	
	_item = _smallSpace + _dot + " " + _element + _name + "</t> (" + _data + ")";
	_text = _text + _item;
} forEach _list;

_text