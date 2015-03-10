
/*
	File: fn_commsMenuToggleVisibility.sqf
	Author: Joris-Jan van 't Land

	Description:
	Shows or hides certain sections of the global communications menu.

	Parameter(s):
	_this select 0: index (Scalar) or list of indices (Array of Scalars) or section name (String)
		"som" - SecOps section
		"wf" - Warfare section
	_this select 1: mode (Scalar)
		0 - hide
		1 - show
	
	Returns:
	Success flag (Boolean)
*/

private ["_indices", "_mode"];
_indices = _this select 0;
_mode = _this select 1;

//TODO: one more mode for: "conditioned on" (_modifier is condition (see below), not 1)

//TODO: more parameter validation.
if (isnil "BIS_MENU_GroupCommunication") exitWith {debugLog "Log: ERROR  [fn_commsMenuToggleVisibility] Global communications menu does not exist!"; false};
if ((typeName _mode) != (typeName 0)) exitWith {debugLog "Log: ERROR [fn_commsMenuToggleVisibility] mode (1) must be a number!"; false};
if (!((typeName _indices) in [(typeName 0), (typeName []), (typeName "")])) exitWith {debugLog "Log: [fn_commsMenuToggleVisibility] indices (0) must be a number, array or string!"; false};

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
			case "wf": {_indices = [4, 5, 6, 7, 8, 9, 10, 11, 12,13]};			
		};
		
	};
};

private ["_modifier"];

{
  if (_mode == 0) then {_modifier = "0"} else {_modifier = "1"};
  
  /*
  switch (_x) do
  {//"conditioned on" mode - using conditions for visibility    
    case 9: {_modifier = "1 - IsLeader"; textLogFormat ["COMM_  -> cond %1",[_x, BIS_MENU_GroupCommunication select _x]];};  //request disband
    case 10: {_modifier = "IsLeader"; textLogFormat    ["COMM_  -> cond  %1",[_x, BIS_MENU_GroupCommunication select _x]];}; //disband selected         
    case 11: {_modifier = "IsLeader"; textLogFormat    ["COMM_  -> cond  %1",[_x, BIS_MENU_GroupCommunication select _x]];}; //send units             
    case 12: {_modifier = "IsLeader"; textLogFormat    ["COMM_  -> cond  %1",[_x, BIS_MENU_GroupCommunication select _x]];}; //send money
    default {};
  };

	[BIS_MENU_GroupCommunication, [_x, 5], _modifier] call BIS_fnc_setNestedElement;	
	*/
	
	textLogFormat ["COMM_ fn_commsMenuToggleVisibility iterating _x (from _indices) %1",_x];
	
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
      		  
      		  case 8: {
      			  if ((_x select 7) != 4) then
        			  {//using unique ID - squad communication only if HCbar not visible        			    
        			      _value = "IsLeader * (1 - HCNotEmpty)";        			              			    
        			  }
        			  else
        			  {//HC entry (ID ==1) available only if hcBarShown         			  
        			      _value = "HCNotEmpty";        			     
        			  };
        			};
      		  
      		  
            case 10: {
              
                       if ((_x select 7) == 2) then
                			  {//using unique ID - send units
                			      _value = "(1 - HCNotEmpty)";        			              			    
                			  }
                			  else
                			  {//HC entry
                			      _value = "HCNotEmpty";        			     
                			  };
                    }; //disband selected         
            case 11: {_value = "IsLeader";}; //send units             
            case 12: {_value = "IsLeader";}; //send money
    
    
      			case 9: {
      			  if ((_x select 7) == 0) then
        			  {//using unique ID - req disband
        			      _value = "(1 - IsAlone) * (1 - IsLeader) * (1 - HCNotEmpty)";
        			  };
        			
        			if ((_x select 7) == 5) then
        			  {//using unique ID - disband selected
        			      _value = "(1 - HCNotEmpty)";
        			  };
        			  
        			if ((_x select 7) == 1) then
        			  {//using unique ID - team respawn
        			      _value = "HCNotEmpty"; //selected something in HC
        			  };
      			  }; //request disband  / disband selected / HC respawn selected team     			      			
      		};
      		
      		
    	
        [BIS_MENU_GroupCommunication, [_menuArrayIndex, 5], _value] call BIS_fnc_setNestedElement;	
        textLogFormat    ["COMM_ VIS ------------------------------------------------"];	
        textLogFormat    ["COMM_ VIS %1",BIS_MENU_GroupCommunication select _menuArrayIndex];	
        textLogFormat    ["COMM_ VIS %1 number: %2 value %3 ID: %4, cond  %5 ",_listIndex, _x select 1, _value, _x select 7, _x];	
        textLogFormat    ["COMM_ VIS %1",BIS_MENU_GroupCommunication select _menuArrayIndex];	

    	  
      };     
    };
    
    _menuArrayIndex = _menuArrayIndex +1;    
  } forEach BIS_MENU_GroupCommunication;
	
	
	
} 
forEach _indices;

true