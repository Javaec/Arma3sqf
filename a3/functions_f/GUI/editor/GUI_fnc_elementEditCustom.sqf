#define	GUI_DISPLAY_DEFAULT	(uinamespace getvariable "BIS_RscGUIEditor")
#define	GUI_DISPLAY		(uinamespace getvariable "BIS_RscGUIEditor_elementEditCustom")
#define GUI_CONTROL		(GUI_DISPLAY displayctrl _idc)

_countLines = 20;

if (GUI_idcActive < 0) exitwith {};

if (isnull GUI_DISPLAY) then {

	_idcDataCustom = GUI_idcActive call GUI_fnc_elementDataCustom;

	//--- Create tool window
	createdialog "RscGUIEditor";
	GUI_listKeys = [];
	waituntil {!isnil {GUI_DISPLAY_DEFAULT}};
	uinamespace setvariable ["BIS_RscGUIEditor_elementEditCustom",GUI_DISPLAY_DEFAULT];

	//--- Background
	_idc = (GUI_layer_text + 0);
	GUI_CONTROL ctrlsetposition [0,0,1,1];
	GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
	GUI_CONTROL ctrlcommit 0;

	//////////////////////////////////////////////////////////////
	_y = -1;

	_fnc_addLine = {
		_y = _y + 1;

		//--- Edit
		_idc = (GUI_layer_edit + _y);

		_data = if (count _idcDataCustom > _y) then {_idcDataCustom select _y} else {""};
		if (typename _data != typename "") then {
			_data = str _data;
			GUI_CONTROL ctrlsetfade 0.01; //--- Mark as no text
		};
		GUI_CONTROL ctrlsetposition [
			GUI_window_borderX,
			GUI_window_borderY + GUI_window_sizeText * (_y),
			1 - GUI_window_borderX * 2,
			GUI_window_sizeText
		];
		GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
		GUI_CONTROL ctrlsettext _data;
		GUI_CONTROL ctrlcommit 0;
	};

	for "_i" from 0 to _countLines do {
		call _fnc_addLine;
	};

	//--- Warning
	_replace = "";
	{
		if (_foreachindex > 0) then {_replace = _replace + ", "};
		_replace = _replace + tostring [_x select 1];
	} foreach GUI_listExportReplace;
	_idc = GUI_layer_structuredtext + 1;
	GUI_CONTROL ctrlsetposition [
		GUI_window_borderX,
		1 - GUI_window_borderY - 0.1,
		0.4,
		0.1
	];
	GUI_CONTROL ctrlsetbackgroundcolor [1,0,0,0.33];
	GUI_CONTROL ctrlsetstructuredtext parsetext format [
		"<t size='0.8' colorx='#ff3333' align='left'>WARNING! Due to technical limitations, following symbols won't be saved: %1</t>",
		_replace
	];
	GUI_CONTROL ctrlcommit 0;


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
	GUI_CONTROL buttonSetAction "[] call GUI_fnc_elementEditCustom;";
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

	//--- Reset custom data
	[GUI_idcActive,[]] call GUI_fnc_elementSetDataCustom;

	//--- Save custom data
	_idcDataCustom = GUI_idcActive call GUI_fnc_elementDataCustom;
	for "_y" from 0 to _countLines do {
		_idc = (GUI_layer_edit + _y);
		_textEdit = ctrltext GUI_CONTROL;
		_textEditOld = if (count _idcDataCustom > _y) then {_idcDataCustom select _y} else {""};
		if (_textEdit != "" || _textEdit != _textEditOld) then {
			[GUI_idcActive,_textEdit,_y] call GUI_fnc_elementSetDataCustom;
		};
	};

	[1] call GUI_fnc_export;

	closedialog 999;
};