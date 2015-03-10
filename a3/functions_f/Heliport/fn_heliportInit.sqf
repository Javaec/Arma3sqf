disableserialization;

//////////////////////////////////////////////////////////////////////////////////////////

//--- Only on server
if (!isserver) exitwith {};


//--- Heliport already running - terminate
if (!isnil {missionnamespace getvariable worldname}) exitwith {"Heliport is already running" call bis_fnc_error};


//--- Init variables
_logic = _this select 0;
missionnamespace setvariable [worldname,_logic];


//--- Custom variables
_allowAmbientLife = [_logic getvariable "allowAmbientLife",0,true,[true]] call bis_fnc_param;
_allowSetDate = [_logic getvariable "allowSetDate",0,true,[true]] call bis_fnc_param;


//--- Wait for functions
waituntil {!isnil "bis_fnc_init"};
if (isnil "BIS_fnc_heliportInitDone") then {startloadingscreen ["","RscDisplayLoadCustom"]};


//--- Mission is procedural - init first
//if (isnull player) then {[] call bis_fnc_missionInit;};


//--- Global variables
hsim_playerName = [] call bis_fnc_playerName;
hsim_isCampaign = isclass (campaignconfigfile >> "campaign");
_isEditor = !isnull (finddisplay 26);

//--- Detect first campaign mission
_clearDB = false;
_initTurn = 0;
_initMoney = 0;
if (hsim_isCampaign) then {
	if (
		missionname
		==
		gettext (campaignconfigfile >> "campaign" >> (gettext (campaignconfigfile >> "campaign" >> "firstbattle")) >> "firstmission")
	) then {
		_clearDB = true;
		_initMoney = getnumber (configfile >> "cfgBase" >> worldname >> "initMoney");
	};
};

//--- Initialize heliport database (clear it in campaign's first mission)
_isDB = _clearDB call bis_fnc_heliportDBLoad;
_heliportTurn = [_initTurn] call BIS_fnc_heliportTurnAdd;
_heliportMoney = [_initMoney,false] call BIS_fnc_heliportMoneyAdd;

//--- Heliport object name space
hsim_heliportCurrent = worldname;
hsim_heliportLogic = missionnamespace getvariable worldname;
if (isnil "hsim_heliportLogic") then {hsim_heliportLogic = player;};


//--- Current mission
//hsim_heliportMissionConfig = campaignconfigfile >> "campaign" >> "missions" >> missionname;
hsim_heliportMission = [] call bis_fnc_heliportMission;


//--- Override mission name
_missionnamelocal = gettext (missionconfigfile >> "missionName");
if (_missionnamelocal != "") then {hsim_heliportMission = _missionnamelocal call bis_fnc_heliportMission};
if (isnil "hsim_heliportMission") then {hsim_heliportMission = missionname};


//--- Add factions
//[] call BIS_fnc_heliportFactionsAdd;


//--- Load no-fly zones (has to be loaded when player is not in heli yet)
[] call BIS_fnc_noFlyZonesCreate;


//--- Set date
if (_allowSetDate) then {
	_initDate = getarray (configfile >> "cfgBase" >> worldname >> "initDate");
	if (count _initDate == 0) then {
		_initDate = [2013,8,5,0,0];
		["initDate not set for CfgBase >> %1",worldname] call bis_fnc_error;
	};
	_hour = daytime;
	_minute = (_hour % 1) * 60;
	_hour = _hour - (_hour % 1);
	_day = (_initDate select 2) + _heliportTurn;
	setdate [_initDate select 0,_initDate select 1,_day,_hour,_minute];
};


if (missionname == worldname) then {

	//////////////////////////////////////////////////////////////////////////////////////////
	//--- Heliport specific settings
	//////////////////////////////////////////////////////////////////////////////////////////

	//--- Debug - select last completed mission
	if (distributionregion == 0 && ([] call BIS_fnc_heliportTurn) == 0 && hsim_playerName in ["Karel","Joris"]) then {
		_missionList = [];
		_cfgMissions = campaignconfigfile >> "Campaign" >> "Missions";
		for "_i" from 0 to (count _cfgMissions - 1) do {
			_current = _cfgMissions select _i;
			if (isclass _current) then  {
				_missionList = _missionList + [configname _current];
			};
		};
		if (count _missionList > 0) then {
			endloadingscreen;
			sleep 0.01;
			titletext ["","black in",10e10];
			_select = [_missionList,"DEBUG: Select last mission",0.5,true] call bis_fnc_guiMessage;
			titletext ["","black in",0];
			startloadingscreen ["","RscDisplayLoadCustom"];

			if (_select select 0) then {
				_configName = _missionList select (_select select 1);
				_dbAdd = [hsim_heliportDB,[worldname,"Missions",_configName,"config"],_configName] call BIS_fnc_dbValueSet;
			};
		};
	};

	//--- Create categories
	_listHeliports = [] call BIS_fnc_heliportGetHeliports;
	{
		[hsim_heliportDB,[_x],configfile >> "cfgbase" >> _x] call BIS_fnc_dbImportConfig;	
	} foreach _listHeliports;

	//--- Menu init
	_this call BIS_fnc_heliportMenuInit;

	//--- Check pending missions and finish the completed ones
	true call bis_fnc_heliportMissionEnd;

	//--- Unregister mission (before forced missions are calculated)
	_mission = [hsim_heliportDBCampaign,["mission"],""] call bis_fnc_dbValueReturn;
	if (_mission != "") then {
		[hsim_heliportDBCampaign,["mission"]] call bis_fnc_dbValueRemove;
	};

	//--- Add forced items
	[] call BIS_fnc_heliportAddForced;

	//--- Upgrade positions
	//_listLogics = position hsim_heliportLogic nearentities ["HeliportLogicUpgrade",50000];
	{
		if (typeof _x == "HeliportLogicUpgrade") then {
			_logicName = vehiclevarname _x;
			if (_logicName != "") then {
				_dbAdd = [hsim_heliportDB,[hsim_heliportCurrent,"UpgradePositions",_logicName,"position"],position _x] call BIS_fnc_dbValueSet;
				_dbAdd = [hsim_heliportDB,[hsim_heliportCurrent,"UpgradePositions",_logicName,"direction"],direction _x] call BIS_fnc_dbValueSet;
			};
		};
	} foreach (units hsim_heliportLogic);

	//[] spawn BIS_fnc_heliportMenuMain;
	[] call BIS_fnc_heliportStaffLoad;

	//--- Disable saving
	enablesaving [false,false];

} else {

	//////////////////////////////////////////////////////////////////////////////////////////
	//--- Mission specific settings
	//////////////////////////////////////////////////////////////////////////////////////////

	//--- Debug - not running from campaign
	if !(_isDB) then {

		//--- Upgrade positions
		_listUpgradePositions = [];
		_cfgMission = configfile >> "CfgBase" >> worldname >> "Mission" >> "Mission";

		_cfgGroups = _cfgMission >> "Groups";
		for "_g" from 0 to (count _cfgGroups - 1) do {
			_group = _cfgGroups select _g;
			if (isclass _group) then {
				_side = gettext (_group >> "side");
				if (_side == str sidelogic) then {
					_cfgVehicles = _group >> "vehicles";
					for "_v" from 0 to (count _cfgVehicles - 1) do {
						_vehicle = _cfgVehicles select _v;
						if (isclass _vehicle) then {
							_vehicleClass = gettext (_vehicle >> "vehicle");
							_text = gettext (_vehicle >> "text");
							if (_vehicleClass == "HeliportLogicUpgrade" && _text != "") then {
								_position = getarray (_vehicle >> "position");
								_position = [
									_position select 0,
									_position select 2,
									_position select 1
								];
								//_position set [2,(_position select 2) - getTerrainHeightASL _position];
								_position set [2,0];
								_azimut = getnumber (_vehicle >> "azimut");
								_dbAdd = [hsim_heliportDB,[worldname,"UpgradePositions",_text,"position"],_position] call BIS_fnc_dbValueSet;
								_dbAdd = [hsim_heliportDB,[worldname,"UpgradePositions",_text,"direction"],_azimut] call BIS_fnc_dbValueSet;
							};
						};
					};
				};
			};
		};

		[] call BIS_fnc_heliportAddForced;
	};

	[] call BIS_fnc_heliportStaffLoad;

	//--- Identify mission type
	_missionConfig = [] call BIS_fnc_singleMissionConfig;
	_isSingleMission = !isnil "_missionConfig";
	_isProcedural = if (_isSingleMission) then {

		//--- Single mission marked as procedural template
		getnumber (_missionConfig >> "templateProcedural") > 0
	} else {

		//--- Found in CfgBase missions
		_missionConfig = configfile >> "cfgBase" >> worldname >> "missions" >> hsim_heliportMission;
		isclass (configfile >> "cfgBase" >> worldname >> "missions" >> hsim_heliportMission)
	};
	_isEditor = !isnull (finddisplay 26);
	_isRegistred = [hsim_heliportDB,["missionspending",hsim_heliportMission]] call bis_fnc_dbClassCheck;

	//--- Debug - select mission manually
	if (distributionregion == 0) then {
		if (([] call bis_fnc_heliportMission == format ["Proc_%1",worldname])) then {
			_missionList = [];
			_missionListNames = [];
			_cfgMissions = configfile >> "cfgbase" >> worldname >> "missions";
			for "_i" from 0 to (count _cfgMissions - 1) do {
				_current = _cfgMissions select _i;
				if (isclass _current) then  {
					_missionList = _missionList + [configname _current];
					_missionListNames = _missionListNames + [_current call bis_fnc_displayname];
				};
			};
			if (count _missionList > 0) then {
				endloadingscreen;
				sleep 0.01;
				titletext ["","black in",10e10];
				_select = [_missionListNames,"DEBUG: Select procedural mission",0.5,true] call bis_fnc_guiMessage;
				titletext ["","black in",0];
				startloadingscreen ["","RscDisplayLoadCustom"];

				if (_select select 0) then {
					_configName = _missionList select (_select select 1);
					[hsim_heliportDB,["mission"],_configName] call bis_fnc_dbValueSet;
					hsim_heliportMission = _configName;

					//--- Overwite default values
					_missionConfig = _cfgMissions >> _configName;
					_isSingleMission = true;
					_isProcedural = true;
				};
			};
		};
	};

	//--- No mission found - TERMINATE
	if (_isProcedural && !isclass _missionConfig) exitwith {
		endloadingscreen;
		([] call bis_fnc_displayMission) closedisplay 2;
	};

	if (_isProcedural) then {

		////////////////////////
		//--- Procedural Mission

		//--- Create default helicopter
		_helicoptersDefault = getarray (_missionConfig >> "helicoptersDefault");
		_helicopterDefault = if (count _helicoptersDefault > 0) then {
			_helicoptersDefault call bis_fnc_selectrandom;
		} else {
			"Heli_Medium01_H"
		};
		hsim_heliportLogic setvariable ["hsim_helicopterDefault",_helicopterDefault];

		//--- Create helicopter (always default when in non-campaign procedural template)
		[_helicopterDefault,true,_isSingleMission || _isEditor || !_isRegistred] call BIS_fnc_heliportHeliAddMission;

		//--- Execute mission FSM
		_function = gettext (_missionConfig >> "function");
		if (_function == "") then {_function = format ["BIS_fnc_mission%1",configname _missionConfig]};
		hsim_missionflow = _function call bis_fnc_missionFlow;

		//--- Diary
		["mission" + hsim_heliportMission] call bis_fnc_missionInitDiary;
	} else {

		////////////////////////
		//--- Classic mission

		//--- Default helicopter
		_listSynchro = synchronizedobjects hsim_heliportLogic;
		_heliDefault = "";
		{
			if (_x iskindof "Helicopter") then {_heliDefault = _x};
		} foreach _listSynchro;
		_heliDefaultScript = hsim_heliportLogic getvariable "hsim_helicopterDefault";
		if (!isnil "_heliDefaultScript") then {_heliDefault = _heliDefaultScript};
		[_heliDefault,true,_isEditor || !_isRegistred] call BIS_fnc_heliportHeliAddMission;

		//--- Diary
		[hsim_heliportMission] call bis_fnc_missionInitDiary;
	};

	//--- Register to heliport
	if (_isSingleMission && !_isProcedural) then {
		_missionName = configname _missionConfig;
		_missionName call bis_fnc_heliportMission;
		_dbAdd = [hsim_heliportDB,["MissionsPending",_missionName,"config"],_missionConfig] call BIS_fnc_dbValueSet;
		_dbAdd = [hsim_heliportDB,["MissionsPending",_missionName,"world"],worldname] call BIS_fnc_dbValueSet;
		[] call bis_fnc_heliportMissionReward;
	};

	//--- Reset reward coeficient
	[1,true] call bis_fnc_heliportMissionReward;

	//--- Mission end
	addMissionEventHandler [
		"ended",
		{
			false call bis_fnc_heliportMissionEnd;
		}
	];
};

//////////////////////////////////////////////////////////////////////////////////////////
//--- Other
//////////////////////////////////////////////////////////////////////////////////////////

//--- Identities
#include "fn_heliportInitPersons.hpp"

//--- Load heliport compositions
[] call BIS_fnc_heliportUpgradesLoad;


//--- Load helicopters
if (hsim_heliportCurrent == worldname) then {
	[] call BIS_fnc_heliportHeliLoad;
};


//-- kb priorities
if (hsim_isCampaign || _isEditor || (getnumber (configfile >> "cfgmissions" >> "demo")) > 0) then {
	//--- Default, transitional and narrative
	[0,1,5,10] call bis_fnc_kbPriority;
} else {
	//--- Default only
	[0] call bis_fnc_kbPriority;
};


//--- kb fake actors
bis_fnc_kbTell_createDummy = true;


//--- Generic sentences
[] call bis_fnc_genericSentenceInit;


//--- Radio channels
#include "fn_heliportInitRadio.hpp"


//--- Waypoint ratings
bis_wpRating = 1;


//--- Mission fail when helicopter is destroyed
[] call bis_fnc_helicopterCanFly;


//--- Populate world
if (_allowAmbientLife) then {
	[] spawn BIS_fnc_ambientHelicopters;
	[] spawn BIS_fnc_ambientPlanes;
	[] spawn BIS_fnc_ambientBoats;
};


//--- Diary hints
player call bis_fnc_diaryHints;


//--- Mission end - save DB into profile
addMissionEventHandler [
	"ended",
	{
		startloadingscreen [""];

		//--- Save helicopter damage
		false call bis_fnc_heliportHeliDamage;

		//--- Save the DB
		[] call bis_fnc_heliportDBsave;

		endloadingscreen;
	}
];

//--- Execute custom heliport init
_init = gettext (configfile >> "cfgBase" >> worldname >> "init");
if (_init != "") then {
	[] execvm _init;
};


//--- PP world
[] call bis_fnc_ambientPostprocess;


//--- Misc settings
enableteamswitch false;


//--- Various debugs
if (distributionregion == 0) then {
	onmapsingleclick "
		if (_alt) then {
			_veh = vehicle player;
			_posZ = if (isengineon _veh && _veh != player) then {100} else {0};
			vehicle player setpos [_pos select 0,_pos select 1,_posZ];
		};
	";
};


//////////////////////////////////////////////////////////////////////////////////////////
BIS_fnc_heliportInitDone = true;

endloadingscreen;