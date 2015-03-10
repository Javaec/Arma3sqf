if (isnil "bis_curator") exitwith {"Curator does not exist" call bis_fnc_error;};
["BIS_fnc_moduleMPTypeSeize"] call bis_fnc_startLoadingScreen;

_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_units = [_this,1,[],[[]]] call bis_fnc_param;


//--- Global variable declaration
_path = if (getnumber (configfile >> "CfgMods" >> "delta") > 0) then {"\a3\Missions_F_delta\MPTypes\Seize\"} else {"\a3\Missions_F_gamma\MPTypes\Seize\"};

[
	_path,
	"BIS_fnc_moduleMPTypeSeize_",
	[
		"initPlayerLocal",
		"initPlayerServerAdvanced",
		"initCurator",
		"initCuratorAdvanced",
		"initDiary",
		"missionTasks",
		"missionConversations"
	]
] call bis_fnc_loadFunctions;

//--- Server-side FSM declaration
BIS_fnc_moduleMPTypeSeize_missionFlowFSM = _path + "missionFlow.fsm";
BIS_fnc_moduleMPTypeSeize_sectorFSM = _path + "sector.fsm";

enableteamswitch false;

//--- Detect synchronized
_enemySides = [];
_enemySideLogics = [];
_playerSides = [];
_playerSideLogics = [];
_sectors = [];

{
	_xType = typeof _x;
	switch _xType do {

		case "SideBLUFOR_F";
		case "SideOPFOR_F";
		case "SideResistance_F": {
			_xSynced = synchronizedobjects _x;
			_x setvariable ["BIS_moduleMPTypeSeize_mission",_logic];

			_side = (["SideOPFOR_F","SideBLUFOR_F","SideResistance_F"] find _xType) call bis_fnc_sideType;
			_x setvariable ["side",_side,true];

			//--- ToDo: Better detection of player side
			if ({_x iskindof "Curator_F"} count _xSynced > 0) then {
				_enemySides set [count _enemySides,_side];
				_enemySideLogics set [count _enemySideLogics,_x];
			} else {
				_playerSides set [count _playerSides,_side];
				_playerSideLogics set [count _playerSideLogics,_x];
			};
		};
		case "ModuleSector_F": {
			_sectors set [count _sectors,_x];
		};
	};
} foreach (synchronizedobjects _logic);

if (count _playerSides == 0) exitwith {"No player sides found." call bis_fnc_error; ["BIS_fnc_moduleMPTypeSeize"] call bis_fnc_endLoadingScreen;};
if (count _enemySides == 0) exitwith {"No enemy sides found." call bis_fnc_error; ["BIS_fnc_moduleMPTypeSeize"] call bis_fnc_endLoadingScreen;};

BIS_fnc_moduleMPTypeSeize_mission = _logic;
publicvariable "BIS_fnc_moduleMPTypeSeize_mission";

_logic setvariable ["playerSides",_playerSides,true];
_logic setvariable ["playerSideLogics",_playerSideLogics,true];
_logic setvariable ["enemySides",_enemySides,true];
_logic setvariable ["enemySideLogics",_enemySideLogics,true];
_logic setvariable ["sectors",_sectors,true];

//--- Init sectors
{
	_fsm = [_x,_logic] execfsm BIS_fnc_moduleMPTypeSeize_sectorFSM;
	_x setvariable ["BIS_fnc_moduleMPTypeSeize_sectorFSM",_fsm];
} foreach _sectors;


//--- Init Trident
[
	missionnamespace,
	"BIS_fnc_moduleTrident_updated",
	{
		_channel = ["SIDE","GLOBAL"] select (_this select 2);
		[_this select 0,_channel, true] call bis_fnc_changeSupportRadioChannel;
		[_this select 1,_channel, true] call bis_fnc_changeSupportRadioChannel;
	}
] call bis_fnc_addScriptedEventHandler;

//--- Init curator
[_logic] call BIS_fnc_moduleMPTypeSeize_initCurator;
[_logic] call BIS_fnc_moduleMPTypeSeize_initCuratorAdvanced;

//--- Execute player scripts
[[_logic],"BIS_fnc_moduleMPTypeSeize_initPlayerLocal",true,true] call bis_fnc_mp;

//--- Diary
{
	[[_logic,"STR_A3_moduleMPTypeSeize_diaryPlayers",_x],"BIS_fnc_moduleMPTypeSeize_initDiary",_x,true] call bis_fnc_mp;
} foreach _playerSides;

//--- onPlayerConnected
["BIS_fnc_moduleMPTypeSeize_initPlayerServerAdvanced",_logic] call bis_fnc_onPlayerConnected;

//--- Wait for modules to initialize -------------------------------------------------------------------------------------------------
waituntil {!isnil {bis_fnc_init}};

//--- Initialize HQ speakers
{
	_var = "BIS_HQ_" + str _x;
	missionnamespace setvariable [_var,_x call bis_fnc_modulehq];
	publicvariable _var;
} foreach [west,east,resistance];

//--- Main mission flow
BIS_fnc_moduleMPTypeSeize_missionFlow = [_logic] execfsm BIS_fnc_moduleMPTypeSeize_missionFlowFSM;

if (isdedicated || true) then {["BIS_fnc_moduleMPTypeSeize"] call bis_fnc_endLoadingScreen;};
true