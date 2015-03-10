private ["_idc","_idcType"];
#define	GUI_DISPLAY_DEFAULT	(uinamespace getvariable "BIS_RscGUIEditor")
#define	GUI_DISPLAY		(uinamespace getvariable "BIS_RscGUIEditor_elementAdd")
#define GUI_CONTROL		(GUI_DISPLAY displayctrl _idc)

_idc = -1;

if (isnull GUI_DISPLAY && count _this == 0) then {

	//--- Create tool window
	createdialog "RscGUIEditor";
	waituntil {!isnil {GUI_DISPLAY_DEFAULT}};
	GUI_listKeys = [];
	uinamespace setvariable ["BIS_RscGUIEditor_elementAdd",GUI_DISPLAY_DEFAULT];

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
		0.4,
		1 - GUI_window_borderY * 2
	];
	GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
	GUI_CONTROL ctrlcommit 0;

	//--- Listbox
	_idc = GUI_layer_listbox;
	GUI_CONTROL ctrlsetposition [
		0 + GUI_window_borderX,
		0 + GUI_window_borderY,
		0.4,
		1 - GUI_window_borderY * 2
	];
	GUI_CONTROL ctrlcommit 0;

	{
		GUI_CONTROL lbadd _x;
	} foreach GUI_listLayersParents;
/*
	GUI_CONTROL lbadd "Text";
	GUI_CONTROL lbadd "Structured Text";
	GUI_CONTROL lbadd "Picture";
	//GUI_CONTROL lbadd "Picture (Shadow)";
	GUI_CONTROL lbadd "Edit";
	GUI_CONTROL lbadd "Listbox";
	GUI_CONTROL lbadd "Button";
	GUI_CONTROL lbadd "ShortcutButton";
*/
	GUI_CONTROL lbsetcursel GUI_window_elementAdd_curSel;

	{
		GUI_CONTROL lbsetvalue [_forEachIndex,_x];
	} foreach GUI_listLayers;
	lbsort GUI_CONTROL;

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
	GUI_CONTROL buttonSetAction "[] call GUI_fnc_elementAdd;";
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

	//--- Add element
	_idc = GUI_layer_listbox;
	_idcType = if (count _this > 0) then {
		_this select 0
	} else {
		GUI_window_elementAdd_curSel = lbcursel GUI_CONTROL;
		GUI_CONTROL lbvalue GUI_window_elementAdd_curSel;
	};
	_idc = -1;

	for "_i" from _idcType to (_idcType + 99) do {
		if !(_i in GUI_listElements) exitwith {_idc = _i;};
	};

	if (_idc < 0) exitwith {debuglog format ["Log: ERROR: UI element limit for type %1 exceeded.",_idcType];};

	if (count _this == 0) then {closedialog 999};

	_idc call GUI_fnc_elementSet;

	[1] call GUI_fnc_export;
};

_idc