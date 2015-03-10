private ["_mode","_inputCopy","_inputArray","_input","_idc","_grid"];
#define	GUI_DISPLAY		(uinamespace getvariable "BIS_RscGUIEditor_main")
#define GUI_CONTROL		(GUI_DISPLAY displayctrl _idc)

startLoadingscreen ["Importing"];

//--- Erase
GUI_listHistory = [];
call GUI_fnc_reset;

//--- Import
_inputCopy = copyfromclipboard;
_inputArray = toarray _inputCopy;
if (count _inputArray == 0) exitwith {
	endloadingscreen;
	debuglog "Log: Error: Cannot import, clipboard is empty.";
};
if ((_inputArray select 0) != 36) exitwith {
	endloadingscreen;
	debuglog format ["Log: Error: Import string have to start with $ tag - %1",_inputCopy];
};

_inputArray set [0,32];

//--- Replace " by '
_quote = toarray """" select 0;
{
	if (_x == _quote) then {
		_inputArray set [_forEachIndex,39];
	};
	progressloadingscreen (_foreachindex / count _inputArray);
} foreach _inputArray;

_inputCopy = tostring _inputArray;
_input = call compile _inputCopy;
_version = _input select 0;

//--- Version compatibility (add grid)
if (_version < 1.03) then {
	_input = [_input,[[0]],1] call BIS_fnc_arrayInsert;
};

//--- Load header
_meta = _input select 1;
if (_version < 1.06) then {
	_grid = _meta;
	[] spawn GUI_fnc_title;
} else {
	GUI_title = _meta select 0;
	_grid = _meta select 1;
	GUI_export_indent = _meta select 2;
	GUI_export_idc = _meta select 3;
	GUI_export_localize = [_meta,4,0,[0]] call bis_fnc_paramin;
};
_grid call GUI_fnc_gridSet;

{
	if (_forEachIndex > 1) then {

		_idc = _x select 0;
		_idcClass = _x select 1;
		_idcData = _x select 2;
		_idcDataCustom = if (count _x > 3) then {_x select 3} else {[]};

		//--- Version compatibility
		if (_version == 1.01) then { //--- Remove IDCs
			_idcData set [1,-1];
			_idcData = _idcData - [-1];
		};
		if (_version < 1.046) then { //--- Add sizeEx
			_idcData = _idcData + ["-1"];
		};

		//--- Set as locked
		if (_idc < 0) then {
			_idc = abs _idc;
			GUI_listElementsLocked set [count GUI_listElementsLocked,_idc];
		};

		//--- Restore quotation marks in custom params
		{
			if (count _idcDataCustom > 0) then {
				{
					if (_x != "") then {
						_textArray = toarray _x;
						{
							for "_i" from 0 to (count GUI_listExportReplace - 1) do {
								_letterArray = GUI_listExportReplace select _i;
								_letter = _letterArray select 0;
								_letterExport = _letterArray select 1;

								if (_x == _letterExport) then {
									_textArray set [_forEachIndex,_letter];
								};
							};
						} foreach _textArray;
						_idcDataCustom set [_forEachIndex,tostring _textArray];
					};
				} foreach _idcDataCustom;
			};
		} foreach _idcDataCustom;

		//--- Initial set
		[_idc,_idcClass] call GUI_fnc_elementSet;

		//--- Set loaded params
		_disableGroupAdjust = true; //--- Disable counter adjusting
		_enableAutoLocalize = true; //--- Replace text by localized strings based on class names
		{
			_function = missionnamespace getvariable _x;
			_data = _idcData select _forEachIndex;
			[_idc,_data] call _function;
		} foreach GUI_listLayersFunctions;

		//--- Set loaded custom params
		[_idc,_idcDataCustom] call GUI_fnc_elementSetDataCustom;
	};
} foreach _input;

[1] call GUI_fnc_export;

endloadingscreen;