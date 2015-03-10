disableserialization;

_class = [_this,0,"",[""]] call bis_fnc_param;
_display = [_this,1,displaynull,[displaynull]] call bis_fnc_param;
_resizeW = [_this,2,false,[false]] call bis_fnc_param;
_resizeH = [_this,3,true,[false]] call bis_fnc_param;

with uinamespace do {
	_controlGroups = [configfile >> _class,nil,false] call bis_fnc_displayControls;

	_GUI_GRID = ["GUI","GRID_OLD"] call bis_fnc_guiGrid;
	_GUI_GRID_area = _GUI_GRID select 0;
	_GUI_GRID_X = (_GUI_GRID_area select 0) call bis_fnc_parseNumber;
	_GUI_GRID_Y = (_GUI_GRID_area select 1) call bis_fnc_parseNumber;
	_GUI_GRID_WAbs = (_GUI_GRID_area select 2) call bis_fnc_parseNumber;
	_GUI_GRID_HAbs = (_GUI_GRID_area select 3) call bis_fnc_parseNumber;
	_delay = 0;

	_dX =  (safezoneW) - (_GUI_GRID_WAbs);
	_dY =  safezoneY - _GUI_GRID_Y;

	_size = [[0,0,0,0],[0,0,0,0]]; //--- Left, Right

	{
		_class = _x;
		_idc = getnumber (_class >> "idc");
		_type = getnumber (_class >> "type");

		_control = _display displayctrl _idc;
		_pos = ctrlposition _control;
		_posX = _pos select 0;
		_posY = _pos select 1;
		_posW = _pos select 2;
		_posH = _pos select 3;

		if (_type == 15) then {

			//--- Control groups
			_align = getarray (_class >> "align");
			_alignW = _align select 0; //--- 0 = Left / 1 = Right
			_alignH = _align select 1; //--- 0 = Top / 1 = Bottom

			_flexibleW = 1 == (getnumber (_class >> "flexibleW"));
			_flexibleH = 1 == (getnumber (_class >> "flexibleH"));

			_dXX = _dX;
			_dYY = _dY;
			if !(_flexibleW) then {_dXX = 0};
			if !(_flexibleH) then {_dYY = 0};
			private ["_dX","_dY"];
			_dX = _dXX;
			_dY = _dYY;

			//--- Group
			if (_alignH == 0) then {
				//--- Top
				if (_resizeH) then {
					_pos set [1,_posY + _dY];
					_pos set [3,_posH - _dY];
				};
			};
			if (_alignW == 1) then {
				//--- Right
				if (_resizeW) then {_pos set [2,_posW + _dX]};
			};

			//--- Background position
			_sizeTemp = _size select _alignW;
			if (_alignH == 0) then {
				if ((_sizeTemp select 0) == 0) then { //--- Not yet set
					_size set [_alignW,_pos];
				};
			} else {
				_sizeTemp set [3,(_sizeTemp select 3) + (_pos select 3)];
			};

			//(_size select _alignW) set [_alignH,_pos];

			//--- Group controls
			_controls = [_class] call bis_fnc_displayControls;
			{
				_grpClass = _x;
				_grpIdc = getnumber (_grpClass >> "idc");
				_grpType = getnumber (_grpClass >> "type");
				_grpFlexibleW = 1 == (getnumber (_grpClass >> "flexibleW"));
				_grpFlexibleH = 1 == (getnumber (_grpClass >> "flexibleH"));
				_grpControl = _display displayctrl _grpIdc;
				_grpControlPos = ctrlposition _grpControl;
				if (_alignH == 0) then {
					//--- Top
					//if (_alignW == 1) then {
						//--- Right
						if (_resizeW) then {_grpControlPos set [2,(_grpControlPos select 2) + _dX];};
						if (_resizeH) then {
							if (_grpFlexibleH) then {
								_grpControlPos set [3,(_grpControlPos select 3) - _dY];
								//_grpControl ctrlsetbackgroundcolor [1,0,1,1];	//--- Debug
							};
						};
					//};
				} else {
					//--- Bottom
					if (_grpFlexibleW) then {
						if (_resizeW) then {_grpControlPos set [2,(_grpControlPos select 2) + _dX];};
						//_grpControl ctrlsetbackgroundcolor [1,1,0,1];	//--- Debug
					} else {
						//--- Right
						if (_resizeW) then {
							if (_alignW == 1) then {
								_grpControlPos set [0,(_grpControlPos select 0) + _dX];
							};
						};
					};
				};
				//_grpControl ctrlsetbackgroundcolor [random 1,random 1,random 1,0.5];	//--- Debug
				_grpControl ctrlsetposition _grpControlPos;
				_grpControl ctrlcommit _delay;
			} foreach _controls;
		};
		_control ctrlsetposition _pos;
		_control ctrlcommit _delay;
	} foreach _controlGroups;

	//--- Modify background size based on ControlsGroup size
	{
		_class = _x;
		_background = getnumber (_class >> "background");

		if (_background > 0) then {

			_backgroundType = getnumber (_class >> "backgroundType");
			_idc = getnumber (_class >> "idc");
			_align = gettext (_class >> "align");
			_control = _display displayctrl _idc;

			_posOrig = ctrlposition _control;
			_posOrigH = _posOrig select 3;
			_pos = +(_size select _backgroundType);

			switch _align do {
				case "top": {
					_pos set [3,_posOrigH];
				};
				case "bottom": {
					_pos set [1,(_pos select 1) + (_pos select 3) - _posOrigH];
					_pos set [3,_posOrigH];
				};
			};
			_control ctrlsetposition _pos;
			_control ctrlcommit _delay;
		};
	} foreach _controlGroups;
};