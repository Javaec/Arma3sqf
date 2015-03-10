private ["_mode","_shift","_alt","_tab","_tabAdd","_tabCount","_brPlain","_br","_textExport","_symbol","_symbol_ddot","_symbol_backslash","_symbol_dollar","_listReplace","_data","_listClasses","_listExport","_fnc_export"];
#define	GUI_DISPLAY_DEFAULT	(uinamespace getvariable "BIS_RscGUIEditor")
#define	GUI_DISPLAY		(uinamespace getvariable "BIS_RscGUIEditor_main")
#define GUI_CONTROL		(GUI_DISPLAY displayctrl _idc)

//--- Export
_mode = if (count _this > 0) then {_this select 0} else {0};
_shift = if (count _this > 1) then {_this select 1} else {false};
_alt = if (count _this > 2) then {_this select 2} else {false};
_tabCount = if (count _this > 3) then {_this select 3} else {0};
_macroIDC = if (count _this > 4) then {_this select 4} else {GUI_export_idc};
_macroIDC = _macroIDC > 0;

_tab = tostring [9];

//--- Check project title
if (_mode == 0 && GUI_title == "") then {
	[] call GUI_fnc_title;
	waituntil {isnull (uinamespace getvariable "BIS_RscGUIEditor_title")};
};

startloadingscreen [""];

//--- Customizable tabs
_tabAdd = "";
if (_tabCount < 0) then {
	_tabCount = 0;
	if (2 in GUI_listKeys) then {_tabCount = 1;};
	if (3 in GUI_listKeys) then {_tabCount = 2;};
	if (4 in GUI_listKeys) then {_tabCount = 3;};
	if (5 in GUI_listKeys) then {_tabCount = 4;};
	if (6 in GUI_listKeys) then {_tabCount = 5;};
	if (7 in GUI_listKeys) then {_tabCount = 6;};
	if (8 in GUI_listKeys) then {_tabCount = 7;};
	if (9 in GUI_listKeys) then {_tabCount = 8;};
	if (10 in GUI_listKeys) then {_tabCount = 9;};
	//for "_i" from 1 to _tabCount do {_tabAdd = _tabAdd + _tab;};
};

_symbol = "$";
_symbol_ddot = toarray ":" select 0;
_symbol_backslash = toarray "\" select 0;
_symbol_dollar = toarray "$" select 0;

//--- Text variables
_tabText = tostring [9];
_brText = tostring [13,10];
_add = {
	call _tab;
	_textExport = _textExport + _this;
	call _br;
};
_br = {
	_textExport = _textExport + _brText;
};
_tab = {
	private ["_tabAdd"];
	_tabAdd = "";
	for "_i" from 1 to _tabCount do {_tabAdd = _tabAdd + _tabText;};
	_textExport = _textExport + _tabAdd;
};
_tabAdd = {
	_tabCount = _tabCount + _this;
};
_blockBorder = "////////////////////////////////////////////////////////";
_textExport = "";

//--- Start comment
_blockBorder call _add;
_playerName = [] call bis_fnc_playerName;
if (_playerName == "test player name") then {_playerName = name player;}; //--- In case main display wasn't fully loaded
format ["// GUI EDITOR OUTPUT START (by %1, v%2, #%3)",_playerName,GUI_version,GUI_exportHash] call _add;
_blockBorder call _add;
call _br;


_listReplace = [
	[[toarray " " select 0,toarray " " select 0],[9,-1]],
	[[toarray "\" select 0,toarray "n" select 0],[13,10]]
];

//--- Include version number
_data = if (!_shift && count GUI_listElements > 0) then {[GUI_version,[GUI_title,GUI_grid,GUI_export_indent,GUI_export_idc,GUI_export_localize]]} else {[]};

_listClasses = [];
_listExport = [];

_fnc_export = {
	private ["_idc","_idcData","_idcDataCustom","_idcDefault","_idcClass","_idcLayer","_idcPositionType","_idcTextExport","_idcExport"];

	_idc = GUI_listElements select _i;
	//_idc = _x;
	_idcData = _idc call GUI_fnc_elementData;
	_idcDataCustom = _idc call GUI_fnc_elementDataCustom;
	_idcDefault = _idc call GUI_fnc_elementDefault;
	_idcClass = _idc call GUI_fnc_elementClass;
	_idcLayer = _idc call GUI_fnc_elementLayer;
	_idcPositionType = _idcData select GUI_param_positionType;
	_isComment = _idcLayer == GUI_layer_comment;

	_idcDataCustom = +_idcDataCustom;
	if (_mode == 0 && !_shift) then {
		if (count _idcDataCustom > 0) then {
			{
				if (_x != "") then {
					_textArray = toarray _x;
					{
						for "_i" from 0 to (count GUI_listExportReplace - 1) do {
							_letterArray = GUI_listExportReplace select _i;
							_letter = _letterArray select 0;
							_letterExport = _letterArray select 1;
							if (_x == _letter) then {
								_textArray set [_forEachIndex,_letterExport];
							};
						};
					} foreach _textArray;
					_idcDataCustom set [_forEachIndex,tostring _textArray];
				};
			} foreach _idcDataCustom;
		};
	};
	_idcExport = if (_idc in GUI_listElementsLocked && _mode < 1) then {-_idc} else {_idc};
	_data = _data + [[_idcExport,_idcClass,_idcData,_idcDataCustom]];	

	//--- Add UI element
	if ((_idcPositionType <= 2 || !isnil "_childIdc") && (!(_idcClass in _listClasses) || _isComment)) then {
		//private ["_data"];

		//--- Config export
		if (_shift) then {
			private ["_textParent","_idcClassArray","_listForced","_listBanned"];
			_listForced = [GUI_param_position];
			_listBanned = [];

			_idcClass = format [_idcClass,GUI_title];
			_textParent = _idc call GUI_fnc_elementParent;
			if (_idcClass == "") then {
				_idcClass = _textParent + "_" + str _idc;
			};
			if (_idcPositionType <= 2) then {_listClasses = _listClasses + [_idcClass]};

			//--- Write parent class?
			if !(_isComment) then {
				_idcClassArray = toarray _idcClass;
				if (_symbol_ddot in _idcClassArray || _symbol_backslash in _idcClassArray) then {
					_idcClassArray = _idcClassArray - [_symbol_backslash];
					_idcClass = tostring _idcClassArray;
					(format ["class %1",_idcClass]) call _add;
					"{" call _add;
				} else {
					(format ["class %1: %2",_idcClass,_textParent]) call _add;
					"{" call _add;
				};
				+1 call _tabAdd;
			};

			//--- Custom params
			if (count _idcDataCustom > 0) then {
				{
					if (_x != "") then {
						private ["_textArray"];

						_textArray = [_x] call GUI_fnc_stringSplit;
						_listParams = _textArray;
						{
							{
								_string = _x;
								if (
									{_x == _string} count _listParams > 0
									||
									{_x == _string + "[]"} count _listParams > 0
									||
									{_x == "\" + _string} count _listParams > 0
								) then {
									if ({_x == _string} count _listBanned == 0) then {_listBanned = _listBanned + [_x]};
								};
							} foreach _x;
						} foreach GUI_listLayersStrings;

						//--- Replace strings
						_textArray = toarray _x;
						if ((_textArray select 0) != _symbol_backslash) then {
							for "_i" from 0 to (count _textArray - 2) do {
								_current = _textArray select (_i);
								_next = _textArray select (_i+1);
								{
									_replace = _x select 0;
									_replaceCurrent = _replace select 0;
									_replaceNext = _replace select 1;
									if (_current == _replaceCurrent && _next == _replaceNext) then {
										_replace = _x select 1;
										_textArray set [_i+0,_replace select 0];
										_textArray set [_i+1,_replace select 1];	
									};
								} foreach _listReplace;
							};
							_textArray = _textArray - [-1];
							_x = tostring _textArray;

							//--- Final value
							_x call _add;
							if (_forEachIndex == (count _idcDataCustom - 1)) then {call _br};
						};
					};
				} foreach _idcDataCustom;
			};


			//--- Regular params
			if !(_isComment) then {
				if (
					!("idc" in _listBanned)
					&&
					//--- No automatic IDC for special buttons
					!((_idc call GUI_fnc_elementLayer) in [GUI_layer_ButtonMenuOK,GUI_layer_ButtonMenuCancel])
				) then {
					//format ["idc = %1;",_idc] call _add;
					_idcMacro = format [
						"IDC_%1_%2",
						toupper (GUI_title call GUI_fnc_elementClassFiltered),
						toupper (_idcClass call GUI_fnc_elementClassFiltered)
					];
					if (_macroIDC) then {
						format ["idc = %1;",_idcMacro] call _add;
					} else {
						format ["idc = %1;",_idc] call _add;
					};
				};
				{
					if (_forEachIndex != GUI_param_positionType) then {
						private ["_listParam","_textParam","_default"];

						_listParam = GUI_listLayersStrings select _forEachIndex;
						_textParam = _listParam select 0;
						_default = _idcDefault select _forEachIndex;

						//--- Recognize default values (not for position)
						if !(_forEachIndex in [GUI_param_position]) then {
							if (typename _x == typename []) then {
								private ["_alpha"];
								_alpha = _x select 3;
								if (typename _alpha == typename "") then {_alpha = call compile _alpha;};
								if (_alpha < 0) then {
									_x = _default;
								};
							};
						};

						//--- Do not save default values
						if (!([_x,_default] call BIS_fnc_areEqual) || _forEachIndex in _listForced) then {
							if (_textParam != "") then {

								if (_forEachIndex == GUI_param_position) then {
									private ["_textX","_textParamPosition"];

									//--- Exception for position (split to x,y,w and h)
									_textX = "";
									_textParamPosition = ["x","y","w","h"];
									{
										_textParam = _textParamPosition select _forEachIndex;
										if ({_textParam in _listBanned} count _listParam == 0) then {
											format ["%1 = %2;",_textParam,_x] call _add;
										};
									} foreach _x;
								} else {
									//--- Ignore empty text in special buttons
									if (
										((_idc call GUI_fnc_elementLayer) in [GUI_layer_ButtonMenuOK,GUI_layer_ButtonMenuCancel])
										&&
										_forEachIndex == GUI_param_text
									) then {
										if (_x == "") then {
											_listBanned = _listBanned + ["text"];
										};
									};

									if ({_textParam in _listBanned} count _listParam == 0) then {
										private ["_textX","_textAdd"];

										//--- Standard procedure
										_textX = "";
										_textAdd = "";
										if (typename _x == typename "") then {
											_textX = str _x;

											//--- Text exception - localize
											if (_forEachIndex in [GUI_param_text,GUI_param_tooltip]) then {
												if (!((_idc call GUI_fnc_elementLayer) in [GUI_layer_pictureshadow,GUI_layer_picturenoshadow]) || _foreachindex == GUI_param_tooltip) then {
													_xArray = toarray _x;
													if (count _xArray > 0) then {
														if ((_xArray select 0) != _symbol_dollar) then {
															if (GUI_export_localize > 0) then {
																_idcClassArray = [_idcClass,":"] call bis_fnc_splitstring;
																_idcClass = if (count _idcClassArray > 0) then {_idcClassArray select 0} else {""};
																_suffix = if (_forEachIndex == GUI_param_tooltip) then {"_tooltip"} else {""};
																_textX = "$STR_A3_" + GUI_title + "_" + _idcClass + _suffix;
															} else {
																_textX = _textx + "; //--- ToDo: Localize";
															};
														} else {
															_textX = _x;
														};
													};
												};
											};

											//--- SizeEx exception - grid height multiplier
											if (_forEachIndex == GUI_param_sizeEx) then {
												_textX = _x + " * " + (gui_grid select 3) + "_H";
											};
										};

										if (typename _x == typename []) then {
											_textParam = _textParam + "[]";
											_textX = "{";
												{
												if (_forEachIndex > 0) then {_textX = _textX + ",";};
												_textX = _textX + str _x;
											} foreach _x;
											_textX = _textX + "}";
										};

										format ["%1 = %2;",_textParam,_textX] call _add;
									};
								};
							};
						};
					};
				} foreach _idcData;

				//--- Control group children
				if ((_idc call GUI_fnc_elementLayer) == (GUI_layer_controlsgroup) && isnil "_childIdc") then {

					"class controls" call _add;
					"{" call _add;
					+1 call _tabAdd;

					//--- Search for group children
					for "_i" from (count GUI_listElements - 1) to 0 step -1 do {
						_childIdc = GUI_listElements select _i;
						_childIdcData = _childIdc call GUI_fnc_elementData;
						if ((_childIdcData select GUI_param_positionType) == _idc) then {
							_childIdc call _fnc_export;
						};
					};

					-1 call _tabAdd;
					"};" call _add;
				};

				//--- Close
				-1 call _tabAdd;
				"};" call _add;
				//_listExport set [_i,_idcTextExport];
			};
		};


		//_textExport = _textExport + _idcTextExport;
	};
	//_textExport = _textExport + _blockBorder;
};

//--- Execute
//for "_i" from 0 to (count GUI_listElements - 1) step +1 do {
for "_i" from (count GUI_listElements - 1) to 0 step -1 do {
	_i call _fnc_export;
};


//--- Copy to clipboard
switch _mode do {

	//--- Export to clipboard
	case 0: {
		private ["_text"];
		_text = if (!_shift) then {
			private ["_textData"];
			if (_alt) then {
				_tabCount = 0;
				call _tab;
				_textExport = "";
				format ["/* #%1",GUI_exportHash] call _add;
				(_symbol + "[") call _add;
				+1 call _tabAdd;
				{
					if (_forEachIndex + 1 == count _data) then {
						(str _x) call _add;

					} else {
						(str _x + ",") call _add;
					};
				} foreach _data;
				-1 call _tabAdd;
				"]" call _add;
				"*/" call _add;
				_textData = _textExport;
			} else {
				_textData = _symbol + str _data;
			};

			_textData
		} else {

			//--- controls[]= export method
			if (_alt) then {
				_textExportControls = _textExport;
				_textExport = "";

				"controls[]=" call _add;
				"{" call _add;
				+1 call _tabAdd;

				{
					//--- Remove custom parent
					_classArray = toarray _x;
					_class = [];
					{
						if (_x == _symbol_ddot) exitwith {};
						_class = _class + [_x];
					} foreach _classArray;
					_class = tostring _class;

					//--- Add to exported string
					if (_foreachindex != count _listClasses - 1) then {(_class + ",") call _add;} else {_class call _add;};
				} foreach _listClasses;

				-1 call _tabAdd;
				"};" call _add;
				_textExport = _textExport + _textExportControls;
			};

			//--- End comment
			_blockBorder call _add;
			"// GUI EDITOR OUTPUT END" call _add;
			_blockBorder call _add;

			_textExport
		};
		GUI_listKeys = [];
		copytoclipboard _text;
		debuglog "Log: GUI: Export";
		_text
	};

	//--- History
	case 1: {
		GUI_listHistory = GUI_listHistory + [+_data];
		GUI_listHistoryIndex = GUI_listHistoryIndex + 1;
		if ((count GUI_listHistory - 1) > GUI_listHistoryIndex) then {
			_listHistoryOld = GUI_listHistory;
			GUI_listHistory = [];
			{
				if (_forEachIndex < GUI_listHistoryIndex) then {
					GUI_listHistory = GUI_listHistory + [_x];
				};
			} foreach _listHistoryOld;
		};

		_alphabetConsonants = ["b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","z"];
		_alphabetVowels = ["a","e","i","o","u","y"];
		GUI_exportHash = format ["%1%2%3%4%5%6%7%8",
			toupper (_alphabetConsonants call bis_fnc_selectrandom),
			(_alphabetVowels call bis_fnc_selectrandom),
			(_alphabetConsonants call bis_fnc_selectrandom),
			(_alphabetVowels call bis_fnc_selectrandom),
			(_alphabetConsonants call bis_fnc_selectrandom),
			(_alphabetVowels call bis_fnc_selectrandom)
		];
	};
};

endloadingscreen;