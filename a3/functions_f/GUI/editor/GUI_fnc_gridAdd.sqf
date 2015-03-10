#define	GUI_DISPLAY_DEFAULT	(uinamespace getvariable "BIS_RscGUIEditor")
#define	GUI_DISPLAY		(uinamespace getvariable "BIS_RscGUIEditor_gridAdd")
#define GUI_CONTROL		(GUI_DISPLAY displayctrl _idc)

if (isnull GUI_DISPLAY) then {

	_idcData = GUI_idcActive call GUI_fnc_elementData;

	//--- Create tool window
	createdialog "RscGUIEditor";
	GUI_listKeys = [];
	waituntil {!isnil {GUI_DISPLAY_DEFAULT}};
	uinamespace setvariable ["BIS_RscGUIEditor_gridAdd",GUI_DISPLAY_DEFAULT];

	//--- Background
	_idc = (GUI_layer_text + 0);
	GUI_CONTROL ctrlsetposition [0,0,1,1];
	GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
	GUI_CONTROL ctrlcommit 0;


	//////////////////////////////////////////////////////////////
	_labelX = 0.2;
	_y = -1;
	_gridData = (GUI_grid select 0) + [GUI_grid select 1] + [GUI_grid select 2,GUI_grid select 3];

	_fnc_addLine = {
		_y = _y + 1;

		//--- Label
		_idc = (GUI_layer_text + 1 + _y);
		GUI_CONTROL ctrlsetposition [
			GUI_window_borderX,
			GUI_window_borderY + GUI_window_sizeText * (_y * 2.5),
			_labelX,
			GUI_window_sizeText
		];
		GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
		GUI_CONTROL ctrlsettext _this;
		GUI_CONTROL ctrlcommit 0;

		//--- Edit
		_idc = (GUI_layer_edit + _y);
		_data = _gridData select _y;
		GUI_CONTROL ctrlsetposition [
			GUI_window_borderX + _labelX,
			GUI_window_borderY + GUI_window_sizeText * (_y * 2.5),
			1 - GUI_window_borderX * 2 - _labelX,
			GUI_window_sizeText
		];
		if (typename _data != typename "") then {_data = str _data};
		GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
		GUI_CONTROL ctrlsettext _data;
		GUI_CONTROL ctrlcommit 0;
	};


	"X:" call _fnc_addLine;
	"Y:" call _fnc_addLine;
	"Area W:" call _fnc_addLine;
	"Area H:" call _fnc_addLine;
	"Segment W:" call _fnc_addLine;
	"Segment H:" call _fnc_addLine;
	"Variable:" call _fnc_addLine;


	//////////////////////////////////////////////////////////////
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
	GUI_CONTROL buttonSetAction "[] call GUI_fnc_gridAdd;";
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
	_idc = GUI_layer_edit;
	_size = [];

	//--- Grid pos
	for "_idc" from GUI_layer_edit to (GUI_layer_edit + 3) do {
		_content = ctrltext GUI_CONTROL;
		_size = _size + [_content];
	};

	//--- Grid size & var
	_grid = [_size];
	for "_idc" from (GUI_layer_edit + 4) to (GUI_layer_edit + 6) do {
		_content = ctrltext GUI_CONTROL;
		_grid = _grid + [_content];
	};

	_grid call GUI_fnc_gridSet;

	closedialog 999;
};