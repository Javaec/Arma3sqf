#define	GUI_DISPLAY		(uinamespace getvariable "BIS_RscGUIEditor_main")
#define GUI_CONTROL		(GUI_DISPLAY displayctrl _idc)

GUI_listElements = [];
GUI_listElementsData = [];
GUI_listElementsDataCustom = [];
GUI_listElementsClass = [];

{
	for "_idc" from _x to (_x + 99) do {
		GUI_CONTROL ctrlsetfade 1;
		GUI_CONTROL ctrlcommit 0;
	};
} foreach GUI_listLayers;