//--------------------------------------------------------------------------------------------------
//
// 	DEBUG OVERRIDES
//
//--------------------------------------------------------------------------------------------------
//debug
BIS_debugMode 		= false;
BIS_showHelpers 	= false;
BIS_skipQuotation	= false;
BIS_hideObjects		= true;
BIS_useLoadingScreen	= true;

//core globals
BIS_scriptNull		= [] spawn {};
BIS_ffDetected 		= false;		//true = friendly fire detected

//conversation init
BIS_topic 		= "";
BIS_container 		= missionName;
BIS_convStart 		= time;
BIS_convEnd 		= time;
BIS_convSkip		= [];
BIS_convQueue		= [];
BIS_canChat		= true;			//toggle on/off ambient chat in car

//function overrides
BIS_fnc_blackOut_disabled = false;
BIS_fnc_endMission_checkAliveState = false;

BIS_fnc_endMission_core = BIS_fnc_endMission;

BIS_fnc_endMission =
{
	_this call BIS_fnc_endMission_core;

	//disable mission task operations
	BIS_fnc_missionTasks = {};

	BIS_fnc_missionConversations = {waitUntil{false}};
};

BIS_getChannel =
{
	private["_channel"];

	_channel = switch (true) do
	{
		case (vehicle player == vehicle BIS_journalist):
		{
			"vehicle"
		};
		case ((vehicle player == player) && (vehicle BIS_journalist == BIS_journalist)):
		{
			"direct"
		};
		default
		{
			"side"
		};
	};

	_channel
};