/*--------------------------------------------------------------------------------------------------

 	OFFROAD CUSTOMIZATION

--------------------------------------------------------------------------------------------------*/
private["_variant"];

_variant = 4;

BIS_car animate ["HideDoor3", 0];
BIS_car animate ["HideBumper1", 0];
BIS_car animate ["HideBumper2", 0];
BIS_car animate ["HideConstruction", 0];

BIS_car setObjectTextureGlobal [0, ["\A3\soft_F\Offroad_01\Data\Offroad_01_ext_co.paa",
"\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE01_CO.paa",
"\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE02_CO.paa",
"\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE03_CO.paa",
"\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE04_CO.paa",
"\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE05_CO.paa"] select _variant];

BIS_car setObjectTextureGlobal [1, ["\A3\soft_F\Offroad_01\Data\Offroad_01_ext_co.paa",
"\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE01_CO.paa",
"\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE02_CO.paa",
"\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE03_CO.paa",
"\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE04_CO.paa",
"\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE05_CO.paa"] select _variant];

BIS_car setFuel 0.01;

/*--------------------------------------------------------------------------------------------------

 	QUOTATION

--------------------------------------------------------------------------------------------------*/
disableSerialization;

waitUntil{!(isNull ([] call BIS_fnc_displayMission))};

if !(BIS_SkipQuotation) then
{
	private["_quotation"];

	_quotation = ["\A3\Missions_F_EPC\video\C_EA_quotation.ogv","str_a3_campaign_quote_43"];

	_quotation call BIS_fnc_quotations;

	waitUntil {BIS_fnc_quotations_playing || !isNil "BIS_fnc_quotations_skip"};
	waitUntil {!BIS_fnc_quotations_playing || !isNil "BIS_fnc_quotations_skip"};
};

["BIS_MissionInit"] call BIS_fnc_blackIn;


/*--------------------------------------------------------------------------------------------------

 	PLAY CHAT CONVERSATIONS IF IDLE

--------------------------------------------------------------------------------------------------*/
[] spawn
{
	private["_chats","_counter","_kb"];

	_counter = 0;
	_chats = ["30_ChatToOilStation","40_ChatToDestination","45_ChatToDestination2"];

	while {(_counter < count _chats) && (BIS_canChat)} do
	{
		waitUntil{vehicle player == vehicle BIS_journalist};

		sleep 15;

		waitUntil{time > BIS_convEnd + 15};

		if !(BIS_canChat) exitWith {};

		_kb = (_chats select _counter) spawn BIS_fnc_missionConversations;

		_counter = _counter + 1;

		waitUntil{scriptDone _kb};
	};

	sleep 5;

	private["_volume","_fadeSpeed"];

	_volume = 0.30;
	_fadeSpeed = 2;

	if !(BIS_canChat) exitWith {};

	waitUntil{(vehicle player != player) && (isEngineOn vehicle player)};

	if !(BIS_canChat) exitWith {};
	if (musicVolume != _volume) exitWith {};

	_fadeSpeed fadeMusic 0; waitUntil{musicVolume == 0};

	if !(BIS_canChat) exitWith {};

	BIS_musicTrackNext	= BIS_musicTrack;
	BIS_musicTrack 		= "C_EA_RadioBroadcast2";

	playMusic BIS_musicTrack; _fadeSpeed fadeMusic _volume;

	//waitUntil{(vehicle player == player) || !(isEngineOn vehicle player)};
};

/*--------------------------------------------------------------------------------------------------

 	MISSION OPTIMIZATIONS

--------------------------------------------------------------------------------------------------*/
[] execVM "missionOptimizations.sqf";