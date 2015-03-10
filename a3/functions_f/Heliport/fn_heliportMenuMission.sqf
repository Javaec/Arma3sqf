/*%FSM<COMPILE "C:\BIS\fsmeditor\fsm2sqfCall.cfg, fn_heliportMenuMission">*/
/*%FSM<HEAD>*/
/*
item0[] = {"START",0,250,-100.000000,-200.000000,0.000000,-150.000000,0.000000,"START"};
item1[] = {"ERROR",8,218,25.000000,-200.000000,125.000000,-150.000000,-1.000000,"ERROR"};
item2[] = {"ERROR",1,250,150.000000,-200.000000,250.000000,-150.000000,0.000000,"ERROR"};
item3[] = {"ListHeliport",4,218,25.000000,-75.000000,125.000000,-25.000000,0.000000,"ListHeliport"};
item4[] = {"ListHeliport",1,250,150.000000,-75.000000,250.000000,-25.000000,0.000000,"ListHeliport"};
item5[] = {"ListCategories",4,218,25.000000,25.000000,125.000000,75.000000,0.000000,"ListCategories"};
item6[] = {"ListCategories",1,250,150.000000,25.000000,250.000000,75.000000,0.000000,"ListCategories"};
item7[] = {"ListItems",4,218,25.000000,125.000000,125.000000,175.000000,0.000000,"ListItems"};
item8[] = {"ListItems",1,250,150.000000,125.000000,250.000000,175.000000,0.000000,"ListItems"};
item9[] = {"INIT",4,218,25.000000,425.000000,125.000000,475.000000,0.000000,"INIT"};
item10[] = {"INIT",2,250,150.000000,425.000000,250.000000,475.000000,0.000000,"INIT"};
item11[] = {"",7,210,-54.000046,445.999878,-45.999950,454.000122,0.000000,""};
item12[] = {"true",8,218,275.000000,375.000000,375.000000,425.000000,0.000000,"true"};
item13[] = {"Refresh_the_list",1,250,400.000000,375.000000,500.000000,425.000000,0.000000,"Refresh" \n "the list"};
item14[] = {"",7,210,321.000000,445.999878,329.000000,454.000122,0.000000,""};
item15[] = {"ButtonBack",4,218,25.000000,250.000000,125.000000,300.000000,0.000000,"ButtonBack"};
item16[] = {"ButtonBack",1,250,150.000000,250.000000,250.000000,300.000000,0.000000,"ButtonBack"};
item17[] = {"ButtonOK",4,218,25.000000,325.000000,125.000000,375.000000,0.000000,"ButtonOK"};
item18[] = {"ButtonOK",2,4346,150.000000,325.000000,250.000000,375.000000,0.000000,"ButtonOK"};
item19[] = {"",7,210,-54.000000,271.000000,-45.999996,279.000000,0.000000,""};
item20[] = {"",7,210,-54.000015,345.999969,-45.999981,354.000061,0.000000,""};
item21[] = {"",7,210,321.000000,346.000000,329.000000,354.000031,0.000000,""};
item22[] = {"",7,210,-54.000000,146.000000,-46.000000,154.000015,0.000000,""};
item23[] = {"",7,210,-53.999996,45.999996,-46.000000,54.000004,0.000000,""};
item24[] = {"",7,210,-53.999996,-54.000000,-46.000000,-46.000000,0.000000,""};
link0[] = {0,1};
link1[] = {0,11};
link2[] = {0,19};
link3[] = {0,20};
link4[] = {0,22};
link5[] = {0,23};
link6[] = {0,24};
link7[] = {1,2};
link8[] = {3,4};
link9[] = {5,6};
link10[] = {7,8};
link11[] = {9,10};
link12[] = {10,14};
link13[] = {11,9};
link14[] = {12,13};
link15[] = {14,12};
link16[] = {15,16};
link17[] = {17,18};
link18[] = {18,21};
link19[] = {19,15};
link20[] = {20,17};
link21[] = {21,12};
link22[] = {22,7};
link23[] = {23,5};
link24[] = {24,3};
globals[] = {25.000000,1,0,0,16777215,640,480,1,36,6316128,1,-34.689938,462.752228,473.494324,-237.476379,397,925,1};
window[] = {2,-1,-1,-1,-1,987,240,1361,240,3,414};
*//*%FSM</HEAD>*/
private ["_state", "_finalStateArray"];
/*%FSM<PRIVATEVARIABLES>*/
#define MENU_CLASS	"RscDisplayHeliportMission"
#define MENU_CONFIG	BIS_fnc_heliportMenuMission_config
#define MENU_PATH	BIS_fnc_heliportMenuMission_class
#define MENU_TOGGLE	(BIS_fnc_heliportMenuMission_toggle select 0)
#define DISPLAY		(uinamespace getvariable MENU_CLASS)
#define CONTROL		(DISPLAY displayctrl _idc)

private [
	"_this",
	"_mode",
	"_input",
	"_idc",
	"_lbId",
	"_heliport",
	"_factionCategory",
	"_varProcedural"
];
/*%FSM</PRIVATEVARIABLES>*/
_state="START";
_finalStateArray = ["ERROR", "ListHeliport", "ListCategories", "ListItems", "Refresh_the_list", "ButtonBack"];
while {!(_state in _finalStateArray)} do
{
  switch (_state) do
  {
  /*%FSM<STATE "START">*/
  case ("START"):
  {
    /*%FSM<STATEINIT>*/
    if (typename _this == typename "") then {_this = ["init",_this]};

    if (count _this == 0) then {_this = ["",-1];};
    if (count _this == 1) then {_this = _this + [""];};

    _mode = _this select 0;
    _input = _this select 1;

    _varProcedural = "%procedural";
    /*%FSM</STATEINIT>*/
    switch(true) do
    {
      /*%FSM<LINK "INIT">*/
      case (call {/*%FSM<CONDITION>*/
      _mode == "INIT"
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "INIT";
      };
      /*%FSM</LINK>*/
      /*%FSM<LINK "ButtonBack">*/
      case (call {/*%FSM<CONDITION>*/
      _mode == "ButtonBack"
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "ButtonBack";
      };
      /*%FSM</LINK>*/
      /*%FSM<LINK "ButtonOK">*/
      case (call {/*%FSM<CONDITION>*/
      _mode == "ButtonOK"
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "ButtonOK";
      };
      /*%FSM</LINK>*/
      /*%FSM<LINK "ListItems">*/
      case (call {/*%FSM<CONDITION>*/
      _mode == "ListItems"
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "ListItems";
      };
      /*%FSM</LINK>*/
      /*%FSM<LINK "ListCategories">*/
      case (call {/*%FSM<CONDITION>*/
      _mode == "ListCategories"
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "ListCategories";
      };
      /*%FSM</LINK>*/
      /*%FSM<LINK "ListHeliport">*/
      case (call {/*%FSM<CONDITION>*/
      _mode == "ListHeliport"
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "ListHeliport";
      };
      /*%FSM</LINK>*/
      /*%FSM<LINK "ERROR">*/
      case (call {/*%FSM<CONDITION>*/
      true
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "ERROR";
      };
      /*%FSM</LINK>*/
      };
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "INIT">*/
  case ("INIT"):
  {
    /*%FSM<STATEINIT>*/
    createdialog MENU_CLASS;
    waituntil {!isnil {DISPLAY}};

    startloadingscreen [""];

    if (isnil "BIS_fnc_heliportMenuMission_toggle") then {
    	BIS_fnc_heliportMenuMission_toggle = [0,0,0,0];
    };

    //--- Custom mission
    _missionDefaultTerrain = "";
    _missionDefaultFaction = -1;
    _missionDefault = [_this,1,"",[""]] call bis_fnc_param;
    if (_missionDefault != "") then {
    	_missionDefaultCfg = campaignconfigfile >> "campaign" >> "missions" >> _missionDefault;
    	if (isclass _missionDefaultCfg) then {
    		_missionDefaultTerrain = gettext (_missionDefaultCfg >> "terrain");
    		_missionDefaultFaction = getnumber (_missionDefaultCfg >> "faction");
    		BIS_fnc_heliportMenuMission_toggle set [1,_missionDefaultTerrain];
    		BIS_fnc_heliportMenuMission_toggle set [2,str _missionDefaultFaction];
    		BIS_fnc_heliportMenuMission_toggle set [3,_missionDefault];
    	} else {
    		["Mission '%1' not found in campaignConfigFile.",_missionDefault] call bis_fnc_error;
    	};
    };

    //--- Dialog IDC
    BIS_fnc_heliportMenuMission_config = [MENU_CLASS] call BIS_fnc_heliportDialogInit;
    BIS_fnc_heliportMenuMission_class = "Missions";

    //--- Money
    [true] spawn BIS_fnc_heliportMoneyDisplay;

    //--- Header
    _idc = ([MENU_CONFIG,"textHeader"] call BIS_fnc_getIDC);
    CONTROL ctrlsetstructuredtext parsetext "<t size='1.4'>Contracts</t>";

    //--- Listbox - Heliports
    _idc = ([MENU_CONFIG,"ListHeliport"] call BIS_fnc_getIDC);
    _lbId = [CONTROL,_missionDefaultTerrain] call BIS_fnc_heliportListboxHeliports;
    CONTROL lbsetcursel _lbId;
    CONTROL ctrladdeventhandler ["LBSelChanged","_this call BIS_fnc_heliportMenuMission_lbHeliport;"];

    //--- Execute
    {
    	_idc = ([MENU_CONFIG,_x] call BIS_fnc_getIDC);
    	CONTROL ctrladdeventhandler [
    		"LBSelChanged",
    		format ["['%1',_this] call BIS_fnc_heliportMenuMission;",_x]
    	];
    } foreach [
    	"ListCategories",
    	"ListItems",
    	"ListHeliport"
    ];

    {
    	_idc = ([MENU_CONFIG,_x] call BIS_fnc_getIDC);
    	CONTROL buttonsetaction format ["['%1',-1] spawn BIS_fnc_heliportMenuMission;",_x];
    } foreach [
     	"ButtonOK",
    	"ButtonBack",
    	"ButtonToggle"
    ];

    //--- Double click
    _idc = ([MENU_CONFIG,"ListItems"] call BIS_fnc_getIDC);
    CONTROL ctrladdeventhandler ["LBDblClick","['ButtonOK',-1] spawn BIS_fnc_heliportMenuMission;"];

    /*
    _idc = ([MENU_CONFIG,"ButtonToggle"] call BIS_fnc_getIDC);
    CONTROL ctrlsetfade 1;
    CONTROL ctrlcommit 0;
    */
    /*%FSM</STATEINIT>*/
    switch(true) do
    {
      /*%FSM<LINK "true">*/
      case (call {/*%FSM<CONDITION>*/
      true
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "Refresh_the_list";
      };
      /*%FSM</LINK>*/
      };
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "ButtonOK">*/
  case ("ButtonOK"):
  {
    /*%FSM<STATEINIT>*/
    //--- Read heliport
    _idc = ([MENU_CONFIG,"ListHeliport"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _heliport = CONTROL lbdata _lbId;

    //--- Read item
    _idc = ([MENU_CONFIG,"ListItems"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _isOwned = CONTROL lbvalue _lbId;

    _item = BIS_fnc_heliportMenuMission_listConfigs select _lbId;
    _price = getnumber (_item >> "price");
    _terrain = gettext (_item >> "terrain");
    _faction = getnumber (_item >> "faction");
    _configName = configname _item;

    if (_isOwned >= 0) then {

    	//--- Start the mission
    	_idc = ([MENU_CONFIG,"ListHeliport"] call BIS_fnc_getIDC);
    	_lbId = lbcursel CONTROL;
    	_heliport = CONTROL lbdata _lbId;

    	//--- Check helicopter requirements (when doesn't met, display selection menu)
    	_selectHeli = [_heliport,"player",_item] call BIS_fnc_heliportMenuHeliList;

    	if (_selectHeli != "") then {

    		//--- Start mission
    		[_configName,_heliport] spawn bis_fnc_heliportMissionStart;
    		startloadingscreen [""];
    		_finalStateArray = [_state];
    		(finddisplay 3001) closedisplay 1701;
    		cuttext ["","black in",999];

    	} else {
    		_selectHeliLater = [
    			localize "STR_HSIM_BIS_fnc_heliportMenuMission_Assign"
    		] call BIS_fnc_guiMessage;
    	};

    } else {

    	//--- Show requirements

    	_required = [_item,true] call BIS_fnc_heliportMissionRequired;
    	_requiredHelicopters = _required select 1;
    	_requiredHelicopterUpgrades = _required select 2;

    	_text = "";
    	_brCount = 0;
    	_fnc_br = {_text = _text + "<br />"; _brCount = _brCount + 1;};
    	_fnc_readTags = {
    		private ["_text","_tag"];
    		_text = "";
    		{
    			if (typename _x == typename "") then {_x = [_x]};
    			{
    				_tag = configfile >> "cfgBase" >> _heliport >> "tags" >> _x;
    				if (isclass _tag) then {
    					_tag = _tag call bis_fnc_displayname;
    					if (_forEachIndex > 0) then {
    						_text = _text + " or "
    					} else {
    						_text = _text + "<img image='hsim\UI_H\data\icons\menu\arrow.paa' /> "
    					};
    					_text = _text + _tag;
    				};
    			} foreach _x;
    			[] call _fnc_br;
    		} foreach _this;
    		_text
    	};


    	_text = "";
    	if (count _requiredHelicopters > 0) then {
    		_text = _text + "<t size='1.2'>" + localize "STR_HSIM_BIS_fnc_heliportMenuMission_RequiredHelicopters" + "</t>";
    		[] call _fnc_br;
    		_text = _text + (_requiredHelicopters call _fnc_readTags);
    	};
    	if (count _requiredHelicopterUpgrades > 0) then {
    		[] call _fnc_br;
    		_text = _text + "<t size='1.2'>" + localize "STR_HSIM_BIS_fnc_heliportMenuMission_RequiredComponents" + "</t>";
    		[] call _fnc_br;
    		_text = _text + (_requiredHelicopterUpgrades call _fnc_readTags);
    	};
    	[
    		_text,
    		localize "STR_HSIM_BIS_fnc_heliportMenuMission_RequiredContracts",
    		((1 / 1.2 * (safezoneW / safezoneH)) / 20) * (_brCount + 2)
    	] call bis_fnc_guiMessage;
    };
    /*%FSM</STATEINIT>*/
    switch(true) do
    {
      /*%FSM<LINK "true">*/
      case (call {/*%FSM<CONDITION>*/
      true
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "Refresh_the_list";
      };
      /*%FSM</LINK>*/
      };
  };
  /*%FSM</STATE>*/
  };
};
switch (_state) do
{
  /*%FSM<STATE "ERROR">*/
  case ("ERROR"):
  {
    /*%FSM<STATEINIT>*/
    debuglog ["Log::::::::::::::::ERROR",_this];
    /*%FSM</STATEINIT>*/
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "ListHeliport">*/
  case ("ListHeliport"):
  {
    /*%FSM<STATEINIT>*/
    //--- Read heliport
    _idc = ([MENU_CONFIG,"ListHeliport"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    if (_lbId < 0) exitwith {
    	//--- Terminate FSM
    	_finalStateArray = [_state];
    };
    BIS_fnc_heliportMenuMission_toggle set [1,_lbId];
    _heliport = CONTROL lbdata _lbId;

    _idc = ([MENU_CONFIG,"ListItems"] call BIS_fnc_getIDC);
    lbclear CONTROL;

    _idc = ([MENU_CONFIG,"ListCategories"] call BIS_fnc_getIDC);
    lbclear CONTROL;

    _cfgFactions = configfile >> "CfgBase" >> _heliport >> "Factions";
    for "_i" from 0 to (count _cfgFactions - 1) do {
    	_item = _cfgFactions select _i;
    	if (isclass _item) then {
    		_displayName = gettext (_item >> "displayname");
    		_id = getnumber (_item >> "id");
    		_image = gettext (_item >> "image");
    		_show = gettext (_item >> "show");

    		if (_show == "") then {_show = "true"};

    		if (call compile _show) then {
    			_lbId = CONTROL lbadd _displayName;
    			CONTROL lbsetvalue [_lbId,_id];
    			CONTROL lbsetpicture [_lbId,_image];

    			//--- Default category
    			_toggleCategory = BIS_fnc_heliportMenuMission_toggle select 2;
    			if (typename _toggleCategory == typename "") then {
    				if (_id == parsenumber _toggleCategory) then {
    					BIS_fnc_heliportMenuMission_toggle set [2,_lbId];
    				};
    			};
    		};
    	};
    };

    if (typename (BIS_fnc_heliportMenuMission_toggle select 2) == typename "") then {BIS_fnc_heliportMenuMission_toggle set [2,0];};
    CONTROL lbsetcursel (BIS_fnc_heliportMenuMission_toggle select 2);
    /*%FSM</STATEINIT>*/
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "ListCategories">*/
  case ("ListCategories"):
  {
    /*%FSM<STATEINIT>*/
    _idc = ([MENU_CONFIG,"ListHeliport"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _heliport = CONTROL lbdata _lbId;
    _cfgHeliport = configfile >> "CfgBase" >> _heliport >> "Missions";

    //--- Read category
    _idc = ([MENU_CONFIG,"ListCategories"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    if (_lbId < 0) exitwith {
    	//--- Terminate FSM
    	_finalStateArray = [_state];
    };
    _factionCategory = CONTROL lbvalue _lbId;

    //--- Default menu selection
    BIS_fnc_heliportMenuMission_listMissions = [];
    _idc = ([MENU_CONFIG,"ListItems"] call BIS_fnc_getIDC);
    lbclear CONTROL;
    BIS_fnc_heliportMenuMission_toggle set [2,_lbId];

    BIS_fnc_heliportMenuMission_listConfigs = [];

    //--- New
    {
    	_cfgMissions = _x select 0;
    	_procedural = _x select 1;

    	_lbId = [
    		CONTROL,
    		_cfgMissions,
    		[_heliport,MENU_PATH],

    		//--- Enable condition
    		{

    			_item = _this;

    			BIS_fnc_heliportMenuMission_listConfigs set [
    				count BIS_fnc_heliportMenuMission_listConfigs,
    				_item
    			];

    			//--- Required components
    			_required = [_item] call BIS_fnc_heliportMissionRequired;
    			_requiredHelicopters = _required select 1;
    			_requiredHelicopterUpgrades = _required select 2;

    			//--- Developer's cheat
    			if (!isnil "hsim_cheatCAMPAIGN") then {
    				_requiredMissions = true;
    				_requiredHelicopters = true;
    				_requiredHelicopterUpgrades = true;
    				_show = "true";
    				_enable = "true";
    			};
    			_requiredHelicopters && _requiredHelicopterUpgrades
    		},

    		//--- Show condition
    		{
    			_item = _this;
    			_configName = configname _item;
    			_displayName = _item call bis_fnc_displayName;
    			_terrain = gettext (_item >> "terrain");
    			_faction = getnumber (_item >> "faction");
    			_templateProcedural = getnumber (_item >> "templateProcedural");
    			_repeat = getnumber (_item >> "repeat");

    			//--- Default values
    			if (_scope == 0) then {_scope = 2;};

    			//--- Already owned
    			//_isOwned = [hsim_heliportDB,[_heliport,MENU_PATH,_configName]] call BIS_fnc_dbClassCheck;
    			_isOwned = _configName in BIS_heliportMissionsCompleted;

    			//--- Procedural mission override
    			if (_procedural == 1) then {
    				_terrain = _varProcedural;
    				if (_repeat == 1) then {_isOwned = false;};
    			};

    			//--- Required missions
    			_required = [_item] call BIS_fnc_heliportMissionRequired;
    			_requiredMissions = _required select 0;

    			//--- Evaluate
    			_requiredMissions
    			&&
    			//--- On same terrain (or procedural)
    			(_terrain == _heliport || _terrain == _varProcedural)
    			&&
    			//--- Belongs to current category
    			_faction == _factionCategory
    			&&
    			//--- Not a procedural template
    			_templateProcedural == 0
    			&&
    			//--- Not a heliport
    			_configName != _heliport
    		}
    	] call bis_fnc_heliportMenuItem;
    } foreach [

    	//--- Campaign missions
    	[campaignconfigfile >> "campaign" >> "missions",0],

    	//--- Procedural missions
    	[configfile >> "cfgbase" >> worldname >> "missions",1]
    ];


    //--- Selection
    if (typename (BIS_fnc_heliportMenuMission_toggle select 3) == typename "") then {
    	BIS_fnc_heliportMenuMission_toggle set [3,0];
    };
    CONTROL lbsetcursel (BIS_fnc_heliportMenuMission_toggle select 3);
    /*%FSM</STATEINIT>*/
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "ListItems">*/
  case ("ListItems"):
  {
    /*%FSM<STATEINIT>*/
    _lbId = _input select 1;
    if (_lbId < 0) exitwith {
    	//--- No items - display nothing
    	_idc = ([MENU_CONFIG,"TextDescriptionHeader"] call BIS_fnc_getIDC);
    	CONTROL ctrlsetstructuredtext parsetext "";
    	//_idc = ([MENU_CONFIG,"TextDescriptionPrice"] call BIS_fnc_getIDC);
    	//CONTROL ctrlsetstructuredtext parsetext "";
    	_idc = ([MENU_CONFIG,"TextDescription"] call BIS_fnc_getIDC);
    	CONTROL ctrlsetstructuredtext parsetext "";
    	_idc = ([MENU_CONFIG,"ButtonOK"] call BIS_fnc_getIDC);
    	CONTROL ctrlenable false;

    	//--- Terminate FSM
    	_finalStateArray = [_state];
    };
    BIS_fnc_heliportMenuMission_toggle set [3,_lbId];

    //--- Read heliport
    _idc = ([MENU_CONFIG,"ListHeliport"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _heliport = CONTROL lbdata _lbId;
    _cfgHeliport = configfile >> "CfgBase" >> _heliport >> "Missions";

    //--- Read category
    _idc = ([MENU_CONFIG,"ListCategories"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _factionCategory = CONTROL lbvalue _lbId;

    //--- Read item
    _idc = ([MENU_CONFIG,"ListItems"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    //_item = CONTROL lbdata _lbId;
    _item = BIS_fnc_heliportMenuMission_listConfigs select _lbId;
    _isOwned = CONTROL lbvalue _lbId;
    _displayName = _item call bis_fnc_displayName;
    _libTextDesc = gettext (_item >> "libTextDesc");
    _enable = [_item,"enable",false] call bis_fnc_heliportCondition;
    _enableText = gettext (_item >> "enableText");
    _price = getnumber (_item >> "price");
    _repeat = getnumber (_item >> "repeat");
    _logo = gettext (_item >> "overviewLogo");
    _logoColor = gettext (_item >> "overviewLogoColor");

    //--- Item name
    _idc = ([MENU_CONFIG,"TextDescriptionHeader"] call BIS_fnc_getIDC);
    //CONTROL ctrlsettext _displayName;
    CONTROL ctrlsetstructuredtext parsetext ("<t align='left' size='1.4'>" + _displayName + "</t>");

    //--- Price
    _idc = ([MENU_CONFIG,"TextDescriptionPrice"] call BIS_fnc_getIDC);
    if (_isOwned <= 0 || _repeat > 0) then {
    	_textReason = if (call compile _enable) then {""} else {_enableText};
    	_textReason = format ["<t align='right'>%1</t>",_textReason];
    	CONTROL ctrlsetstructuredtext parsetext _textReason;
    } else {
    	CONTROL ctrlsetstructuredtext parsetext "";
    };

    //--- Default mission info
    _configname = configname _item;
    if (_libTextDesc == "") then {

    	_libTextDesc = format ["STR_HSim_%1_desc",_configname];
    	if !(_libTextDesc call bis_fnc_islocalized) then {
    		_libTextDesc = format ["STR_HSim_mission%1_desc",_configname];
    		if !(_libTextDesc call bis_fnc_islocalized) exitwith {
    			_libTextDesc = "";
    		};
    	};
    	_libTextDesc = localize _libTextDesc;
    };


    //--- Display mission logo
    if (_logo != "") then {
    	if (_logoColor == "") then {_logoColor = "#ffffff";};
    	_libTextDesc = format ["<img image='%1' color='%2' size='5' shadow='0' align='right' />",_logo,_logoColor] + _libTextDesc;
    };

    //--- Display mission info
    _idc = ([MENU_CONFIG,"TextDescription"] call BIS_fnc_getIDC);
    CONTROL ctrlsetstructuredtext parsetext format ["<t align='left' size='1'>%1</t>",_libTextDesc];
    CONTROL call bis_fnc_ctrltextheight;

    //--- Change 'Confirm' button description
    _idc = ([MENU_CONFIG,"ButtonOK"] call BIS_fnc_getIDC);
    _text = "";
    if (_isOwned < 0) then {
    	_text = format ["<t color='#ffffff'>%1<t align='right' color='#66ffffff'>$%2</t></t>",localize "str_hsim_bis_fnc_heliportmenumission_requirements",abs _price];
    } else {
    	if (_isOwned > 0) then {
    		if (_repeat > 0) then {
    		_text = format ["<t color='#cc33ff33'>%1<t align='right'>$%2</t></t>",localize "STR_DISP_CAMPAIGN_REPLAY",(abs _price) call bis_fnc_numbertext];
    		} else {
    			_text = format ["<t color='#cc33ff33'>%1</t>",localize "STR_DISP_CAMPAIGN_REPLAY"];
    		};
    	} else {
    		_text = format ["<t color='#cc33ff33'>%1<t align='right'>$%2</t></t>",localize "STR_SINGLE_PLAY",(abs _price) call bis_fnc_numbertext];
    	};
    };
    CONTROL ctrlsetstructuredtext parsetext _text;
    /*%FSM</STATEINIT>*/
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "Refresh_the_list">*/
  case ("Refresh_the_list"):
  {
    /*%FSM<STATEINIT>*/
    startloadingscreen [""];

    _idc = ([MENU_CONFIG,"ListHeliport"] call BIS_fnc_getIDC);
    ["ListHeliport",[CONTROL,(BIS_fnc_heliportMenuMission_toggle select 1)]] call BIS_fnc_heliportMenuMission;

    endloadingscreen;
    /*%FSM</STATEINIT>*/
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "ButtonBack">*/
  case ("ButtonBack"):
  {
    /*%FSM<STATEINIT>*/
    [MENU_CLASS] spawn BIS_fnc_heliportDialogExit;
    /*%FSM</STATEINIT>*/
  };
  /*%FSM</STATE>*/
};
/*%FSM</COMPILE>*/