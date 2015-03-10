scriptName "HC\data\scripts\HC_GUI.sqf";
/*
	File: HC_GUI.sqf
	Author: Karel Moricky

	Description:
	High Command Graphical User Interface core script.
	Controls mouse moving and pressed buttons in 2D map.

	Scripts is running locally on each of commanders.
*/
#define		CLICK_DELAY	0.2

debuglog "Log: [High Command] GUI script executed";

_HCO = _this select 0;
_logic = _HCO getvariable "BIS_HC_scope";

_logic setvariable ["LMB_hold",false];
_logic setvariable ["LMB_pos",[0,0]];
_logic setvariable ["LMB_time",-1];
_logic setvariable ["RMB_hold",false];
_logic setvariable ["RMB_pos",[0,0]];
_logic setvariable ["RMB_time",-1];
_logic setvariable ["shift",false];
//_logic setvariable ["ctrl",false];
_logic setvariable ["wpover_click",[grpnull]];
//_logic setvariable ["nearmarker",""];
//_logic setvariable ["nearwp",[]];
//_logic setvariable ["selected",[]];
//_logic setvariable ["selectedwp",[]];
_logic setvariable ["mouseovertime",0];
_logic setvariable ["path_menu","A3\modules_f\HC\data\scripts\HC_GUI_menu.sqf"];
_logic setvariable ["path_stat",compile preprocessfilelinenumbers "A3\modules_f\HC\data\scripts\HC_GUI_stat.sqf"];

BIS_HC_path_menu = compile preprocessfilelinenumbers "A3\modules_f\HC\data\scripts\HC_GUI_menu.sqf";

_logic setvariable ["groupover",grpnull];

_markerframe = createmarkerlocal ["BIS_HC_GUI_FRAME",[1,1]];
_markerframe setmarkercolorlocal "colorgreen";
_markerframe setmarkershapelocal "rectangle";
_markerframe setmarkerbrushlocal "border";

setGroupIconsSelectable true;

///////////////////////////////////////////////////////////////////////////////////
///// Mouse over ON
///////////////////////////////////////////////////////////////////////////////////
onGroupIconOverEnter {scriptname "HC: onGroupIconOverEnter";
//if (name player == "Str") then {hint str [_this,time]};

	//--- HC mod inactive - EXIT
	if !(hcshownbar) exitwith {};

	_is3D = _this select 0;
	_group = _this select 1;
	_wpID = _this select 2;
	_posx = _this select 3;
	_posy = _this select 4;
	_logic = player getvariable "BIS_HC_scope";

	if (_wpID < 0) then {
		_logic setvariable ["groupover",_group];
		_logic setvariable ["wpover",[grpnull]];
	} else {
		if (_group in hcallgroups player && !(_logic getvariable "LMB_hold")) then {
			_logic setvariable ["groupover",grpnull];
			_logic setvariable ["wpover",[_group,_wpID]];
		};
	};

	//--- Not commanded - EXIT
	if !(_group in hcallgroups player) exitwith {};

	//--- Set delay
	_timestart = _logic getvariable "tooltip_timestart";
	if (isnil "_timestart") then {_timestart = time; _logic setvariable ["tooltip_timestart",_timestart]};

	//--- How many second we will wait before tooltip is dispayed
	if (time - _timestart < 0.25) exitwith {};

	_logic setvariable ["tooltip",_group];

	//--- Display statistics
	_this spawn (_logic getvariable "path_stat");
};

///////////////////////////////////////////////////////////////////////////////////
///// Mouse over OFF
///////////////////////////////////////////////////////////////////////////////////
onGroupIconOverLeave {scriptname "HC: onGroupIconOverLeave";

	//--- HC mod inactive - EXIT
	if !(hcshownbar) exitwith {};

	_is3D = _this select 0;
	_group = _this select 1;
	_logic = player getvariable "BIS_HC_scope";

	//--- Hide WP menus
	if (commandingmenu in ["RscHCWPRootMenu","RscHCWPType","RscHCWPCombatMode","RscHCWPFormations","RscHCWPSpeedMode","RscHCWPWait","#USER:HCWPWaitUntil","#USER:HCWPWaitRadio"]) then {showcommandingmenu ""};

	_logic setvariable ["groupover",grpnull];
	_logic setvariable ["wpover",[grpnull]];

	//--- Not commanded - EXIT
	if !(_group in hcallgroups player) exitwith {};

	_logic setvariable ["tooltip_timestart",nil];

	//--- Disable custom cursor
	[] spawn {scriptname "HC: Hide Tooltip";

		sleep 0.01;
		((uinamespace getvariable "_display") displayctrl 1124) ctrlsetposition [0,0,0,0];
		((uinamespace getvariable "_display") displayctrl 1124) ctrlcommit 0;
		((uinamespace getvariable "_display") displayctrl 1125) ctrlsetposition [0,0,0,0];
		((uinamespace getvariable "_display") displayctrl 1125) ctrlcommit 0;
	};
};




///////////////////////////////////////////////////////////////////////////////////
///// Mouse click
///////////////////////////////////////////////////////////////////////////////////
onGroupIconClick {scriptname "HC: onGroupIconClick";

	//--- HC mod inactive - EXIT
	if !(hcshownbar) exitwith {};

	_is3D = _this select 0;
	_group = _this select 1;
	_wpID = _this select 2;
	_button = _this select 3;
	_posx = _this select 4;
	_posy = _this select 5;
	_shift = _this select 6;
	_ctrl = _this select 7;
	_alt = _this select 8;
	_logic = player getvariable "BIS_HC_scope";

	//--- Break if group is not commanded
	if (!(_group in hcallgroups player) || (_is3D && commandingmenu != "RscHCGroupRootMenu")) exitwith {
/*
		//--- Group is actually enemy
		_isEnemy = (side _group getfriend side player) < 0.6;

		if (_isEnemy) then {

			//--- ENEMY!
			_codeWP = _logic getvariable "GUI_WP_ATTACK";
			{
				[_is3D,_x,_group,_ctrl] spawn _codeWP;
			} foreach hcselected player;
		};
*/
	};

	//--- Select group
/*
	if (commandingmenu != "RscHCGroupRootMenu") then {
		_selected = hcselected player;
		_codeSel = _logic getvariable "GUI_SELECT";
		[_group,_is3D,_ctrl] spawn _codeSel;
	};
*/

	if (_button == 0) then {

		//--- Select group
		if (commandingmenu != "RscHCGroupRootMenu" && commandingmenu == "") then {
			_selected = hcselected player;
			_codeSel = _logic getvariable "GUI_SELECT";
			[_group,_is3D,_ctrl] spawn _codeSel;
		};

		//--- LMB
		if (_wpID >= 0) then {
			_logic setvariable ["wpover_click",[_group,_wpID]];
			//showcommandingmenu "";
		};
	} else {

		//--- RMB

		//--- Waypoint menu
		if (_wpID >= 0) then {

			[] spawn {scriptname "HC: onGroupIconClick: RMB";
				_logic = player getvariable "BIS_HC_scope";
				_wpover = _logic getvariable "wpover";
				sleep CLICK_DELAY;
				if (_logic getvariable "RMB_hold" || count _wpover == 1) exitwith {};

				//--- Wait until list
				_array = [["Wait until",false]];
				_array = _array + [["No wait", [2], "", -5, [["expression", "
					_logic = player getvariable 'BIS_HC_scope';
					_wpover = _logic getvariable 'wpover';
					_wpover setwaypointstatements ['true',''];
					_wpover setwaypointscript '';
				"]], "1", "1"]];
				_daytime = daytime - (daytime % (1 / 12));
				for "_i" from 1 to 9 do {
					_time = _daytime + (_i / 12);
					_timeString = [_time,"HH:MM"] call BIS_fnc_timetostring;
					_array = _array + [[_timeString, [_i + 2], "", -5, [["expression", format ["
						_logic = player getvariable 'BIS_HC_scope';
						_wpover = _logic getvariable 'wpover';
						_wpover setwaypointstatements ['daytime > (%1 + ((random 20)*(1 - skill this))/3600)','""%2""'];
					",_time,_timeString]]], "1", "1"]];
				};
				HCWPWaitUntil = _array;


				//--- Radio list
				_radios = _logic getvariable "radios";
				_radioStrings = ["<ERROR>","ALPHA","BRAVO","CHARLIE","DELTA","ECHO","FOXTROT","GOLF","HOTEL","INDIA","JULIET"];

				//--- Radio already selected - cancel
				if ({(waypointstatements _wpover select 1) == str _x} count _radiostrings > 0) then {
					_radios = []; //--- Hack to disable radio list
						_array = [localize "STR_RADIO",[format ["%1 %2",localize "STR_DISP_CANCEL",call compile (waypointstatements _wpover select 1)], [2], "", 149, [["expression", "
						_wpover = bis_hc_mainscope getvariable 'wpover';
						_wpover setwaypointstatements ['true',''];
					"]], "1", "1"]];
					HCWPWaitRadio = _array;
				};

				//--- No radio selected - display list
				if (count _radios > 0) then {
					_array = [[localize "STR_RADIO",false]];
					{
						//--- Only numbers from 0 to 10 are allowed
						if (_x >= 0 && _x <= 10) then {
							_channel = _x;
							if (_channel == 0) then {_channel = 10};
							_string = _radioStrings select _channel; 
							_array = _array + [[localize ("STR_RADIO_" + _string), [1 + _channel], "", 150, [["expression", format ["
								if (isnil {BIS_HC_trig_%1}) then {
									_trig = createTrigger['EmptyDetector',[1,1]];
									_trig settriggeractivation ['%1','PRESENT',false];
									_trig settriggerstatements ['this','deletevehicle BIS_HC_trig_%1; BIS_HC_trig_%1 = nil',''];
									BIS_HC_trig_%1 = _trig;
									'%1' spawn {scriptname 'HC: Radio';
										_trig = call compile format ['BIS_HC_trig_%1',_this];
										while {!isnull _trig} do {
											_waypoints = _trig getvariable 'assigned';
											if ({(waypointstatements _x select 1) == str _this} count _waypoints == 0) then {deletevehicle _trig; call compile format ['BIS_HC_trig_%1 = nil',_this]};
											sleep 1;
										};
									};
								};

								_wpover = bis_hc_mainscope getvariable 'wpover';
								_wpover setwaypointstatements ['isnil {BIS_HC_trig_%1}','""%1""'];
								_grp = _wpover select 0;
								[BIS_HC_trig_%1,'assigned',[_wpover]] call BIS_fnc_variablespaceadd;
							",_string]]], "1", "1"]];
						};
					} foreach _radios;
					HCWPWaitRadio = _array;
				};

				_wpover = _logic getvariable "wpover";
				if (_logic getvariable "RMB_hold" || count _wpover == 1) exitwith {};
				showCommandingMenu "RscHCWPRootMenu";
			};
			//--- Hack to disable RMB deselect
			_logic setvariable ["RMB_pos",[0,0]];
		};
	};

	//--- Show menu again
	if (_is3D) then {[] spawn {showcommandingmenu "RscHCGroupRootMenu"}};
};


///////////////////////////////////////////////////////////////////////////////////
///// Selection changed
///////////////////////////////////////////////////////////////////////////////////
onHCGroupSelectionChanged {scriptname "HC: onHCGroupSelectionChanged";
	_show = false;
	_alpha = 1;
	if (_isselected) then {
		//--- Selected
		_show = true;
		_group setvariable ["MARTA_waypoint",[true,[-1,-1,-1,-1]]];
		if (commandingmenu == ""/* && !visiblemap*/) then {
			////[_group] spawn (bis_hc_mainscope getvariable "GUI_SELECT");
			showCommandingMenu "RscHCGroupRootMenu";//++
		};
/*
		_selected = hcselected player;
		if ((_selected select 0) == _group) then {
			(leader _group) sideradio "HC_Select";	
		};
*/
	} else {

		//--- Deselected
		if (hcshownbar) then {
			_group setvariable ["MARTA_waypoint",[true,[-1,-1,-1,0.5]]];_show = true;_alpha = 0.5;
		} else {
			_group setvariable ["MARTA_waypoint",[false,[-1,-1,-1,-1]]];
		};
		if (count hcselected player == 0 && visibleMap) then {
			//***showCommandingMenu "";
		};
	};

	_groupiconparams = getgroupiconparams _group;
	_groupWPcolor = _groupiconparams select 5;
	_groupWPcolor set [3,_alpha];
	_groupiconparams set [4,_show];
	_groupiconparams set [5,_groupWPcolor];
	_group setgroupiconparams _groupiconparams;
};




///////////////////////////////////////////////////////////////////////////////////
///// Select Icon
///////////////////////////////////////////////////////////////////////////////////
_GUI_SELECT = {scriptname "HC: _GUI_SELECT";
	_groups = _this select 0;
	if (typename _groups == "GROUP") then {_groups = [_groups]};
	_is3D = _this select 1;
	_ctrl = if (count _this > 2) then {_this select 2} else {true};
	_logic = player getvariable "BIS_HC_scope";

	if (!_is3D) then {
		sleep CLICK_DELAY;
	};

	//--- Button is still pressed - Exit
	if (_logic getvariable "LMB_hold") exitwith {};


	//--- No ctrl pressed - reset selection
	_selected = hcselected player;
	//if !(_ctrl) then {{player hcselectgroup [_x,false]} foreach _selected; _selected = []}; //<--- This is closing command menu
	if !(_ctrl) then {_selected = []};

	//sleep 0.01;

	{
		_group = _x;

		if (_group in _selected) then {

			//--- Deselect
			player hcselectgroup [_group,false];
		} else {;

			//--- Continue - Select unit
			player hcselectgroup [_group,true];

			//--- Sound
			//_prefix = ["this is",""] call BIS_fnc_selectRandom;
			//_grouptype = markertype _nearmarker;
		};
	} foreach _groups;
	if !(_ctrl) then {{player hcselectgroup [_x,false]} foreach (hcselected player - _groups)};

	//--- Report
	if (count _groups > 1) then {_groups = _groups - [group player]};
	//(leader (_groups select 0)) sideradio "HC_Select";

	//_report = ["reporting in","we are ready for some action","waiting for orders","standing by for orders","combat ready","ready to kick ass",""] call BIS_fnc_selectRandom;
	//[_grouptype,_report] execVM ("A3\modules_f\HC\data\scripts\HC_sound.sqf");
};


///////////////////////////////////////////////////////////////////////////////////
///// Waypoint - MOVE
///////////////////////////////////////////////////////////////////////////////////
_GUI_WP_MOVE = {scriptname "HC: _GUI_WP_MOVE";

	_is3D = _this select 0;
	_worldpos = _this select 1;
	_shift = _this select 2;
	_ctrl = _this select 3;
	_alt = _this select 4;
	_selected = if (count _this > 5) then {_this select 5} else {hcselected player};
	_logic = player getvariable "BIS_HC_scope";

	//_selected = hcselected player;
	_selectedCount = count _selected;
	_posList = [[0,0],[0,0]]; //--- Default offsets for multiple groups

	//--- Need some delay to check if RMB is still pressed
	if !(_is3D) then {sleep CLICK_DELAY};

	//--- Button is still pressed - Exit
	if (_logic getvariable "LMB_hold") exitwith {};

	//--- MOVE, you pacifist
	if (_selectedCount > 1) then {
		_columnCount = round sqrt(_selectedCount);
		_column = 0;
		_row = 0;
		_coef = 25;
		_averageX = 0;
		_averageY = 0;
		_posList = [];
		for "_i" from 0 to (_selectedCount - 1) do {
			_relX = _column * _coef;
			_relY = -_row * _coef;
			_posList = _posList + [[_relY,_relX]]; // That's not mistake
			_averageX = _averageX + _relX;
			_averageY = _averageY + _relY;

			_column  = _column + 1;
			if (_column >= _columNCount) then {_column = 0; _row = _row + 1};
		};
		_averageX = _averageX / _selectedCount;
		_averageY = _averageY / _selectedCount;
		_posList = [[_averageY,_averageX]] + _posList;
	};

	//--- Begin WP adding process
	for "_i" from 0 to (_selectedCount - 1) do {

		//--- Add new waypoint (wait if button is not still pressed)
		_group = _selected select _i;
		_offsetBase = _posList select 0;
		_offsetGroup = _posList select (_i + 1);
		_offset = [(_offsetBase select 0) - (_offsetGroup select 0),(_offsetBase select 1) - (_offsetGroup select 1)];

		//--- Create new waypoint
		if !(_ctrl) then {

			//--- Reset waypoints
			while {count (waypoints _group) > 0} do {deletewaypoint ((waypoints _group) select 0)};
		};

		_wppos = [(_worldpos select 0) + (_offset select 0),(_worldpos select 1) + (_offset select 1)];
		_wp = _group addwaypoint [_wppos,0];
		_wp setwaypointtype "move";
		_wp showwaypoint "never";
		if !(_ctrl) then {_group setcurrentwaypoint _wp};

		//--- Move handler
		_handler = _logic getvariable "onGroupMove";
		if (!isnil "_handler") then {[_group,_wp,grpnull] spawn _handler};
	};

	//_sound = ["advancing","moving to the objective","orders understood","copy that","roger that","thats affirmative","orders received"] call BIS_fnc_selectRandom;
	//[_sound] execVM ("A3\modules_f\HC\data\scripts\HC_sound.sqf")

	//--- Report
	if (count _selected > 1) then {_selected = _selected - [group player]};
	//(leader (_selected select 0)) sideradio "HC_Move";
};


///////////////////////////////////////////////////////////////////////////////////
///// Waypoint - ATTACK
///////////////////////////////////////////////////////////////////////////////////
_GUI_WP_ATTACK = {scriptname "HC: _GUI_WP_ATTACK";
	_is3D = _this select 0;
	_group = _this select 1; // My group
	_target = _this select 2; // Attacked group
	_ctrl = _this select 3;
	_selected = _this select 4;
	_logic = player getvariable "BIS_HC_scope";

	//--- Need some delay to check if RMB is still pressed
	if !(_is3D) then {sleep CLICK_DELAY};

	//--- Button is still pressed - Exit
	if (_logic getvariable "LMB_hold") exitwith {};

	//--- Create new waypoint
	if !(_ctrl) then {

		//--- Reset waypoints
		while {count (waypoints _group) > 0} do {deletewaypoint ((waypoints _group) select 0)};
	};

	_wp = _group addwaypoint [position vehicle leader _target,0];
	_wp setwaypointstatements ["false",""];
	_wp waypointattachvehicle (leader _target);
	_wp setwaypointtype "destroy";
	_wp showwaypoint "never";
	if !(_ctrl) then {_group setcurrentwaypoint _wp};
	//_wp setwaypointtype "move";
	_wpdescription = localize "str_ac_destroy";
	_wp setwaypointdescription _wpdescription;
	_id = 0.1 / time;
	_wp setwaypointcompletionradius _id; //<-- Hack - set waypoint's ID

	[_target,"hc_attackedby",[_group]] call bis_fnc_variablespaceadd;

	//_sound = ["ready to kick ass","attacking","assaulting enemy positions","engaging","moving to contact","advancing"] call BIS_fnc_selectRandom;
	//[_sound] execVM ("A3\modules_f\HC\data\scripts\HC_sound.sqf");

	//--- Report
	if (count _selected > 1) then {_selected = _selected - [group player]};
	//if ((_selected select 0) == _group) then {(leader _group) sideradio "HC_Attack"};

	//--- Assign icon
	_icon = -1;
	if (isnil {_target getvariable "hc_attackicon"}) then {
		_icon = _target addgroupicon ["hc_selectedEnemy"];
		_target setvariable ["hc_attackicon",_icon];
	};

	//--- Move handler
	_handler = _logic getvariable "onGroupMove";
	if (!isnil "_handler") then {[_group,_wp,_target] spawn _handler};

	//--- Check if group is still attacking target
	//while {waypointtype _wp == "move" && !isnull _target} do {

	//--- Update position if waypoint is not cancelled, group is alive and visible (and same for target)
	while {waypointcompletionradius _wp == _id && if !(isnull _target) then {getgroupiconparams _target select 3} else {false} && !isnull _group} do {
		//--- HOTFIX
		if ((position vehicle leader _target) distance [0,0,0] < 1) exitwith {debuglog "[HC]: Wreck hotfix"};

		//_wp setwaypointposition [position vehicle leader _target,0];
		_wp waypointattachvehicle (leader _target);
		_attackers = _target getvariable "hc_attackedby";

		//--- To show or not to show
		if !(isnil "_attackers") then {
			if ({hcleader _x == player} count _attackers > 0) then {_target setgroupicon [_icon,"hc_selectedEnemy"]} else {_target setgroupicon [_icon,"flag"]};
		};
		sleep 0.05;
	};

	//if (waypointdescription _wp == _wpdescription) then {_wp setwaypointdescription ""};
	_newarray = if (!isnil {_target getvariable "hc_attackedby"} && !isnull _target) then {[_target,"hc_attackedby",[_group]] call bis_fnc_variablespaceremove} else {[]};

	//--- No other attackers left
	if (count _newarray == 0) then {
		_target removegroupicon (_target getvariable "hc_attackicon");
		if (!isnil {_target getvariable "hc_attackicon"} && !isnull _target) then {_target setvariable ["hc_attackicon",nil]};
		if (!isnil {_target getvariable "hc_attackedby"} && !isnull _target) then {_target setvariable ["hc_attackedby",nil]};
	};
	if (waypointcompletionradius _wp == _id) then {deletewaypoint _wp};
	//if (waypointdescription _wp == _wpdescription) then {deletewaypoint _wp};
};

///////////////////////////////////////////////////////////////////////////////////
///// Waypoint - GET IN (Cancelled)
///////////////////////////////////////////////////////////////////////////////////
_GUI_WP_GETIN = {scriptname "HC: _GUI_WP_GETIN";

};


///////////////////////////////////////////////////////////////////////////////////
///// HC bar event
///////////////////////////////////////////////////////////////////////////////////
//_logic spawn {scriptname "HC: HC bar event";

onCommandModeChanged {
	//debuglog str ["Log::::::::",_isHighCommand,time];
	if (_isHighCommand) then {

		//--- HC bar active -------------------------------
		if (isnil "BIS_HC_visible") then {BIS_HC_visible = groupiconsvisible};
		setGroupIconsVisible [true,true];
		//showCommandingMenu "RscHCGroupRootMenu";

		//--- Init values (later we will store them in commander's var space)
		uinamespace setvariable ["_displayMain",finddisplay 46];
		uinamespace setvariable ["_display",finddisplay 12];
		uinamespace setvariable ["_map",(findDisplay 12) displayCtrl 51];

		//--- Set 3D Event Handlers
		BIS_HC_displayEventHandlers = [];
		{
			_eh = (uinamespace getvariable "_displayMain") displayAddEventHandler [_x, 
				format ["_temp = ['%1',_this] spawn BIS_HC_GUI;",_x]
			];
			BIS_HC_displayEventHandlers = BIS_HC_displayEventHandlers + [_eh];
		} foreach ["keydown","keyup"];


		//--- Set 2D Event Handlers
		BIS_HC_ctrlEventHandlers = [];
		{
			_eh = (uinamespace getvariable "_map") ctrlAddEventHandler [_x, 
				format ["_temp = ['%1',_this] spawn BIS_HC_GUI;",_x]
			];
			BIS_HC_ctrlEventHandlers = BIS_HC_ctrlEventHandlers + [_eh];
		} foreach ["mousemoving","mouseholding","mousebuttondown","mousebuttonup"];

		//--- Show waypoints
		{
			_x setvariable ["MARTA_waypoint",[true,[-1,-1,-1,0.5]]];
		} foreach hcallgroups player;
	} else {
		//--- HC bar inactive -----------------------------
		setGroupIconsVisible BIS_HC_visible;
		BIS_HC_visible = nil;
		showCommandingMenu "";

		//--- Remove 3D Event Handlers
		_events = ["keydown","keyup"];
		for "_i" from 0 to 1 do {
			_current = _events select _i;
			(uinamespace getvariable "_displayMain") displayremoveEventhandler [_current, BIS_HC_displayEventHandlers select _i]
		};
		BIS_HC_displayEventHandlers = nil;

		//--- Remove 2D Event Handlers
		if (!isnil "BIS_HC_ctrlEventHandlers") then {
			_events = ["mousemoving","mouseholding","mousebuttondown","mousebuttonup"];
			for "_i" from 0 to 3 do {
				_current = _events select _i;
				(uinamespace getvariable "_map") ctrlremoveEventhandler [_current, BIS_HC_ctrlEventHandlers select _i]
			};
			BIS_HC_ctrlEventHandlers = nil;
		};

		//--- Hide waypoints
		{
			_x setvariable ["MARTA_waypoint",[false,[-1,-1,-1,-1]]];
		} foreach hcallgroups player;

		//--- Disable custom cursor
		(uinamespace getvariable "_map") ctrlMapCursor ["Track","Track"];


		//--- Reset tooltip window
		((uinamespace getvariable "_display") displayctrl 1124) ctrlsetposition [0,0,0,0];
		((uinamespace getvariable "_display") displayctrl 1124) ctrlcommit 0;
		((uinamespace getvariable "_display") displayctrl 1125) ctrlsetposition [0,0,0,0];
		((uinamespace getvariable "_display") displayctrl 1125) ctrlcommit 0;

		//--- Cleanup
		HCWPWaitUntil = nil;
		HCWPWaitRadio = nil;
	};

};



//--- Save side scripts
_logic setvariable ["GUI_SELECT",_GUI_SELECT];
_logic setvariable ["GUI_WP_MOVE",_GUI_WP_MOVE];
_logic setvariable ["GUI_WP_ATTACK",_GUI_WP_ATTACK];
_logic setvariable ["GUI_WP_GETIN",_GUI_WP_GETIN];

























///////////////////////////////////////////////////////////////////////////////////
///// Core script 
///////////////////////////////////////////////////////////////////////////////////

BIS_HC_GUI = {scriptname "HC: BIS_HC_GUI";
	//disableserialization;
	
	//--- HC mod inactive - EXIT
	if !(hcshownbar) exitwith {};

	_logic = player getvariable "BIS_HC_scope";
	_type = _this select 0;
	_input = _this select 1;

	_HCO = player;

	//_display = findDisplay 12;
	//_map = _display displayCtrl 51;


	///////////////////////////////////////////////////////////////////////////////////
	///// Mouse moving/holding
	///////////////////////////////////////////////////////////////////////////////////
	if (_type in ["mousemoving","mouseholding"]) then {

		_posx = _input select 1;
		_posy = _input select 2;
		_worldpos = (uinamespace getvariable "_map") ctrlmapscreentoworld [_posx,_posy];

		_iconover = _logic getvariable "iconover";


		_selected = hcselected player;
		_groupover = _logic getvariable "groupover";
		_wpover = (_logic getvariable "wpover");
		//if (isnil "_wpover") then {};
		_hcall = hcallgroups player;

		//--- Group under cursor?
		if !(isnull _groupover) then {

			//--- Yes
			if (_groupover in _hcall || (_wpover select 0) in _hcall) then {

				//--- Commanded
				(uinamespace getvariable "_map") ctrlMapCursor ["Track","HC_overFriendly"];
			} else {

				if ((side _groupover getfriend side player) < 0.6 && count hcselected player > 0) then {

					//--- Enemy
					(uinamespace getvariable "_map") ctrlMapCursor ["Track","HC_overEnemy"];
				} else {(uinamespace getvariable "_map") ctrlMapCursor ["Track","HC_unsel"]};
			};
		} else {

			//--- No
			if (count _selected > 0) then {
				_mouseover = if (count (ctrlMapMouseOver (uinamespace getvariable "_map")) > 0) then {ctrlMapMouseOver (uinamespace getvariable "_map")} else {[""]};

				if (_mouseover select 0 == "task" && str(_logic getvariable "onTaskAssigned") != str{}) then {

					//--- Task
					(uinamespace getvariable "_map") ctrlMapCursor ["Track","HC_overMission"];
				} else {

					//--- Waypoint
					(uinamespace getvariable "_map") ctrlMapCursor ["Track","HC_move"];
				};
			} else {

				//--- Default
				(uinamespace getvariable "_map") ctrlMapCursor ["Track","Track"];
			};
		};

		//--- Holding LMB
		_wpover_click = _logic getvariable "wpover_click";
		if (count _wpover_click == 2) then {
			_logic setvariable ["wpover",_wpover_click];

			//--- Moving waypoint
			if (_logic getvariable "LMB_hold" && !(_logic getvariable "RMB_hold") && (time - (_logic getvariable "LMB_time") > 0.2) ) then {
				(uinamespace getvariable "_map") ctrlMapCursor ["Track","Move"];
				_wpover_click setwppos _worldpos;
			};

		} else {

			if (_logic getvariable "LMB_hold"/* && !(_logic getvariable "RMB_hold")*/) then {

				//--- Create frame
				(uinamespace getvariable "_map") ctrlMapCursor ["Track","Move"];

				if (isnil {_logic getvariable "LMB_posworld"}) then {_logic setvariable ["LMB_posworld",(uinamespace getvariable "_map") ctrlmapscreentoworld[_posx,_posy]]};

				_oldposworld = _logic getvariable "LMB_posworld";
				_newpos = [_posx,_posy];

				//_oldposWorld = _map ctrlmapscreentoworld _oldpos;
				_oldX = _oldposWorld select 0;
				_oldY = _oldposWorld select 1;
				_newposWorld = (uinamespace getvariable "_map") ctrlmapscreentoworld _newpos;
				_newX = _newposWorld select 0;
				_newY = _newposWorld select 1;

				_marker = "BIS_HC_GUI_FRAME";
				_markerpos = [_oldX + (_newX - _oldX)/2,_oldY + (_newY - _oldY)/2];
				_markersize = [(_newX - _oldX)/2,(_newY - _oldY)/2];
				_marker setmarkerposlocal _markerpos;
				_marker setmarkersizelocal _markersize;
				if ((abs(markersize _marker select 0) + abs(markersize _marker select 1)) > 10) then {_marker setmarkeralphalocal 1} else {_marker setmarkeralphalocal 0};
			} else {

				//--- Reset frame
				_marker = "BIS_HC_GUI_FRAME";
				_marker setmarkeralphalocal 0;
				_logic setvariable ["LMB_posworld",nil];
			};
		};

	};



	///////////////////////////////////////////////////////////////////////////////////
	///// Mouse DOWN
	///////////////////////////////////////////////////////////////////////////////////
	if (_type == "mousebuttondown") then {
		_button = _input select 1;
		_buttonString = if (_button == 0) then {"LMB"} else {"RMB"};
		_posx = _input select 2;
		_posy = _input select 3;

		_worldpos = (uinamespace getvariable "_map") ctrlmapscreentoworld [_posx,_posy];
		_logic setvariable [format ["%1_pos",_buttonString],[_posx,_posy]];
		_logic setvariable [format ["%1_hold",_buttonString],true];
		_logic setvariable [format ["%1_time",_buttonString],time];
	};

	///////////////////////////////////////////////////////////////////////////////////
	///// Mouse UP
	///////////////////////////////////////////////////////////////////////////////////
	if (_type == "mousebuttonup") then {

		_button = _input select 1;
		_buttonString = if (_button == 0) then {"LMB"} else {"RMB"};
		_posx = _input select 2;
		_posy = _input select 3;
		_oldtime = time - (_logic getvariable format ["%1_time",_buttonString]);
		_logic setvariable [format ["%1_hold",_buttonString],false];
		_logic setvariable [format ["%1_time",_buttonString],-1];

		_shift = _input select 4;
		_ctrl = _input select 5;
		_alt = _input select 6;

		_logic setvariable ["wpover_click",[grpnull]];

		//--- LMB
		if (_button == 0) then {
			_markerframe = "BIS_HC_GUI_FRAME";
			if (markeralpha _markerframe != 0) then {
				_codeSel = _logic getvariable "GUI_SELECT";

				_markerpos = markerpos _markerframe;
				_markerposX = _markerpos select 0;
				_markerposY = _markerpos select 1;
				_markersize = markersize _markerframe;
				_markersizeX = abs(_markersize select 0);
				_markersizeY = abs(_markersize select 1);

				_borderXleft = _markerposX - _markersizeX;
				_borderXright = _markerposX + _markersizeX;
				_borderYdown = _markerposY - _markersizeY;
				_borderYtop = _markerposY + _markersizeY;

				_selected = hcselected player;
				_selectedNew = [];
				{
					_group = _x;

					//--- Check if group is assigned to local commander
					_groupX = position (leader _x) select 0;
					_groupY = position (leader _x) select 1;
					if (
						//!(_group in _selected) && 
						_groupX > _borderXleft && 
						_groupX < _borderXright &&
						_groupY > _borderYdown &&
						_groupY < _borderYtop
					) then {
						_selectedNew = _selectedNew + [_group];
					};
				} foreach hcallgroups player;
				 [_selectedNew,false,_ctrl] spawn _codeSel;
			};
		};

		//--- RMB
		if (_button == 1) then {

			//--- Deselect group
			_groupover = _logic getvariable "groupover";
			if (isnull _groupover) then {
				_oldpos = _logic getvariable "RMB_pos";
				_dis = [_posX,_posY] distance _oldpos;

				if (count (hcselected player) > 0 && _dis < 0.01 && count (_logic getvariable "wpover") == 1) then {
					{player hcselectgroup [_x,false]} foreach (hcselected player);
					showCommandingMenu "";
				} else {
					_RMBmenu = _logic getvariable "RMBmenu";
					if (!isnil "_RMBmenu" && _oldtime <= CLICK_DELAY && count (_logic getvariable "wpover") == 1) then {
						if (commandingmenu == _RMBmenu) then {showcommandingmenu ""} else {showcommandingmenu _RMBmenu};
					};
				};
			} else {

				//--- Open menu
				[_groupover,_posx,_posy] spawn {scriptname "BIS_HC_GUI: Open menu";
					_group = _this select 0;
					_logic = player getvariable "BIS_HC_scope";
					_posx = _this select 1;
					_posy = _this select 2;
					//sleep CLICK_DELAY;
					if (_logic getvariable "RMB_hold" || (_logic getvariable "RMB_pos") distance [_posx,_posy] > 0.01) exitwith {};

					//--- Select group
					if !(_group in hcselected player) then {
						_codeSel = _logic getvariable "GUI_SELECT";
						[_group,false,true] spawn _codeSel;	
					};

					if (_logic getvariable "RMB_hold") exitwith {};
					//if (commandingmenu == "RscHCGroupRootMenu") then {showCommandingMenu ""} else {showCommandingMenu "RscHCGroupRootMenu"};
					if (commandingmenu != "RscHCGroupRootMenu") then {showCommandingMenu "RscHCGroupRootMenu"};
				};

				//--- Hack to disable RMB deselect
				//_logic setvariable ["RMB_pos",[0,0]];
			};
		};
	};


	//--- Key DOWN -----------------------------------------------------------
	if (_type == "keydown") then {
		_key = _input select 1;

		switch (_key) do {

			/* DELETE */	case 82:	{//--- Temporary placement for deleting WF missions
								_mouseover = ctrlMapMouseOver (uinamespace getvariable "_map");
								if (count _mouseover > 0) then {
									if (_mouseover select 0 == "task") then {
										_task = _mouseover select 1;
										_taskpos = taskdestination _task;
										_mission = [];
										waituntil {
											_mission = [side player,_taskpos,1] call BIS_WF_GetNearestMission;
											//hint str [_task,_taskpos];
											count _mission > 0;
										};
										//hint str _mission;
										
										[side player,_mission select 0,_mission select 1] call BIS_WF_DeleteMission;
									};
								};
							};

			/* LSHIFT */	case 42: 	{_logic setvariable ["shift",true]};
			/* RSHIFT */	case 54: 	{_logic setvariable ["shift",true]};
			/* LCTRL 	case 29:	{_logic setvariable ["ctrl",true]};*/

			default {};
		};

		//hint str ["DOWN",_key,_logic];
	};


	//--- Key UP -------------------------------------------------------------
	if (_type == "keyup") then {
		_key = _input select 1;

		switch (_key) do {
			/* LSHIFT */	case 42:	{_logic setvariable ["shift",false]};
			/* RSHIFT */	case 54:	{_logic setvariable ["shift",false]};
			/* LCTRL 	case 29:	{_logic setvariable ["ctrl",false]};*/
		};
		//hintc str ["UP",_key,_logic];
	};
};














//---------------------------------------------------------------------------------
//--- This is the End -------------------------------------------------------------
//---------------------------------------------------------------------------------