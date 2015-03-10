scriptName "HC\data\scripts\HC_GUI_menu.sqf";
/*
	File: HC_GUI_menu.sqf
	Author: Karel Moricky

	Description:
	High Command GUI command menu handler.
*/

_logic = player getvariable "BIS_HC_scope";
_selected = hcselected player;
_WPover = _logic getvariable "WPover";
_isWP = count _WPover > 0;
_grp = grpnull;
_id = -2;
if (_isWP) then {
	_grp = _WPover select 0;
	_id = _WPover select 1;
};

_mode = _this;
if (typename _this == "ARRAY") then {_mode = _this select 0};
_logic setvariable ["menu_command",_mode];

//--- WP is null
_nullwp = false;
if (_mode in ["WP_TYPE_MOVE","WP_TYPE_CYCLE","WP_TYPE_SAD","WP_TYPE_GUARD","WP_TYPE_UNLOAD","WP_TYPE_LOAD","WP_TYPE_GETOUT","WP_TYPE_GETIN","WP_COMBAT_STEALTH","WP_COMBAT_DANGER","WP_COMBAT_AWARE","WP_COMBAT_SAFE","WP_COMBAT_UNCHANGED","WP_COLUMN","WP_STAG COLUMN","WP_WEDGE","WP_ECH LEFT","WP_ECH RIGHT","WP_VEE","WP_LINE","WP_FILE","WP_DIAMOND","WP_UNCHANGED","WP_SPEED_UNCHANGED","WP_SPEED_LIMITED","WP_SPEED_NORMAL","WP_SPEED_FULL","WP_WAIT_NO","WP_WAIT_1MIN","WP_WAIT_5MIN","WP_WAIT_10MIN","WP_WAIT_15MIN","WP_WAIT_20MIN","WP_WAIT_25MIN","WP_WAIT_30MIN","WP_WAIT_45MIN","WP_WAIT_60MIN","WP_CREATETASK","WP_CANCELWP"]) then {
	if (count _wpover == 1) then {_nullwp = true};
};
if (_nullwp) exitwith {};

switch (_mode) do {

	//------------------------------------------------------------------------
	//--- Quick command ------------------------------------------------------
	//------------------------------------------------------------------------

	//--- 1: Attack ----------------------------------------------------------
	case "ATTACK": {
		_pos = _this select 1;
		_is3D = _this select 2;
		_selected = _this select 3;
		_ctrl = false;//_ctrl = _this select 4;
		_groupover = _logic getvariable "groupover";
		_codeSel = _logic getvariable "GUI_WP_ATTACK";
		{[_is3D,_x,_groupover,_ctrl,_selected] spawn _codeSel} foreach _selected;
	};

	//--- 1: Get in ----------------------------------------------------------
	case "GET IN": {
		hint str _this;
	};

	//--- 2: Move ------------------------------------------------------------
	case "MOVE": {
		_pos = _this select 1;
		_is3D = _this select 2;
		_selected = _this select 3;
		//_groupover = _logic getvariable "groupover";
		_ctrl = _this select 4;
		_shift = false;

		//--- Add waypoint
		_codeWP = _logic getvariable 'GUI_WP_MOVE';
		_script = [_is3D,_pos,_shift,_ctrl,false,_selected] spawn _codeWP;
/*
		_script spawn {
			waituntil {scriptdone _this};
			_selected = hcselected player;
			{player hcselectgroup [_x,false]} foreach _selected;
			sleep 0.05;
			if (!visiblemap) then {showcommandingmenu "RscHCGroupRootMenu"};
		};
*/
	};


	//------------------------------------------------------------------------
	//--- Complex command ----------------------------------------------------
	//------------------------------------------------------------------------

	//--- 1: Move ------------------------------------------------------------
	case "NEXTWP":			{{_waypoints = waypoints _x;_current = currentwaypoint _x;_x setcurrentwaypoint [_x,_current + 1]} foreach _selected};
	case "CANCELWP":		{{_waypoints = waypoints _x;deletewaypoint (_waypoints select (count _waypoints - 1))} foreach _selected};
	case "CANCELALLWP":		{{_waypoints = waypoints _x;{deletewaypoint _x} foreach _waypoints;{deletewaypoint _x} foreach _waypoints} foreach _selected};

	//--- 3: Engage ----------------------------------------------------------
	case "OPENFIRE":		{{{_x setcombatmode "yellow"} foreach units _x} foreach _selected};
	case "HOLDFIRE":		{{{_x setcombatmode "blue"} foreach units _x} foreach _selected};

	//--- 4: Speed ---------------------------------------------------
	case "SPEED_LIMITED":		{{_x setspeedmode "limited"} foreach _selected;};
	case "SPEED_NORMAL":		{{_x setspeedmode "normal"} foreach _selected;};
	case "SPEED_FULL":		{{_x setspeedmode "full"} foreach _selected;};

	//--- 7: Combat mode -----------------------------------------------------
	case "COMBAT_STEALTH":		{{{_x setbehaviour "stealth"} foreach units _x} foreach _selected};
	case "COMBAT_DANGER":		{{{_x setbehaviour "combat"} foreach units _x} foreach _selected};
	case "COMBAT_AWARE":		{{{_x setbehaviour "aware"} foreach units _x} foreach _selected};
	case "COMBAT_SAFE":		{{{_x setbehaviour "safe"} foreach units _x} foreach _selected};

	//--- 8: Formations ------------------------------------------------------
	case "COLUMN":			{{_x setformation _this} foreach _selected;};
	case "STAG COLUMN":		{{_x setformation _this} foreach _selected;};
	case "WEDGE":			{{_x setformation _this} foreach _selected;};
	case "ECH LEFT":		{{_x setformation _this} foreach _selected;};
	case "ECH RIGHT":		{{_x setformation _this} foreach _selected;};
	case "VEE":			{{_x setformation _this} foreach _selected;};
	case "LINE":			{{_x setformation _this} foreach _selected;};
	case "FILE":			{{_x setformation _this} foreach _selected;};
	case "DIAMOND":			{{_x setformation _this} foreach _selected;};

	//--- 9: Team ------------------------------------------------------------

	//--- 0: SITREP ------------------------------------------------------------
	case "SITREP":			{[visiblemap,_selected,-1,0,0] spawn (_logic getvariable "path_stat")};


	//------------------------------------------------------------------------
	//--- Waypoint command ---------------------------------------------------
	//------------------------------------------------------------------------

	//--- 1: Waypoint Type ---------------------------------------------------
	case "WP_TYPE_MOVE":		{_WPover setwaypointtype "MOVE"};
	case "WP_TYPE_CYCLE":		{_WPover setwaypointtype "CYCLE"};
	case "WP_TYPE_SAD":		{_WPover setwaypointtype "SAD"};
	case "WP_TYPE_GUARD":		{_WPover setwaypointtype "GUARD"};
	case "WP_TYPE_UNLOAD":		{_WPover setwaypointtype "UNLOAD"};
	case "WP_TYPE_LOAD":		{_WPover setwaypointtype "LOAD"};
	case "WP_TYPE_GETOUT":		{_WPover setwaypointtype "GETOUT"};
	case "WP_TYPE_GETIN":		{_WPover setwaypointtype "GETIN NEAREST"};

	//--- 2: Combat mode ------------------------------------------------------
	case "WP_COMBAT_STEALTH":	{_mode = "STEALTH";	_WPover setwaypointbehaviour _mode; if (_id == currentwaypoint _grp) then {_grp setbehaviour _mode}};
	case "WP_COMBAT_DANGER":	{_mode = "COMBAT";	_WPover setwaypointbehaviour _mode; if (_id == currentwaypoint _grp) then {_grp setbehaviour _mode}};
	case "WP_COMBAT_AWARE":		{_mode = "AWARE";	_WPover setwaypointbehaviour _mode; if (_id == currentwaypoint _grp) then {_grp setbehaviour _mode}};
	case "WP_COMBAT_SAFE":		{_mode = "SAFE";	_WPover setwaypointbehaviour _mode; if (_id == currentwaypoint _grp) then {_grp setbehaviour _mode}};
	case "WP_COMBAT_UNCHANGED":	{_WPover setwaypointbehaviour "UNCHANGED"};

	//--- 3: Formations -------------------------------------------------------
	case "WP_COLUMN":		{_mode = "COLUMN";	_WPover setwaypointformation _mode; if (_id != currentwaypoint _grp) then {_grp setformation _mode}};
	case "WP_STAG COLUMN":		{_mode = "STAG COLUMN";	_WPover setwaypointformation _mode; if (_id != currentwaypoint _grp) then {_grp setformation _mode}};
	case "WP_WEDGE":		{_mode = "WEDGE";	_WPover setwaypointformation _mode; if (_id != currentwaypoint _grp) then {_grp setformation _mode}};
	case "WP_ECH LEFT":		{_mode = "ECH LEFT";	_WPover setwaypointformation _mode; if (_id != currentwaypoint _grp) then {_grp setformation _mode}};
	case "WP_ECH RIGHT":		{_mode = "ECH RIGHT";	_WPover setwaypointformation _mode; if (_id != currentwaypoint _grp) then {_grp setformation _mode}};
	case "WP_VEE":			{_mode = "VEE";		_WPover setwaypointformation _mode; if (_id != currentwaypoint _grp) then {_grp setformation _mode}};
	case "WP_LINE":			{_mode = "LINE";	_WPover setwaypointformation _mode; if (_id != currentwaypoint _grp) then {_grp setformation _mode}};
	case "WP_FILE":			{_mode = "FILE";	_WPover setwaypointformation _mode; if (_id != currentwaypoint _grp) then {_grp setformation _mode}};
	case "WP_DIAMOND":		{_mode = "DIAMOND";	_WPover setwaypointformation _mode; if (_id != currentwaypoint _grp) then {_grp setformation _mode}};
	case "WP_UNCHANGED":		{_mode = "NO CHANGE";	_WPover setwaypointformation _mode; if (_id != currentwaypoint _grp) then {_grp setformation _mode}};

	//--- 4: Waypoint Speed ---------------------------------------------------
	case "WP_SPEED_UNCHANGED":	{_mode = "UNCHANGED";	_WPover setwaypointspeed _mode; if (_id != currentwaypoint _grp) then {_grp setspeedmode _mode}};
	case "WP_SPEED_LIMITED":	{_mode = "LIMITED";	_WPover setwaypointspeed _mode; if (_id != currentwaypoint _grp) then {_grp setspeedmode _mode}};
	case "WP_SPEED_NORMAL":		{_mode = "NORMAL";	_WPover setwaypointspeed _mode; if (_id != currentwaypoint _grp) then {_grp setspeedmode _mode}};
	case "WP_SPEED_FULL":		{_mode = "FULL";	_WPover setwaypointspeed _mode; if (_id != currentwaypoint _grp) then {_grp setspeedmode _mode}};

	//--- 5: Wait -------------------------------------------------------------
	case "WP_WAIT_NO":		{_mode = 0000; _WPover setwaypointtimeout [_mode,_mode,_mode]};
	case "WP_WAIT_1MIN":		{_mode = 0060; _WPover setwaypointtimeout [_mode,_mode,_mode]};
	case "WP_WAIT_5MIN":		{_mode = 0300; _WPover setwaypointtimeout [_mode,_mode,_mode]};
	case "WP_WAIT_10MIN":		{_mode = 0600; _WPover setwaypointtimeout [_mode,_mode,_mode]};
	case "WP_WAIT_15MIN":		{_mode = 0900; _WPover setwaypointtimeout [_mode,_mode,_mode]};
	case "WP_WAIT_20MIN":		{_mode = 1200; _WPover setwaypointtimeout [_mode,_mode,_mode]};
	case "WP_WAIT_25MIN":		{_mode = 1500; _WPover setwaypointtimeout [_mode,_mode,_mode]};
	case "WP_WAIT_30MIN":		{_mode = 1800; _WPover setwaypointtimeout [_mode,_mode,_mode]};
	case "WP_WAIT_45MIN":		{_mode = 2700; _WPover setwaypointtimeout [_mode,_mode,_mode]};
	case "WP_WAIT_60MIN":		{_mode = 3600; _WPover setwaypointtimeout [_mode,_mode,_mode]};

	//--- 8: Cancel WP --------------------------------------------------------
	case "WP_CREATETASK":		{_wpover spawn (_logic getvariable "onTaskCreated")};

	//--- 9: Cancel WP --------------------------------------------------------
	case "WP_CANCELWP":		{deletewaypoint _WPover};


	//--- Default ------------------------------------------------------------
	default {debuglog ("Log: [HC_HUI_menu] Wrong input param: " + _this)};



};