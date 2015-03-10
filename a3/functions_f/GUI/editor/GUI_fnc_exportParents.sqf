_shift = _this select 0;
_br = tostring [13,10];
_tab = tostring [9];
_textExport = if (_shift) then {
	_gridSize = GUI_grid select 0;
	_gridSizeX = _gridSize select 0;
	_gridSizeY = _gridSize select 1;
	_gridX = GUI_grid select 1;
	_gridY = GUI_grid select 2;

	//--- Get number of grid elements
	_gridSizeW = (_gridSize select 2);
	_gridSizeH = (_gridSize select 3);
/*
	if (typename _gridSizeW == typename "") then {_gridSizeW = call compile _gridSizeW};
	if (typename _gridSizeH == typename "") then {_gridSizeH = call compile _gridSizeH};
	if (typename _gridX == typename "") then {_gridX = call compile _gridX};
	if (typename _gridY == typename "") then {_gridY = call compile _gridY};
	_gridSizeW = _gridSizeW / _gridX;
	_gridSizeH = _gridSizeH / _gridY;
*/

	//--- Return original values
	_gridX = GUI_grid select 1;
	_gridY = GUI_grid select 2;

	_textExport = "";
	{
		_gridVar = GUI_grid select 3;
		_label = [
			format ["%1_X",_gridVar],
			format ["%1_Y",_gridVar],
			format ["%1_W",_gridVar],
			format ["%1_H",_gridVar],
			format ["%1_WAbs",_gridVar],
			format ["%1_HAbs",_gridVar]
		] select _forEachIndex;
		_textExport = _textExport + format ["#define %1",_label] + _tab + format ["(%1)",_x] + _br;
	} foreach [_gridSizeX,_gridSizeY,_gridX,_gridY,_gridSizeW,_gridSizeH];
	_textExport
} else {
	_textExport = loadfile (GUI_path + "GUI_styles.hpp") + _br;
	{
		if (GUI_listLayers select _foreachindex != GUI_layer_comment) then {
			_textParent = [configfile >> _x] call GUI_fnc_returnConfig;
			_textExport = _textExport + _textParent;
		};
	} foreach GUI_listLayersParents;
	_textExport
};
copytoclipboard _textExport;