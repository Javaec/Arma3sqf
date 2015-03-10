BIS_topic 	= _mode;
BIS_container 	= missionName;

//["%1 @ %2 sec",_mode,round time] call BIS_fnc_logFormat;
//["_mode = %1 | _this = %2",_mode,_this] call BIS_fnc_logFormat;

#define LOW_PRIO	if (BIS_convEnd == 10e10) exitWith\
			{\
				["Low prio conversation [%1] is skipped as other conversation is playing.",_mode] call BIS_fnc_logFormat;\
			};\
			\
			BIS_convQueue 	= BIS_convQueue + [_mode];\
			BIS_convStart 	= time;\
			BIS_convEnd 	= 10e10;

#define HIGH_PRIO	BIS_convQueue 	= BIS_convQueue + [_mode];\
			waitUntil{((BIS_convEnd != 10e10) && ((BIS_convQueue select 0) == _mode)) || (_mode in BIS_convSkip)};\
			if (_mode in BIS_convSkip) exitWith\
			{\
				["Conversation [%1] is skipped as it was tagged 'to-skip'.",_mode] call BIS_fnc_logFormat;\
				BIS_convQueue = BIS_convQueue - [_mode];\
			};\
			\
			BIS_convStart 	= time;\
			BIS_convEnd 	= 10e10;


#define ON_END		BIS_convEnd = time;\
			BIS_convQueue = BIS_convQueue - [_mode];

/*
#define PLAY_CONVERSATION	if (vehicle player == vehicle BIS_journalist) then\
				{\
					[_mode,nil,nil,"vehicle"] call BIS_fnc_kbTell;\
				}\
				else\
				{\
					[_mode,nil,nil,"direct"] call BIS_fnc_kbTell;\
				};
*/

case "01_PlayerArrived":
{
	HIGH_PRIO

	[_mode] call BIS_fnc_kbTell;

	ON_END
};

case "05_MeetingWithJournalist":
{
	if (true) then
	{
		HIGH_PRIO

		#include "scripts\playPlayerJournalistConv.sqf"

		ON_END
	};

	["BIS_meetJournalist","SUCCEEDED"] call BIS_fnc_missionTasks;

	sleep 3;
};

case "10_GetCar":
{
	HIGH_PRIO

	sleep 3;

	#include "scripts\playPlayerJournalistConv.sqf"


	ON_END
};

case "15_CarFound":
{
	HIGH_PRIO

	#include "scripts\playPlayerJournalistConv.sqf"

	ON_END
};

case "25_LowFuel":
{
	sleep 1;

	LOW_PRIO

	if (count _this == 0) then
	{
		["25_LowFuel"] call BIS_fnc_kbTell;
	}
	else
	{
		["25_LowFuel", nil, _this] call BIS_fnc_kbTell;
	};

	ON_END
};

case "30_ChatToOilStation":
{
	HIGH_PRIO

	#include "scripts\playPlayerJournalistConv.sqf"

	ON_END
};

case "35_ReFueled":
{
	LOW_PRIO

	#include "scripts\playPlayerJournalistConv.sqf"

	ON_END

	sleep 5;
};

case "37_CarAccident":
{
	LOW_PRIO

	#include "scripts\playPlayerJournalistConv.sqf"

	ON_END
};

case "40_ChatToDestination":
{
	HIGH_PRIO

	#include "scripts\playPlayerJournalistConv.sqf"

	ON_END
};

case "45_ChatToDestination2":
{
	HIGH_PRIO

	#include "scripts\playPlayerJournalistConv.sqf"

	ON_END
};

case "50_AtDestination":
{
	if (true) then
	{
		HIGH_PRIO

		#include "scripts\playPlayerJournalistConv.sqf"

		ON_END
	};

	//update the task
	["BIS_escort",[BIS_nikos,true]] call BIS_fnc_taskSetDestination;
};

case "55_MeetingNikos_FIAFriends":
{
	HIGH_PRIO

	[_mode] call BIS_fnc_kbTell;

	ON_END
};

case "57_MeetingNikos_FIANotFriends":
{
	HIGH_PRIO

	[_mode] call BIS_fnc_kbTell;

	ON_END
};

case "60_RTB":
{
	HIGH_PRIO

	[_mode,nil,nil,"side",
	{
		private ["_sentence"];
		_sentence = _this select 3;

		if (_sentence == 1) then {
			// Fade out
			[] spawn {
				scriptName "meetingNikos.sqf: fade out";

				sleep 3;

				5 fadeSound 0;
				5 fadeMusic 0.4;
				titleCut ["", "BLACK OUT", 5];

				sleep 5;

				BIS_inf allowDamage false;
				BIS_inf setCaptive true;
				BIS_inf enableSimulation false;

				sleep 1;

				enableRadio false;
				clearRadio;

				sleep 4;

				// The End
				execVM "scripts\theEnd.sqf";
			};
		};

	}] call BIS_fnc_kbTell;

	ON_END
};

case "x01_CarDamaged":
{
	sleep 1;

	(vehicle player) spawn
	{
		sleep 3;

		if((vehicle player != player) && (vehicle player == _this) && (speed _this < 0.05)) then
		{
			moveOut player;
		};
	};

	LOW_PRIO

	#include "scripts\playPlayerJournalistConv.sqf"

	ON_END
};

case "x15_WrongWay":
{
	LOW_PRIO

	#include "scripts\playPlayerJournalistConv.sqf"

	ON_END
};

case "x20_WrongWay":
{
	LOW_PRIO

	#include "scripts\playPlayerJournalistConv.sqf"

	ON_END
};

case "x25_WrongWay":
{
	LOW_PRIO

	#include "scripts\playPlayerJournalistConv.sqf"

	ON_END
};