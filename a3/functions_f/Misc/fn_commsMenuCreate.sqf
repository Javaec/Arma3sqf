
/*
	File: fn_commsMenuCreate.sqf
	Author: Joris-Jan van 't Land

	Description:
	Creates the global communications menu, if it's not already created.
	All entries are invisible by default.
	Unhide appropriate sections by using BIS_fnc_commsMenuToggleVisibility.

	Parameter(s):
	-
	
	Returns:
	Success flag (Boolean)
*/

//Does the comms menu already exist?

textLogFormat ["WF_INIT %1 BIS_MENU_GroupCommunication %1", [isNil "BIS_MENU_GroupCommunication", _this]];

if (isnil "BIS_MENU_GroupCommunication") then 
{
	BIS_MENU_GroupCommunication = 
	[//last parameter after visibility and availability is unique ID (or -1) (used in toggle script functions)
		[localize "STR_SOM_COMMUNICATIONS", true],
		[localize "STR_SOM_REQUEST_SUPPORT", [2], "#USER:BIS_MENU_SOM_Support", -5, [["expression", ""]], "0", "0", -1],
		[localize "STR_SOM_SECOPS", [3], "#USER:BIS_MENU_SOM_SecOps", -5, [["expression", ""]], "0", "0", -1], 
		["", [], "", -1, [], "0", "0", -1], 
		[localize "str_sqlhelp", [4], "", -5, [["expression", "showCommandingMenu ''; player sideChat 'I need assistance!';"]], "0", "0", -1],
		[localize "str_sqlhelpmiss", [5], "", -5, [["expression", "showCommandingMenu ''"]], "0", "0", -1],
		[localize "str_sqlrequnits", [6], "", -5, [["expression", "showCommandingMenu ''; player sidechat 'I need units!';"]], "0", "0", -1],
		[localize "str_sqlreqmoney", [7], "", -5, [["expression", "showCommandingMenu ''; player sidechat 'I need money!';"]], "0", "0", -1],
		["", [], "", -1, [], "0", "0", -1],
		[localize "str_sqlreqjoin", [8], "", -5, [["expression","['Join'] execVM BIS_FNC_CMDMENUCOMM"]], "0", "0", -1],
		[localize "str_team" + " " + localize "str_automatic" + " " + localize "str_editor_edobj_wp_param_behavior", [8], "", -5, [["expression","BIS_SQL_SelectedUnits = hcSelected player;['HCAutomaticBehavior'] execVM BIS_FNC_CMDMENUCOMM"]], "0", "0", 4],
		
		[localize "str_sqlreqdisband", [9], "", -5, [["expression", "showCommandingMenu ''; ['Dismiss'] execVM BIS_FNC_CMDMENUCOMM; textLogFormat ['SQL_comm Disband menu'];"]], "0", "0",0],
		[localize "str_sqlcommDisbandSel" + " (%SELECTED_UNIT_ID)", [9], "", -5, [["expression", "BIS_SQL_SelectedUnits = groupSelectedUnits player; showCommandingMenu ''; ['DismissSelected'] execVM BIS_FNC_CMDMENUCOMM; textLogFormat ['SQL_comm Disband selected'];"]], "0", "0",5],
		[localize "str_team" + " " + localize "str_disp_int_respawn" + " (%SELECTED_UNIT_ID)", [9], "", -5, [["expression", "BIS_SQL_SelectedUnits = hcSelected player; showCommandingMenu ''; ['HCRespawnSelected'] execVM BIS_FNC_CMDMENUCOMM; textLogFormat ['SQL_comm Respawn team'];"]], "0", "0",1],
		
		
		
		["", [], "", -1, [], "0", "0", -1],
		//[localize "str_sqlsendunits", [10], "", -5, [["expression", "showCommandingMenu ''; BIS_WF_GROUPSELECTEDUNITS = groupSelectedUnits player;createDialog 'RscDisplayWFTransfer';"]], "0", "0"],
		[localize "str_sqlsendunits"  + " (%SELECTED_UNIT_ID)", [10], "", -5, [["expression", "showCommandingMenu ''; BIS_WF_GROUPSELECTEDUNITS = groupSelectedUnits player;['SendUnits'] execVM BIS_FNC_CMDMENUCOMM;"]], "0", "0", 2],		
		[localize "str_team" + " " + localize "str_disp_arcsens_type" + " (%SELECTED_UNIT_ID)", [10], "", -5, [["expression", "showCommandingMenu ''; BIS_SQL_SelectedUnits = HCSelected player;['HCTeamType'] execVM BIS_FNC_CMDMENUCOMM;"]], "0", "0", 3],
		//[localize "str_team" + " " + localize "str_disp_arcsens_type" + " (%SELECTED_UNIT_ID)", [10], "", -5, [["expression", "showCommandingMenu ''; showCommandingMenu '#USER:HC_Custom_0';"]], "0", "0", 3],
		
		//["HC - set team type", [10], "", -5, [["expression", "showCommandingMenu ''; BIS_WF_GROUPSELECTEDUNITS = groupSelectedUnits player;['SendUnits'] execVM BIS_FNC_CMDMENUCOMM;"]], "0", "0"],
		//[localize "str_sqlsendmoney", [11], "", -5, [["expression", "showCommandingMenu ''; createDialog 'RscDisplayWFTransfer';"]], "0", "0"]	 
		[localize "str_sqlsendmoney", [11], "", -5, [["expression", "showCommandingMenu '';['SendMoney'] execVM BIS_FNC_CMDMENUCOMM;"]], "0", "0", -1]	 
	];	
};

true