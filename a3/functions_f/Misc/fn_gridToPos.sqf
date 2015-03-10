/*
	Author: Karel Moricky

	Description:
	Converts grid coordinates to world position.
	Correct results outside of the map area are not guaranteed.

	Parameter(s):
		0: STRING - grid returned by mapGridPosition command

	Returns:
	ARRAY in format [[gridX:Number,gridY:Number],[gridWidth:Number,gridHeight:Number]]
*/

private ["_posGrid","_cfgGrid","_offsetX","_offsetY","_zoomMax","_format","_formatX","_formatY","_stepX","_stepY"];
_posGrid = [_this,0,mapgridposition position cameraon,[""]] call bis_fnc_param;

//--- Extract grid values from world config
_cfgGrid = configfile >> "CfgWorlds" >> worldname >> "Grid";
_offsetX = getnumber (_cfgGrid >> "offsetX");
_offsetY = getnumber (_cfgGrid >> "offsetY");
_zoomMax = 1e99;
_format = "";
_formatX = "";
_formatY = "";
_stepX = 1e10;
_stepY = 1e10;
{
	_zoom = getnumber (_x >> "zoomMax");
	if (_zoom < _zoomMax) then {
		_zoomMax = _zoom;
		_format = gettext (_x >> "format");
		_formatX = gettext (_x >> "formatX");
		_formatY = gettext (_x >> "formatY");
		_stepX = getnumber (_x >> "stepX");
		_stepY = getnumber (_x >> "stepY");
	};
} foreach configproperties [_cfgGrid,"isclass _x",false];

//--- Get grid format
private ["_iX","_iY","_formatXcount","_formatYcount"];
_iX = -1;
_iY = -1;
{if (_iX < 0) then {_iX = _format find _x;};} foreach ["X","x"];
{if (_iY < 0) then {_iY = _format find _x;};} foreach ["Y","y"];
_formatXcount = count _formatX;
_formatYcount = count _formatY;

//--- Convert letters to numbers
private ["_replaceBefore","_replaceAfter","_posGridX","_posGridY","_fnc_lettersToNumbers"];
_replaceBefore = toarray " 0123456789abcdefghijklmnopqrestuvwxyz";
_replaceAfter = [-1,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25];
_posGridX = _posGrid select [_iX,_formatXcount];
_posGridY = _posGrid select [_iY + _formatXcount - 1,_formatYcount];

_fnc_lettersToNumbers = {
	_array = toarray tolower (_this select 0);
	_count = _this select 1;
	_step = _this select 2;
	_result = 0;
	{
		_result = _result + (_replaceAfter select ((_replaceBefore find _x) max 0)) * _step * 0.1 * 10^(_count - _foreachindex);
	} foreach _array;
	_result
};

_posGridX = [_posGridX,_formatXcount,_stepX] call _fnc_lettersToNumbers;
_posGridY = [_posGridY,_formatYcount,_stepY] call _fnc_lettersToNumbers;
_formatX = [_formatX,_formatXcount,_stepX] call _fnc_lettersToNumbers;
_formatY = [_formatY,_formatYcount,_stepY] call _fnc_lettersToNumbers;

_posGridX = _posGridX - _formatX;
_posGridY = _posGridY - _formatY;

//--- Get map size (ToDo: Universal detection by new scripting command)
private ["_ctrlMap","_mapPos1","_mapPos2","_mapSize"];
_ctrlMap = finddisplay 12 displayctrl 51;
_mapPos1 = _ctrlMap ctrlmapscreentoworld [0,0];
_mapPos2 = _ctrlMap ctrlmapscreentoworld [1,0];
_mapPos1 set [2,0];
_mapPos2 set [2,0];
_mapSize = round ((_mapPos1 vectordistance _mapPos2) / ctrlmapscale _ctrlMap);

//--- Correct vertical pos, which for legacy reasons starts in top left, not bottom left corner
if (_stepY > 0) then {_offsetY = _offsetY + _stepY;};

//--- Return the position
[[_offsetX + _posGridX,_mapSize - _offsetY - _posGridY],[abs _stepX,abs _stepY]]