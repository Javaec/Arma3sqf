private ["_idc","_idcData","_layer","_function","_data"];
#define	GUI_DISPLAY	(uinamespace getvariable "BIS_RscGUIEditor_main")
#define GUI_CONTROL	(GUI_DISPLAY displayctrl _idc)

_idc = _this;
_idcClass = "";
if (typename _idc == typename []) then {
	_idcClass = _idc select 1;
	_idc = _idc select 0;
};

_idcData = _idc call GUI_fnc_elementDefault;
_idcLayer = _idc call GUI_fnc_elementLayer;

//--- Add or edit?
if !(_idc in GUI_listElements) then {
	GUI_listElements = [_idc] + GUI_listElements;
	GUI_listElementsData = [[]] + GUI_listElementsData;
	GUI_listElementsDataCustom = [[]] + GUI_listElementsDataCustom;
	if (_idcClass == "") then {GUI_listLayersParents select (GUI_listLayers find _idcLayer);};
	GUI_listElementsClass = [_idcClass] + GUI_listElementsClass;
} else {
	_idcData = _idc call GUI_fnc_elementData;
};

//--- Initial position
_layer = _idc call GUI_fnc_elementLayer;
{
	_function = missionnamespace getvariable _x;
	_data = _idcData select _forEachIndex;

	//--- Correct input check
	if (_forEachIndex == GUI_param_text) then {
		if (_layer in [GUI_layer_picturenoshadow,GUI_layer_pictureshadow]) then {
			if (_data == "") then {_data = "#(argb,8,8,3)color(1,1,1,1)"};
		} else {
			_data = ""; //--- Disable inherited text
		};
	};
	if (_forEachIndex == GUI_param_text && _layer == GUI_layer_listbox) then {
		for "_i" from 1 to 10 do {GUI_CONTROL lbadd "Test";};
	};
	if (_forEachIndex == GUI_param_positionType && _layer == GUI_layer_comment) then {
		_data = 0;
	};
	[_idc,_data] call _function;
} foreach GUI_listLayersFunctions;


GUI_CONTROL ctrlsetfade 0;
GUI_CONTROL ctrlcommit 0;

true