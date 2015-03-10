private ["_key","_shift","_ctrl","_alt","_return"];
#define	GUI_DISPLAY	(uinamespace getvariable "BIS_RscGUIEditor_main")
#define GUI_CONTROL	(GUI_DISPLAY displayctrl _idc)

//--- Function for moving control by arrow keys
_fnc_elementMove = {
	_dX = _this select 0;
	_dY = _this select 1;
	_dW = _this select 2;
	_dH = _this select 3;
	_idc = GUI_idcActive;
	if (_idc >= 0) then {

		_gridSize = GUI_grid select 0;
		_gridX = GUI_grid select 1;
		_gridY = GUI_grid select 2;
		if (typename _gridX == typename "") then {_gridX = call compile _gridX};
		if (typename _gridY == typename "") then {_gridY = call compile _gridY};
		_gridX = _gridX / 10;
		_gridY = _gridY / 10;

		_idcData = _idc call GUI_fnc_elementData;
		_pos = ctrlposition GUI_CONTROL;
		_pos set [0,(_pos select 0) + _dX * _gridX];
		_pos set [1,(_pos select 1) + _dY * _gridY];
		_pos set [2,(_pos select 2) + _dW * _gridX];
		_pos set [3,(_pos select 3) + _dH * _gridY];
		[_idc,_pos] call GUI_fnc_elementSetPosition;

		_thicknessX = 0.005;
		_thicknessY = _thicknessX * 4/3;
		_idc = GUI_layer_tool_selection;
		_posSelection = [
			(_pos select 0) - GUI_selection_thicknessX,
			(_pos select 1) - GUI_selection_thicknessY,
			(_pos select 2) + GUI_selection_thicknessX * 2,
			(_pos select 3) + GUI_selection_thicknessY * 2
		];
		GUI_CONTROL ctrlsetposition _posSelection;
		GUI_CONTROL ctrlcommit 0;
	};
};

_mode = _this select 0;
_input = _this select 1;
_key = _input select 1;
_shift = _input select 2;
_ctrl = _input select 3;
_alt = _input select 4;
_return = false;

switch _mode do {

	//-- Down
	case 1: {
		switch _key do {

			//--- Escape
			case 1: {
				[] call GUI_fnc_exit;
				_return = true;
			};

			//--- E (Element)
			case 18: {
				if (_ctrl) then {
					if (GUI_idcActive < 0) then {
						[] call GUI_fnc_elementAdd;
					} else {
						[] call GUI_fnc_elementEdit;
					};
				};
			};

			//--- R (Reload functions)
			case 19: {
				if (_ctrl) then {[] call GUI_fnc_compile;};
			};

			//--- T (Title)
			case 20: {
				if (_ctrl) then {
					[] spawn GUI_fnc_title;
				};
			};

			//--- Z (Undo / Redo)
			case 21: {
				if (_ctrl) then {
					if (_shift) then {+1 call GUI_fnc_undo;} else {-1 call GUI_fnc_undo;};
				};
			};

			//--- I (Import Config)
			case 23: {
				if (_ctrl) then {[] call GUI_fnc_importConfig;};
			};

			//--- O (Open)
			case 24: {
				if (_ctrl) then {[] spawn GUI_fnc_import;};
			};

			//--- P (Export Parents)
			case 25: {
				if (_ctrl) then {
					[_shift] call GUI_fnc_exportParents;
				};
			};

			//--- S (Save)
			case 31: {
				if (_ctrl) then {
					if (_shift || _alt) then {
						[0,_shift,_alt,-1] spawn GUI_fnc_export;
					} else {
						[] spawn GUI_fnc_exportMenu;
					};
				};
			};

			//--- D (Define)
			case 32: {
				if (_ctrl) then {[0,_shift,_alt] spawn GUI_fnc_exportDefine;};
			};

			//--- H (Help)
			case 35: {
				[] call GUI_fnc_help;
			};

			//--- K (Export Stringtable)
			case 37: {
				if (_ctrl) then {[] call GUI_fnc_exportStringtable;};
			};

			//--- L (List)
			case 38: {
				if (_ctrl) then {[] call GUI_fnc_elementsList;};
			};

			//--- X (Cut)
			case 45: {
				if (_ctrl) then {

					if (GUI_idcActive < 0) exitwith {};
					GUI_listCopy = [
						GUI_idcActive call GUI_fnc_elementLayer,
						GUI_idcActive call GUI_fnc_elementData,
						GUI_idcActive call GUI_fnc_elementDataCustom
					];
					GUI_idcActive call GUI_fnc_elementRemove;
				};
			};

			//--- C (Copy)
			case 46: {
				if (_ctrl) then {

					if (GUI_idcActive < 0) exitwith {};
					GUI_listCopy = [
						GUI_idcActive call GUI_fnc_elementLayer,
						GUI_idcActive call GUI_fnc_elementData,
						GUI_idcActive call GUI_fnc_elementDataCustom
					];
				};
			};

			//--- V (Paste)
			case 47: {
				if (_ctrl) then {
					if (count GUI_listCopy > 0) then {
						_idc = GUI_listCopy select 0;
						_idcData = GUI_listCopy select 1;
						_idcDataCustom = GUI_listCopy select 2;
						_idcLayer = _idc call GUI_fnc_elementLayer;
						_idcNew = _idcData;
						for "_i" from _idcLayer to (_idcLayer + 99) do {
							if !(_i in GUI_listElements) exitwith {_idcNew = _i;};
						};

						//--- Initial set
						_idcNew call GUI_fnc_elementSet;

						//--- Set copied params
						{
							_function = missionnamespace getvariable _x;
							[_idcNew,_idcData select _forEachIndex] call _function;
						} foreach GUI_listLayersFunctions;

						//--- Set copied custom params
						[_idcNew,_idcDataCustom] call GUI_fnc_elementSetDataCustom;

						//--- Move under cursor
						if (!_shift) then {
							_idc = _idcNew;
							_pos = ctrlposition GUI_CONTROL;
							[_idc,GUI_mousePos + [_pos select 2,_pos select 3]] call GUI_fnc_elementSetPosition;
						};
					};
				};
			};

			//--- B (Background)
			case 48: {
				if (_ctrl) then {
					_idc = GUI_layer_tool_background;
					GUI_CONTROL ctrlsetfade round ((ctrlfade GUI_CONTROL + 1) % 2);
					GUI_CONTROL ctrlcommit 0.2;
				};
			};

			//--- N (New layout)
			case 49: {
				if (_ctrl) then {[] call GUI_fnc_reset;};
			};

			//--- Space (Display all)
			case 57: {
				[] call GUI_fnc_displayAll;
			};

			//--- F1
			case 59: {
				[] call GUI_fnc_help;
			};

			//--- Delete
			case 211: {
				GUI_idcActive call GUI_fnc_elementRemove;
			};

			//--- G (Grid)
			case 34: {
				if (_ctrl) then {
					[] call GUI_fnc_gridAdd
				} else {
					if (_shift) then {
						if (str GUI_grid == format ["[[0,0,1,1],0.025,0.04,""%1""]",GUI_Grid select 3]) then {
							[0] call GUI_fnc_gridSet;
						} else {
							[] call GUI_fnc_gridSet;
						};
					} else {
						if (_alt) then {
							if (GUI_idcActive < 0) then {

								_mousePos = GUI_mousePos;
								if (
									(_mousePos select 0) >= 0 &&
									(_mousePos select 0) <= 1 &&
									(_mousePos select 1) >= 0 &&
									(_mousePos select 1) <= 1

								) then {

									//--- Default grid
									[] call GUI_fnc_gridSet;
								} else {

									//--- Safezone grid
									[0] call GUI_fnc_gridSet;
								};
							} else {

								//--- Element local grid;
								_idc = GUI_idcActive;
								_pos = ctrlposition GUI_CONTROL;
								[_pos,(_pos select 2) / 20,(_pos select 3)/20,GUI_grid select 3] call GUI_fnc_gridSet;
							};
						} else {

							//--- Show / hide grid
							if (call GUI_fnc_gridVisible) then {
								false call GUI_fnc_gridShow;
							} else {
								true call GUI_fnc_gridShow;
							};
						};
					};
				};
			};

			case GUI_keyAlt: {
				if !(GUI_keyAlt in GUI_listKeys) then {
					GUI_LMB = false;
				};
			};

			//--- Arrow Up
			case 200: {
				if (_alt) then {
					[0,0,0,-1] call _fnc_elementMove;
				} else {
					[0,-1,0,0] call _fnc_elementMove;
				};
				_return = true;
			};

			//--- Arrow Left
			case 203: {
				if (_alt) then {
					[0,0,-1,0] call _fnc_elementMove;
				} else {
					[-1,0,0,0] call _fnc_elementMove;
				};
				_return = true;
			};

			//--- Arrow Right
			case 205: {
				if (_alt) then {
					[0,0,1,0] call _fnc_elementMove;
				} else {
					[1,0,0,0] call _fnc_elementMove;
				};
				_return = true;
			};

			//--- Arrow Down
			case 208: {
				if (_alt) then {
					[0,0,0,1] call _fnc_elementMove;
				} else {
					[0,1,0,0] call _fnc_elementMove;
				};
				_return = true;
			};

		};
		GUI_listKeys = GUI_listKeys + [_key];
	};

	//--- Up
	case 0: {
		switch _key do {

			case GUI_keyAlt: {
				if (GUI_keyAlt in GUI_listKeys) then {
					_idc = GUI_idcActive;
					GUI_idcActive_pos = ctrlposition GUI_CONTROL;
				};
			};

		};
		GUI_listKeys = GUI_listKeys - [_key];
	};
};

if(cheat1) then {debuglog ["Log:::::::::::::KEY",_this];};

_return