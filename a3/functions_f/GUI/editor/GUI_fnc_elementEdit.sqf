#define	GUI_DISPLAY_DEFAULT	(uinamespace getvariable "BIS_RscGUIEditor")
#define	GUI_DISPLAY		(uinamespace getvariable "BIS_RscGUIEditor_elementEdit")
#define GUI_CONTROL		(GUI_DISPLAY displayctrl _idc)

if (GUI_idcActive < 0) exitwith {};

if (isnull GUI_DISPLAY) then {

	_idcData = GUI_idcActive call GUI_fnc_elementData;
	_idcParent = GUI_idcActive call GUI_fnc_elementParent;

	//--- Create tool window
	createdialog "RscGUIEditor";
	GUI_listKeys = [];
	waituntil {!isnil {GUI_DISPLAY_DEFAULT}};
	uinamespace setvariable ["BIS_RscGUIEditor_elementEdit",GUI_DISPLAY_DEFAULT];

	//--- Background
	_idc = (GUI_layer_text + 0);
	GUI_CONTROL ctrlsetposition [0,0,1,1];
	GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
	GUI_CONTROL ctrlcommit 0;



	//////////////////////////////////////////////////////////////
	_y = -1;
	_rowHeight = 2.3;

	_fnc_addLine = {
		_y = _y + 1;

		//--- Label
		_idc = (GUI_layer_text + 1 + _y);
		GUI_CONTROL ctrlsetposition [
			GUI_window_borderX,
			GUI_window_borderY + GUI_window_sizeText * (_y * _rowHeight),
			1 - GUI_window_borderX * 2,
			GUI_window_sizeText
		];
		GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
		GUI_CONTROL ctrlsettext _this;
		GUI_CONTROL ctrlcommit 0;

		//--- Disable elements for Comment
		if ((GUI_idcActive call GUI_fnc_elementLayer) == GUI_layer_comment && _foreachindex > 0) then {
			GUI_CONTROL ctrlshow false;
			GUI_CONTROL ctrlenable false;
		};

		//--- Edit
		_idc = (GUI_layer_edit + 1 + _y);
		_data = if (_y == 0) then {
			GUI_idcActive call GUI_fnc_elementClass
		} else {
			(_idcData select (_y - 1*0))
		};
		if (typename _data != typename "") then {
			_data = str _data;
			GUI_CONTROL ctrlsetfade 0.01; //--- Mark as no text
		};
		GUI_CONTROL ctrlsetposition [
			GUI_window_borderX,
			GUI_window_borderY + GUI_window_sizeText * (_y * _rowHeight + 1),
			1 - GUI_window_borderX * 2,
			GUI_window_sizeText
		];
		GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
		GUI_CONTROL ctrlsettext _data;
		GUI_CONTROL ctrlcommit 0;

		//--- Disable elements for Comment
		if ((GUI_idcActive call GUI_fnc_elementLayer) == GUI_layer_comment && _foreachindex > 0) then {
			GUI_CONTROL ctrlshow false;
			GUI_CONTROL ctrlenable false;
		};
	};
	{
		_x call _fnc_addLine;
	} foreach GUI_listLayersLabels;


	//--- Listbox (position type)
	_y = _y + 1;

	//--- Label
	_idc = (GUI_layer_text + 1 + _y);
	GUI_CONTROL ctrlsetposition [
		GUI_window_borderX,
		GUI_window_borderY + GUI_window_sizeText * (_y * _rowHeight),
		1 - GUI_window_borderX * 2,
		GUI_window_sizeText
	];
	GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
	GUI_CONTROL ctrlsettext "Position type:";
	GUI_CONTROL ctrlcommit 0;

	//--- Listbox
	_idc = (GUI_layer_combo);
	_data = _idcData select (_y - 1);
	if (typename _data != typename "") then {
		_data = str _data;
		GUI_CONTROL ctrlsetfade 0.01; //--- Mark as no text
	};
	GUI_CONTROL ctrlsetposition [
		GUI_window_borderX,
		GUI_window_borderY + GUI_window_sizeText * (_y * _rowHeight + 1),
		1 - GUI_window_borderX * 2,
		GUI_window_sizeText
	];
	//GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
	GUI_CONTROL ctrlsettext _data;
	GUI_CONTROL ctrlcommit 0;

	//--- Grid
	_lbAdd = GUI_CONTROL lbadd "Absolute";
	GUI_CONTROL lbsetvalue [_lbAdd,0];
	_lbAdd = GUI_CONTROL lbadd "Safezone";
	GUI_CONTROL lbsetvalue [_lbAdd,1];
	_lbAdd = GUI_CONTROL lbadd ("Grid: " + (gui_grid select 3));
	GUI_CONTROL lbsetvalue [_lbAdd,2];
	_listValues = [0,1,2];

	//--- Grid - controls group
	{
		if (
			//--- Add only control groups
			(_x call GUI_fnc_elementLayer) == (GUI_layer_controlsgroup)
			&&
			//--- Element itself is not control group (sorry, cannot go deeper)
			(GUI_idcActive call GUI_fnc_elementLayer) != (GUI_layer_controlsgroup)
			&&
			//--- Cannot be control group of itself
			GUI_idcActive != _x
		) then {
			_className = _x call GUI_fnc_elementClass;
			if (_className == "") then {_className = str _x};
			_lbAdd = GUI_CONTROL lbadd ("ControlGroup: " + _className);
			GUI_CONTROL lbsetvalue [_lbAdd,_x];
			_listValues = _listValues + [_x];
		};
	} foreach GUI_listElements;
	_cursel = (_listValues find (_idcData select GUI_param_positionType)) max 0;
	GUI_CONTROL lbsetcursel _cursel;


	//////////////////////////////////////////////////////////////
	//--- Info
	_idc = GUI_layer_structuredtext + 1;
	GUI_CONTROL ctrlsetposition [
		GUI_window_borderX,
		1 - GUI_window_borderY - 0.1,
		0.4,
		0.1
	];
	GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
	GUI_CONTROL ctrlsetstructuredtext parsetext format [
		"<t align='left'>class %1<br />idc = %2;</t>",
		_idcParent,
		GUI_idcActive
	];
	GUI_CONTROL ctrlcommit 0;

	//--- Ok button
	_idc = GUI_layer_button + 0;
	GUI_CONTROL ctrlsetposition [
		GUI_window_borderX + 0.4 + GUI_window_borderY,
		1 - GUI_window_borderY - 0.05,
		0.2,
		0.05
	];
	GUI_CONTROL ctrlsettext "OK";
	GUI_CONTROL ctrlcommit 0;
	GUI_CONTROL buttonSetAction "[] call GUI_fnc_elementEdit;";
	ctrlsetfocus GUI_CONTROL;

	//--- Cancel button
	_idc = GUI_layer_button + 1;
	GUI_CONTROL ctrlsetposition [
		GUI_window_borderX + 0.4 + GUI_window_borderY + 0.2 + GUI_window_borderY,
		1 - GUI_window_borderY - 0.05,
		0.2,
		0.05
	];
	GUI_CONTROL ctrlsettext "Cancel";
	GUI_CONTROL ctrlcommit 0;
	GUI_CONTROL buttonSetAction "closedialog 999;";

} else {
	//--- Set class
	_idc = GUI_layer_edit + 1;
	_content = ctrltext GUI_CONTROL;
	[GUI_idcActive,_content] call GUI_fnc_elementSetClass;

	//--- Set position type
	_idc = GUI_layer_combo;
	_idcData = GUI_idcActive call GUI_fnc_elementData;;
	_positionTypeOrig = _idcData select GUI_param_positionType;
	_positionType = GUI_CONTROL lbvalue (lbcursel GUI_CONTROL);//lbcursel GUI_CONTROL;
	[GUI_idcActive,_positionType] call GUI_fnc_elementSetPositionType;
	GUI_positionType = _positionType;

	//--- Set params
	_disableGroupAdjust = if ((_positionTypeOrig max _positionType) > 2) then {nil} else {true}; //--- Disable adjusting for non-group elements
	_grpFrom = if (_positionTypeOrig > 2) then {_positionTypeOrig} else {nil}; //--- Save group when switching from it
	_elementEdit = true;
	{
		_idc = GUI_layer_edit + _forEachIndex + 1;
		_idcParent = GUI_idcActive call GUI_fnc_elementParent;
		_function = missionnamespace getvariable _x;

		if (_forEachIndex != GUI_param_positionType) then {

			_content = ctrltext GUI_CONTROL;

			//--- Not marked as text
			if (ctrlfade GUI_CONTROL == 0) then {_content = str _content;};
			_content = call compile _content;

			//--- OK, Set!
			[GUI_idcActive,_content] call _function;
		};

	} foreach GUI_listLayersFunctions;

	[1] call GUI_fnc_export;

	closedialog 999;
};