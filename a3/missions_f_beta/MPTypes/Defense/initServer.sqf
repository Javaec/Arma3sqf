["BIS_fnc_moduleMPTypeDefense"] call bis_fnc_startLoadingScreen;

_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_units = [_this,1,[],[[]]] call bis_fnc_param;

//--- Global variable declaration
_path = if (getnumber (configfile >> "CfgMods" >> "delta") > 0 && false) then {"\a3\Missions_F_delta\MPTypes\Defense\"} else {"\a3\Missions_F_beta\MPTypes\Defense\"};

[
	_path,
	"BIS_fnc_moduleMPTypeDefense_",
	[
		"initPlayerLocal",
		"initPlayerServerAdvanced",
		"initCurator",
		"initCuratorAdvanced",
		"initDiary",
		"ownerChanged",
		"skipTime",
		"killed",
		"missionTasks",
		"missionConversations",
		"heliEvacLocal",
		"addEditingArea",
		"playMusic",
		"lastStand"
	]
] call bis_fnc_loadFunctions;

//--- Server-side FSM declaration
BIS_fnc_moduleMPTypeDefense_missionFlowFSM = _path + "missionFlow.fsm";
BIS_fnc_moduleMPTypeDefense_heliEvac = _path + "heliEvac.fsm";
BIS_fnc_moduleMPTypeDefense_heliEvacFSM = -1;
BIS_fnc_moduleMPTypeDefense_tier = 0;

/*
ToDo: Error when more than 2 player sides are present
*/

enableteamswitch false;

//--- Detect synchronized
_enemySides = [];
_enemySideLogics = [];
_playerSides = [];
_playerSideLogics = [];

{
	_xType = typeof _x;
	switch _xType do {

		case "SideBLUFOR_F";
		case "SideOPFOR_F";
		case "SideResistance_F": {
			_xSynced = synchronizedobjects _x;
			_x setvariable ["BIS_moduleMPTypeDefense_mission",_logic];

			_side = (["SideOPFOR_F","SideBLUFOR_F","SideResistance_F"] find _xType) call bis_fnc_sideType;
			_x setvariable ["side",_side,true];

			if ({_x iskindof "Curator_F"} count _xSynced > 0) then {
				_enemySides set [count _enemySides,_side];
				_enemySideLogics set [count _enemySideLogics,_x];
			} else {
				_playerSides set [count _playerSides,_side];
				_playerSideLogics set [count _playerSideLogics,_x];
			};
		};
	};
} foreach (synchronizedobjects _logic);

if (count _playerSides == 0) exitwith {["No friendly sides synchronized to Defense mission type."] call bis_fnc_errorMsg; ["BIS_fnc_moduleMPTypeDefense"] call bis_fnc_endLoadingScreen; false};
if (count _enemySides == 0) exitwith {["No enemy sides synchronized to Defense mission type."] call bis_fnc_errorMsg; ["BIS_fnc_moduleMPTypeDefense"] call bis_fnc_endLoadingScreen; false};

BIS_fnc_moduleMPTypeDefense_mission = _logic;
publicvariable "BIS_fnc_moduleMPTypeDefense_mission";

_logic setvariable ["playerSides",_playerSides,true];
_logic setvariable ["playerSideLogics",_playerSideLogics,true];
_logic setvariable ["enemySides",_enemySides,true];
_logic setvariable ["enemySideLogics",_enemySideLogics,true];

_logic setvariable ["heli",objnull,true];
_logic setvariable ["evacuated",false,true];
_logic setvariable ["lastStand",false,true];

//--- Init enemy sides
{
	_xLogic = _x;
	_sectors = [];
	{
		if (_x iskindof "emptydetector") then {

			//--- Register the trigger
			[_logic,"enemySectors",[_x],false,true] call bis_fnc_variablespaceadd;
			_sectors set [count _sectors,_x];

			//--- Register spawning positions
			_xPos = position _x;
			_xArea = triggerarea _x;
			_xSize = (_xArea select 0) max (_xArea select 1);

			[_xPos,_xSize] call bis_fnc_curatorAutomaticPositions;
		};
	} foreach (synchronizedobjects _xLogic);

	_xLogic setvariable ["sectors",_sectors,true];
} foreach _enemySideLogics;


//--- Init player sides
{
	_xLogic = _x;
	_xSide = _xLogic getvariable ["side",sideUnknown];
	_enemySide = if (count _enemySides > 0) then {_enemySides select 0} else {sideUnknown};
	{
		_type = typeof _x;

		switch true do {
			case (_x iskindof "FlagCarrier"): {
				_xLogic setvariable ["flag",_x,true];
				_x setvariable ["flag",_xSide,true];
			};
			case (side group _x == _xSide): {
				_heli = vehicle _x;
				_heli enablesimulation false;
				_heli hideobject true;
				_xLogic setvariable ["heli",_heli,true];
			};
			case (_x iskindof "HeliH"): {
				_xLogic setvariable ["helipad",_x,true];
			};
			case (_x iskindof "emptydetector"): {
				_x settriggeractivation [str _enemySide,"present",true];
				_x settriggerstatements [
					"count (thislist unitsBelowHeight 2) > 0",
					"[[thisTrigger,true],'BIS_fnc_moduleMPTypeDefense_baseTrigger'] call bis_fnc_mp;",
					"[[thisTrigger,false],'BIS_fnc_moduleMPTypeDefense_baseTrigger'] call bis_fnc_mp;"
				];
				_xLogic setvariable ["trigger",_x,true];
				_x setvariable ["side",_xSide,true];
			};

		};
	} foreach (synchronizedobjects _x);

	//--- Announce players' supports by global radio
	[_xSide,"GLOBAL"] call bis_fnc_changeSupportRadioChannel;

} foreach _playerSideLogics;

//--- Init Trident
[
	missionnamespace,
	"BIS_fnc_moduleTrident_updated",
	{
		_channel = ["SIDE","GLOBAL"] select (_this select 2);
		[_this select 0,_channel] call bis_fnc_changeSupportRadioChannel;
		[_this select 1,_channel] call bis_fnc_changeSupportRadioChannel;
	}
] call bis_fnc_addScriptedEventHandler;

//--- Init daytime
RscDisplayModuleSkiptime_description = "Time will be skipped once the current wave is finished.";
RscDisplayModuleSkiptime_valueMax = 8;
RscDisplayModuleSkiptime_value = 0;
publicvariable "RscDisplayModuleSkiptime_description";
publicvariable "RscDisplayModuleSkiptime_valueMax";
publicvariable "RscDisplayModuleSkiptime_value";

//--- Init curator
[_logic] call BIS_fnc_moduleMPTypeDefense_initCurator;
[_logic] call BIS_fnc_moduleMPTypeDefense_initCuratorAdvanced;

//--- Execute player scripts
[[_logic],"BIS_fnc_moduleMPTypeDefense_initPlayerLocal",true,true] call bis_fnc_mp;
{
	[[_logic,"STR_A3_moduleMPTypeDefense_diaryPlayers",_x],"BIS_fnc_moduleMPTypeDefense_initDiary",_x,true] call bis_fnc_mp;
} foreach _playerSides;

//--- onPlayerConnected
["BIS_fnc_moduleMPTypeDefense_initPlayerServerAdvanced",_logic] call bis_fnc_onPlayerConnected;


//--- Wait for modules to initialize -------------------------------------------------------------------------------------------------
waituntil {!isnil {bis_fnc_init}};

//--- Play alarm when enemy captures the sector
_sectors = missionnamespace getvariable ["BIS_fnc_moduleSector_sectors",[]];
if (count _sectors == 0) exitwith {sleep 0.01; ["No sectors found."] call bis_fnc_errorMsg; ["BIS_fnc_moduleMPTypeDefense"] call bis_fnc_endLoadingScreen; false};
{
	[_x,"ownerchanged",{[_this,"BIS_fnc_moduleMPTypeDefense_ownerChanged"] call bis_fnc_mp;}] call bis_fnc_addscriptedeventhandler;
	_x setvariable ["BIS_fnc_moduleMPTypeDefense_logic",_logic,true];
} foreach _sectors;

//--- Initialize HQ speakers
{
	missionnamespace setvariable ["BIS_HQ_" + str _x,_x call bis_fnc_modulehq];
} foreach [west,east,resistance];

//--- Main mission flow
BIS_fnc_moduleMPTypeDefense_missionFlow = [_logic] execfsm BIS_fnc_moduleMPTypeDefense_missionFlowFSM;

if (isdedicated) then {["BIS_fnc_moduleMPTypeDefense"] call bis_fnc_endLoadingScreen;};
true