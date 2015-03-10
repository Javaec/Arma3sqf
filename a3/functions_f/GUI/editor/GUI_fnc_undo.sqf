private ["_direction","_input","_idc","_idcData"];

_direction = _this;

GUI_listHistoryIndex = GUI_listHistoryIndex + _direction;
GUI_listHistoryIndex = GUI_listHistoryIndex max 0 min (count GUI_listHistory -1);

call GUI_fnc_reset;

if (GUI_listHistoryIndex < 0) exitwith {GUI_listHistoryIndex = 0;};
_input = GUI_listHistory select GUI_listHistoryIndex;
{
	if (_forEachIndex == 1) then {
		_x call GUI_fnc_gridSet;
	};
	if (_forEachIndex > 1) then {
		_idc = _x select 0;
		_idcClass = _x select 1;
		_idcData = _x select 2;
		_idcDataCustom = _x select 3;

		//--- Initial set
		[_idc,_idcClass] call GUI_fnc_elementSet;

		//--- Set loaded params
		_disableGroupAdjust = true; //--- Disable counter adjusting
		{
			_function = missionnamespace getvariable _x;
			_data = _idcData select _forEachIndex;
			[_idc,_data] call _function;
		} foreach GUI_listLayersFunctions;

		//--- Set loaded custom params
		[_idc,_idcDataCustom] call GUI_fnc_elementSetDataCustom;
	};
} foreach _input;