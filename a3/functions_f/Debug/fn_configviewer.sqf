/*
	Author: Karel Moricky

	Description:
	Splendid config viewer

	Parameter(s):
		0 (Optional): DISPLAY - parent display (mission display by default)
		1 (Optional): CONFIG - root config (all configs displayed by default)
		2 (Optional): BOOL - true to display OK button. Script will then wait until viewer is closed and return selected class and param
		3 (Optional): CODE - executed upon selecting a class. Has to return STRING, which will be shown as structured text instead of params.
		3 (Optional): CODE - executed upon adding a class to list. Returned value (STRING) is item text. Empty string will skip the item.
		5 (Optional): TEXT - custom header. Use %1 to refer to original name ("Splendid Config Viewer")

	Returns:
	ARRAY
		- when OK button is not displayed, empty array is returned
		- when OK button is displayed, array of currently selected entries in format [class (CONFIG), param (STRING)] is returned.
*/

#define DIK_ESCAPE          0x01
#define DIK_1               0x02
#define DIK_2               0x03
#define DIK_3               0x04
#define DIK_4               0x05
#define DIK_5               0x06
#define DIK_6               0x07
#define DIK_7               0x08
#define DIK_8               0x09
#define DIK_9               0x0A
#define DIK_0               0x0B
#define DIK_MINUS           0x0C    /* - on main keyboard */
#define DIK_EQUALS          0x0D
#define DIK_BACK            0x0E    /* backspace */
#define DIK_TAB             0x0F
#define DIK_Q               0x10
#define DIK_W               0x11
#define DIK_E               0x12
#define DIK_R               0x13
#define DIK_T               0x14
#define DIK_Y               0x15
#define DIK_U               0x16
#define DIK_I               0x17
#define DIK_O               0x18
#define DIK_P               0x19
#define DIK_LBRACKET        0x1A
#define DIK_RBRACKET        0x1B
#define DIK_RETURN          0x1C    /* Enter on main keyboard */
#define DIK_LCONTROL        0x1D
#define DIK_A               0x1E
#define DIK_S               0x1F
#define DIK_D               0x20
#define DIK_F               0x21
#define DIK_G               0x22
#define DIK_H               0x23
#define DIK_J               0x24
#define DIK_K               0x25
#define DIK_L               0x26
#define DIK_SEMICOLON       0x27
#define DIK_APOSTROPHE      0x28
#define DIK_GRAVE           0x29    /* accent grave */
#define DIK_LSHIFT          0x2A
#define DIK_BACKSLASH       0x2B
#define DIK_Z               0x2C
#define DIK_X               0x2D
#define DIK_C               0x2E
#define DIK_V               0x2F
#define DIK_B               0x30
#define DIK_N               0x31
#define DIK_M               0x32
#define DIK_COMMA           0x33
#define DIK_PERIOD          0x34    /* . on main keyboard */
#define DIK_SLASH           0x35    /* / on main keyboard */
#define DIK_RSHIFT          0x36
#define DIK_MULTIPLY        0x37    /* * on numeric keypad */
#define DIK_LMENU           0x38    /* left Alt */
#define DIK_SPACE           0x39
#define DIK_CAPITAL         0x3A
#define DIK_F1              0x3B
#define DIK_F2              0x3C
#define DIK_F3              0x3D
#define DIK_F4              0x3E
#define DIK_F5              0x3F
#define DIK_F6              0x40
#define DIK_F7              0x41
#define DIK_F8              0x42
#define DIK_F9              0x43
#define DIK_F10             0x44
#define DIK_NUMLOCK         0x45
#define DIK_SCROLL          0x46    /* Scroll Lock */
#define DIK_NUMPAD7         0x47
#define DIK_NUMPAD8         0x48
#define DIK_NUMPAD9         0x49
#define DIK_SUBTRACT        0x4A    /* - on numeric keypad */
#define DIK_NUMPAD4         0x4B
#define DIK_NUMPAD5         0x4C
#define DIK_NUMPAD6         0x4D
#define DIK_ADD             0x4E    /* + on numeric keypad */
#define DIK_NUMPAD1         0x4F
#define DIK_NUMPAD2         0x50
#define DIK_NUMPAD3         0x51
#define DIK_NUMPAD0         0x52
#define DIK_DECIMAL         0x53    /* . on numeric keypad */
#define DIK_OEM_102         0x56    /* < > | on UK/Germany keyboards */
#define DIK_F11             0x57
#define DIK_NUMPADENTER     0x9C    /* Enter on numeric keypad */

#define DIK_DELETE          0xD3    /* Delete on arrow keypad */

#define GUI_BACKGROUND		(_display displayctrl 11000)
#define GUI_GROUPDEFAULT	(_display displayctrl 2300)
#define GUI_GROUPCUSTOM		(_display displayctrl 2301)
#define GUI_CLASSES		(_display displayctrl 1500)
#define GUI_TITLE		(_display displayctrl 1000)
#define GUI_CLASSES_SEARCH	(_display displayctrl 1001)
#define GUI_PARAMS		(_display displayctrl 1501)
#define GUI_PARAMS_SEARCH	(_display displayctrl 1002)
#define GUI_BOOKMARKS		(_display displayctrl 1502)
#define GUI_OK			(_display displayctrl 2600)
#define GUI_CLOSE		(_display displayctrl 2)
#define GUI_PREVIEWCLASS	(_display displayctrl 2400)
#define GUI_PREVIEWPARAM	(_display displayctrl 2401)
#define GUI_HIERARCHY		(_display displayctrl 1400)
#define GUI_PARENTS		(_display displayctrl 1401)
#define GUI_CUSTOMTEXT		(_display displayctrl 1100)
#define GUI_CUSTOMBACKGROUND	(_display displayctrl 1005)
#define INIT			_display = uinamespace getvariable ["BIS_fnc_configviewer_display",displaynull];
//_display = (ctrlparent (_this select 0));

disableserialization;
private ["_mode"];
_mode = [_this,0,displaynull,[displaynull,""]] call (uinamespace getvariable "bis_fnc_param");

//--- Function called before display - create display and terminate
if (typename _mode == typename displaynull) exitwith {
	private ["_root","_isOK","_code","_title","_displayMission","_parent","_display","_classes","_returnedClass"];

	//--- Define root
	_root = [_this,1,false,[false,configfile]] call (uinamespace getvariable "bis_fnc_param");
	_isOK = [_this,2,false,[false]] call (uinamespace getvariable "bis_fnc_param");
	_code = [_this,3,{},[{}]] call (uinamespace getvariable "bis_fnc_param");
	_codeList = [_this,4,{configname (_this select 0)},[{}]] call (uinamespace getvariable "bis_fnc_param");
	_title = [_this,5,"%1",[""]] call (uinamespace getvariable "bis_fnc_param");
	uinamespace setvariable ["BIS_fnc_configviewer_root",_root];
	uinamespace setvariable ["BIS_fnc_configviewer_isOK",_isOK];
	uinamespace setvariable ["BIS_fnc_configviewer_previewCode",_code];
	uinamespace setvariable ["BIS_fnc_configviewer_codeList",_codeList];
	uinamespace setvariable ["BIS_fnc_configviewer_title",_title];

	//--- Detect parent display
	_parent = if (isnull _mode) then {
		_displayMission = [] call (uinamespace getvariable "bis_fnc_displayMission");
		if !(isnull (finddisplay 312)) then {_displayMission = finddisplay 312;}; //--- Curator
		if (isnull _displayMission) then {
			_displays = uinamespace getvariable ["GUI_displays",[]];
			_classes = uinamespace getvariable ["GUI_classes",[]];

			{
				if (isnull _x) then {
					_classes set [_foreachindex,-1];
				};
			} foreach _displays;
			_displays = _displays - [displaynull];
			_classes = _classes - [-1];

			if (count _displays > 0 && count _displays == count _classes) then {
				if ((_classes select (count _classes - 1)) == "RscDisplayDebug") then {
					//--- Debug console is open - use the display below it (otherwise you couldn't access the console while in the viewer)
					_displays select (count _displays - 2)
				} else {
					//--- Open the viewer from the last open display
					_displays select (count _displays - 1)
				};
			} else {
				//--- No displays are tracked - cannot open
				displaynull
			};
		} else {
			//--- Mission display is present - use it as parent
			_displayMission
		};
	} else {
		_mode
	};
	_parent createdisplay "RscDisplayConfigViewer";
	
	//--- Wait until class is selected
	if (_isOK) then {
		waituntil {!isnil {uinamespace getvariable "BIS_fnc_configviewer_display"}};
		_display = uinamespace getvariable "BIS_fnc_configviewer_display";

		waituntil {isnull _display};
		_returnedClass = uinamespace getvariable "BIS_fnc_configviewer_returnedClass";
		if !(isnil "_returnedClass") then {
			BIS_fnc_configviewer_returnedClass = nil;
			_returnedClass
		} else {
			[]
		};
	} else {
		[]
	};
};

_this = [_this,1,[]] call (uinamespace getvariable "bis_fnc_param");
switch _mode do {

	///////////////////////////////////////////////////////////////////////////////////////////
	case "Init": {
		private ["_display","_path","_selected"];
		_display = _this select 0;

		BIS_fnc_configviewer_display = _display;

		GUI_CLASSES ctrladdeventhandler ["lbselchanged","with uinamespace do {terminate bis_fnc_configviewer_lbselchanged; bis_fnc_configviewer_lbselchanged = ['lbSelChanged',_this] spawn bis_fnc_configviewer};"];
		GUI_CLASSES ctrladdeventhandler ["lbdblclick","with uinamespace do {['buttonClick',_this] spawn bis_fnc_configviewer};"];
		GUI_CLASSES ctrladdeventhandler ["keydown","with uinamespace do {['keyDown',_this] call bis_fnc_configviewer};"];
		GUI_BOOKMARKS ctrladdeventhandler ["lbdblclick","with uinamespace do {['bookmarkButtonClick',_this] spawn bis_fnc_configviewer};"];
		GUI_BOOKMARKS ctrladdeventhandler ["keydown","with uinamespace do {['bookmarkKeyDown',_this] call bis_fnc_configviewer};"];
		GUI_PARAMS ctrladdeventhandler ["keydown","with uinamespace do {['keyDown',_this] spawn bis_fnc_configviewer};"];
		GUI_PARAMS ctrladdeventhandler ["lbselchanged","with uinamespace do {['paramLbSelChanged',_this] spawn bis_fnc_configviewer};"];
		GUI_CLOSE ctrladdeventhandler ["buttonclick","(ctrlparent (_this select 0)) closedisplay 2;"];

		//--- Set title
		_titleText = ctrltext GUI_TITLE;
		GUI_TITLE ctrlsettext format [BIS_fnc_configviewer_title,_titleText];

		//--- Initialize or hide OK button
		if (BIS_fnc_configviewer_isOK) then {
			GUI_OK ctrladdeventhandler ["buttonclick","with uinamespace do {['buttonOK',_this] spawn bis_fnc_configviewer};"];
		} else {
			GUI_OK ctrlenable false;
			GUI_OK ctrlsetfade 1;
			GUI_OK ctrlcommit 0;
		};

		//--- Initialize or hide preview buttons
		if (str BIS_fnc_configviewer_previewCode != str {}) then {
			GUI_PREVIEWCLASS ctrlenable false;
			GUI_PREVIEWCLASS ctrlsetfade 1;
			GUI_PREVIEWCLASS ctrlcommit 0;

			GUI_PREVIEWPARAM ctrlenable false;
			GUI_PREVIEWPARAM ctrlsetfade 1;
			GUI_PREVIEWPARAM ctrlcommit 0;

			GUI_GROUPDEFAULT ctrlenable false;
			GUI_GROUPDEFAULT ctrlsetfade 1;
			GUI_GROUPDEFAULT ctrlcommit 0;

			GUI_CUSTOMBACKGROUND ctrlsetposition [
				ctrlposition GUI_GROUPCUSTOM select 0,
				ctrlposition GUI_CLASSES select 1,
				ctrlposition GUI_GROUPCUSTOM select 2,
				ctrlposition GUI_CLASSES select 3
			];
			GUI_CUSTOMBACKGROUND ctrlcommit 0;
		} else {
			GUI_PREVIEWCLASS ctrladdeventhandler ["buttonclick","with uinamespace do {['previewClass',_this] spawn bis_fnc_configviewer};"];
			GUI_PREVIEWPARAM ctrladdeventhandler ["buttonclick","with uinamespace do {['previewParam',_this] spawn bis_fnc_configviewer};"];
			GUI_PREVIEWCLASS ctrlsettooltip "Create the vehicle/weapon under cursor's position."; //--- ToDo: Translate
			GUI_PREVIEWPARAM ctrlsettooltip "Display param preview. Currently works only for .paa files and colors."; //--- ToDo: Translate

			GUI_GROUPCUSTOM ctrlenable false;
			GUI_GROUPCUSTOM ctrlsetfade 1;
			GUI_GROUPCUSTOM ctrlcommit 0;
		};

		//--- Load path from previous session (only when specific root is not present)
		if (typename BIS_fnc_configviewer_root == typename false) then {
			_path = profilenamespace getvariable "BIS_fnc_configviewer_path";
			_selected = profilenamespace getvariable "BIS_fnc_configviewer_selected";
			if (isnil "_path") then {_path = [];};
			if (isnil "_selected") then {_selected = "";};
			BIS_fnc_configviewer_path = if (typename _path == typename []) then {+_path} else {[]};
			BIS_fnc_configviewer_selected = if (typename _selected == typename "") then {_selected} else {""};
			profilenamespace setvariable ["BIS_fnc_configviewer_path",BIS_fnc_configviewer_path];
			profilenamespace setvariable ["BIS_fnc_configviewer_selected",BIS_fnc_configviewer_selected];
			saveprofilenamespace;
		} else {
			BIS_fnc_configviewer_path = [];
			BIS_fnc_configviewer_selected = "";
		};

		BIS_fnc_configviewer_rootNames = [str configfile,str campaignconfigfile,str missionconfigfile];
		//BIS_fnc_configviewer_returnedClass = confignull;

		if (typename BIS_fnc_configviewer_root == typename false) then {

			//--- Load bookmarks
			_bookmarksDefault = [
				[["configfile","CfgVehicles"],["typeof vehicle cameraon"]],
				[["configfile","CfgWeapons"],["currentweapon vehicle cameraon"]]
			];
			if (isnil {profilenamespace getvariable "BIS_fnc_configviewer_bookmarks"}) then {
				profilenamespace setvariable ["BIS_fnc_configviewer_bookmarks",_bookmarksDefault];
			};
			_bookmarks = +(profilenamespace getvariable "BIS_fnc_configviewer_bookmarks");
			_lbAdd = GUI_BOOKMARKS lbadd format ["<%1>",localize "STR_A3_RscDisplayConfigViewer_bookmark"];
			GUI_BOOKMARKS lbsetpicture [_lbadd,"\A3\ui_f\data\gui\rsc\rscdisplayconfigviewer\bookmark_gs.paa"];
			{
				_path = _x select 0;
				_selected = _x select 1;
				if (typename _selected == typename []) then {_selected = call compile (_selected select 0);}; //--- "CODE" type doesn't work
				_text = "";
				{
					if (_x == "configfile") then {_x = ""};
					if (_x == "missionconfigfile") then {_x = "mission"};
					if (_x == "campaignconfigfile") then {_x = "campaign"};
					_add = if (_foreachindex == 0) then {_x} else {"/" + _x};
					_text = _text + _add;
				} foreach _path;
				if ((_path select (count _path - 1)) != _selected) then {
					_text = _text + "/" + _selected;
				};
				_lbAdd = GUI_BOOKMARKS lbadd _text;
				GUI_BOOKMARKS lbsetvalue [_lbAdd,_foreachindex];
				if (_lbAdd <= count _bookmarksDefault) then {
					GUI_BOOKMARKS lbsetcolor [_lbAdd,[1,1,1,0.6]];
				};
			} foreach _bookmarks;

			//--- Contract the class list
			_posClasses = ctrlposition GUI_CLASSES;
			_posBookmarks = ctrlposition GUI_BOOKMARKS;
			_posH = ((_posBookmarks select 1) - (_posClasses select 1)) - 0.01;

			_posClasses set [3,_posH];
			GUI_CLASSES ctrlsetposition _posClasses;
			GUI_CLASSES ctrlcommit 0;

		} else {
			//--- Disable bookmarks when config viewer is not loaded with whole config
			GUI_BOOKMARKS ctrlenable false;
			GUI_BOOKMARKS ctrlsetfade 1;
			GUI_BOOKMARKS ctrlcommit 0;
		};

		["treeRefresh",[]] call bis_fnc_configViewer;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "Exit": {
		if (typename BIS_fnc_configviewer_root == typename false) then {
			profilenamespace setvariable ["BIS_fnc_configviewer_path",BIS_fnc_configviewer_path];
			profilenamespace setvariable ["BIS_fnc_configviewer_selected",BIS_fnc_configviewer_selected];
			saveprofilenamespace;
		};

		BIS_fnc_configviewer_path = nil;
		BIS_fnc_configviewer_selected = nil;
		BIS_fnc_configviewer_listMeta = nil;
		BIS_fnc_configviewer_root = nil;
		BIS_fnc_configviewer_rootNames = nil;
		BIS_fnc_configviewer_isOK = nil;
		BIS_fnc_configviewer_previewCode = nil;
		BIS_fnc_configviewer_title = nil;
		BIS_fnc_configviewer_display = nil;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	//--- Scan config - init
	case "treeRefresh": {
		INIT
		startloadingscreen [""];

		private ["_progress"];
		if (isnil "_progress") then {_progress = 0};

		lbclear GUI_CLASSES;
		BIS_fnc_configviewer_listMeta = [];
		_lbCursel = 0;
		if (BIS_fnc_configviewer_selected == "" && count BIS_fnc_configviewer_path > 0) then {BIS_fnc_configviewer_selected = BIS_fnc_configviewer_path select (count BIS_fnc_configviewer_path - 1);};
		_selected = BIS_fnc_configviewer_selected;
		_root = if (typename BIS_fnc_configviewer_root == typename false) then {
			[
				[
					
					[configfile,"configfile"],
					[campaignconfigfile,"campaignconfigfile"],
					[missionconfigfile,"missionconfigfile"]
				],
				0
			]
		} else {
			[BIS_fnc_configviewer_root,1]
		};
		["treeSub",_root] call bis_fnc_configviewer;

		//--- Decide which item should be selected
		GUI_CLASSES lbsetcursel _lbCursel;
		BIS_fnc_configviewer_selected = nil;

		endloadingscreen;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	//--- Scan config - recursive
	case "treeSub": {
		private ["_path","_pathSorted","_pathSortedCount","_subPath","_subPathName","_n","_r","_parents"];
		_path = _this select 0;
		_n = _this select 1;

		_parents = if (_n == 0) then {
			[_path]
		} else {
			[_path] call bis_fnc_returnparents;
		};
		//--- Sort alphabetically
		_pathSorted = [];
		_pathList = [];

		lbclear GUI_PARAMS;
		{
			for "_p" from 0 to (count _x - 1) do {
				_subPath = _x select _p;

				//if (typename _subPath == typename []) then {
				if (_n == 0) then {
					_subPath = _subPath select 0;
					_subPathName = configname _subPath;
					_lbAdd = GUI_PARAMS lbadd _subPathName;
				} else {
					if (isclass _subPath) then {
						_subPathName = configname _subPath;
						if !(_subPathName in _pathList) then {
							_lbAdd = GUI_PARAMS lbadd _subPathName;
							_pathList set [count _pathList,_subPathName];
						};
					};
				};
			};
		} foreach _parents;
		lbsort GUI_PARAMS;

		_r = 0;
		for "_p" from 0 to (lbsize GUI_PARAMS - 1) do {
			_subPath = GUI_PARAMS lbtext _p;

			if (_subPath in BIS_fnc_configviewer_rootNames) then {
				_pathSorted = _pathSorted + [_path select _r];
				_r = _r + 1;
			} else {
				_pathSorted set [count _pathSorted,_path >> _subPath];
			};
		};
		lbclear GUI_PARAMS;

		//--- Add to class list
		_pathSortedCount = count _pathSorted - 1;
		for "_p" from 0 to _pathSortedCount do {
			private ["_subPathConfigName"];
			_subPath = _pathSorted select _p;
			_subPathName = if (typename _subPath == typename []) then {
				_subPathName = _subPath select 1;
				_subPath = _subPath select 0;
				_subPathConfigName = _subPathName;
				_subPathName
			} else {
				_subPathConfigName = configname _subPath;
				[_subPath] call BIS_fnc_configviewer_codeList;
			};

			if (_subPathName != "") then {

				//--- Detect subclasses
				_hasSubclasses = false;
				_parents = [_subPath] call bis_fnc_returnparents;
				{
					for "_s" from 0 to (count _x - 1) do {
						if (isclass (_x select _s)) exitwith {_hasSubclasses = true;_s = count _x;};
					};
					if (_hasSubclasses) exitwith {};
				} foreach _parents;

				//--- Compose prefix ("+" for classes with subclasses, otherwise empty)
				_prefix = "";
				for "_i" from 1 to _n do {_prefix = _prefix + "  "};
				_prefix = if (_hasSubclasses) then {_prefix + "+"} else {_prefix + " "};
				_prefix = _prefix + " ";

				_lbAdd = GUI_CLASSES lbadd (_prefix + _subPathName);
				GUI_CLASSES lbsetvalue [_lbAdd,_n];
				GUI_CLASSES lbsetdata [_lbAdd,_subPathConfigName];
				_color = if (_n == count BIS_fnc_configviewer_path) then {[1,1,1,1]} else {[1,1,1,0.6]};
				GUI_CLASSES lbsetcolor [_lbAdd,_color];

				BIS_fnc_configviewer_listMeta set [count BIS_fnc_configviewer_listMeta,[_hasSubclasses,toarray tolower _subPathConfigName]];

				if (count BIS_fnc_configviewer_path > 0) then {

					//--- Last expanded container - select
					if (_subPathConfigName == BIS_fnc_configviewer_selected) then {
						_lbCursel = (lbsize GUI_CLASSES - 1);
					};

					//--- Go deeper
					if ((BIS_fnc_configviewer_path select _n) == _subPathConfigName) then {
						["treeSub",[_subPath,_n + 1]] call bis_fnc_configviewer;
					};
				};
			};

			//--- Moving progress bar
			_progress = _progress + ((1 / (_pathSortedCount + 1)) / (_n + 3.1));
			progressloadingscreen _progress;
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	//--- Expand / Collapse
	case "buttonClick": {
		INIT
		_lbId = lbcursel GUI_CLASSES;
		_lbValue = GUI_CLASSES lbvalue _lbId;
		_lbData = GUI_CLASSES lbData _lbId;

		//--- Get item meta
		_listMeta = BIS_fnc_configviewer_listMeta select _lbId;
		_hasSubclasses = _listMeta select 0;

		//--- Cannot expand params
		if !(_hasSubclasses) exitwith {};

		//--- Already selected
		if (_lbId != lbcursel GUI_CLASSES) exitwith {};

		_path = [""] + BIS_fnc_configviewer_path; //--- Add one element to make sure it works with empty array

		//if (_lbData in BIS_fnc_configviewer_path) then {
		//if ((BIS_fnc_configviewer_path select (count BIS_fnc_configviewer_path - 1)) == _lbData) then {

		BIS_fnc_configviewer_path resize _lbValue;
		if ((_path select (count _path - 1)) == _lbData) then {
			//--- Collapse - remove first item when nil
			if (count BIS_fnc_configviewer_path == 1) then {
				if (isnil {BIS_fnc_configviewer_path select 0}) then {BIS_fnc_configviewer_path = [];};
			};
		} else {
			//--- Expand
			BIS_fnc_configviewer_path = BIS_fnc_configviewer_path + [_lbData];
		};
		BIS_fnc_configviewer_selected = _lbData;
		["treeRefresh",[]] call bis_fnc_configViewer;

	};

	///////////////////////////////////////////////////////////////////////////////////////////
	//--- Load params
	case "lbSelChanged": {
		INIT
		_lbId = lbcursel GUI_CLASSES;
		_lbValue = GUI_CLASSES lbvalue _lbId;
		_lbData = GUI_CLASSES lbData _lbId;

		//--- Terminate if clicked item is already selected
		if (_lbData == missionnamespace getvariable ["BIS_fnc_configviewer_selected",""]) exitwith {};
		BIS_fnc_configviewer_selected = _lbData;

		//--- Compose path
		_configPath = ["composePath",_this] call bis_fnc_configviewer;

		//--- Execute custom preview code and terminate
		if (str BIS_fnc_configviewer_previewCode != str {}) exitwith {
			_text = [_configPath] call BIS_fnc_configviewer_previewCode;
			_text = [_text,0,"",[""]] call bis_fnc_paramIn;
			GUI_CUSTOMTEXT ctrlsetstructuredtext parsetext _text;

			_pos = ctrlposition GUI_CUSTOMTEXT;
			_pos set [3,ctrltextheight GUI_CUSTOMTEXT];
			GUI_CUSTOMTEXT ctrlsetposition _pos;
			GUI_CUSTOMTEXT ctrlcommit 0;
		};

		//--- Display hierarchy and parents
		_text = ["textPath",_this] call bis_fnc_configviewer;
		GUI_HIERARCHY ctrlsettext _text;

		_parents = [_configPath,true] call bis_fnc_returnparents;
		_parents set [0,-1];
		_parents = _parents - [-1];
		GUI_PARENTS ctrlsettext str (_parents);

		//--- Preview button
		_path = (["arrayPath",_this] call bis_fnc_configviewer) select 0;
		_pathCount = count _path;
		_class = "";

		_cfgVehiclesId = _path find "CfgVehicles";
		_scopeVehicle = if (_cfgVehiclesId >= 0 && _pathCount > (_cfgVehiclesId + 1)) then {
			_class = _path select (_cfgVehiclesId + 1);
			getnumber (_configPath >> "scope");
		} else {
			-1
		};

		_cfgWeaponsId = _path find "CfgWeapons";
		_scopeWeapon = if (_cfgWeaponsId >= 0 && _pathCount > (_cfgWeaponsId + 1)) then {
			_class = _path select (_cfgWeaponsId + 1);
			getnumber (_configPath >> "scope");
		} else {
			-1
		};
		GUI_PREVIEWCLASS ctrlsettext format [localize "STR_A3_RscDisplayConfigViewer_ButtonPreviewClass",_class];
		GUI_PREVIEWCLASS ctrlenable (_scopeVehicle > 0 || _scopeWeapon > 0);
		

		//--- Show params
		lbclear GUI_PARAMS;
		_parents = [_configPath] call bis_fnc_returnparents;
		_params = [];
		{
			_pathScope = _x;
			for "_p" from 0 to (count _pathScope - 1) do {
				_param = _pathScope select _p;
				_paramName = configName _param;
				_param = _configPath >> _paramName;

				if !(isclass _param) then {
					if !(_param in _params) then {
						_paramColor = [1,1,1,1];
						_paramValue = switch true do {
							case (istext _param): {
								_paramColor = [1,0.8,0.8,1];
								str gettext _param;
							};
							case (isnumber _param): {
								_paramColor = [0.8,1,0.8,1];
								str getnumber _param;
							};
							case (isarray _param): {
								_paramColor = [0.6,0.6,1,1];
								_paramName = _paramName + "[]";
								_paramValue = "{";
								_paramArray = getarray _param;
								{
									if (_foreachindex > 0) then {_paramValue = _paramValue + ",";};
									_paramValue = _paramValue + str _x;
								} foreach _paramArray;
								_paramValue = _paramValue + "}";
								_paramValue
							};
						};
						_lbAdd = GUI_PARAMS lbadd (_paramName + " = " + _paramValue + ";");
						GUI_PARAMS lbsetdata [_lbAdd,configName _param];
						GUI_PARAMS lbsetcolor [_lbAdd,_paramColor];
						if (_foreachindex > 0) then {GUI_PARAMS lbsetpicture [_lbAdd,"#(argb,8,8,3)color(0,0,0,0)"];};
						_params set [count _params,_param];
					};
				};
			};
		} foreach _parents;

		lbsort GUI_PARAMS;
		_lbAdd = GUI_PARAMS lbadd ""; //--- Empty line so last line is not hidden
		GUI_PARAMS lbsetcursel -1;
		GUI_PREVIEWPARAM ctrlenable false;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "keyDown": {
		INIT
		_key = _this select 1;
		_shift = _this select 2;
		_ctrl = _this select 3;
		_alt = _this select 4;

		_isClasses = ((_this select 0) == GUI_CLASSES);

		if (_ctrl) then {
			switch _key do {

				//--- X
				case DIK_X: {
					if (_isClasses) then {
						_lbId = lbcursel GUI_CLASSES;
						_lbData = GUI_CLASSES lbData _lbId;
						if (_shift) then {

							//--- Copy path in config format
							copytoclipboard (["textPath",_this] call bis_fnc_configviewer);
						} else {
							//--- Copy path in viewer format
							copytoclipboard str (["arrayPath",_this] call bis_fnc_configviewer);
						};
						GUI_CLASSES ctrlsetfade 0.5;
						GUI_CLASSES ctrlcommit 0;
						GUI_CLASSES ctrlsetfade 0;
						GUI_CLASSES ctrlcommit 0.2;
					};
				};

				//--- C
				case DIK_C: {
					if (_isClasses) then {
						_lbId = lbcursel GUI_CLASSES;
						_lbData = GUI_CLASSES lbData _lbId;
						copytoclipboard _lbData;
						GUI_CLASSES ctrlsetfade 0.5;
						GUI_CLASSES ctrlcommit 0;
						GUI_CLASSES ctrlsetfade 0;
						GUI_CLASSES ctrlcommit 0.2;
					} else {
						if (_shift) then {
							_text = "";
							_br = tostring [13,10];
							for "_i" from 0 to (lbsize GUI_PARAMS - 1) do {
								_text = _text + (GUI_PARAMS lbtext _i) + _br;
							};
							copytoclipboard _text;
						} else {
							_lbId = lbcursel GUI_PARAMS;
							_lbText = GUI_PARAMS lbText _lbId;
							copytoclipboard _lbText;
						};
						GUI_PARAMS ctrlsetfade 0.5;
						GUI_PARAMS ctrlcommit 0;
						GUI_PARAMS ctrlsetfade 0;
						GUI_PARAMS ctrlcommit 0.2;
					};
				};

				//--- V
				case DIK_V: {
					if (_isClasses) then {
						_copy = call compile copyfromclipboard;
						if (typename _copy == typename []) then {
							if (count _copy == 2) then {
								_path = _copy select 0;
								_selected = _copy select 1;
								if ({typename _x != typename ""} count _path == 0 && typename _selected == typename "") then {
									BIS_fnc_configviewer_path = _path;
									BIS_fnc_configviewer_selected = _selected;
									["treeRefresh",[]] call bis_fnc_configViewer;
									GUI_CLASSES ctrlsetfade 0.5;
									GUI_CLASSES ctrlcommit 0;
									GUI_CLASSES ctrlsetfade 0;
									GUI_CLASSES ctrlcommit 0.2;
								};
							};
						};
					};
				};
			};

			false
		} else {

			//--- No Ctrl
			if (_key in [DIK_RETURN,DIK_NUMPADENTER,DIK_BACK]) then {
				if (_key == DIK_BACK) then {

					//--- Backspace
					if (count BIS_fnc_configviewer_path > 0) then {
						BIS_fnc_configviewer_selected = BIS_fnc_configviewer_path select (count BIS_fnc_configviewer_path - 1);
						BIS_fnc_configviewer_path resize ((count BIS_fnc_configviewer_path - 1) max 0);
					};
					["treeRefresh",[]] spawn bis_fnc_configViewer;
				} else {

					//--- Enter
					['buttonClick',_this] spawn bis_fnc_configviewer;
				};

				true
			} else {


				//--- abcdefghijklmnopqrstuvwxyz
				_alphabet = ["_","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];
				_alphabetUni = [95,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122];
				_alphabetDik = [DIK_SPACE,DIK_A,DIK_B,DIK_C,DIK_D,DIK_E,DIK_F,DIK_G,DIK_H,DIK_I,DIK_J,DIK_K,DIK_L,DIK_M,DIK_N,DIK_O,DIK_P,DIK_Q,DIK_R,DIK_S,DIK_T,DIK_U,DIK_V,DIK_W,DIK_X,DIK_Y,DIK_Z];
				_keyId = _alphabetDik find _key;
				if (_keyId >= 0) then  {
					_keyUni = _alphabetUni select _keyId;
					_keyText = _alphabet select _keyId;

					_textSearch = if (_isClasses) then {GUI_CLASSES_SEARCH} else {GUI_PARAMS_SEARCH};
					_textSearch ctrlsettext ((ctrltext _textSearch) + _keyText);

					//--- Track pressed keys
					if (isnil "BIS_fnc_configviewer_keyList") then {BIS_fnc_configviewer_keyList = []};

					BIS_fnc_configviewer_keyList set [count BIS_fnc_configviewer_keyList,_keyUni];

					//--- Reset after some time
					[GUI_CLASSES,_isClasses] spawn {
						disableserialization;
						with uinamespace do {
							INIT
							_isClasses = _this select 1;
							_listbox = if (_isClasses) then {GUI_CLASSES} else {GUI_PARAMS};
							_keyCount = count BIS_fnc_configviewer_keyList;

							uisleep 0.5; //--- Originally 0.3
							if (count BIS_fnc_configviewer_keyList != _keyCount) exitwith {};

							startloadingscreen [""];
							_matchMax = 0;
							for "_i" from 0 to (lbsize _listbox - 1) do {
								_lbValue = _listbox lbvalue _i;
								if (_lbValue == count BIS_fnc_configviewer_path) then {
									_meta = (uinamespace getvariable "BIS_fnc_configviewer_listMeta") select _i;
									_metaArray = _meta select 1;
									_metaArrayCount = count _metaArray;

									_match = 0;
									_stop = false;
									{
										if (_metaArrayCount > _foreachindex) then {
											if (_x == (_metaArray select _foreachindex)) then {
												_match = _match + 1
											} else {
												_stop = true;
											};
										};
										if (_stop) exitwith {};
									} foreach BIS_fnc_configviewer_keyList;

									//if (_match == count BIS_fnc_configviewer_keyList) then {
									if (_match > _matchMax) then {
										_matchMax = _match;
										_listbox lbsetcursel _i;
										//_i = (lbsize _listbox + 1)
									};
								};
							};

							BIS_fnc_configviewer_keyList = [];
							GUI_CLASSES_SEARCH ctrlsettext "";
							GUI_PARAMS_SEARCH ctrlsettext "";
							endloadingscreen;
						};
					};
					true //--- Disable default action
				} else {
					false
				};
			};
		};
	};


	///////////////////////////////////////////////////////////////////////////////////////////
	//--- Param selection changed
	case "paramLbSelChanged": {
		INIT
		_lbId = lbcursel GUI_PARAMS;
		_lbData = GUI_PARAMS lbData _lbId;

		//--- Display hierarchy
		_text = ["textPath",_this] call bis_fnc_configviewer;
		GUI_HIERARCHY ctrlsettext _text;

		_configPath = ["composePath",_this] call bis_fnc_configviewer;
		_configValue = [_configPath,_lbData,""] call bis_fnc_returnconfigentry;

		_enable = switch (typename _configValue) do {
			case (typename ""): {
				_configValueArray = toarray tolower _configValue;
				_configValueCount = count _configValueArray;

				//--- *.paa
				if (count _configValueArray > 3) then {
					(
						_configValueArray select (_configValueCount - 3) == 112
						&&
						_configValueArray select (_configValueCount - 2) == 97
						&&
						_configValueArray select (_configValueCount - 1) == 97
					)
				} else {
					false
				};
			};
			case (typename []): {
				{typename _x == typename 0} count _configValue == 4
			};
			default {false};
		};

		GUI_PREVIEWPARAM ctrlenable _enable;
		GUI_PREVIEWPARAM ctrlsettext format [localize "STR_A3_RscDisplayConfigViewer_ButtonPreviewParam",_lbData];
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	//--- Show param preview
	case "previewClass": {
		INIT
		_lbId = lbcursel GUI_PARAMS;
		_lbValue = GUI_PARAMS lbvalue _lbId;
		_lbData = GUI_PARAMS lbData _lbId;

		_path = (["arrayPath",_this] call bis_fnc_configviewer) select 0;
		_pathCount = count _path;
		_class = "";
		_pos = screentoworld [0.5,0.5];
		_obj = objnull;

		_cfgVehiclesId = _path find "CfgVehicles";
		if (_cfgVehiclesId >= 0 && _pathCount > (_cfgVehiclesId + 1)) then {
			_class = _path select (_cfgVehiclesId + 1);
			_obj = createvehicle [_class,_pos,[],0,"none"];
		};

		_cfgWeaponsId = _path find "CfgWeapons";
		if (_cfgWeaponsId >= 0 && _pathCount > (_cfgWeaponsId + 1)) then {
			_class = _path select (_cfgWeaponsId + 1);
			_obj = createvehicle ["weaponholder",_pos,[],0,"none"];
			_obj addweaponcargo [_class,1];
			{
				_obj addmagazinecargo [_x,1];
			} foreach getarray (configfile >> "CfgWeapons" >> _class >> "magazines");
		};


		_obj setdir (direction player - 90);
		_obj setpos _pos;
		player reveal _obj;
		with missionnamespace do {
			if (!isnil "BIS_fnc_configviewer_preview") then {deletevehicle BIS_fnc_configviewer_preview;};
			BIS_fnc_configviewer_preview = _obj;
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	//--- Show param preview
	case "previewParam": {
		INIT
		_lbId = lbcursel GUI_PARAMS;
		_lbValue = GUI_PARAMS lbvalue _lbId;
		_lbData = GUI_PARAMS lbData _lbId;

		_configPath = ["composePath",_this] call bis_fnc_configviewer;
		_configValue = [_configPath,_lbData] call bis_fnc_returnconfigentry;

		switch (typename _configValue) do {

			case (typename 0): {

			};

			case (typename ""): {
				_configValueArray = toarray tolower _configValue;
				_configValueCount = count _configValueArray;

				//--- *.paa
				if (
					_configValueArray select (_configValueCount - 3) == 112
					&&
					_configValueArray select (_configValueCount - 2) == 97
					&&
					_configValueArray select (_configValueCount - 1) == 97
				) then {
					[
						parsetext format ["<img align='center' shadow='0' image='%1' size='%2' /> ",_configValue,safezoneH * 12],
						str _configValue,
						nil,
						nil,
						_display
					] spawn bis_fnc_guimessage;
				};
			};

			case (typename []): {
				if ({typename _x == typename 0} count _configValue == 4) then {
					[
						parsetext format (["<img align='center' shadow='0' size='%1' image='#(argb,8,8,3)color(%2,%3,%4,%5)' size='10' /> ",safezoneH * 20] + _configValue),
						parsetext format ["<t size='1.1'>%1</t>",str _configValue],
						ctrlposition GUI_BACKGROUND,
						nil,
						_display
					] spawn bis_fnc_guimessage;
				};
			};

		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	//--- Create config path
	case "composePath": {
		INIT
		private ["_lbData","_path","_configPath"];
		_lbId = lbcursel GUI_CLASSES;
		_lbValue = GUI_CLASSES lbvalue _lbId;
		_lbData = GUI_CLASSES lbData _lbId;

		_path = +BIS_fnc_configviewer_path;
		_path resize _lbValue;
		_configPath = configfile;
		_configPath = if (count _path > 0) then {
			{
				if (_foreachindex == 0) then {
					if (isnil "_x") then {
						_configPath = BIS_fnc_configviewer_root;
					} else {
						_configPath = call compile _x;
					};
				} else {
					_configPath = _configPath >> _x;
				};
			} foreach _path;
			_configPath >> _lbData
		} else {
			call compile _lbData;
		};
		_configPath
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	//--- Create text path
	case "textPath": {
		INIT
		private ["_lbData","_path","_text","_textType"];
		_textType = [_this,2,false] call bis_fnc_paramin;
		_lbId = lbcursel GUI_CLASSES;
		_lbValue = GUI_CLASSES lbvalue _lbId;
		_lbData = GUI_CLASSES lbData _lbId;

		_path = +BIS_fnc_configviewer_path;
		_path resize _lbValue;
		_path = _path - [nil];
		if (typename BIS_fnc_configviewer_root != typename false) then {
			_path = (BIS_fnc_configviewer_root call bis_fnc_configPath) + _path;
		};

		_text = "";
		_text = if (count _path > 0) then {
			{
				if (_foreachindex == 0) then {
					if (_textType) then {
						if (_x == "configfile") then {_text = ""};
						if (_x == "missionconfigfile") then {_text = "mission"};
						if (_x == "campaignconfigfile") then {_text = "campaign"};
					} else {
						_text = _x;
					};
				} else {
					if !(isnil "_x") then {
						if (_textType) then {_text = _text + "/" + _x} else {_text = _text + " >> " + str _x};
					};
				};
			} foreach _path;
			if (_textType) then {_text + "/" + _lbData} else {_text + " >> " + str _lbData};
		} else {
			_lbData;
		};

		//--- Add selected param
		_lbIdParam = lbcursel GUI_PARAMS;
		_lbDataParam = GUI_PARAMS lbData _lbIdParam;
		if (!_textType && _lbDataParam != "") then {
			_text = _text + " >> " + str _lbDataParam;
		};

		_text
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	//--- Create array path
	case "arrayPath": {
		INIT
		private ["_lbData","_path","_array"];
		_lbId = lbcursel GUI_CLASSES;
		_lbValue = GUI_CLASSES lbvalue _lbId;
		_lbData = GUI_CLASSES lbData _lbId;

		_path = +BIS_fnc_configviewer_path;
		_path resize _lbValue;
		_array = [];
		_array = if (count _path > 0) then {
			{
				if (_foreachindex == 0) then {
					if (isnil "_x") then {
						_array = [];
					} else {
						_array = [_x];
					};
				} else {
					_array = _array + [_x];
				};
			} foreach _path;
			_array + [_lbData]
		} else {
			[_lbData];
		};
		[_array,_lbData]
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	//--- Bookmark double-click
	case "bookmarkButtonClick": {
		INIT
		_lbId = lbcursel GUI_BOOKMARKS;
		_bookmarks = +(profilenamespace getvariable ["BIS_fnc_configviewer_bookmarks",[]]);
		if (_lbId == 0) then {

			//--- Save bookmark
			_text = ["textPath",_this + [true]] call bis_fnc_configviewer;
			GUI_BOOKMARKS lbadd _text;

			_array = ["arrayPath",_this] call bis_fnc_configviewer;
			profilenamespace setvariable ["BIS_fnc_configviewer_bookmarks",_bookmarks + [_array]];
		} else {

			//--- Load bookmark
			_lbId = _lbId - 1;
			if (_lbId < count _bookmarks) then {
				_path = _bookmarks select _lbId;
				BIS_fnc_configviewer_path = _path select 0;
				BIS_fnc_configviewer_selected = _path select 1;
				if (typename BIS_fnc_configviewer_selected == typename []) then {BIS_fnc_configviewer_selected = call compile (BIS_fnc_configviewer_selected select 0);};
				["treeRefresh",[]] call bis_fnc_configViewer;
				ctrlsetfocus GUI_CLASSES;
				GUI_BOOKMARKS lbsetcursel -1;
			};
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	//--- Bookmark key
	case "bookmarkKeyDown": {
		INIT
		_key = _this select 1;

		switch _key do {

			//--- Enter
			case DIK_NUMPADENTER;
			case DIK_RETURN: {
				["bookmarkButtonClick",_this] spawn bis_fnc_configviewer;
			};

			//--- Del
			case DIK_DELETE: {
				_lbId = (lbcursel GUI_BOOKMARKS);
				if (_lbId > 2) then { //--- Default bookmarks cannot be deleted
					GUI_BOOKMARKS lbdelete _lbId;
					_bookmarks = +(profilenamespace getvariable ["BIS_fnc_configviewer_bookmarks",[]]);
					if (_lbId <= count _bookmarks) then {
						_bookmarks set [_lbId-1,-1];
						_bookmarks = _bookmarks - [-1];
						profilenamespace setvariable ["BIS_fnc_configviewer_bookmarks",_bookmarks];
					};
				};			
			};
		};
		false
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	//--- OK Button
	case "buttonOK": {
		INIT

		_lbId = lbcursel GUI_PARAMS;
		_lbValue = GUI_PARAMS lbvalue _lbId;
		_lbData = GUI_PARAMS lbData _lbId;

		BIS_fnc_configviewer_returnedClass = [
			["composePath",_this] call bis_fnc_configviewer,
			_lbData
		];
		_display closedisplay 2;
	};
};