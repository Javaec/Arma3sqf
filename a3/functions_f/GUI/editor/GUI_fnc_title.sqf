#define	GUI_DISPLAY_DEFAULT	(uinamespace getvariable "BIS_RscGUIEditor")
#define	GUI_DISPLAY		(uinamespace getvariable "BIS_RscGUIEditor_title")
#define GUI_CONTROL		(GUI_DISPLAY displayctrl _idc)

if (isnull GUI_DISPLAY) then {

	//--- Create tool window
	createdialog "RscGUIEditor";
	GUI_listKeys = [];
	waituntil {!isnil {GUI_DISPLAY_DEFAULT}};
	uinamespace setvariable ["BIS_RscGUIEditor_title",GUI_DISPLAY_DEFAULT];

	//--- Background
	_idc = (GUI_layer_text + 0);
	GUI_CONTROL ctrlsetposition [
		0,
		GUI_window_borderY + GUI_window_sizeText * 9,
		1,
		GUI_window_sizeText * 7
	];
	GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
	GUI_CONTROL ctrlcommit 0;

	//--- Label
	_idc = (GUI_layer_text + 1);
	GUI_CONTROL ctrlsetposition [
		GUI_window_borderX,
		GUI_window_borderY + GUI_window_sizeText * 10,
		1 - GUI_window_borderX * 2,
		GUI_window_sizeText
	];
	GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
	GUI_CONTROL ctrlsettext "Project title";
	GUI_CONTROL ctrlcommit 0;

	//--- Edit
	_idc = (GUI_layer_edit);
	GUI_CONTROL ctrlsetposition [
		GUI_window_borderX,
		GUI_window_borderY + GUI_window_sizeText * 11,
		1 - GUI_window_borderX * 2,
		GUI_window_sizeText
	];
	GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
	GUI_CONTROL ctrlsettext GUI_title;
	GUI_CONTROL ctrlcommit 0;
	ctrlsetfocus GUI_CONTROL;

	//--- Warning
	_idc = GUI_layer_structuredtext;
	GUI_CONTROL ctrlsetposition [
		GUI_window_borderX,
		GUI_window_borderY + GUI_window_sizeText * 13,
		0.4,
		0.1
	];
	GUI_CONTROL ctrlcommit 0;

	//--- Ok button
	_idc = GUI_layer_button + 0;
	GUI_CONTROL ctrlsetposition [
		GUI_window_borderX + 0.4 + GUI_window_borderY,
		GUI_window_borderY + GUI_window_sizeText * 13,
		0.2,
		0.05
	];
	GUI_CONTROL ctrlsettext "OK";
	GUI_CONTROL ctrlcommit 0;
	GUI_CONTROL buttonSetAction "[] call GUI_fnc_title;";
	ctrlsetfocus GUI_CONTROL;

	//--- Cancel button
	_idc = GUI_layer_button + 1;
	GUI_CONTROL ctrlsetposition [
		GUI_window_borderX + 0.4 + GUI_window_borderY + 0.2 + GUI_window_borderY,
		GUI_window_borderY + GUI_window_sizeText * 13,
		0.2,
		0.05
	];
	GUI_CONTROL ctrlsettext "Cancel";
	GUI_CONTROL ctrlcommit 0;
	GUI_CONTROL buttonSetAction "closedialog 999;";
} else {
	_idc = (GUI_layer_edit);
	_title = (ctrltext GUI_CONTROL) call bis_fnc_filterString;
	if (_title == "") then {
		_idc = GUI_layer_structuredtext;
		GUI_CONTROL ctrlsetbackgroundcolor [1,0,0,0.33];
		GUI_CONTROL ctrlsetstructuredtext parsetext "<t size='1.2' align='left'>ERROR:<br />Title cannot be empty!</t>";
	} else {
		GUI_title = _title;
		closedialog 999;
	};
};