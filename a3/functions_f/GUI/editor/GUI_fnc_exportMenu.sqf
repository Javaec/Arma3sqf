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
		0.2,
		GUI_window_borderY + GUI_window_sizeText * 3,
		0.6,
		GUI_window_sizeText * 19
	];
	GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
	GUI_CONTROL ctrlcommit 0;

	//--- Title label
	_idc = (GUI_layer_text + 1);
	GUI_CONTROL ctrlsetposition [
		0.2 + GUI_window_borderX,
		GUI_window_borderY + GUI_window_sizeText * 4,
		0.6 - GUI_window_borderX * 2,
		GUI_window_sizeText
	];
	GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
	GUI_CONTROL ctrlsettext "Project title";
	GUI_CONTROL ctrlcommit 0;

	//--- Title edit
	_idc = (GUI_layer_edit);
	GUI_CONTROL ctrlsetposition [
		0.2 + GUI_window_borderX,
		GUI_window_borderY + GUI_window_sizeText * 5,
		0.6 - GUI_window_borderX * 2,
		GUI_window_sizeText
	];
	GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
	GUI_CONTROL ctrlsettext GUI_title;
	GUI_CONTROL ctrlcommit 0;


	//--- Format label
	_idc = (GUI_layer_text + 2);
	GUI_CONTROL ctrlsetposition [
		0.2 + GUI_window_borderX,
		GUI_window_borderY + GUI_window_sizeText * 7,
		0.6 - GUI_window_borderX * 2,
		GUI_window_sizeText
	];
	GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
	GUI_CONTROL ctrlsettext "Format";
	GUI_CONTROL ctrlcommit 0;

	//--- Format listbox
	_idc = (GUI_layer_listbox + 0);
	GUI_CONTROL ctrlsetposition [
		0.2 + GUI_window_borderX,
		GUI_window_borderY + GUI_window_sizeText * 8,
		0.6 - GUI_window_borderX * 2,
		GUI_window_sizeText * 7
	];
	GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
	GUI_CONTROL ctrlcommit 0;
	{
		_lbAdd = GUI_CONTROL lbadd _x;
	} foreach ["GUI Editor","Config (controls as class)","Config (controls as array)","Config Macros","Grid Macros","Parent Classes","Stringtable"];
	GUI_fnc_exportMenu_lbselChanged = {
		_cursel = _this select 1;
		_enable = _cursel in [0,1,2];
		{
			_idc = _x;
			GUI_CONTROL ctrlenable _enable;
			GUI_CONTROL ctrlsetfade ([1,0] select _enable);
			GUI_CONTROL ctrlcommit 0;
		} foreach [
			(GUI_layer_text + 3),
			(GUI_layer_edit + 1),
			(GUI_layer_text + 4),
			(GUI_layer_combo + 0),
			(GUI_layer_text + 5),
			(GUI_layer_combo + 1)
		];
	};
	GUI_CONTROL ctrladdeventhandler ["lbselchanged","_this call GUI_fnc_exportMenu_lbselChanged"];
	GUI_CONTROL lbsetcursel GUI_export_format;


	//--- Indent label
	_idc = (GUI_layer_text + 3);
	GUI_CONTROL ctrlsetposition [
		0.2 + GUI_window_borderX,
		GUI_window_borderY + GUI_window_sizeText * 16,
		0.2 - GUI_window_borderX * 2,
		GUI_window_sizeText
	];
	GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
	GUI_CONTROL ctrlsettext "Indent";
	GUI_CONTROL ctrlcommit 0;

	//--- Indent edit
	_idc = (GUI_layer_edit + 1);
	GUI_CONTROL ctrlsetposition [
		0.2 + GUI_window_borderX,
		GUI_window_borderY + GUI_window_sizeText * 17,
		0.2 - GUI_window_borderX * 2,
		GUI_window_sizeText
	];
	GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
	GUI_CONTROL ctrlsettext str GUI_export_indent;
	GUI_CONTROL ctrlcommit 0;


	//--- IDC label
	_idc = (GUI_layer_text + 4);
	GUI_CONTROL ctrlsetposition [
		0.4 + GUI_window_borderX,
		GUI_window_borderY + GUI_window_sizeText * 16,
		0.2 - GUI_window_borderX * 2,
		GUI_window_sizeText
	];
	GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
	GUI_CONTROL ctrlsettext "IDC";
	GUI_CONTROL ctrlcommit 0;

	//--- IDC combo
	_idc = (GUI_layer_combo);
	GUI_CONTROL ctrlsetposition [
		0.4 + GUI_window_borderX,
		GUI_window_borderY + GUI_window_sizeText * 17,
		0.2 - GUI_window_borderX * 2,
		GUI_window_sizeText
	];
	GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
	GUI_CONTROL ctrlcommit 0;
	{GUI_CONTROL lbadd _x} foreach ["Numbers","Macros"];
	GUI_CONTROL lbsetcursel GUI_export_idc;


	//--- Localize label
	_idc = (GUI_layer_text + 5);
	GUI_CONTROL ctrlsetposition [
		0.6 + GUI_window_borderX,
		GUI_window_borderY + GUI_window_sizeText * 16,
		0.2 - GUI_window_borderX * 2,
		GUI_window_sizeText
	];
	GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
	GUI_CONTROL ctrlsettext "Text";
	GUI_CONTROL ctrlcommit 0;

	//--- Localize combo
	_idc = (GUI_layer_combo + 1);
	GUI_CONTROL ctrlsetposition [
		0.6 + GUI_window_borderX,
		GUI_window_borderY + GUI_window_sizeText * 17,
		0.2 - GUI_window_borderX * 2,
		GUI_window_sizeText
	];
	GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
	GUI_CONTROL ctrlcommit 0;
	{GUI_CONTROL lbadd _x} foreach ["Plain","Localized"];
	GUI_CONTROL lbsetcursel GUI_export_localize;

	//--- Warning
	_idc = GUI_layer_structuredtext;
	GUI_CONTROL ctrlsetposition [
		0.2,
		GUI_window_borderY + GUI_window_sizeText * 18.5,
		0.6,
		GUI_window_sizeText * 1
	];
	GUI_CONTROL ctrlcommit 0;

	//--- Ok button
	_idc = GUI_layer_button + 0;
	GUI_CONTROL ctrlsetposition [
		GUI_window_borderX + 0.25 + GUI_window_borderY,
		GUI_window_borderY + GUI_window_sizeText * 20,
		0.2,
		0.05
	];
	GUI_CONTROL ctrlsettext "OK";
	GUI_CONTROL ctrlcommit 0;
	GUI_CONTROL buttonSetAction "[] call GUI_fnc_exportMenu;";
	ctrlsetfocus GUI_CONTROL;

	//--- Cancel button
	_idc = GUI_layer_button + 1;
	GUI_CONTROL ctrlsetposition [
		GUI_window_borderX + 0.25 + GUI_window_borderY + 0.2 + GUI_window_borderY,
		GUI_window_borderY + GUI_window_sizeText * 20,
		0.2,
		0.05
	];
	GUI_CONTROL ctrlsettext "Cancel";
	GUI_CONTROL ctrlcommit 0;
	GUI_CONTROL buttonSetAction "closedialog 999;";
} else {
	_idc = (GUI_layer_edit);
	_title = (ctrltext GUI_CONTROL) call bis_fnc_filterString;
	if (_title == "") exitwith {
		_idc = GUI_layer_structuredtext;
		GUI_CONTROL ctrlsetbackgroundcolor [1,0,0,0.33];
		GUI_CONTROL ctrlsetstructuredtext parsetext "ERROR: Title cannot be empty!";
	};
	GUI_title = _title;

	_idc = (GUI_layer_listbox + 0);
	_format = lbcursel GUI_CONTROL;
	GUI_export_format = _format;

	_idc = (GUI_layer_edit + 1);
	_indent = (ctrltext GUI_CONTROL) call bis_fnc_parsenumber;
	if (isnil {_indent}) exitwith {
		_idc = GUI_layer_structuredtext;
		GUI_CONTROL ctrlsetbackgroundcolor [1,0,0,0.33];
		GUI_CONTROL ctrlsetstructuredtext parsetext "ERROR: Indent must be a number!";
	};
	GUI_export_indent = _indent;

	_idc = (GUI_layer_combo);
	_formatIDC = lbcursel GUI_CONTROL;
	GUI_export_idc = _formatIDC;

	_idc = (GUI_layer_combo + 1);
	_formatLocalize = lbcursel GUI_CONTROL;
	GUI_export_localize = _formatLocalize;

	switch _format do {
		//--- GUI Editor
		case 0: {
			[0,false,true] spawn GUI_fnc_export;
		};
		//--- Config (controls as class)
		case 1: {
			[0,true,false,_indent,_formatIDC] spawn GUI_fnc_export;
		};
		//--- Config (controls as array)
		case 2: {
			[0,true,true,_indent,_formatIDC] spawn GUI_fnc_export;
		};
		//--- Config Macros
		case 3: {
			[] spawn GUI_fnc_exportDefine;
		};
		//--- Grid Macros
		case 4: {
			[true] call GUI_fnc_exportParents;
		};
		//--- Parent Classes
		case 5: {
			[false] call GUI_fnc_exportParents;
		};
		//--- Stringtable
		case 6: {
			[] call GUI_fnc_exportStringtable;
		};
	};
	closedialog 999;
};