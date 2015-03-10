private ["_size","_sizeX","_sizeY","_sizeW","_sizeH","_gridX","_gridY","_gridVar","_thicknessX","_thicknessY","_idc","_idcBase","_idcLimit"];
#define	GUI_DISPLAY	(uinamespace getvariable "BIS_RscGUIEditor_main")
#define GUI_CONTROL	(GUI_DISPLAY displayctrl _idc)

_size = if (count _this > 0) then {_this select 0} else {[0,0,1,1]};
if (typename _size == typename 0) then {_size = [safezoneX,safezoneY,safezoneW,safezoneH]};
_sizeX = _size select 0;
_sizeY = _size select 1;
_sizeW = _size select 2;
_sizeH = _size select 3;
_gridX = if (count _this > 1) then {_this select 1} else {_sizeW / 40};
_gridY = if (count _this > 2) then {_this select 2} else {_sizeH / 25};
_gridVar = if (count _this > 3) then {_this select 3} else {
	if (isnil "GUI_grid") exitwith {"GUI_GRID"};
	if (count GUI_grid > 3) then {GUI_grid select 3} else {"GUI_GRID"}
};
_thicknessX = 0.001 * safezoneH;
_thicknessY = _thicknessX * 4/3;
_idcBase = GUI_layer_grid;
_idcLimit = _idcBase + 99;

GUI_grid = [_size,_gridX,_gridY,_gridVar];

//--- Exception (Shift + G)
if (count _this > 0) then {
	if (typename (_this select 0) == typename 0) then {
		GUI_grid = [["safezoneX","safezoneY","safezoneW","safezoneH"],"safezoneW / 40","safezoneH / 25",_gridVar];
	};
};

if (typename _sizeX == typename "") then {_sizeX = call compile _sizeX};
if (typename _sizeY == typename "") then {_sizeY = call compile _sizeY};
if (typename _sizeW == typename "") then {_sizeW = call compile _sizeW};
if (typename _sizeH == typename "") then {_sizeH = call compile _sizeH};
if (typename _gridX == typename "") then {_gridX = call compile _gridX};
if (typename _gridY == typename "") then {_gridY = call compile _gridY};

//--- Save global variable (watch for grid/set naming difference)
missionnamespace setvariable [format ["%1_X",_gridVar],_sizeX];
missionnamespace setvariable [format ["%1_Y",_gridVar],_sizeY];
missionnamespace setvariable [format ["%1_W",_gridVar],_gridX];
missionnamespace setvariable [format ["%1_H",_gridVar],_gridY];

//--- Reset
for "_idc" from _idcBase to _idcLimit do {
	GUI_CONTROL ctrlsetbackgroundcolor [0,0,0,0];
	GUI_CONTROL ctrlcommit 0;
};
_idc = _idcBase;

//--- Set
for "_x" from _sizeX to (_sizeX + _sizeW) step _gridX do {
	GUI_CONTROL ctrlsetposition [
		_x,
		_sizeY,
		_thicknessX,
		_sizeH
	];
	GUI_CONTROL ctrlsetbackgroundcolor [0,0,0,0.1];
	GUI_CONTROL ctrlcommit 0;

	_idc = _idc + 1;
	if (_idc > _idcLimit) exitwith {debuglog ["Log::::::::::ERROR: Grid Overflow X",_x];};
};
if (_idc > _idcLimit) exitwith {};

for "_y" from _sizeY to (_sizeY + _sizeH) step _gridY do {
	GUI_CONTROL ctrlsetposition [
		_sizeX,
		_y,
		_sizeW,
		_thicknessY
	];
	GUI_CONTROL ctrlsetbackgroundcolor [0,0,0,0.5];
	GUI_CONTROL ctrlcommit 0;

	_idc = _idc + 1;
	if (_idc > _idcLimit) exitwith {debuglog ["Log::::::::::ERROR: Grid Overflow Y",_y];};
};

//--- Refresh all elements
//_disableGroupAdjust = true; //--- Disable counter adjusting
{
	_idc = _x;
	_idcData = _idc call GUI_fnc_elementData;

	//--- Position
	_input = _idcData select GUI_param_position;
	if ((_idcData select GUI_param_positionType) <= 2) then {
		[_idc,_input] call GUI_fnc_elementSetPosition;
	};

	//--- SizeEx (based on grid height)
	_input = _idcData select GUI_param_sizeEx;
	[_idc,_input] call GUI_fnc_elementSetSizeEx;
} foreach GUI_listElements;