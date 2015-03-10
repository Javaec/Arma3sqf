//Make sure at least one APC is alive and can move
if (isNil { BIS_echoNeutralized }) then {
	//Flag event
	BIS_echoSupportCalledSucessfull = true;
	
	//The group
	private "_group";
	_group = grpNull;
	
	//Which one is alive
	if (alive BIS_apcOne && canMove BIS_apcOne) then {
		_group = group commander BIS_apcOne;
	} else {
		_group = group commander BIS_apcTwo;
	};
	
	//Conversation
	"BIS_Support" spawn BIS_fnc_missionConversations;
	
	//Waypoint
	[_group, getMarkerPos "BIS_roadBlock", "MOVE", "COMBAT", "RED", "FULL", "COLUMN", 0, ["true", ""], true] call BIS_fnc_saa_addWaypoint;

	//Log
	"Echo support called to assist seizing road block" call BIS_fnc_log;
} else {
	//Log
	"Player used support menu but both APC's are down" call BIS_fnc_log;
};
