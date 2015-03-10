startloadingscreen [""];

_br = tostring [13,10];
_data = "//--- " + GUI_title + _br + "language,	original" + _br;
_defines = [];
_defineChars = [];
_charsMax = 0;
_allowedChars = toarray "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_";

for "_i" from (count GUI_listElements - 1) to 0 step -1 do {

	_idc = GUI_listElements select _i;
	_idcLayer = _idc call GUI_fnc_elementLayer;
	_idcData = _idc call GUI_fnc_elementData;
	_idcClass = _idc call GUI_fnc_elementClass;
	_idcClass = format [_idcClass,GUI_title];
	_idcClassArray = [_idcClass,":"] call bis_fnc_splitstring;
	_idcClass = if (count _idcClassArray > 0) then {_idcClassArray select 0} else {""};
	if (_idcClass == "") then {
		_textParent = _idc call GUI_fnc_elementParent;
		_idcClass = _textParent + "_" + str _idc;
	};
	if !(_idcLayer in [GUI_layer_picturenoshadow,GUI_layer_combo,GUI_layer_listbox,GUI_layer_slider,GUI_layer_iguiback,GUI_layer_controlsgroup,GUI_layer_comment]) then {
		_idcText = _idcData select GUI_param_text;
		_idcTextArray = toarray _idcText;
		if ((_idcTextArray select 0) != (toarray "$" select 0)) then {
			_locKey = /*"STR_A3_" + */GUI_title + "_" + _idcClass;
			_data = _data + _locKey + ",	""" + _idcText + """" + _br;
		};
	};

	_idcTooltip = _idcData select GUI_param_tooltip;
	_idcTooltipArray = toarray _idcTooltip;
	if ((_idcTooltipArray select 0) != (toarray "$" select 0)) then {
		_locKey = /*"STR_A3_" + */GUI_title + "_" + _idcClass + "_tooltip";
		_data = _data + _locKey + ",	""" + _idcTooltip + """" + _br;
	};
};

copytoclipboard _data;
debuglog "Log: GUI: Export stringtable";

endloadingscreen;