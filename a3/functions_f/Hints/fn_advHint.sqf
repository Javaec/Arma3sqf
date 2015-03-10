/*
	File: advHint.sqf
	Author: Borivoj Hlava

	Description:
	Primary function of advanced hint system

	Parameter(s):
	_this select 0: Array - Array in format ["hint mainclass","hint class"] or ["hint mainclass","hint class","sub-hint class"]
	_this select 1: Number (optional) - Duration of short version of hint in seconds
	_this select 2: String (optional) - Condition for hiding of short version of hint
	_this select 3: Number (optional) - Duration of full version of hint in seconds
	_this select 4: String (optional) - Condition for hiding of full version of hint
	_this select 5: Bool (optional) - True shows hint even if tutorial hints are disabled via game settings
	_this select 6: Bool (optional) - True shows directly the full hint without using of the short hint
	_this select 7: Bool (optional) - Show the hint in a mission only once (true) or multiple times (false)
	_this select 8: Bool (optional) - Sound is not used when false
	
	Returned value:
	None. Create variable BIS_fnc_advHint_hint:
	BIS_fnc_advHint_hint select 0: String - Class of hint
	BIS_fnc_advHint_hint select 1: String - Structured text of full hint
	BIS_fnc_advHint_hint select 2: String - Structured text of short hint
	BIS_fnc_advHint_hint select 3: Number - Duration of short hint in seconds
	BIS_fnc_advHint_hint select 4: String - Condition for hiding of short hint (default: "false")
	BIS_fnc_advHint_hint select 5: Number - Duration of full hint in seconds
	BIS_fnc_advHint_hint select 6: String - Condition for hiding of full hint (default: "false")
	BIS_fnc_advHint_hint select 7: Bool - True shows directly full hint (default: false)
	BIS_fnc_advHint_hint select 8: Bool - True for using of sound (default: true)
	
	Note: Hint must be defined in CfgHints.
*/

_ignoreTutHintsEnabled = [_this,5,false] call BIS_fnc_param;

if (isTutHintsEnabled || _ignoreTutHintsEnabled) then {
	if (isNil {BIS_fnc_advHint_shownList}) then {BIS_fnc_advHint_shownList = []};
	_onlyOnceCheck = true;
	_onlyOnce = [_this,7,false] call BIS_fnc_param;				//show only once or multiple times
	
	_class = _this select 0;
	_cfg = configFile;
	if ((count _class) > 2) then {
		_cfg = [["CfgHints",_class select 0,_class select 1,_class select 2],configfile >> "CfgHints" >> "Empty"] call bis_fnc_loadClass;
	} else {
		_cfg = [["CfgHints",_class select 0,_class select 1],configfile >> "CfgHints" >> "Empty"] call bis_fnc_loadClass;
	};
	if (isclass _cfg) then {
		if (_cfg in BIS_fnc_advHint_shownList) then {
			_onlyOnceCheck = false;
		} else {
			BIS_fnc_advHint_shownList set [count BIS_fnc_advHint_shownList,_cfg];
		};
	};
	
	if (!_onlyOnce || _onlyOnceCheck) then {
		_this spawn {
			// ========== Parameters ==========
			_class = _this select 0;									//classes, 2 requires
			_showT = [_this,1,15,[0]] call BIS_fnc_param;				//duration of short hint
			_cond = [_this,2,"false",[""]] call BIS_fnc_param;			//hide condition of short hint
			_showTF = [_this,3,35,[0]] call BIS_fnc_param;				//duration of full hint
			_condF = [_this,4,"false",[""]] call BIS_fnc_param;			//hide condition of full hint
			_show = [_this,5,false] call BIS_fnc_param;					//show even if its disabled in options
			_onlyFull = [_this,6,false] call BIS_fnc_param;				//show directly full hint
			_sound = [_this,8,true] call BIS_fnc_param;					//use animation and sound
						
			if (_showT == 0) then {_showT = 15};
			if (_cond == "") then {_cond = "false"};
			if (_showTF == 0) then {_showTF = 35};
			if (_condF == "") then {_condF = "false"};
			
			// ========== Basic variables ==========	
			_topicCfg = configFile;	
			_titleCfg = configFile;
			if ((count _class) > 2) then {
				_topicCfg = [["CfgHints",(_class select 0),(_class select 1)],configfile >> "CfgHints" >> "Empty"] call bis_fnc_loadClass;
				_titleCfg = _topicCfg >> (_class select 2);
			} else {
				_topicCfg = [["CfgHints",(_class select 0)],configfile >> "CfgHints" >> "Empty"] call bis_fnc_loadClass;
				_titleCfg = _topicCfg >> (_class select 1);
			};
			if !(isclass _titleCfg) exitwith {["Hint 'CfgHints >> %1 >> %2' does not exist",_class select 0,_class select 1] call bis_fnc_error;};
			
			//dlc check
			_dlcNo = getNumber (_titleCfg >> "dlc");
			if !((_dlcNo <= 0) || {_dlcNo in (getDlcs 1)}) then {
				_class = ["DlcMessage","Dlc" + (str _dlcNo)];
				_showT = 15;
				_cond = "false";
				_showTF = 35;
				_condF = "false";
				_show = false;
				_onlyFull = true;
				_topicCfg = [["CfgHints",(_class select 0)],configfile >> "CfgHints" >> "Empty"] call bis_fnc_loadClass;
				_titleCfg = _topicCfg >> (_class select 1);
			};

			//marking of shown hints in FM
			if (isNil {BIS_fnc_advHint_FMMark}) then {BIS_fnc_advHint_FMMark = []};
			_FMClassList = ["GlobalTopic_"+(_class select 0),(_class select 0) + "_" + (_class select 1)];
			{
				if !(_x in BIS_fnc_advHint_FMMark) then {BIS_fnc_advHint_FMMark = BIS_fnc_advHint_FMMark + [_x]};
			} forEach _FMClassList;			
			
			//_topicName = getText (_topicCfg >> "displayName");	//temporary disabled
			_titleClass = _class select 1;
			if ((count _class) > 2) then {_titleClass = _class select 2};
			_titleName = getText (_titleCfg >> "displayName");
			_titleNameShort = getText (_titleCfg >> "displayNameShort");
			_desc = getText (_titleCfg >> "description");
			_tipString = getText (_titleCfg >> "tip");
			_arg = getArray (_titleCfg >> "arguments");
			_image = getText (_titleCfg >> "image");
			_noImage = getText (_titleCfg >> "noImage");

			if (isNil {player getVariable "BIS_fnc_advHint_HActiveF"}) then {
				player setVariable ["BIS_fnc_advHint_HActiveF",""]
			};
			if (isNil {player getVariable "BIS_fnc_advHint_HActiveS"}) then {
				player setVariable ["BIS_fnc_advHint_HActiveS",""]
			};

			// Control if paramater image is used
			_imageVar = false;
			if ((_image != "") && (_noImage != "true")) then {
				_imageVar = true;
			};


			// ========== Hint creation ==========
			// -- Info string creation and variables compilation --
			_keyColor = (["GUI", "BCG_RGB"] call BIS_fnc_displayColorGet) call BIS_fnc_colorRGBtoHTML;
			//_elementColor = (["IGUI", "TEXT_RGB"] call BIS_fnc_displayColorGet) call BIS_fnc_colorRGBtoHTML;
			_infoString = _desc;
			// Info + arguments processing
			//_infoString = [_infoString] call BIS_fnc_advHintInfo;		//optimalization
			_argArray = [_arg, _keyColor] call BIS_fnc_advHintArg;
			
			_titleName = format ([_titleName] + _argArray);		//every text is processed twice, because of possible '%number' variables used in _argArray
			_titleName = toUpper (format ([_titleName] + _argArray));
			_titleNameShort = format ([_titleNameShort] + _argArray);
			_titleNameShort = format ([_titleNameShort] + _argArray);
			_info = format ([_infoString] + _argArray);
			_info = format ([_info] + _argArray);
			
			//Logging of shown hints to diary --------------------------------------
			_dlcLog = if !((count _class) > 2) then {getNumber (_titleCfg >> "dlc")} else {getNumber (_topicCfg >> "dlc")};
			if !(_dlcLog < 0) then {	//no log for hint with negative dlc parameter
				//Check that "log" subject exists in diary. If not, create it.
				if (!(player diarysubjectexists "log")) then
				{
					player creatediarysubject ["log", localize "STR_UI_DIARY_TITLE"];
				};
		
				player createDiaryRecord ["log", [localize "STR_A3_RSCDIARY_RECORD_HINTS", format["<img image='%1' width=18 height=18/> <execute expression="" 
				uinamespace setvariable ['RscDisplayFieldManual_Topic', '%2'];
				uinamespace setvariable ['RscDisplayFieldManual_Hint', '%3'];
				(finddisplay 12) createDisplay 'RscDisplayFieldManual';"">%4</execute>",
					getText (_titleCfg >> "image"),
					"GlobalTopic_" + (_class select 0),
					(_class select 0) + "_" + (_class select 1),
					_titleName]]];
			};
			//Logging of shown hints to diary --------------------------------------
			
			disableSerialization;
			waitUntil {!(isNull call BIS_fnc_displayMission)};
			BIS_fnc_advHint_HPressed = nil;

			// -- Hint recalling --
			with uiNamespace do {
				disableSerialization;
				if !(isNil "BIS_fnc_advHint_hintHandlers") then {
					if !(BIS_fnc_advHint_hintHandlers) then {		
						_display = [] call BIS_fnc_displayMission;
						
						BIS_fnc_advHint_hintHandlers = true;
						_display displayAddEventHandler [
							"KeyDown",
							"
								_key = _this select 1;
								
								if (_key in actionkeys 'help') then {
									BIS_fnc_advHint_HPressed = true;
									BIS_fnc_advHint_RefreshCtrl = true;
									[true] call BIS_fnc_AdvHintCall;
									true;
								};
							"
						];
					};
				} else {
					_display = [] call BIS_fnc_displayMission;
					
					BIS_fnc_advHint_hintHandlers = true;
					_display displayAddEventHandler [
						"KeyDown",
						"
							_key = _this select 1;
							
							if (_key in actionkeys 'help') then {
								BIS_fnc_advHint_HPressed = true;
								BIS_fnc_advHint_RefreshCtrl = true;
								[true] call BIS_fnc_AdvHintCall;
								true;
							};
						"
					];
				};
			};

			// -- Build hint --
			_textSizeSmall = 1;			// derived from default hint font size 0.8; final size = (0.8 * 1) = 0.8
			_textSizeNormal = 1.25;		// derived from default hint font size 0.8; final size = (0.8 * 1.25) = 1.0
			_invChar05 = "<img image='#(argb,8,8,3)color(0,0,0,0)' size='0.5' />";		//invisible object for small spaces
			_invChar02 = "<img image='#(argb,8,8,3)color(0,0,0,0)' size='0.2' />";		//invisible object for small spaces
			_shadowColor = "#999999";
			
			_helpKey = "";
			_helpArray = actionKeysNamesArray "help";
			if (count _helpArray != 0) then {
				_helpKey = _helpArray select 0
			} else {
				//wrong name of action or undefined key, actionKeysNamesArray return empty array
				_helpKey = localize "STR_A3_Hints_undefined"
			};
			
			_keyString = format ["<t color = '%1'>[%2]</t>", _keyColor, _helpKey];
			_partString = format [localize "STR_A3_Hints_recall", _keyString];
			_partShortString = format [localize "STR_A3_Hints_moreinfo", _keyString];
			
			_startPartString = "";
			if (_titleNameShort == "") then {
				_titleNameShort = _titleName;
				_startPartString = "";	// from start to image
			} else {
				_startPartString = format ["<t size = '%3' align='center' color = '%5'>""%2""</t><br/>", _titleName, _titleNameShort, _textSizeNormal, _keyColor, _shadowColor];	// from start to image
			};
			_middlePartString = format ["<t align='left' size='%2'>%1</t><br/>", _info, _textSizeSmall];	// from image to tip
			_endPartString = format ["%4<br/><t size = '%2' color = '%3'>%1</t>", _partString, _textSizeSmall, _shadowColor, _invChar02];	// from tip to end
			_tipPartString = "";
			if (_tipString != "") then {
				//_tipString = [_tipString] call BIS_fnc_advHintInfo;		//optimization
				_tipArray = [_tipString] + _argArray;
				_tip = format _tipArray;
				_tipPartString = format ["<t align='left' size='%2' color='%3'>%1</t><br/>", _tip, _textSizeSmall, _shadowColor]
			};
			
			_shortHint = format ["<t size = '%5' color = '%6'>%2</t>", _titleName, _partShortString, _textSizeNormal, _keyColor, _textSizeSmall, _shadowColor];
			
			
			if (_imageVar) then {		// hint with image
				if (_tipString != "") then {			// hint with tip
					_hint = format ["%1<img image = '%5' size = '5' shadow = '0' align='center' /><br/>%2<br/>%3%4", _startPartString, _middlePartString, _tipPartString, _endPartString, _image];
					BIS_fnc_advHint_hint = [_titleClass, [_titleName,_hint], [_titleNameShort,_shortHint], _showT, _cond, _showTF, _condF, _onlyFull, _sound];
				} else {						// hint without tip
					_hint = format ["%1<img image = '%4' size = '5' shadow = '0' align='center' /><br/>%2%3", _startPartString, _middlePartString, _endPartString, _image];
					BIS_fnc_advHint_hint = [_titleClass, [_titleName,_hint], [_titleNameShort,_shortHint], _showT, _cond, _showTF, _condF, _onlyFull, _sound];
				}
			} else {					// hint without image
				if (_tipString != "") then {			// hint with tip
					_hint = format ["%1<br/>%5<br/>%2<br/>%3%4", _startPartString, _middlePartString, _tipPartString, _endPartString, _invChar02];
					BIS_fnc_advHint_hint = [_titleClass, [_titleName,_hint], [_titleNameShort,_shortHint], _showT, _cond, _showTF, _condF, _onlyFull, _sound];
				} else {						// hint without tip
					_hint = format ["%1<t size='0.05'><br/>a<br/>a<br/></t>%2%3", _startPartString, _middlePartString, _endPartString];
					BIS_fnc_advHint_hint = [_titleClass, [_titleName,_hint], [_titleNameShort,_shortHint], _showT, _cond, _showTF, _condF, _onlyFull, _sound];
				}
			};

			[false] call BIS_fnc_AdvHintCall;
		};
	};
};