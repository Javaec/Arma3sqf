private ["_idc"];
#define	GUI_DISPLAY	(uinamespace getvariable "BIS_RscGUIEditor_main")
#define GUI_CONTROL	(GUI_DISPLAY displayctrl _idc)

if (GUI_idcActive < 0) exitwith {};

_idc = _this;
_idcIndex = _idc call GUI_fnc_elementIndex;
if (_idcIndex < 0) exitwith {};

//--- Control group - change positionType of children (unassign from controls group)
if ((_idc call GUI_fnc_elementLayer) == (GUI_layer_controlsgroup)) then {
	_idcData = _idc call GUI_fnc_elementData;
	_positionType = _idcData select GUI_param_positionType;
	{
		_childIdcData = _x call GUI_fnc_elementData;
		if ((_childIdcData select GUI_param_positionType) == _idc) then {
			[_x,_positionType] call GUI_fnc_elementSetPositionType;
		};
	} foreach GUI_listElements;
};

//--- Cleanup
GUI_listElementsData set [_idcIndex,-1];
GUI_listElementsData = GUI_listElementsData - [-1];

GUI_listElementsDataCustom set [_idcIndex,-1];
GUI_listElementsDataCustom = GUI_listElementsDataCustom - [-1];

GUI_listElementsClass set [_idcIndex,-1];
GUI_listElementsClass = GUI_listElementsClass - [-1];

GUI_listElements = GUI_listElements - [_idc];

GUI_idcActive = -1;

//--- Initial position
GUI_CONTROL ctrlsetfade 1;
GUI_CONTROL ctrlcommit 0;

[1] call GUI_fnc_export;

true