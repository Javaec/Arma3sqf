#define	GUI_DISPLAY_DEFAULT	(uinamespace getvariable "BIS_RscGUIEditor")
#define	GUI_DISPLAY		(uinamespace getvariable "BIS_RscGUIEditor_help")
#define GUI_CONTROL		(GUI_DISPLAY displayctrl _idc)


_idcData = GUI_idcActive call GUI_fnc_elementData;

//--- Create tool window
createdialog "RscGUIEditor";
GUI_listKeys = [];
waituntil {!isnil {GUI_DISPLAY_DEFAULT}};
uinamespace setvariable ["BIS_RscGUIEditor_help",GUI_DISPLAY_DEFAULT];

//--- Background
_idc = (GUI_layer_text + 0);
GUI_CONTROL ctrlsetposition [0,0,1,1];
GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
GUI_CONTROL ctrlcommit 0;

//--- Text
_idc = (GUI_layer_listbox + 0);
GUI_CONTROL ctrlsetposition [
	GUI_window_borderX,
	GUI_window_borderY,
	1 - GUI_window_borderX * 2,
	1 - GUI_window_borderY * 2 - 0.1
];
GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
GUI_CONTROL ctrlcommit 0;
{
	if (typename _x == typename "") then {
		GUI_CONTROL lbadd _x;
	} else {
		_lbAdd = GUI_CONTROL lbadd (_x select 0);
		GUI_CONTROL lbsetcolor [_lbAdd,[1,0,0,1]];
	};
} foreach [
	["LMB"],
	"Click and hold over GUI element - Move element",
	"   Ctrl - Align to grid",
	"   Alt - Modify size",
	"   Alt + Shift - Modify size with constant proportions",
	"",
	["RMB"],
	"Click on GUI element - Modify element parameters",
	"Ctrl + Click on GUI element - Modify custom element parameters",
	"Click on free space - Add a new element",
	"",
	["Key Shortcuts"],
	"F1 - Help",
	"G - Toggle grid",
	"Ctrl + G - Modify grid parameters",
	"Alt + G - Create grid on element under cursor",
	"Shift + G - Toggle between Absolute and Safezone grid",
	"Ctrl + B - Toggle background",
	"Ctrl + E - Add new element or edit currently selected one",
	"Ctrl + N - Clear current layout",
	"Delete - Delete a current element",
	"Ctrl + C/X/V - Copy/Cut/Paste a current element",
	"Ctrl + Z - Undo",
	"Shift + Ctrl + Z - Redo",
	"Ctrl + L - Display list of all elements, change order and lock/unlock",
	"Ctrl + S - Open export settings window",
	"Alt + Ctrl + S - Export to GUI editor format with linebreaks",
	"Shift + Ctrl + S - Export to config format",
	"Shift + Alt + Ctrl + S - Export to config format (controls[]= variant)",
	"Ctrl + O - Import from GUI editor format",
	"Ctrl + I - Import from config",
	"Ctrl + D - Export control macro defines",
	"Ctrl + P - Export Parent classes",
	"Shift + Ctrl + P - Export grid proportions",
	"Ctrl + K - Export stringtable.csv",
	"Ctrl + T - Set project title",
	"Space - Highlight all elements",
	"Arrows - Modify active element position by 10% grid size",
	"Alt + Arrows - Modify active element size by 10% grid size",
	"","","","",""
];
GUI_CONTROL ctrlseteventhandler ["lbselchanged","if ((_this select 1) >= 0) then {(_this select 0) lbsetcursel -1};"];

//////////////////////////////////////////////////////////////
//--- Ego
_idc = GUI_layer_structuredtext + 1;
GUI_CONTROL ctrlsetposition [
	GUI_window_borderX,
	1 - GUI_window_borderY - 0.1,
	0.3,
	0.1
];
GUI_CONTROL ctrlsetstructuredtext parsetext format ["<t size='0.8' color='#999999' align='left'>v%1<br />2011-2012 Karel Moricky<br />http://moricky.com</t>",GUI_version];
GUI_CONTROL ctrlcommit 0;

//--- Ok button
_idc = GUI_layer_button + 0;
GUI_CONTROL ctrlsetposition [
	GUI_window_borderX + 0.3 + GUI_window_borderY,
	1 - GUI_window_borderY - 0.05,
	0.2*2,
	0.05
];
GUI_CONTROL ctrlsettext "OK";
GUI_CONTROL ctrlcommit 0;
GUI_CONTROL buttonSetAction "closedialog 999;";
ctrlsetfocus GUI_CONTROL;