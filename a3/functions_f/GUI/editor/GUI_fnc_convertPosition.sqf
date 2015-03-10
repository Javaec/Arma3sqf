private ["_pos","_positionType","_idc","_idcData","_posX","_posY","_posW","_posH","_gridVar","_gridX","_gridY","_gridW","_gridH"];
#define	GUI_DISPLAY	(uinamespace getvariable "BIS_RscGUIEditor_main")
#define GUI_CONTROL	(GUI_DISPLAY displayctrl _idc)

_idc = _this;
_idcData = _idc call GUI_fnc_elementData;

if (_idc < 0) exitwith {};
if (count _idcData != count GUI_listLayersFunctions) exitwith {
	if ((_idc call GUI_fnc_elementLayer) != GUI_layer_comment) then {
		(_idc call GUI_fnc_elementDefault) select GUI_param_position
	} else {
		//--- Comments are not displayed
		[-1,-1,0,0]
	};
};

_pos = _idcData select GUI_param_position;
_positionType = _idcData select GUI_param_positionType;

_posX = (_pos select 0) call bis_fnc_parsenumber;
_posY = (_pos select 1) call bis_fnc_parsenumber;
_posW = (_pos select 2) call bis_fnc_parsenumber;
_posH = (_pos select 3) call bis_fnc_parsenumber;

_gridVar = GUI_grid select 3;
_gridX = missionnamespace getvariable format ["%1_X",_gridVar];
_gridY = missionnamespace getvariable format ["%1_Y",_gridVar];
_gridW = missionnamespace getvariable format ["%1_W",_gridVar];
_gridH = missionnamespace getvariable format ["%1_H",_gridVar];

//--- Child of controls group (no applied when moving with control group)
_isControlGroup = (_positionType > 2 || !isnil "_grpFrom") && (isnil "_disableGroupAdjust");
if (_isControlGroup) then {
	_grpTo = _positionType;

	//--- Part of controls group (or switching from group) - use same settings as group
	private ["_grpIdcData"];
	_grpFromEmpty = false;
	_grpFrom = if (isnil "_grpFrom") then {_grpFromEmpty = true; _grpTo} else {_grpFrom};
	_adjustCoef = if (_grpFrom > _grpTo) then {+1} else {-1};

	if (_grpFrom > 2 && _grpTo > 2 && _grpFrom != _grpTo) then {

		//--- Switching from one group to another
		_grpIdcData = _grpFrom call GUI_fnc_elementData;
		_positionType = _grpIdcData select GUI_param_positionType;
		_grpPos = +(_grpIdcData select GUI_param_position);
		{
			_grpPos set [_foreachindex,_x call bis_fnc_parsenumber];
		} foreach _grpPos;

		_posX = _posX + 1 * (_grpPos select 0);
		_posY = _posY + 1 * (_grpPos select 1);

		_grpIdcData = _grpTo call GUI_fnc_elementData;
		_positionType = _grpIdcData select GUI_param_positionType;
		_grpPos = +(_grpIdcData select GUI_param_position);
		{
			_grpPos set [_foreachindex,_x call bis_fnc_parsenumber];
		} foreach _grpPos;

		_posX = _posX + -1 * (_grpPos select 0);
		_posY = _posY + -1 * (_grpPos select 1);
	} else {
		//if (_grpFrom != _grpTo || true) then {
		if (_grpFrom != _grpTo || _grpFromEmpty || isnil "_elementEdit") then {
			//--- Switching from group to free or vice versa
			_grpIdcData = _grpFrom call GUI_fnc_elementData;
			_positionType = _grpIdcData select GUI_param_positionType;
			_grpPos = +(_grpIdcData select GUI_param_position);
			{
				_grpPos set [_foreachindex,_x call bis_fnc_parsenumber];
			} foreach _grpPos;

			_posX = _posX + _adjustCoef * (_grpPos select 0);
			_posY = _posY + _adjustCoef * (_grpPos select 1);
		};
	};
};

_pos = switch _positionType do {

	//--- Absolute
	case 0: {
		[_posX,_posY,_posW,_posH]
	};

	//--- Safezone
	case 1: {
		if (_isControlGroup) then {
			if (typename _posX == typename 0) then {_posX = str (_posX / safezoneW) + " * safezoneW";};
			if (typename _posY == typename 0) then {_posY = str (_posY / safezoneH) + " * safezoneH";};
		} else {
			if (typename _posX == typename 0) then {_posX = str ((_posX - safezoneX) / safezoneW) + " * safezoneW + safezoneX";};
			if (typename _posY == typename 0) then {_posY = str ((_posY - safezoneY) / safezoneH) + " * safezoneH + safezoneY";};
		};
		if (typename _posW == typename 0) then {_posW = str (_posW / safezoneW) + " * safezoneW";};
		if (typename _posH == typename 0) then {_posH = str (_posH / safezoneH) + " * safezoneH";};
		[_posX,_posY,_posW,_posH];
	};

	//--- Grid
	case 2: {
		if (_isControlGroup) then {
			if (typename _posX == typename 0) then {_posX = str (round ((_posX / _gridW) * 100) / 100) + format [" * %1_W",_gridVar];};
			if (typename _posY == typename 0) then {_posY = str (round ((_posY / _gridH) * 100) / 100) + format [" * %1_H",_gridVar];};
		} else {
			if (typename _posX == typename 0) then {_posX = str (round (((_posX - _gridX) / _gridW) * 100) / 100) + format [" * %1_W + %1_X",_gridVar];};
			if (typename _posY == typename 0) then {_posY = str (round (((_posY - _gridY) / _gridH) * 100) / 100) + format [" * %1_H + %1_Y",_gridVar];};
		};
		if (typename _posW == typename 0) then {_posW = str (_posW / _gridW) + format [" * %1_W",_gridVar];};
		if (typename _posH == typename 0) then {_posH = str (_posH / _gridH) + format [" * %1_H",_gridVar];};
		[_posX,_posY,_posW,_posH];
	};

	default {_pos};
};
_pos