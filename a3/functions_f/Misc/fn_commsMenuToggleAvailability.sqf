
/*
	File: fn_commsMenuToggleAvailability.sqf
	Author: Joris-Jan van 't Land

	Description:
	Enables or disables certain sections of the global communications menu.

	Parameter(s):
	_this select 0: index (Scalar) or list of indices (Array of Scalars) or section name (String)
		"som" - SecOps section
		"wf" - Warfare section
	_this select 1: mode (Scalar)
		0 - disable
		1 - enable
	
	Returns:
	Success flag (Boolean)
*/

private ["_indices", "_mode"];
_indices = _this select 0;
_mode = _this select 1;


//TODO: more parameter validation.
if (isnil "BIS_MENU_GroupCommunication") exitWith {debugLog "Log: [fn_commsMenuToggleAvailability] Global communications menu does not exist!"; false};
if ((typeName _mode) != (typeName 0)) exitWith {debugLog "Log: [fn_commsMenuToggleAvailability] mode (1) must be a number!"; false};
if (!((typeName _indices) in [(typeName 0), (typeName []), (typeName "")])) exitWith {debugLog "Log: [fn_commsMenuToggleAvailability] indices (0) must be a number, array or string!"; false};

private ["_modifier"];
if (_mode == 0) then {_modifier = "0"} else {_modifier = "1"};

private ["_wfMode"]; //Hax :-)
_wfMode = false;
if ((typeName _indices) == (typeName 0)) then 
{
	_indices = [_indices];
} 
else 
{
	if ((typeName _indices) == (typeName "")) then 
	{
		switch (_indices) do 
		{
			case "som": {_indices = [2, 3]};
			case "wf": {_wfMode = true; _indices = [4, 5, 6, 7, 8, 9, 10, 11, 12,13]};
		};
	};
};

{
	private ["_value"];
	_value = _modifier;
	if (_wfMode) then 
	{
		//Warfare requires special availability modifiers for some elements.
		
		//TODO: iterate 
		/*
		switch (_x) do 
		{
			//case 5: {_value = "1 - (1 - IsAlone) * (1 - IsLeader)"}; //request help on mission
			case 5: {_value = "0"}; //TODO: reenable
			case 6: {_value = "1 - (1 - IsAlone) * (1 - IsLeader)"}; //request units
			case 7: {_value = "1 - (1 - IsAlone) * (1 - IsLeader)"}; //request money
			case 9: {_value = "(1 - IsLeader) * (1 - IsAlone)"}; //request disband
			case 10: {_value = "IsLeader"}; //disband selected
			case 12: {_value = "IsLeader"}; //send units 
			case 13: {_value = "1"}; //send money
		};
		*/
	};
	
	private ["_listIndex"];
	_listIndex = _x;
	
	private ["_cnt"];
	_menuArrayIndex =0;
  {
    private ["_menuIndexAKAhotkeyArray"];
    _menuIndexAKAhotkeyArray = _x select 1;
    
    if (typeName _menuIndexAKAhotkeyArray != typename false) then //first entry in array is name of menu
    {
      _value = _modifier;
    
      if (_listIndex == (_menuIndexAKAhotkeyArray select 0)) then
      {//_listIndex (iterated position in menu equals to position in menu given in menu array
             
      	  switch (_listIndex) do 
      		{
      			//case 5: {_value = "1 - (1 - IsAlone) * (1 - IsLeader)"}; //request help on mission
      			case 5: {_value = "0"}; //TODO: reenable
      			case 6: {_value = "1 - (1 - IsAlone) * (1 - IsLeader)"}; //request units - alone or leader
      			case 7: {_value = "1 - (1 - IsAlone) * (1 - IsLeader)"}; //request money - alone or leader 
      			case 9: {
       			  if ((_x select 7) == 0) then
        			  {//using unique ID - req disband
        			      _value = "(1 - IsAlone) * (1 - IsLeader) * (1 - HCIsLeader))"; //(empty squad or not leader), nothing selected in HC 
        			  };
        			
        			if ((_x select 7) == 5) then
        			  {//using unique ID - disband selected
        			      _value = "IsLeader * (1 - HCNotEmpty)"; //leader, nothing selected in HC
        			  };
        			  
        			if ((_x select 7) == 1) then
        			  {//using unique ID - team respawn
        			      _value = "HCNotEmpty"; //selected something in HC
        			  };
        			  
        			  
        			  
      			  }; //request disband      			
      			case 10: {_value = "1 - (1 - IsLeader) * (1 - HCNotEmpty)"}; //send units+teamType ...either leader (with units) or something selected in HC 
      			case 11: {_value = "1"}; //send money
      		};
      		
      		
    	
        [BIS_MENU_GroupCommunication, [_menuArrayIndex, 6], _value] call BIS_fnc_setNestedElement;	
        textLogFormat    ["COMM_ ------------------------------------------------"];	
        textLogFormat    ["COMM_ %1",BIS_MENU_GroupCommunication select _menuArrayIndex];	
        textLogFormat    ["COMM_ %1 number: %2 value %3 ID: %4, cond  %5 ",_listIndex, _x select 1, _value, _x select 7, _x];	
        textLogFormat    ["COMM_ %1",BIS_MENU_GroupCommunication select _menuArrayIndex];	

    	  
      };     
    };
    
    _menuArrayIndex = _menuArrayIndex +1;    
  } forEach BIS_MENU_GroupCommunication;
	

		
	
} 
forEach _indices;

true