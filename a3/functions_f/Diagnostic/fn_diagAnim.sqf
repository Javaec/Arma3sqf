
/*
	File: fn_diagAnim.sqf
	Author: Vilem

	Description:
	Displays or logs animation states:
	 * animChanged - when action is performed (only to debug.log);
	 * animDone - when animation chain that was sterted by action is finished (only to debug.log);
	 * animStateChanged - each animation state changes (ie.  animationState _who != _former_animationState_of_who) (debug.log + globalchat).
	 
	
	Parameter(s):
	1: (optional) <object> subject
		
	Returns:
	<> nothing
*/

private ["_who"];  
if (count _this < 1) then {_who = player;} else {_who = _this select 0;};

_who addEventHandler ["animChanged", "textLogFormat ['DIAG_ANIM_ EH animChanged %1',_this];"];
_who addEventHandler ["animDone", "textLogFormat ['DIAG_ANIM_ EH animDone %1',_this];"];  
_who addEventHandler ["animStateChanged", "textLogFormat ['DIAG_ANIM_ %1 %2 %3',(_this select 0), _this select 1, getText (configfile >> 'CfgMovesMaleSdr'>>'States'>>(_this select 1)>>'actions')];"];  
_who addEventHandler ["animStateChanged", "(_this select 0) globalChat format ['DIAG_ANIM_ %2 %3',(_this select 0), _this select 1, getText (configfile >> 'CfgMovesMaleSdr'>>'States'>>(_this select 1)>>'actions')];"];    

nil