scriptName "HC\data\scripts\HC.sqf";
/*
	File: HC.sqf
	Author: Karel Moricky

	Description:
	Init script - High Command

	Parameter(s):
	_this: the HC logic unit which triggered this script.
*/

textLogFormat["HC-PRELOAD_ HC.sqf start..."];

_logic = _this select 0;
_logic setpos [1000,10,0];
_group = group _logic;

//--- HC main is laready running
_isMain = if (_logic == BIS_HC_mainscope) then {true} else {false};
//if (_isMain) then {startLoadingScreen ['High Command']};

//--- Code executed only on first HC scope
if (_isMain) then {
	//SPACE selects last unit that reported, variables:
	HC_lastUnitReporting	 = []; //hc unit - array of groups
	HC_lastUnitReportingTime = 0;
	HC_lastUnitReportingMarkerName = "";
	HC_lastUnitReportingTimeMax = 45; //no older reports than this from teams are considered
	_logic setvariable ["sound",false];

	//--- Execute MARTA
	if (isNil "BIS_MARTA_mainScope") then
	{//create MARTA only once, avoid creating too much groups
		activateaddons ["A3_Modules_F_Marta"];	  
		_logicMARTA =(group _logic) createunit ["MartaManager",position player,[],0,"none"];
		//BIS_MARTA_mainScope = _logicMARTA; //TODO: look at this (it is here because init handler of marta (setting BIS_MARTA_mainScope) runs maybe too late (after initialization of whole WF)
	};

	//waituntil {count (BIS_marta_mainscope getvariable "allgroups") > 0};
	//_logicMARTA = BIS_marta_mainscope;
};

//--- Scope name
for "_i" from 0 to 1000 do {
	_name = format ["BIS_HC_%1",_i];
	if (isnil _name) exitwith {call compile format ["%1 = _logic",_name]};
};

//--- Synchronization
waituntil {{typeof _x != "HighCommandSubordinate"} count (synchronizedObjects _logic) > 0 || _logic == bis_hc_mainscope};
_possibleLeaders = synchronizedObjects _logic;
_groupColors = ["teammain","teamgreen","teamblue","teamyellow"];
_sublogics = [];
for "_i" from 0 to (count _possibleLeaders - 1) do {
	_element = _possibleLeaders select _i;
	if (typeof _element == "HighCommandSubordinate") then {
		_sublogics = _sublogics + [_element];
		if (isnil {_element getvariable "color"}) then {
			_color = if (_i >= count _groupColors) then {"teammain"} else {_groupColors select _i};
			_element setvariable ["color",_color];
		};
	};
};
_possibleLeaders = _possibleLeaders - _sublogics;
_logic setvariable ["sublogics",_sublogics];
if (count _possibleLeaders > 1) then {textLogFormat ["Log: [High Command] WARNING! More than one commanders assigned - %1",_possibleleaders]};
_leader = _possibleLeaders select 0;
_leader setvariable ["BIS_HC_scope",_logic,true];


//--- Default leader
//_leader setvariable ["hcdefaultcommander",true];


//--- Functions are loaded
waituntil {!isnil "BIS_fnc_init"};

//--- Get custom params ----------------------------------------------------------------------------------

/*
//--- Commanders
_commanders = if (isnil {_logic getvariable "commanders"}) then {
	if (_leader != _logic) then {[_leader]} else {[]};
} else {
	_logic getvariable "commanders";
};
_logic setvariable ["commanders",_commanders,true];
*/

//--- Detect all (obsolete)
_addAllGroups = if (isnil {_logic getvariable "addAllGroups"}) then {
	if (count _sublogics > 0) then {false} else {true}
} else {_logic getvariable "addAllGroups"};
_logic setvariable ["addAllGroups",_addAllGroups,true];

//--- Radio activations
_radios = if (isnil {_logic getvariable "radios"}) then {[]} else {_logic getvariable "radios"};
_logic setvariable ["radios",_radios,true];

//--- Chain of Command
_coc = if (isnil {_logic getvariable "chainofcommand"}) then {false} else {_logic getvariable "chainofcommand"};
_logic setvariable ["chainofcommand",_coc,true];

//--- Task created
_onTaskCreated = if (isnil {_logic getvariable "onTaskCreated"}) then {{}} else {_logic getvariable "onTaskCreated"};
_logic setvariable ["onTaskCreated",_onTaskCreated,true];

//--- Task assigned
_onTaskAssigned = if (isnil {_logic getvariable "onTaskAssigned"}) then {{}} else {_logic getvariable "onTaskAssigned"};
_logic setvariable ["onTaskAssigned",_onTaskAssigned,true];

//--- RMBmenu
/*
_RMBmenu = if (isnil {_logic getvariable "RMBmenu"}) then {""} else {_logic getvariable "RMBmenu"};
_logic setvariable ["RMBmenu",_RMBmenu,true];
*/




//--- Automatic group assigning - Synchronized
if (count _sublogics > 0 && !_addAllGroups) then {
	//if (isnull(hcleader group _leader)) then {_leader HCsetgroup [group _leader,""]};
	_linkedLogic = synchronizedObjects _logic;
	if (count _linkedLogic > 1) then {
		{
			if (typeof _x == "HighCommandSubordinate") then {
				_subordinate = _x;
				_linkedSubordinate = synchronizedObjects _subordinate;
				{
					if !(_x iskindof "logic") then {
						_group = group _x;
						_groupColor = _subordinate getvariable "color";
						[_leader,"MARTA_REVEAL",[_group],false,true] call BIS_fnc_variableSpaceAdd;
						_leader HCsetgroup [_group,"",_groupColor];
					};
				} foreach _linkedSubordinate;
			};
		} foreach _linkedlogic;
	};
} else {

	//--- Automatic group assigning - All
	//if (isnull(hcleader group _leader)) then {_leader HCsetgroup [group _leader,""]};

	_groups = allgroups;//_logicMARTA getvariable "allgroups";
	{
		//--- No HCO defined yet
		_grp = _x;
		if (isnull hcleader _grp) then {
			if (side player == side _grp && _addAllGroups) then {
				[player,"MARTA_REVEAL",[_x],false,true] call BIS_fnc_variableSpaceAdd;
				player HCsetgroup [_grp,""];
			};
		};
	} foreach _groups;
};

//--- Local script ---------------------------------------------------------------------------------------
//waitUntil{!isNil {BIS_MPF_initDone}};
  
if (_isMain) then {
	//[nil, nil, "per", rEXECVM, "A3\modules_f\HC\data\scripts\HC_local.sqf"] call RE
	[["A3\modules_f\HC\data\scripts\HC_local.sqf"],"BIS_fnc_execVM",nil,true] call BIS_fnc_MP;
};

//--- No proper Chain of Command
if !(_coc) exitwith {};

while {true} do {
	_allgroups = allgroups;
	{
		_group = _x;
		if (isnil {_group getvariable "BIS_HC_fsmcoc"}) then {
			_fsm = _group execfsm ("\A3\modules_f\hc\data\scripts\HC_COC.fsm");
			_group setvariable ["BIS_HC_fsmcoc",_fsm];
		};
		sleep 0.05;
	} foreach _allgroups;
	sleep 1;
};