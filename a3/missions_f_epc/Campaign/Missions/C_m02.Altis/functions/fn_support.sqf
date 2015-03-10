//Parameters
private ["_action", "_parameters"];
_action 	= [_this, 0, "", [""]] call BIS_fnc_param;
_parameters	= [_this, 1, []] call BIS_fnc_param;

//Sub-functions
switch (toLower _action) do {
	case (toLower "Strike") : {
		//Flag campaign event
		BIS_artilleryUsed = true;
		saveVar "BIS_artilleryUsed";
		
		//Strike
		BIS_artillery_3 doWatch position BIS_tank;
		BIS_artillery_3 commandArtilleryFire [position BIS_tank, "12Rnd_230mm_rockets", 2];
		
		//Communication
		"BIS_tankStrike" spawn BIS_fnc_missionConversations;
		
		//New thread
		[] spawn {
			//Proceed only when tank is destroyed
			waitUntil {
				!alive BIS_tank
			};
			
			//Delete vehicle
			["delete", [group driver BIS_artillery_3]] call BIS_fnc_C_m02_groupManager;
			
			//Delay
			sleep 60;
			
			//Conversation with unhappy Nikos
			"BIS_pyrgosBombardmentAgain" call BIS_fnc_missionConversations;
		};
	};
};
