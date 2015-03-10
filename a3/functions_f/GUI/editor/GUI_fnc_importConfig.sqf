#define	GUI_DISPLAY_DEFAULT	(uinamespace getvariable "BIS_RscGUIEditor")
#define	GUI_DISPLAY		(uinamespace getvariable "BIS_RscGUIEditor_importConfig")
#define GUI_CONTROL		(GUI_DISPLAY displayctrl _idc)

if (isnull GUI_DISPLAY) then {

	//--- Select path
	_idcData = GUI_idcActive call GUI_fnc_elementData;
	_idcParent = GUI_idcActive call GUI_fnc_elementParent;

	//--- Create tool window
	createdialog "RscGUIEditor";
	GUI_listKeys = [];
	waituntil {!isnil {GUI_DISPLAY_DEFAULT}};
	uinamespace setvariable ["BIS_RscGUIEditor_importConfig",GUI_DISPLAY_DEFAULT];

	//--- Background
	_idc = (GUI_layer_text + 0);
	GUI_CONTROL ctrlsetposition [
		0,
		GUI_window_borderY + GUI_window_sizeText * 9,
		1,
		GUI_window_sizeText * 7
	];
	GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
	GUI_CONTROL ctrlcommit 0;

	//--- Label
	_idc = (GUI_layer_text + 1);
	GUI_CONTROL ctrlsetposition [
		GUI_window_borderX,
		GUI_window_borderY + GUI_window_sizeText * 10,
		1 - GUI_window_borderX * 2,
		GUI_window_sizeText
	];
	GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
	GUI_CONTROL ctrlsettext "Config path";
	GUI_CONTROL ctrlcommit 0;

	//--- Edit
	_idc = (GUI_layer_edit);
	GUI_CONTROL ctrlsetposition [
		GUI_window_borderX,
		GUI_window_borderY + GUI_window_sizeText * 11,
		1 - GUI_window_borderX * 2,
		GUI_window_sizeText
	];
	GUI_CONTROL ctrlsetbackgroundcolor GUI_window_colorBackground;
	GUI_CONTROL ctrlsettext GUI_importConfig;
	GUI_CONTROL ctrlcommit 0;
	ctrlsetfocus GUI_CONTROL;

	//--- Warning
	_idc = GUI_layer_structuredtext;
	GUI_CONTROL ctrlsetposition [
		GUI_window_borderX,
		GUI_window_borderY + GUI_window_sizeText * 13,
		0.4,
		0.1
	];
	GUI_CONTROL ctrlcommit 0;

	//--- Ok button
	_idc = GUI_layer_button + 0;
	GUI_CONTROL ctrlsetposition [
		GUI_window_borderX + 0.4 + GUI_window_borderY,
		GUI_window_borderY + GUI_window_sizeText * 13,
		0.2,
		0.05
	];
	GUI_CONTROL ctrlsettext "OK";
	GUI_CONTROL ctrlcommit 0;
	GUI_CONTROL buttonSetAction "[] call GUI_fnc_importConfig;";
	ctrlsetfocus GUI_CONTROL;

	//--- Cancel button
	_idc = GUI_layer_button + 1;
	GUI_CONTROL ctrlsetposition [
		GUI_window_borderX + 0.4 + GUI_window_borderY + 0.2 + GUI_window_borderY,
		GUI_window_borderY + GUI_window_sizeText * 13,
		0.2,
		0.05
	];
	GUI_CONTROL ctrlsettext "Cancel";
	GUI_CONTROL ctrlcommit 0;
	GUI_CONTROL buttonSetAction "closedialog 999;";

} else {

	//--- Get dialog values
	private ["_config","_idd","_controls","_controlsBackground","_item","_itemName","_listParents","_parentDirect","_parent","_idParent","_paramValue","_paramText","_addParam"];

	_idc = GUI_layer_edit;
	GUI_importConfig = ctrltext GUI_CONTROL;
	_config = call compile GUI_importConfig;

	//--- Import
	call GUI_fnc_reset;

	if (isclass _config) then {
		_idd = _config >> "idd";
		if (isnumber _idd) then {//--- ToDo - IDD string?
			_isNewStyle = true;
			_listControls = [];
			_controls = _config >> "controls";
			_controlsBackground = _config >> "controlsBackground";
			_controlsAll = if (isClass _controls) then {
				[_controlsBackground,_controls];
			} else {
				_isNewStyle = false;
				_listControls = getarray _controls + getarray _controlsBackground;
				[_config];
			};

			//--- Active params
			_listParamsActive = [];
			{
				if (_forEachIndex != GUI_param_positionType) then {
					_listParamsActive = _listParamsActive + _x;
				};
			} foreach GUI_listLayersStrings;

			//--- Scan directory
			{
				_controlsCurrent = _x;
				for "_i" from 0 to (count _controlsCurrent - 1) do {
					_item = _controlsCurrent select _i;
					_itemName = configname _item;
					_isActive = if (_isNewStyle) then {true} else {{_itemName == _x} count _listControls > 0};

					if (isclass _item && _isActive) then {

						//--- Return parent
						_listParents = [_item,true] call BIS_fnc_returnparents;
						_listParentsConfig = [_item] call BIS_fnc_returnparents;
						_parentConfig = _listParentsConfig select (count _listParentsConfig - 1);
						_parentDirect = configname inheritsfrom _item;
						_parent = "RscText";
						{
							if (_x in GUI_listLayersParents) exitwith {_parent = _x};
						} foreach _listParents;
						_idParent = GUI_listLayersParents find _parent;

						_className = if (_parentDirect == _parent || _parentDirect == "") then {
							_itemName
						} else {
							_itemName + ": " + _parentDirect
						};

						//--- Create element
						_idc = [GUI_listLayers select _idParent] call GUI_fnc_elementAdd;
						[_idc,_className] call GUI_fnc_elementSetClass;


						//--- Active params
						{
							_paramIndex = _foreachindex;
							if (_paramIndex != GUI_param_positionType) then {
								_listParams = _x;
								_functionName = GUI_listLayersFunctions select _forEachIndex;
								_function = missionnamespace getvariable _functionName;
								_paramArray = [];
								{
									_paramValue = [_item,_x] call BIS_fnc_returnConfigEntry;
									if !(isnil "_paramValue") then {

										//--- Inherited?
										_parentValue = [_parentConfig,_x] call BIS_fnc_returnConfigEntry;
										if (!isnil "_parentValue" && _parentDirect != "" && _paramIndex != GUI_param_position) then {
											if ([_paramValue,_parentValue] call BIS_fnc_areEqual) then {_paramValue = -1};
										};

										_paramArray = _paramArray + [_paramValue];
									};
								} foreach _listParams;

								//--- Set
								if (count _paramArray > 0) then {
									if (_forEachIndex == GUI_param_position) then {
										[_idc,_paramArray] call _function;
									} else {
										[_idc,_paramArray select 0] call _function;
									};
								};
							};
						} foreach GUI_listLayersStrings;


						//--- Custom params
						_listParams = [];
						for "_i" from 0 to (count _item - 1) do {
							_param = _item select _i;
							_paramName = configname _param;
							if ({_paramName == _x} count _listParamsActive == 0) then {
								_paramValue = [_item,_paramName] call BIS_fnc_returnConfigEntry;

								if !(isnil "_paramValue") then {

									//--- Inherited?
									_parentValue = [_parentConfig,_paramName] call BIS_fnc_returnConfigEntry;
									_addParam = if (!isnil "_parentValue" && _parentDirect != "") then {
										!([_paramValue,_parentValue] call BIS_fnc_areEqual)
									} else {
										true
									};

									if (_addParam) then {
										_paramText = if (typename _paramValue == typename []) then {
											_paramText = format ["%1[] = {",_paramName];
											{
												_paramText = _paramText + str _x;
												if (_forEachIndex != count _paramValue - 1) then {_paramText = _paramText + ","};
											} foreach _paramValue;
											_paramText = _paramText + "};";
											_paramText
										} else {
											if (typename _paramValue == typename "") then {_paramValue = str _paramValue};
											format ["%1 = %2;",_paramName,_paramValue];
										};
										_listParams = _listParams + [_paramText];
									};
								};
							};
						};
						[_idc,_listParams] call GUI_fnc_elementSetDataCustom;
					};
				};
			} foreach _controlsAll;
			closedialog 999;
		} else {
			_idc = GUI_layer_structuredtext;
			GUI_CONTROL ctrlsetbackgroundcolor [1,0,0,0.33];
			GUI_CONTROL ctrlsetstructuredtext parsetext "<t size='1.2' align='left'>ERROR:<br />IDD not found!</t>";
		};
	} else {
		_idc = GUI_layer_structuredtext;
		GUI_CONTROL ctrlsetbackgroundcolor [1,0,0,0.33];
		GUI_CONTROL ctrlsetstructuredtext parsetext "<t size='1.2' align='left'>ERROR:<br />Display not found!</t>";
	};
};