#define	GUI_DISPLAY_DEFAULT	(uinamespace getvariable "BIS_RscGUIEditor")
#define	GUI_DISPLAY		(uinamespace getvariable "BIS_RscGUIEditor_elementsList")
#define GUI_CONTROL		(GUI_DISPLAY displayctrl _idc)

if (isnull GUI_DISPLAY) then {

	//--- Create tool window
	createdialog "RscGUIEditor";
	GUI_listKeys = [];
	waituntil {!isnil {GUI_DISPLAY_DEFAULT}};
	uinamespace setvariable ["BIS_RscGUIEditor_elementsList",GUI_DISPLAY_DEFAULT];

	//--- Add to undo history if anything changed
	GUI_window_elementsList_ctrl = false;
	GUI_window_elementsList_changed = false;
	GUI_DISPLAY displayaddeventhandler ["unload","
		if (GUI_window_elementsList_changed) then {
			[1] call GUI_fnc_export;
		};
		GUI_window_elementsList_changed = nil;
	"];

	GUI_DISPLAY displayaddeventhandler [
		"keydown",
		"
			_key = _this select 1;
			switch _key do {
				case 201: {[2] call GUI_fnc_elementsList; true};
				case 209: {[3] call GUI_fnc_elementsList; true};
				case 38: {[4] call GUI_fnc_elementsList; true};
				case 211: {[5] call GUI_fnc_elementsList; true};

				case 29: {GUI_window_elementsList_ctrl = true;};
				case 157: {GUI_window_elementsList_ctrl = true;};
				default {false};
			};
		"
	];
	GUI_DISPLAY displayaddeventhandler [
		"keyup",
		"
			_key = _this select 1;
			switch _key do {
				case 29: {GUI_window_elementsList_ctrl = false;};
				case 157: {GUI_window_elementsList_ctrl = false;};
				default {false};
			};
		"
	];

	//--- Background
	_idc = (GUI_layer_text + 0);
	GUI_CONTROL ctrlsetposition [0,0,1,1];
	GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
	GUI_CONTROL ctrlcommit 0;

	//--- Listbox background
	_idc = (GUI_layer_text + 1);
	GUI_CONTROL ctrlsetposition [
		0 + GUI_window_borderX,
		0 + GUI_window_borderY,
		0.7,
		1 - GUI_window_borderY * 2
	];
	GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
	GUI_CONTROL ctrlcommit 0;

	//--- Listbox
	_idc = GUI_layer_listbox;
	GUI_CONTROL ctrlsetposition [
		0 + GUI_window_borderX,
		0 + GUI_window_borderY,
		0.7,
		1 - GUI_window_borderY * 2
	];
	GUI_CONTROL ctrlcommit 0;
	GUI_CONTROL ctrladdeventhandler ["lbselchanged","[1] call GUI_fnc_elementsList"];
	GUI_CONTROL ctrladdeventhandler ["lbdblclick","[6] call GUI_fnc_elementsList"];
	[0] call GUI_fnc_elementsList;

	//--- Up button
	_idc = GUI_layer_button + 2;
	GUI_CONTROL ctrlsetposition [
		GUI_window_borderX + 0.7 + GUI_window_borderY,
		1 * GUI_window_borderY + 0.00,
		0.2 + GUI_window_borderY,
		0.05
	];
	GUI_CONTROL ctrlsettext "Move Up";
	GUI_CONTROL ctrlsettooltip "Page Up";
	GUI_CONTROL ctrlcommit 0;
	GUI_CONTROL buttonSetAction "[2] call GUI_fnc_elementsList";
	ctrlsetfocus GUI_CONTROL;

	//--- Down button
	_idc = GUI_layer_button + 3;
	GUI_CONTROL ctrlsetposition [
		GUI_window_borderX + 0.7 + GUI_window_borderY,
		2 * GUI_window_borderY + 0.05,
		0.2 + GUI_window_borderY,
		0.05
	];
	GUI_CONTROL ctrlsettext "Move Down";
	GUI_CONTROL ctrlsettooltip "Page Down";
	GUI_CONTROL ctrlcommit 0;
	GUI_CONTROL buttonSetAction "[3] call GUI_fnc_elementsList";
	ctrlsetfocus GUI_CONTROL;

	//--- Lock button
	_idc = GUI_layer_button + 4;
	GUI_CONTROL ctrlsetposition [
		GUI_window_borderX + 0.7 + GUI_window_borderY,
		3 * GUI_window_borderY + 0.15,
		0.2 + GUI_window_borderY,
		0.05
	];
	GUI_CONTROL ctrlsettext "Lock";
	GUI_CONTROL ctrlsettooltip "L";
	GUI_CONTROL ctrlcommit 0;
	GUI_CONTROL buttonSetAction "[4] call GUI_fnc_elementsList";
	ctrlsetfocus GUI_CONTROL;

	//--- Delete button
	_idc = GUI_layer_button + 5;
	GUI_CONTROL ctrlsetposition [
		GUI_window_borderX + 0.7 + GUI_window_borderY,
		4 * GUI_window_borderY + 0.20,
		0.2 + GUI_window_borderY,
		0.05
	];
	GUI_CONTROL ctrlsettext "Delete";
	GUI_CONTROL ctrlsettooltip "Delete";
	GUI_CONTROL ctrlcommit 0;
	GUI_CONTROL buttonSetAction "[5] call GUI_fnc_elementsList";
	ctrlsetfocus GUI_CONTROL;

	//--- Edit button
	_idc = GUI_layer_button + 6;
	GUI_CONTROL ctrlsetposition [
		GUI_window_borderX + 0.7 + GUI_window_borderY,
		5 * GUI_window_borderY + 0.25,
		0.2 + GUI_window_borderY,
		0.05
	];
	GUI_CONTROL ctrlsettext "Edit";
	GUI_CONTROL ctrlsettooltip "E";
	GUI_CONTROL ctrlcommit 0;
	GUI_CONTROL buttonSetAction "[6] call GUI_fnc_elementsList";
	ctrlsetfocus GUI_CONTROL;

	//--- Cancel button
	_idc = GUI_layer_button + 1;
	GUI_CONTROL ctrlsetposition [
		GUI_window_borderX + 0.7 + GUI_window_borderY,
		1 - GUI_window_borderY - 0.05,
		0.2 + GUI_window_borderY,
		0.05
	];
	GUI_CONTROL ctrlsettext "Return";
	GUI_CONTROL ctrlcommit 0;
	GUI_CONTROL buttonSetAction "closedialog 999;";

} else {
	_mode = _this select 0;

	_fnc_moveElements = {
		GUI_listElements = GUI_listElements - [_idc];
		GUI_listElements = [GUI_listElements,[_idc],_idcIndexNew] call bis_fnc_arrayInsert;

		_idcData = GUI_listElementsData select _idcIndex;
		GUI_listElementsData set [_idcIndex,-1];
		GUI_listElementsData = GUI_listElementsData - [-1];
		GUI_listElementsData = [GUI_listElementsData,[_idcData],_idcIndexNew] call bis_fnc_arrayInsert;

		_idcDataCustom = GUI_listElementsDataCustom select _idcIndex;
		GUI_listElementsDataCustom set [_idcIndex,-1];
		GUI_listElementsDataCustom = GUI_listElementsDataCustom - [-1];
		GUI_listElementsDataCustom = [GUI_listElementsDataCustom,[_idcDataCustom],_idcIndexNew] call bis_fnc_arrayInsert;

		_idcClass = GUI_listElementsClass select _idcIndex;
		GUI_listElementsClass set [_idcIndex,-1];
		GUI_listElementsClass = GUI_listElementsClass - [-1];
		GUI_listElementsClass = [GUI_listElementsClass,[_idcClass],_idcIndexNew] call bis_fnc_arrayInsert;

		GUI_listElements = GUI_listElements - [_idc];
		GUI_listElements = [GUI_listElements,[_idc],_idcIndexNew] call bis_fnc_arrayInsert;

		GUI_window_elementsList_curSel = _idcIndexNew;
		[0] call GUI_fnc_elementsList;

		GUI_window_elementsList_changed = true;
	};

	switch _mode do {

		case 0: {
			_idc = GUI_layer_listbox;
			lbclear GUI_CONTROL;
			{
				_textSub = GUI_listElementsClass select _foreachindex;
				if (_textSub == "") then {_textSub = str _x};
				_text = _textSub + " (" + (_x call GUI_fnc_elementParent) + ")";
				_group = (_x call GUI_fnc_elementData) select GUI_param_positionType;
				if ((_x call GUI_fnc_elementLayer) == GUI_layer_controlsgroup) then {
					_group = _x;
				} else {
					if (_group >= GUI_layer_controlsgroup) then {_text = "    " + _text;};
				};
				_lbAdd = GUI_CONTROL lbadd _text;
				GUI_CONTROL lbsetvalue [_lbAdd,_x];

				_textcolor = if (_group >= GUI_layer_controlsgroup) then {
					_groupId = (_group % GUI_layer_controlsgroup) % 12;
					[
						[1,0,0,1],
						[0,1,0,1],
						[0,0,1,1],
						[0,1,1,1],
						[1,0,1,1],
						[1,1,0,1],
						[1.0,0.5,0.0,1],
						[1.0,0.0,0.5,1],
						[0.5,1.0,0.0,1],
						[0.0,1.0,0.5,1],
						[0.5,0.0,1.0,1],
						[0.0,0.5,1.0,1]
					] select _groupId;
				} else {
					[1,1,1,1]
				};
				GUI_CONTROL lbsetcolor [_lbAdd,_textcolor];

				if (_x in GUI_listElementsLocked) then {
					GUI_CONTROL lbsetpicture [_lbAdd,"#(argb,8,8,3)color(1,0.5,0,1)"];
				} else {
					if ((_x call GUI_fnc_elementLayer) != GUI_layer_comment) then {
						GUI_CONTROL lbsetpicture [_lbAdd,"#(argb,8,8,3)color(0,1,0,1)"];
					} else {
						//--- Comment doesn't support locking
						GUI_CONTROL lbsetpicture [_lbAdd,"#(argb,8,8,3)color(1,1,1,0.3)"];
					};
				};
			} foreach GUI_listElements;

			//--- Fake lines on the bottom to avoid item overflooding
			for "_i" from 0 to 1 do {
				_lbAdd = GUI_CONTROL lbadd "";
				GUI_CONTROL lbsetvalue [_lbAdd,-1];
			};


			GUI_CONTROL lbsetcursel GUI_window_elementsList_curSel;
		};

		//--- Listbox selection changed
		case 1: {
			_idc = GUI_layer_listbox;
			_lbAdd = lbcursel GUI_CONTROL;
			_idcActive = GUI_CONTROL lbvalue _lbAdd;
			_idcActiveIndex = _idcActive call GUI_fnc_elementIndex;
			GUI_window_elementsList_curSel = _lbAdd;
			GUI_idcActive = _idcActive;

			//--- Disable the buttons for fake lines on the bottom
			if (_idcActiveIndex < 0) exitwith {
				for "_i" from 2 to 6 do {
					_idc = GUI_layer_button + _i;
					GUI_CONTROL ctrlenable false;
				};
			};
			for "_i" from 2 to 6 do {
				_idc = GUI_layer_button + _i;
				GUI_CONTROL ctrlenable true;
			};

			//--- Lock button text
			_idc = GUI_layer_button + 4;
			if (_idcActive in GUI_listElementsLocked) then {
				GUI_CONTROL ctrlsettext "Unlock";
			} else {
				GUI_CONTROL ctrlsettext "Lock";
			};
			GUI_CONTROL ctrlenable ((GUI_idcActive call GUI_fnc_elementLayer) != GUI_layer_comment);

			//--- Disable Up/Down buttons on array borders
			_idc = GUI_layer_button + 2;
			GUI_CONTROL ctrlenable (_idcActiveIndex > 0);
			GUI_CONTROL ctrlcommit 0;

			_idc = GUI_layer_button + 3;
			GUI_CONTROL ctrlenable (_idcActiveIndex < (count GUI_listElements - 1));
		};

		//--- Move Up
		case 2: {
			_idc = GUI_layer_listbox;
			_lbAdd = lbcursel GUI_CONTROL;
			_idc = GUI_CONTROL lbvalue _lbAdd;
			if (_idc >= 0) then {
				_idcIndex = _idc call GUI_fnc_elementIndex;

				if (_idcIndex > 0) then {
					_idcIndexNew = _idcIndex - 1;
					call _fnc_moveElements;
				};
			};
		};

		//--- Move Down
		case 3: {
			_idc = GUI_layer_listbox;
			_lbAdd = lbcursel GUI_CONTROL;
			_idc = GUI_CONTROL lbvalue _lbAdd;
			if (_idc >= 0) then {
				_idcIndex = _idc call GUI_fnc_elementIndex;

				if (_idcIndex < (count GUI_listElements - 1)) then {
					_idcIndexNew = _idcIndex + 1;
					call _fnc_moveElements;
				};
			};
		};

		//--- Lock
		case 4: {
			_idc = GUI_layer_listbox;
			_lbAdd = lbcursel GUI_CONTROL;
			_idcActive = GUI_CONTROL lbvalue _lbAdd;
			if (_idcActive > 0) then {

				if (_idcActive in GUI_listElementsLocked) then {
					GUI_listElementsLocked = GUI_listElementsLocked - [_idcActive];
					GUI_CONTROL lbsetpicture [_lbAdd,"#(argb,8,8,3)color(0,1,0,1)"];
				} else {
					GUI_listElementsLocked set [count GUI_listElementsLocked,_idcActive];
					GUI_CONTROL lbsetpicture [_lbAdd,"#(argb,8,8,3)color(1,0.5,0,1)"];
				};
			};
		};

		//--- Delete
		case 5: {
			GUI_idcActive call GUI_fnc_elementRemove;
			[0] call GUI_fnc_elementsList;
		};

		//--- Edit
		case 6: {
			if (GUI_window_elementsList_ctrl) then {
				[] call GUI_fnc_elementEditCustom;
			} else {
				[] call GUI_fnc_elementEdit;
			};
			GUI_window_elementsList_ctrl = false;

			//--- Refresh the list once edit windows are closed again
			[] spawn {
				waituntil {
					isnull (uinamespace getvariable ["BIS_RscGUIEditor_elementEdit",controlnull])
					&&
					isnull (uinamespace getvariable ["BIS_RscGUIEditor_elementEditCustom",controlnull])
				};
				[0] call GUI_fnc_elementsList;
			};
		};
	};
	

	//closedialog 999;
};