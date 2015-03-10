private ["_x","_y","_pos","_x1","_x2","_y1","_y2","_idcActive"];
#define	GUI_DISPLAY	(uinamespace getvariable "BIS_RscGUIEditor_main")
#define GUI_CONTROL	(GUI_DISPLAY displayctrl _idc)

_mouseX = _this select 1;
_mouseY = _this select 2;
GUI_mousePos = [_mouseX,_mouseY];

//debuglog ["LOg:::::::::::::::",_this];
_thicknessX = GUI_selection_thicknessX;
_thicknessY = GUI_selection_thicknessY;
_idcActive = -1;

//--- Grid
_gridSize = GUI_grid select 0;
_gridSizeX = _gridSize select 0;
_gridSizeY = _gridSize select 1;
_gridSizeW = _gridSize select 2;
_gridSizeH = _gridSize select 3;
_gridX = GUI_grid select 1;
_gridY = GUI_grid select 2;
if (typename _gridSizeX == typename "") then {_gridSizeX = call compile _gridSizeX};
if (typename _gridSizeY == typename "") then {_gridSizeY = call compile _gridSizeY};
if (typename _gridSizeW == typename "") then {_gridSizeW = call compile _gridSizeW};
if (typename _gridSizeH == typename "") then {_gridSizeH = call compile _gridSizeH};
if (typename _gridX == typename "") then {_gridX = call compile _gridX};
if (typename _gridY == typename "") then {_gridY = call compile _gridY};

//--- Mouse pos
_idc = GUI_layer_tool_mousepos;
if (call GUI_fnc_gridVisible) then {
	GUI_CONTROL ctrlsetposition [
		(_mouseX) min (safezoneX + safezoneW - 0.1),
		(_mouseY + 0.05) min (safezoneY + safezoneH - 0.1),
		0.1,
		0.1
	];
	GUI_CONTROL ctrlcommit 0;
	GUI_CONTROL ctrlsettext format [
		"X:%1\nY:%2",
		ceil ((_mouseX - _gridSizeX) / _gridX),
		ceil ((_mouseY - _gridSizeY) / _gridY)
	];
} else {
	GUI_CONTROL ctrlsetposition [-1,-1,0,0];
	GUI_CONTROL ctrlcommit 0;
};


_gridX = _gridX / 2;
_gridY = _gridY / 2;

if (GUI_LMB) then {
	_diffMouseX = _mouseX - (GUI_LMB_pos select 0);
	_diffMouseY = _mouseY - (GUI_LMB_pos select 1);

	//--- LMB pressed
	_idc = GUI_idcActive;
	if (isnil "GUI_idcActive_pos") then {GUI_idcActive_pos = ctrlposition GUI_CONTROL;};
	_pos = if (GUI_keyAlt in GUI_listKeys) then {

		//--- Alt - modify size
		_posX = (GUI_idcActive_pos select 0);
		_posY = (GUI_idcActive_pos select 1);
		_posW = (GUI_idcActive_pos select 2);
		_posH = (GUI_idcActive_pos select 3);

		//--- Determine which corner user grabbed
		_posXcorner = if ((GUI_LMB_pos select 0) < (_posX + _posW / 2)) then {
			//--- Left
			_posX = _posX + _diffMouseX;
			_posW = _posW - _diffMouseX;
			0
		} else {
			//--- Right
			_posW = _posW + _diffMouseX; // Right
			1
		};
		_posYcorner = if ((GUI_LMB_pos select 1) < (_posY + _posH / 2)) then {
			//--- Top
			_posY = _posY + _diffMouseY;
			_posH = _posH - _diffMouseY;
			0
		} else {
			//--- Bottom
			_posH = _posH + _diffMouseY; // Bottom
			1
		};

		//--- Detect pressed keys (temporarily disabled)
		if (GUI_keyShift in GUI_listKeys) then {

			//--- Shift - constant ratio
			//_posH = _posH + _diffMouseX;
			_aspect = (GUI_idcActive_pos select 3) / (GUI_idcActive_pos select 2);
			_posH = (_posW) * _aspect;

			if !(GUI_keyCtrl in GUI_listKeys) then {

				//--- Ctrl - grid lock
				if (_posXcorner == 0) then {_posX = _posX - (_posX % _gridX);};
				if (_posYcorner == 0) then {_posY = _posY - (_posY % _gridY);};
				_posW = _posW - (_posW % _gridX);
				_posH = _posH - (_posH % _gridY);
				_posW = _posW max 0.01;
				_posH = _posH max 0.01;
				[
					_posX,
					_posY,
					_posW,
					_posH
				];
			} else {

				//--- No key - Classic modify
				_posW = _posW max 0.01;
				_posH = _posH max 0.01;
				[
					_posX,
					_posY,
					_posW,
					_posH
				];
			};

		} else {

			if !(GUI_keyCtrl in GUI_listKeys) then {

				//--- Ctrl - grid lock
				if (_posXcorner == 0) then {_posX = _posX + (_posW % _gridX);};
				if (_posYcorner == 0) then {_posY = _posY + (_posH % _gridY);};
				_posW = _posW - (_posW % _gridX);
				_posH = _posH - (_posH % _gridY);
				_posW = _posW max 0.01;
				_posH = _posH max 0.01;
				[
					_posX,
					_posY,
					_posW,
					_posH
				];
			} else {

				//--- No key - Classic modify
				_posW = _posW max 0.01;
				_posH = _posH max 0.01;
				[
					_posX,
					_posY,
					_posW,
					_posH
				];
			};
		};
	} else {

		//--- Move
		if !(GUI_keyCtrl in GUI_listKeys) then {

			//--- Ctrl - grid lock
			_posX = (GUI_idcActive_pos select 0) + _diffMouseX;
			_posY = (GUI_idcActive_pos select 1) + _diffMouseY;
			_posW = (GUI_idcActive_pos select 2);
			_posH = (GUI_idcActive_pos select 3);

			_posX = _posX - (_posX % _gridX) + (_gridSizeX % _gridX) + _gridX;
			_posY = _posY - (_posY % _gridY) + (_gridSizeY % _gridY) + _gridY;
			//_posX = _posX max _gridSizeX min (_gridSizeX + _gridSizeW - _posW);
			//_posY = _posY max _gridSizeY min (_gridSizeY + _gridSizeH - _posH);
			[
				_posX,
				_posY,
				_posW,
				_posH
			];
		} else {

			if (GUI_keyShift in GUI_listKeys) then {
				//--- Shift - object lock

			} else {

				//--- No key - Classic move
				[
					(GUI_idcActive_pos select 0) + _diffMouseX,
					(GUI_idcActive_pos select 1) + _diffMouseY,
					GUI_idcActive_pos select 2,
					GUI_idcActive_pos select 3
				];
			};
		};
	};
	//GUI_CONTROL ctrlsetposition _pos;
	//GUI_CONTROL ctrlcommit 0;
	[_idc,_pos] call GUI_fnc_elementSetPosition;

	if (_idc >= 0) then {
		_idc = GUI_layer_tool_selection;
		//GUI_CONTROL ctrlsetposition [0,0,0,0];
		//GUI_CONTROL ctrlcommit 0;
		_posSelection = [
			(_pos select 0) - _thicknessX,
			(_pos select 1) - _thicknessY,
			(_pos select 2) + _thicknessX * 2,
			(_pos select 3) + _thicknessY * 2
		];
		GUI_CONTROL ctrlsetposition _posSelection;
		GUI_CONTROL ctrlcommit 0;
	};
} else {

	//--- LMB not pressed
	{
		_idc = _x;
		_pos = ctrlposition GUI_CONTROL;
		_x1 = _pos select 0;
		_x2 = _x1 + (_pos select 2);
		_y1 = _pos select 1;
		_y2 = _y1 + (_pos select 3);

		if (
			_mouseX >= _x1 &&
			_mouseX <= _x2 &&
			_mouseY >= _y1 &&
			_mouseY <= _y2
		) exitwith {
			_idcActive = _x;
		};
	} foreach (GUI_listElements - GUI_listElementsLocked);

	//--- Mouseover
	_idc = GUI_layer_tool_selection;
	if (_idcActive >= 0) then {
		GUI_idcActive = abs _idcActive;
		_posSelection = [
			(_pos select 0) - _thicknessX,
			(_pos select 1) - _thicknessY,
			(_pos select 2) + _thicknessX * 2,
			(_pos select 3) + _thicknessY * 2
		];
		GUI_CONTROL ctrlsetposition _posSelection;
		GUI_CONTROL ctrlcommit 0;
		GUI_CONTROL ctrlsetstructuredtext parsetext format ["<t size='0.6' color='#99ffffff' shadow='0'>%1</t>",GUI_idcActive call GUI_fnc_elementClass];
	} else {
		GUI_idcActive = -1;
		GUI_CONTROL ctrlsetposition [0,0,0,0];
		GUI_CONTROL ctrlcommit 0;
	};
};