#define	GUI_DISPLAY_DEFAULT	(uinamespace getvariable "BIS_RscGUIEditor")
#define	GUI_DISPLAY		(uinamespace getvariable "BIS_RscGUIEditor_exit")
#define GUI_CONTROL		(GUI_DISPLAY displayctrl _idc)

if (isnull GUI_DISPLAY) then {

	//--- Create tool window
	createdialog "RscGUIEditor";
	GUI_listKeys = [];
	waituntil {!isnil {GUI_DISPLAY_DEFAULT}};
	uinamespace setvariable ["BIS_RscGUIEditor_exit",GUI_DISPLAY_DEFAULT];

	//--- Background
	_idc = (GUI_layer_text + 0);
	GUI_CONTROL ctrlsetposition [
		0.2,
		0.4,
		0.6,
		0.2
	];
	GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
	GUI_CONTROL ctrlsettext "Do you want to save your changes before exit?";
	GUI_CONTROL ctrlcommit 0;

	//--- Yes button
	_idc = GUI_layer_button + 0;
	GUI_CONTROL ctrlsetposition [
		0.2,
		0.55,
		0.2,
		0.05
	];
	GUI_CONTROL ctrlsettext "Save";
	GUI_CONTROL ctrlcommit 0;
	GUI_CONTROL buttonSetAction "true spawn GUI_fnc_exit;";
	ctrlsetfocus GUI_CONTROL;

	//--- No button
	_idc = GUI_layer_button + 1;
	GUI_CONTROL ctrlsetposition [
		0.4,
		0.55,
		0.2,
		0.05
	];
	GUI_CONTROL ctrlsettext "Don't Save";
	GUI_CONTROL ctrlcommit 0;
	GUI_CONTROL buttonSetAction "false spawn GUI_fnc_exit;";

	//--- No button
	_idc = GUI_layer_button + 2;
	GUI_CONTROL ctrlsetposition [
		0.6,
		0.55,
		0.2,
		0.05
	];
	GUI_CONTROL ctrlsettext "Cancel";
	GUI_CONTROL ctrlcommit 0;
	GUI_CONTROL buttonSetAction "closedialog 999;";
} else {
	closedialog 999;
	waituntil {isnull GUI_DISPLAY};

	if (_this) then {
		[0,false,false] call GUI_fnc_export;
	};

	closedialog 999;
};