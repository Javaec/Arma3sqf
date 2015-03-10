_mode = _this select 0;
_params = _this select 1;
_class = _this select 2;

switch _mode do
{
	case "onLoad":
	{
		private ["_display", "_control", "_ListBoxTopic", "_ListBoxHint", "_buttonTopicSortType", "_buttonTopicSortDirection", "_buttonHintSortType", "_buttonHintSortDirection"];

		_display = _params select 0;

		//--- set player's name
		(_display displayctrl 8434) ctrlSetText profileName;
		[_display, 8434] call (uinamespace getvariable 'BIS_fnc_setIDCStreamFriendly');

		//toUpper title
		_control = (_display displayctrl 1000);
		_control ctrlSetText (toUpper (ctrlText _control));

		_ctrlModel = _display displayctrl 789;
		RscDisplayFieldManual_ctrlModelPosDef = ctrlposition _ctrlModel;

		//Set the default sorting to logical and ascending
		uiNamespace setVariable ["BIS_RscDisplayFieldManual_HintSortType", "logically"];
		uiNamespace setVariable ["BIS_RscDisplayFieldManual_HintSortDirection", "ASCEND"];
		uiNamespace setVariable ["BIS_RscDisplayFieldManual_TopicSortType", "logically"];
		uiNamespace setVariable ["BIS_RscDisplayFieldManual_TopicSortDirection", "ASCEND"];

		_ListBoxTopic = (_display displayctrl 1500);
		_ListBoxHint = (_display displayctrl 1501);
		_buttonTopicSortType = (_display displayctrl 1005);
		_buttonTopicSortDirection = (_display displayctrl 1006);
		_buttonHintSortType = (_display displayctrl 1007);
		_buttonHintSortDirection = (_display displayctrl 1008);

		_ListBoxTopic ctrladdeventhandler [
				"LBSelChanged",
				"with uinamespace do {['listTopicLBSelChanged', _this, 'RscDisplayFieldManual'] call RscDisplayFieldManual_script};"
		];

		//should be here to fill the description as soon as hint is selected in _ListBoxHint by this init
		_ListBoxHint ctrladdeventhandler [
				"LBSelChanged",
				"with uinamespace do {['listHintLBSelChanged', _this, 'RscDisplayFieldManual'] call RscDisplayFieldManual_script};"
		];

		_buttonTopicSortType ctrladdeventhandler [
				"buttonclick",
				"with uinamespace do {['topicSortTypeButtonClick', _this, 'RscDisplayFieldManual'] call RscDisplayFieldManual_script};"
		];

		_buttonTopicSortDirection ctrladdeventhandler [
				"buttonclick",
				"with uinamespace do {['topicSortDirectionButtonClick', _this, 'RscDisplayFieldManual'] call RscDisplayFieldManual_script};"
		];


		_buttonHintSortType ctrladdeventhandler [
				"buttonclick",
				"with uinamespace do {['hintSortTypeButtonClick', _this, 'RscDisplayFieldManual'] call RscDisplayFieldManual_script};"
		];

		_buttonHintSortDirection ctrladdeventhandler [
				"buttonclick",
				"with uinamespace do {['hintSortDirectionButtonClick', _this, 'RscDisplayFieldManual'] call RscDisplayFieldManual_script};"
		];

		//Init (fill and sort) Topic List box. Changing selected topic in the functions invokes hint ListBox update.
		["reinitTopicListBox", [_ListBoxTopic], "RscDisplayFieldManual"] call RscDisplayFieldManual_script;
	};


	//Fills the Tooltips ListBox
	case "fillTopicListBox":
	{
		private["_ListBoxTopic","_topicArray","_cfgHints", "_cfgHintsMission", "_i", "_currentTopic", "_isTopicEmpty", "_index",
			"_displayName", "_arguments", "_keyColor", "_elementColor"];

		_ListBoxTopic = _params select 0;
		_topicArray = _params select 1;
		_cfgHints = configfile >> "CfgHints";
		_cfgHintsMission = missionConfigFile >> "cfgHints";
		_i = 0;
		lbClear _ListBoxTopic;

		//If mission contains some topic, add <Mission> at the beginning of the ListBox
		if( (str(_cfgHintsMission)) != "" ) then
		{
			_currentTopic = _cfgHintsMission select _i;
			_isTopicEmpty = true;

			//If topic has dlc = -1, don't display it.
			if((isclass _currentTopic) && {!(getNumber(_currentTopic >> "dlc") < 0)}) then
			{
				//Check whether the topic is non-empty (should contain at least one sub-class)
				//Don't count hints with dlc = -1.
				for "_k" from 0 to (count _currentTopic - 1) do
				{
					_currentHint = _currentTopic select _k;
					if((isClass _currentHint) && {!(getNumber(_currentHint >> "dlc") < 0)}) then
					{
						_isTopicEmpty = false;
					};
				};

				if (!_isTopicEmpty) then
				{
					_index = _ListBoxTopic lbAdd (localize "STR_A3_RSCDISPLAYFIELDMANUAL_TEXTMISSION"); //"<Mission>"
					_i = _i + 1;
				};
			};
		};

		while {_i <= (count _topicArray - 1)} do
		{
			_currentTopic = _topicArray select _i;
			_isTopicEmpty = true;

			//If topic has dlc = -1, don't display it.
			if ((isclass _currentTopic) && {!(getNumber(_currentTopic >> "dlc") < 0)}) then
			{
				//Check whether the topic is non-empty (should contain at least one sub-class).
				//Don't count hints with dlc = -1.
				for "_k" from 0 to (count _currentTopic - 1) do
				{
					_currentHint = _currentTopic select _k;
					if((isClass _currentHint) && {!(getNumber(_currentHint >> "dlc") < 0)}) then
					{
						_isTopicEmpty = false;
					};
				};

				if (!_isTopicEmpty) then
				{
					//Read displayName including arguments. Needed for reading displayName from locDB bis_fnc_advHintArg.
					//Arguments are not needed for ListBox, but are applied for hint title which uses displayName too.
					_displayName = getText(_currentTopic >> "displayName");
					//Get arguments.
					_arguments = getArray(_currentTopic >> "arguments");
					_keyColor = (["GUI", "BCG_RGB"] call BIS_fnc_displayColorGet) call BIS_fnc_colorRGBtoHTML;
					_elementColor = (["GUI", "BCG_RGB"] call BIS_fnc_displayColorGet) call BIS_fnc_colorRGBtoHTML;
					//Shift of the reguments according to the string variables shift and color them when needed.
					_arguments = [_arguments, _keyColor, _elementColor] call bis_fnc_advHintArg;
					_displayName = format([_displayName]+_arguments);
					_index = _ListBoxTopic lbAdd _displayName;

					//Add metadata to be able to find config entry.
					_topicID = "GlobalTopic_"+(configName _currentTopic);
					_ListBoxTopic lbSetData [_index, _topicID];

					//Mark topic shown as hint in the mission
					if(_topicID in (missionNamespace getVariable ['BIS_fnc_advHint_FMMark', []]) ) then
					{
						_ListBoxTopic lbSetPicture [_index, "\A3\Ui_f\data\Map\Markers\Military\warning_CA.paa"];
					};
				};
			};

			_i = _i + 1;
		};
	};


	//Fills the Hints ListBox
	case "fillHintListBox":
	{
		private ["_ListBoxHint", "_hintArray", "_hintItem", "_displayName", "_arguments", "_keyColor", "_elementColor", "_index", "_hintID"];
		_ListBoxHint =  _params select 0;
		_hintArray = _params select 1;

		for "_i" from 0 to (count _hintArray - 1) do
		{
			_hintItem = _hintArray select _i;

			//Don't display hints with parameter dlc = -1
			if (isclass _hintItem && {!((getNumber (_hintItem >> "dlc")) < 0)}) then
			{
				//Read displayName including arguments. Needed for reading displayName from locDB bis_fnc_advHintArg.
				//Arguments are not needed for ListBox, but are applied for hint title which uses displayName too.
				_displayName = getText(_hintItem >> "displayName");
				//Get arguments.
				_arguments = getArray(_hintItem >> "arguments");
				_keyColor = (["GUI", "BCG_RGB"] call BIS_fnc_displayColorGet) call BIS_fnc_colorRGBtoHTML;
				_elementColor = (["GUI", "BCG_RGB"] call BIS_fnc_displayColorGet) call BIS_fnc_colorRGBtoHTML;
				//Shift of the reguments according to the string variables shift and color them when needed.
				_arguments = [_arguments, _keyColor, _elementColor] call bis_fnc_advHintArg;
				_displayName = format([_displayName]+_arguments);

				_index = _ListBoxHint lbAdd _displayName;
				//Add metadata to be able to find config entry.
				_hintID = (configName _currentTopic)+"_"+(configName _hintItem);
				_ListBoxHint lbSetData [_index, _hintID];

				//Mark hint shown in the mission
				if(_hintID in (missionNamespace getVariable ['BIS_fnc_advHint_FMMark', []])) then
				{
					_ListBoxHint lbSetPicture [_index, "\A3\Ui_f\data\Map\Markers\Military\warning_CA.paa"];
				};

				//Mark DLC Hint (Walk through CfgMods only when it's necessary) - TODO: Uncomment as soon as color of right icon can be set separately
				//_dlcNo = getNumber(_hintItem >> "dlc");
				//if(_dlcNo > 0) then
				//{
				//	{ //for each class from cfgMods
				//		if(_dlcNo == getNumber(_x >> "appId")) then
				//		{
				//			_ListBoxHint lbSetPictureRight [_index, getText(_x >> "logo")];
				//		};
				//	} foreach ((configfile >> "CfgMods") call bis_fnc_returnChildren);
				//};
			};
		};
	};


	//Reads hints for the selected topic
	case "listTopicLBSelChanged":
	{
		private ["_ListBoxTopic", "_display", "_ListBoxHint", "_cfgHints", "_cfgHintsMission", "_currentTopic", "_topicSelectedNum",
			 "_topic", "_sortingDirection","_hintArray","_currentHint", "_sortingAlgorithm","_logicalOrderPath", "_hintSelectedData"];

		_ListBoxTopic = _params select 0;
		_display = ctrlparent _ListBoxTopic;
		_ListBoxHint = (_display displayctrl 1501);
		_cfgHints = configfile >> "CfgHints";
		_cfgHintsMission = missionConfigFile >> "cfgHints";
		_currentTopic = "";
		_hintSelectedData = "";

		//Find config position of selected topic
		scopeName "topicChangedScope";
		_topicSelectedNum = 0;

		for "_k" from 0 to (count _cfgHints - 1) do
		{
			_topic = _cfgHints select _k;

			if(isClass(_topic) && ("GlobalTopic_"+configName(_topic)) == (_ListBoxTopic lbData (lbCurSel _ListBoxTopic))) then
			{
				_topicSelectedNum = _k;
				breakTo "topicChangedScope";
			};
		};

		//Check if mission specific hints are defined in description.ext and selected in Topic ListBox
		if( ((str _cfgHintsMission) != "") && (_topicSelectedNum == 0)) then
		{
			_currentTopic = _cfgHintsMission select _topicSelectedNum;
		}
		else
		{
			_currentTopic = _cfgHints select _topicSelectedNum;
		};

		lbClear _ListBoxHint;
		(_display displayctrl 1100) ctrlSetStructuredText parseText "";

		if (isclass _currentTopic) then
		{
			_sortingDirection = uiNamespace getVariable ["BIS_RscDisplayFieldManual_HintSortDirection", "ASCEND"];

			if((uiNamespace getVariable ["BIS_RscDisplayFieldManual_HintSortType", "logically"]) == "logically") then
			{
				//Sort LOGICALLY-------------------------------------------------------------------------------------------

				//Fill the helper array
				_hintArray = [];
				for "_i" from 0 to (count _currentTopic - 1) do
				{
					_currentHint = _currentTopic select _i;

					//Don't add hints that are displayed instead of DLC hints when DLC is not owned.
					if (isclass _currentHint) then
					{
						_hintArray = _hintArray+[_currentHint];
					};
				};

				_sortingAlgorithm = {

					_logicalOrderPath = _x >> "logicalOrder";

					//Check if logicalOrder parameter exists, if not put hint at the end of the list
					if(isNumber(_logicalOrderPath)) then
					{
						getNumber(_logicalOrderPath);
					}
					else
					{
						//TODO: When two entries have same value, bis_fnc_sortBy keeps the position from config. Increment by position would be
						//	safer, but currently have no idea how to accomplish it (Local, global and _input0 variable can't be incremented).
						1000;
					};
				};

				_hintArray = [_hintArray, [], _sortingAlgorithm, _sortingDirection] call bis_fnc_sortBy;
				//Fill the ListBox
				["fillHintListBox", [_ListBoxHint, _hintArray], "RscDisplayFieldManual"] call RscDisplayFieldManual_script;
			}
			else
			{
				//Sort ALPHABETICALLY-------------------------------------------------------------------------------------------
				["fillHintListBox", [_ListBoxHint, _currentTopic], "RscDisplayFieldManual"] call RscDisplayFieldManual_script;

				if(_sortingDirection == "ASCEND") then
				{
					//Ascending
					lbSort [_ListBoxHint, "ASC"];
				}
				else
				{
					//Descending
					lbSort [_ListBoxHint, "DESC"];
				};
				//Sort ALPHABETICALLY-------------------------------------------------------------------------------------------
			};
		};

		_dlcHint = (getFieldManualStartPage _display) select 1;
		_topicClassName = [_ListBoxTopic lbData (lbCurSel _ListBoxTopic), 12] call bis_fnc_trimString;
		_curSel = 0;

		if(_dlcHint != "") then
		{
			_hintSelectedData = _topicClassName + "_" + _dlcHint;
		}
		else
		{
			_hintSelectedData = uiNamespace getVariable ['RscDisplayFieldManual_Hint', ""];
		};

		//Find topic that was selected while closing Field Manual last time   - MUF-was here before
		if(_hintSelectedData != "") then
		{
			scopeName "onLoadScope";
			for "_k" from 0 to ((lbSize _ListBoxHint) - 1) do
			{
				if((_ListBoxHint lbData _k) == _hintSelectedData) then
				{
					_curSel = _k;
					breakTo "onLoadScope";
				};
			};
		};

		_ListBoxHint lbSetCurSel _curSel;
	};


	//Displays text of the selected hint
	case "listHintLBSelChanged":
	{

		private ["_ListBoxHint", "_display", "_ListBoxTopic", "_cfgHints", "_topicSelectedNum", "_hintSelectedNum", "_cfgHintsMission",
			 "_currentTopic", "_hintControl", "_position", "_topic", "_hint", "_selectedHint", "_keyColor", "_elementColor", "_shadowColor",
			 "_textSizeSmall", "_textSizeNormal", "_displayName", "_displayNameShort", "_image", "_description", "_tip", "_arguments",
			 "_startPartString", "_titleControl", "_middlePartString"];

		_ListBoxHint = _params select 0;
	        _display = ctrlparent _ListBoxHint;
		_ListBoxTopic = (_display displayctrl 1500);
		_cfgHints = configfile >> "CfgHints";
		_cfgHintsMission = missionConfigFile >> "cfgHints";
		_currentTopic = "";

		//Find config position of selected topic
		scopeName "hintChangedMainScope";
		_topicSelectedNum = 0;

		for "_k" from 0 to (count _cfgHints - 1) do
		{
			_topic = _cfgHints select _k;

			if(isClass(_topic) && ("GlobalTopic_"+configName(_topic)) == (_ListBoxTopic lbData (lbCurSel _ListBoxTopic))) then
			{
				_topicSelectedNum = _k;
				breakTo "hintChangedMainScope";
			};
		};

		//Check if mission specific hints are defined in description.ext and selected in Topic ListBox
		if( ((str _cfgHintsMission) != "") && (_topicSelectedNum == 0)) then
		{
			_currentTopic = _cfgHintsMission select _topicSelectedNum;
		}
		else
		{
			_currentTopic = (configfile >> "CfgHints") select _topicSelectedNum;
		};

		if(count _currentTopic > 0) then
		{
			//Find config position of selected hint
			scopeName "hintChangedScope";
			_hintSelectedNum = 0;

			for "_k" from 0 to (count _currentTopic - 1) do
			{
				_hint = _currentTopic select _k;

				if(isClass(_hint) && ((configName(_currentTopic)+"_"+configName(_hint)) == (_ListBoxHint lbData (lbCurSel _ListBoxHint)))) then //compare lbData of currently selected item and topicClassName_hintClassName
				{
					_hintSelectedNum = _k;
					breakTo "hintChangedScope";
				};
			};

			_selectedHint = _currentTopic select _hintSelectedNum;

			if (isclass _selectedHint) then
			{
				//Colors
				_keyColor = (["GUI", "BCG_RGB"] call BIS_fnc_displayColorGet) call BIS_fnc_colorRGBtoHTML;
				_elementColor = (["GUI", "BCG_RGB"] call BIS_fnc_displayColorGet) call BIS_fnc_colorRGBtoHTML;
				_shadowColor = "#999999";

				//Text sizes
				_textSizeSmall = 0.8;		// computed from size parameter set in config: configSize*_textSizeSmall = final size
				_textSizeNormal = 1.0;		// e.g. configSize = 1 (parameter size), 1*0.8=0.8 or 1*1=1;

				//Load strings
				_displayName = getText(_selectedHint >> "displayName");
				_displayNameShort = getText(_selectedHint >> "displayNameShort");
				_image = getText(_selectedHint >> "image");
				_description = getText(_selectedHint >> "description");
				_tip = getText(_selectedHint >> "tip");
				_arguments = getArray(_selectedHint >> "arguments");
				_vehicle = getText(_selectedHint >> "vehicle");
				_weapon = getText(_selectedHint >> "weapon");
				_modelScaleBase = 1;
				_modelScale = getNumber(_selectedHint >> "modelScale");
				_model = "";
				_modelVector = [[0,0,0],[0,0,0]];
				_modelPos = +RscDisplayFieldManual_ctrlModelPosDef;

				_titleControl = (_display displayctrl 1101);
				_statGroup = (_display displayctrl 2301);

				_barMin = 0.01;
				_barMax = 1;

				switch true do {
					case true: {}; //--- Terminate, not implemented yet
					case (_vehicle != ""): {
						_statGroup ctrlshow true;
						_titleControl ctrlshow false;
						_titleControl = (_display displayctrl 1102);

						_model = gettext (configfile >> "cfgvehicles" >> _vehicle >> "model");
						_modelScaleBase = 0.075;
						_modelVector = [[0.0301068,0.0430097,0],[-0.0024624,-0.00172368,0.0524139]];
						_modelPos set [2,(_modelPos select 2) - 0.1];

						_attributes = ["maxspeed","armor","fuelcapacity","threat"];
						_attributeTypes = [false,false,false,false]; // True for log scale

						//--- Load global mins and max
						_statsExtremes = uinamespace getvariable "RscDisplayFieldManual_vehicleStats";
						if (isnil "_statsExtremes") then {
							_statsExtremes = [
								"isclass _x && getnumber (_x >> 'scope') == 2 && ((configname _x) iskindof 'allvehicles')" configclasses (configfile >> "cfgvehicles"),
								_attributes,
								_attributeTypes
							] call bis_fnc_configExtremes;
							uinamespace setvariable ["RscDisplayFieldManual_vehicleStats",_statsExtremes];
						};
						_statsMin = _statsExtremes select 0;
						_statsMax = _statsExtremes select 1;

						//--- Load stats of the current vehicle
						_stats = [
							[configfile >> "cfgvehicles" >> _vehicle],
							_attributes,
							_attributeTypes,
							_statsMin
						] call bis_fnc_configExtremes;
						_stats = _stats select 1;

						_statMaxSpeed = linearConversion [_statsMin select 0,_statsMax select 0,_stats select 0,_barMin,_barMax];
						_statArmor = linearConversion [_statsMin select 1,_statsMax select 1,_stats select 1,_barMin,_barMax];
						_statFuelCapacity = linearConversion [_statsMin select 2,_statsMax select 2,_stats select 2,_barMin,_barMax];
						_statHit = linearConversion [_statsMin select 3,_statsMax select 3,_stats select 3,_barMin,_barMax];

						(_display displayctrl 1009) ctrlsettext "Max speed"; //--- ToDo: Localize
						(_display displayctrl 1010) ctrlsettext "Armor"; //--- ToDo: Localize
						(_display displayctrl 1011) ctrlsettext "Fuel capacity"; //--- ToDo: Localize
						(_display displayctrl 1012) ctrlsettext "Threat"; //--- ToDo: Localize

						(_display displayctrl 1800) progresssetposition _statMaxSpeed;
						(_display displayctrl 1801) progresssetposition _statArmor;
						(_display displayctrl 1802) progresssetposition _statFuelCapacity;
						(_display displayctrl 1803) progresssetposition _statHit;
					};
					case (_weapon != ""): {
						_statGroup ctrlshow true;
						_titleControl ctrlshow false;
						_titleControl = (_display displayctrl 1102);

						_model = gettext (configfile >> "cfgweapons" >> _weapon >> "model");
						_modelVector = [[-0.0301068,0.0430097,0],[-0.0024624,-0.00172368,0.0524139]];

						_attributes = ["reloadtime","maxrange","hit","mass"];
						_attributeTypes = [true,true,true,false]; // True for log scale

						//--- Load global mins and max
						_statsExtremes = uinamespace getvariable "RscDisplayFieldManual_weaponStats";
						if (isnil "_statsExtremes") then {
							_statsExtremes = [
								("isclass _x && getnumber (_x >> 'scope') == 2 && getnumber (_x >> 'type') < 5") configclasses (configfile >> "cfgweapons"),
								_attributes,
								_attributeTypes
							] call bis_fnc_configExtremes;
							uinamespace setvariable ["RscDisplayFieldManual_weaponStats",_statsExtremes];
						};
						_statsMin = _statsExtremes select 0;
						_statsMax = _statsExtremes select 1;

						//--- Load stats of the current weapon
						_stats = [
							[configfile >> "cfgweapons" >> _weapon],
							_attributes,
							_attributeTypes,
							_statsMin
						] call bis_fnc_configExtremes;
						_stats = _stats select 1;

						_statReloadSpeed = linearConversion [_statsMin select 0,_statsMax select 0,_stats select 0,_barMax,_barMin];
						_statMaxRange = linearConversion [_statsMin select 1,_statsMax select 1,_stats select 1,_barMin,_barMax];
						_statHit = linearConversion [_statsMin select 2,_statsMax select 2,_stats select 2,_barMin,_barMax];
						_statMass = linearConversion [_statsMin select 3,_statsMax select 3,_stats select 3,_barMin,_barMax];
						if (getnumber (configfile >> "cfgweapons" >> _weapon >> "type") == 4 && _statReloadSpeed == 1) then {_statReloadSpeed = 0;};

						(_display displayctrl 1009) ctrlsettext "Rate of fire"; //--- ToDo: Localize
						(_display displayctrl 1010) ctrlsettext "Range"; //--- ToDo: Localize
						(_display displayctrl 1011) ctrlsettext "Impact"; //--- ToDo: Localize
						(_display displayctrl 1012) ctrlsettext "Weight"; //--- ToDo: Localize

						(_display displayctrl 1800) progresssetposition _statReloadSpeed;
						(_display displayctrl 1801) progresssetposition _statMaxRange;
						(_display displayctrl 1802) progresssetposition _statHit;
						(_display displayctrl 1803) progresssetposition _statMass;
					};
					default {
						_statGroup ctrlshow false;
						_titleControl ctrlshow true;
					};
				};

				//DLC check
				_dlcNo = getNumber (_selectedHint >> "dlc");

				if !((_dlcNo == 0) || {_dlcNo in (getDlcs 1)}) then
				{
					_displayName = getText(configFile >> "CfgHints" >> "DlcMessage" >> ("Dlc" + (str _dlcNo) + "FM") >> "displayName");
					_image = getText(configFile >> "CfgHints" >> "DlcMessage" >> ("Dlc" + (str _dlcNo) + "FM") >> "image");
					_description = getText(configFile >> "CfgHints" >> "DlcMessage" >> ("Dlc" + (str _dlcNo) + "FM") >> "description");
					_tip = getText(configFile >> "CfgHints" >> "DlcMessage" >> ("Dlc" + (str _dlcNo) + "FM") >> "tip");
					_arguments = getArray(configFile >> "CfgHints" >> "DlcMessage" >> ("Dlc" + (str _dlcNo) + "FM") >> "arguments");
				};

				//shift of the reguments according to the string variables shift and color them when needed
				_arguments = [_arguments, _keyColor, _elementColor] call bis_fnc_advHintArg;

				_displayName = toUpper(format([_displayName]+_arguments));

				//shift of string variables (e.g. %1 to %5 etc.)
				//_description = [_description] call bis_fnc_advHintInfo;

				//concatenate and format string with arguments (replacement of variables in the string with proper arguments)
				_description = [_description] + _arguments;
				_description = format _description;

				//_displayNameShort is optional, check if it is present and non-empty
				_startPartString = "";

				if (_displayNameShort == "") then {
					_startPartString = format ["<t align='left' size = '%2' color = '%3'>%1</t>", _displayName, _textSizeNormal, _keyColor];
				} else {
					_startPartString = format ["<t align='left' size = '%3' color = '%4'>%1</t><br/><t size = '%3' align='left' color = '%5'>""%2""</t>", _displayName, _displayNameShort, _textSizeNormal, _keyColor, _shadowColor];
				};

				//Walk through CfgMods only when it's necessary
				if(_dlcNo > 0) then
				{
					{ //for each class from cfgMods
						if(_dlcNo == getNumber(_x >> "appId")) then
						{
							_startPartString = _startPartString + format["<br/><t size = '%1' align='left' color = '%2'>%3</t>", _textSizeNormal, _shadowColor, getText(_x >> "name")];
						};
					} foreach ((configfile >> "CfgMods") call bis_fnc_returnChildren);
				};

				//Title
				if (isnull _titleControl) then {_titleControl = (_display displayctrl 1101); _titleControl ctrlshow true;};
				_titleControl ctrlSetStructuredText parseText (_startPartString);

				//image
				if (_image == "") then
				{
					//NO ICON image - TODO: add icon here as soon as it is ready
					(_display displayctrl 1200) ctrlSetText "#(argb,8,8,3)color(1,1,1,0.1)";
				}
				else
				{
					(_display displayctrl 1200) ctrlSetText _image;
				};

				_middlePartString = format ["<t align='left' size='%2'>%1</t><br/>", _description, _textSizeNormal];	// from image to tip
				_hintControl = (_display displayctrl 1100);

				if (_tip == "") then
				{
					_hintControl ctrlSetStructuredText parseText (_middlePartString);
				}
				else
				{
					//shift of string variables (e.g. %1 to %5 etc.)
					//_tip = [_tip] call bis_fnc_advHintInfo;
					//concatenate and format string with arguments (replacement of variables in the string with proper arguments)
					_tip = [_tip] + _arguments;
					_tip = format _tip;
					_tip = format ["<t align='left' size='%2' color='%3'>%1</t><br/>", _tip, _textSizeNormal, _shadowColor];
					_hintControl ctrlSetStructuredText (parseText (format ["%1<br/>%2", _middlePartString, _tip]));
				};

				//--- Show hint model (used for item previews)
				_ctrlModelBackground = _display displayctrl 798;
				_ctrlModelBackground ctrlsetfade ([0,1] select (_model == ""));
				_ctrlModelBackground ctrlcommit 1;
				if (_model == "") then {
					_model = gettext (configfile >> "cfgvehicles" >> "logic" >> "model");
				};
				if (_modelScale == 0) then {_modelScale = 1;};
				_ctrlModel = _display displayctrl 789;
				_ctrlModel ctrlsetmodel _model;
				_ctrlModel ctrlsetmodelscale (_modelScaleBase * _modelScale);
				_ctrlModel ctrlsetmodeldirandup _modelVector;
				_ctrlModel ctrlsetposition _modelPos;

				//Resize StructuredText component to display the scrollbar if needed
				_position = ctrlPosition _hintControl;
				_hintControl ctrlSetPosition [_position select 0, _position select 1, _position select 2, ctrlTextHeight _hintControl+0.05];
				_hintControl ctrlcommit 0;
			};
		};
	};


	//Change sorting type of topics
	case "topicSortTypeButtonClick":
	{
		private ["_buttonTopicSortType","_display","_ListBoxTopic","_ListBoxHint"];

		_buttonTopicSortType = _params select 0;
		_display = ctrlparent _buttonTopicSortType;
		_ListBoxTopic = (_display displayctrl 1500);
		_ListBoxHint = (_display displayctrl 1501);

		//Remember the selected topic
		uinamespace setvariable ["RscDisplayFieldManual_Topic", _ListBoxTopic lbData (lbCurSel _ListBoxTopic)];

		if(ctrlText _buttonTopicSortType == "L") then
		{
			//Switch to descending (cba)
			_buttonTopicSortType ctrlSetText "A";
			_buttonTopicSortType ctrlSetTooltip (localize "STR_A3_RSCDISPLAYFIELDMANUAL_SORT_ALPHABETICALLY");
			uiNamespace setVariable ["BIS_RscDisplayFieldManual_TopicSortType", "alphabetically"];
		}
		else
		{
			//Switch to ascending (abc)
			_buttonTopicSortType ctrlSetText "L";
			_buttonTopicSortType ctrlSetTooltip (localize "STR_A3_RSCDISPLAYFIELDMANUAL_SORT_LOGICALLY");
			uiNamespace setVariable ["BIS_RscDisplayFieldManual_TopicSortType", "logically"];
		};

		["reinitTopicListBox", [_ListBoxTopic], "RscDisplayFieldManual"] call RscDisplayFieldManual_script;
	};


	//Change sort direction of topics
	case "topicSortDirectionButtonClick":
	{
		private ["_buttonTopicSortDirection","_display","_ListBoxTopic","_ListBoxHint"];

		_buttonTopicSortDirection = _params select 0;
		_display = ctrlparent _buttonTopicSortDirection;
		_ListBoxTopic = (_display displayctrl 1500);
		_ListBoxHint = (_display displayctrl 1501);

		//Remember the selected topic
		uinamespace setvariable ["RscDisplayFieldManual_Topic", _ListBoxTopic lbData (lbCurSel _ListBoxTopic)];

		if(ctrlText _buttonTopicSortDirection == "\A3\ui_f\data\gui\rsc\RscDisplayMultiplayer\arrow_up_ca.paa") then
		{
			//Switch to descending (cba)
			_buttonTopicSortDirection ctrlSetText "\A3\ui_f\data\gui\rsc\RscDisplayMultiplayer\arrow_down_ca.paa";
			_buttonTopicSortDirection ctrlSetTooltip (localize "STR_A3_RSCDISPLAYFIELDMANUAL_SORT_DESCENDING");
			uiNamespace setVariable ["BIS_RscDisplayFieldManual_TopicSortDirection", "DESCEND"];
		}
		else
		{
			//Switch to ascending (abc)
			_buttonTopicSortDirection ctrlSetText "\A3\ui_f\data\gui\rsc\RscDisplayMultiplayer\arrow_up_ca.paa";
			_buttonTopicSortDirection ctrlSetTooltip (localize "STR_A3_RSCDISPLAYFIELDMANUAL_SORT_ASCENDING");
			uiNamespace setVariable ["BIS_RscDisplayFieldManual_TopicSortDirection", "ASCEND"];
		};

		["reinitTopicListBox", [_ListBoxTopic], "RscDisplayFieldManual"] call RscDisplayFieldManual_script;
	};


	//Change sorting type of hints
	case "hintSortTypeButtonClick":
	{
		private ["_buttonHintSortType","_display","_ListBoxTopic","_ListBoxHint"];

		_buttonHintSortType = _params select 0;
		_display = ctrlparent _buttonHintSortType;
		_ListBoxTopic = (_display displayctrl 1500);
		_ListBoxHint = (_display displayctrl 1501);

		//Remember the selected hint
		uinamespace setvariable ["RscDisplayFieldManual_Hint", _ListBoxHint lbData (lbCurSel _ListBoxHint)];

		if(ctrlText _buttonHintSortType == "L") then
		{
			//Switch to descending (cba)
			_buttonHintSortType ctrlSetText "A";
			_buttonHintSortType ctrlSetTooltip (localize "STR_A3_RSCDISPLAYFIELDMANUAL_SORT_ALPHABETICALLY");
			uiNamespace setVariable ["BIS_RscDisplayFieldManual_HintSortType", "alphabetically"];
		}
		else
		{
			//Switch to ascending (abc)
			_buttonHintSortType ctrlSetText "L";
			_buttonHintSortType ctrlSetTooltip (localize "STR_A3_RSCDISPLAYFIELDMANUAL_SORT_LOGICALLY");
			uiNamespace setVariable ["BIS_RscDisplayFieldManual_HintSortType", "logically"];
		};

		//Simulate change of topic (but select the same), to update the Hints ListBox
		["listTopicLBSelChanged", [_ListBoxTopic, lbCurSel _ListBoxTopic], "RscDisplayFieldManual"] call RscDisplayFieldManual_script;
	};


	//Change sort direction of hints
	case "hintSortDirectionButtonClick":
	{
		private ["_buttonHintSortDirection","_display","_ListBoxTopic","_ListBoxHint"];

		_buttonHintSortDirection = _params select 0;
		_display = ctrlparent _buttonHintSortDirection;
		_ListBoxTopic = (_display displayctrl 1500);
		_ListBoxHint = (_display displayctrl 1501);

		//Remember the selected hint
		uinamespace setvariable ["RscDisplayFieldManual_Hint", _ListBoxHint lbData (lbCurSel _ListBoxHint)];

		if(ctrlText _buttonHintSortDirection == "\A3\ui_f\data\gui\rsc\RscDisplayMultiplayer\arrow_up_ca.paa") then
		{
			//Switch to descending (cba)
			_buttonHintSortDirection ctrlSetText "\A3\ui_f\data\gui\rsc\RscDisplayMultiplayer\arrow_down_ca.paa";
			_buttonHintSortDirection ctrlSetTooltip (localize "STR_A3_RSCDISPLAYFIELDMANUAL_SORT_DESCENDING");
			uiNamespace setVariable ["BIS_RscDisplayFieldManual_HintSortDirection", "DESCEND"];
		}
		else
		{
			//Switch to ascending (abc)
			_buttonHintSortDirection ctrlSetText "\A3\ui_f\data\gui\rsc\RscDisplayMultiplayer\arrow_up_ca.paa";
			_buttonHintSortDirection ctrlSetTooltip (localize "STR_A3_RSCDISPLAYFIELDMANUAL_SORT_ASCENDING");
			uiNamespace setVariable ["BIS_RscDisplayFieldManual_HintSortDirection", "ASCEND"];
		};

		//Simulate change of topic (but select the same), to update the Hints ListBox
		["listTopicLBSelChanged", [_ListBoxTopic, lbCurSel _ListBoxTopic], "RscDisplayFieldManual"] call RscDisplayFieldManual_script;
	};


	//Fill and sort Topic ListBox
	case "reinitTopicListBox":
	{
		private ["_cfgHints","_ListBoxTopic","_i","_topicSelectedData","_currentTopic","_isTopicEmpty","_sortingDirection","_topicArray"];

		_cfgHints = configfile >> "CfgHints";
		_ListBoxTopic = _params select 0;
		_topicSelectedData = "";
		_sortingDirection = uiNamespace getVariable ["BIS_RscDisplayFieldManual_TopicSortDirection", "ASCEND"];

		if((uiNamespace getVariable ["BIS_RscDisplayFieldManual_TopicSortType", "logically"]) == "logically") then
		{
			//Sort LOGICALLY-------------------------------------------------------------------------------------------

			//Fill the helper array
			_topicArray = [];
			for "_i" from 0 to (count _cfgHints - 1) do
			{
				_currentTopic = _cfgHints select _i;
				if (isclass _currentTopic) then
				{
					//Check whether the topic is non-empty (should contain at least one sub-class)
					_isTopicEmpty = true;
					for "_k" from 0 to (count _currentTopic - 1) do
					{
						if(isClass(_currentTopic select _k)) then
						{
							_isTopicEmpty = false;
						};
					};

					if (!_isTopicEmpty) then
					{
						_topicArray = _topicArray+[_currentTopic];
					};
				};
			};

			_sortingAlgorithm = {

				_logicalOrderPath = _x >> "logicalOrder";

				//Check if logicalOrder parameter exists, if not put hint at the end of the list
				if(isNumber(_logicalOrderPath)) then
				{
					getNumber(_logicalOrderPath);
				}
				else
				{
					//TODO: When two entries have same value, bis_fnc_sortBy keeps the position from config. Increment by position would be
					//	safer, but currently have no idea how to accomplish it (Local, global and _input0 variable can't be incremented).
					1000;
				};
			};

			_topicArray = [_topicArray, [], _sortingAlgorithm, _sortingDirection] call bis_fnc_sortBy;
			//Fill the ListBox
			["fillTopicListBox", [_ListBoxTopic, _topicArray], "RscDisplayFieldManual"] call RscDisplayFieldManual_script;
			_aiLevelComboBox ctrladdeventhandler ["LBSelChanged","with uinamespace do {['aiLevel',_this,'RscDisplayGameOptions'] call RscDisplayGameOptions_script};"];
		}
		else
		{
			//Sort ALPHABETICALLY-------------------------------------------------------------------------------------------
			["fillTopicListBox", [_ListBoxTopic, _cfgHints], "RscDisplayFieldManual"] call RscDisplayFieldManual_script;

			if(_sortingDirection == "ASCEND") then
			{
				//Ascending
				lbSort [_ListBoxTopic, "ASC"];
			}
			else
			{
				//Descending
				lbSort [_ListBoxTopic, "DESC"];
			};
			//Sort ALPHABETICALLY-------------------------------------------------------------------------------------------
		};

		//Check if topic was selected when Field Manual was last time opened.
		//Take DLC topics into account (Field Manual was invoked by click on DLC logo in Main Menu).
		_dlcTopic = (getFieldManualStartPage _display) select 0;
		_curSel = 0;

		if(_dlcTopic != "") then
		{
			_topicSelectedData = "GlobalTopic_" + _dlcTopic;
		}
		else
		{
			_topicSelectedData = uiNamespace getVariable ['RscDisplayFieldManual_Topic', ""];
		};

		if(_topicSelectedData != "") then
		{
			scopeName "onLoadScope";
			for "_k" from 0 to ((lbSize _ListBoxTopic) - 1) do
			{
				if((_ListBoxTopic lbData _k) == _topicSelectedData) then
				{
					_curSel = _k;
					breakTo "onLoadScope";
				};
			};
		};

		_ListBoxTopic lbSetCurSel _curSel;
	};


	case "onUnload":
	{
		private ["_display", "_ListBoxTopic", "_ListBoxHint"];
		_display = _params select 0;
		_ListBoxTopic = _display displayctrl 1500;
		_ListBoxHint = _display displayctrl 1501;

		//Remember the selected topic and hint
		uinamespace setvariable ["RscDisplayFieldManual_Topic", _ListBoxTopic lbData (lbCurSel _ListBoxTopic)];
		uinamespace setvariable ["RscDisplayFieldManual_Hint", _ListBoxHint lbData (lbCurSel _ListBoxHint)];
	};
};
