//Parameters
private ["_vehicle"];
_vehicle = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

//Is variable already existent, create if not
if (isNil { BIS_echoApcsKilled }) then {
	BIS_echoApcsKilled = 0;
};

//Is vehicle immobilized or dead?
if (!alive _vehicle || !canMove _vehicle) then {
	//The event handler
	private "_event";
	_event = _vehicle getVariable "BIS_hit";
	
	//Remove event handler
	_vehicle removeEventHandler ["Hit", _event];
	
	//Flag increment
	BIS_echoApcsKilled = BIS_echoApcsKilled + 1;
	
	//Are bot vehicles down?
	if (BIS_echoApcsKilled > 1) then {
		//Flag
		BIS_echoNeutralized = true;
		
		//Conversation
		"BIS_EchoDestroyed" spawn BIS_fnc_missionConversations;
		
		//Remove menu entry, if existent
		if (!isNil { BIS_supportCommMenuId }) then {
			[player, BIS_supportCommMenuId] call BIS_fnc_removeCommMenuItem;
			BIS_supportCommMenuId = nil;
		};
	};
};
