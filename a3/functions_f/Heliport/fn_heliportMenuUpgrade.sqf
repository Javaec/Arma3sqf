/*%FSM<COMPILE "C:\BIS\fsmeditor\fsm2sqfCall.cfg, fn_heliportMenuUpgrade">*/
/*%FSM<HEAD>*/
/*
item0[] = {"START",0,4346,-175.000000,-250.000000,-75.000000,-200.000000,0.000000,"START"};
item1[] = {"INIT",4,218,-50.000000,650.000000,50.000000,700.000000,0.000000,"INIT"};
item2[] = {"INIT",2,250,75.000000,650.000000,175.000000,700.000000,0.000000,"INIT"};
item3[] = {"ListHeliport",4,218,-50.000000,-125.000000,50.000000,-75.000000,0.000000,"ListHeliport"};
item4[] = {"ListHeliport",2,250,75.000000,-150.000000,175.000000,-50.000000,0.000000,"ListHeliport"};
item5[] = {"ListCategories",4,218,-50.000000,0.000000,50.000000,50.000000,0.000000,"ListCategories"};
item6[] = {"ListCategories",2,250,75.000000,-25.000000,175.000000,75.000000,0.000000,"ListCategories"};
item7[] = {"ListItems",4,218,-50.000000,125.000000,50.000000,175.000000,0.000000,"ListItems"};
item8[] = {"ListItems",1,250,575.000000,100.000000,675.000000,200.000000,0.000000,"ListItems"};
item9[] = {"ButtonToggle",4,218,-50.000000,325.000000,50.000000,375.000000,0.000000,"ButtonToggle"};
item10[] = {"ButtonToggle",2,250,75.000000,325.000000,175.000000,375.000000,0.000000,"ButtonToggle"};
item11[] = {"ButtonBack",4,218,-50.000000,250.000000,50.000000,300.000000,0.000000,"ButtonBack"};
item12[] = {"ButtonBack",1,250,75.000000,250.000000,175.000000,300.000000,0.000000,"ButtonBack"};
item13[] = {"ButtonOK",4,218,-50.000000,400.000000,50.000000,450.000000,0.000000,"ButtonOK"};
item14[] = {"ButtonOK",2,250,75.000000,400.000000,175.000000,450.000000,0.000000,"ButtonOK"};
item15[] = {"___1",4,218,200.000000,-150.000000,300.000000,-100.000000,0.000000,"0"};
item16[] = {"__",4,218,200.000000,-100.000000,300.000000,-50.000000,0.000000,"1"};
item17[] = {"Current",2,250,325.000000,-100.000000,425.000000,-50.000000,0.000000,"Current"};
item18[] = {"New",2,250,325.000000,-150.000000,425.000000,-100.000000,0.000000,"New"};
item19[] = {"True",8,218,450.000000,-125.000000,550.000000,-75.000000,0.000000,"True"};
item20[] = {"ListHeliport_1",1,250,575.000000,-150.000000,675.000000,-50.000000,0.000000,"ListHeliport"};
item21[] = {"___1",4,218,200.000000,-25.000000,300.000000,25.000000,0.000000,"0"};
item22[] = {"__",4,218,200.000000,25.000000,300.000000,75.000000,0.000000,"1"};
item23[] = {"Current_1",2,250,325.000000,25.000000,425.000000,75.000000,0.000000,"Current"};
item24[] = {"New_1",2,250,325.000000,-25.000000,425.000000,25.000000,0.000000,"New"};
item25[] = {"True",8,218,450.000000,0.000000,550.000000,50.000000,0.000000,"True"};
item26[] = {"ListCategories_1",1,250,575.000000,-25.000000,675.000000,75.000000,0.000000,"ListCategories"};
item27[] = {"ERROR",4,218,-50.000000,-250.000000,50.000000,-200.000000,0.000000,"ERROR"};
item28[] = {"ERROR",1,250,75.000000,-250.000000,175.000000,-200.000000,0.000000,"ERROR"};
item29[] = {"",7,210,-129.000046,670.999939,-120.999947,679.000061,0.000000,""};
item30[] = {"",7,210,-129.000000,-104.000000,-121.000000,-96.000000,0.000000,""};
item31[] = {"",7,210,-129.000000,21.000000,-121.000000,29.000000,0.000000,""};
item32[] = {"",7,210,-128.999939,146.000000,-121.000061,154.000000,0.000000,""};
item33[] = {"",7,210,-129.000000,346.000000,-121.000008,354.000000,0.000000,""};
item34[] = {"",7,210,-129.000000,271.000000,-121.000000,279.000000,0.000000,""};
item35[] = {"",7,210,-129.000015,420.999969,-120.999977,429.000031,0.000000,""};
item36[] = {"true",8,218,200.000000,725.000000,300.000000,775.000000,0.000000,"true"};
item37[] = {"Refresh_the_list",1,250,325.000000,725.000000,425.000000,775.000000,0.000000,"Refresh" \n "the list"};
item38[] = {"",7,210,246.000015,670.999939,254.000000,679.000061,0.000000,""};
item39[] = {"",7,210,245.999985,346.000000,254.000000,354.000000,0.000000,""};
item40[] = {"",7,210,245.999985,421.000000,254.000000,429.000000,0.000000,""};
item41[] = {"___1",4,218,200.000000,100.000000,300.000000,150.000000,1.000000,"0"};
item42[] = {"__",4,218,200.000000,150.000000,300.000000,200.000000,1.000000,"1"};
item43[] = {"Current_2",2,250,325.000000,150.000000,425.000000,200.000000,0.000000,"Current"};
item44[] = {"New_2",2,250,325.000000,100.000000,425.000000,150.000000,0.000000,"New"};
item45[] = {"True",8,218,450.000000,125.000000,550.000000,175.000000,0.000000,"True"};
item46[] = {"ListItems_1",2,250,75.000000,100.000000,175.000000,200.000000,0.000000,"ListItems"};
link0[] = {0,27};
link1[] = {0,29};
link2[] = {0,30};
link3[] = {0,31};
link4[] = {0,32};
link5[] = {0,33};
link6[] = {0,34};
link7[] = {0,35};
link8[] = {1,2};
link9[] = {2,38};
link10[] = {3,4};
link11[] = {4,15};
link12[] = {4,16};
link13[] = {5,6};
link14[] = {6,21};
link15[] = {6,22};
link16[] = {7,46};
link17[] = {9,10};
link18[] = {10,39};
link19[] = {11,12};
link20[] = {13,14};
link21[] = {14,40};
link22[] = {15,18};
link23[] = {16,17};
link24[] = {17,19};
link25[] = {18,19};
link26[] = {19,20};
link27[] = {21,24};
link28[] = {22,23};
link29[] = {23,25};
link30[] = {24,25};
link31[] = {25,26};
link32[] = {27,28};
link33[] = {29,1};
link34[] = {30,3};
link35[] = {31,5};
link36[] = {32,7};
link37[] = {33,9};
link38[] = {34,11};
link39[] = {35,13};
link40[] = {36,37};
link41[] = {38,36};
link42[] = {39,36};
link43[] = {40,36};
link44[] = {41,44};
link45[] = {42,43};
link46[] = {43,45};
link47[] = {44,45};
link48[] = {45,8};
link49[] = {46,41};
link50[] = {46,42};
globals[] = {25.000000,1,0,0,16777215,640,480,1,51,6316128,1,-198.405991,151.635010,441.423462,-423.100922,364,899,1};
window[] = {2,-1,-1,-1,-1,905,-1223,-263,156,3,381};
*//*%FSM</HEAD>*/
private ["_state", "_finalStateArray"];
/*%FSM<PRIVATEVARIABLES>*/
#define MENU_CLASS	"RscDisplayHeliportUpgrade"
#define MENU_CONFIG	BIS_fnc_heliportMenuUpgrade_config
#define MENU_PATH	BIS_fnc_heliportMenuUpgrade_class
#define MENU_TOGGLE	(BIS_fnc_heliportMenuUpgrade_toggle select 0)
#define DISPLAY	(uinamespace getvariable MENU_CLASS)
#define CONTROL	(DISPLAY displayctrl _idc)


private [
"_mode",
"_input",
"_idc",
"_lbId",
"_heliport",
"_category",
"_cfgCategory",
"_upgrade",
"_logic",
"_isFreeSlot",

"_path",
"_displayName",
"_libTextDesc",
"_scope",
"_show",
"_enable",
"_enableText",
"_forced",
"_price",
"_positions",
"_composition"
];
/*%FSM</PRIVATEVARIABLES>*/
_state="START";
_finalStateArray = ["ListItems", "ButtonBack", "ListHeliport_1", "ListCategories_1", "ERROR", "Refresh_the_list"];
while {!(_state in _finalStateArray)} do
{
  switch (_state) do
  {
  /*%FSM<STATE "START">*/
  case ("START"):
  {
    /*%FSM<STATEINIT>*/
    if (count _this == 0) then {_this = ["",-1];};
    if (count _this == 1) then {_this = _this + [-1];};

    _mode = _this select 0;
    _input = _this select 1;

    [] call bis_fnc_heliportMenuPreview;
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
      /*%FSM<LINK "ListItems">*/
      case (call {/*%FSM<CONDITION>*/
      _mode == "ListItems"
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "ListItems_1";
      };
      /*%FSM</LINK>*/
      /*%FSM<LINK "ButtonToggle">*/
      case (call {/*%FSM<CONDITION>*/
      _mode == "ButtonToggle"
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "ButtonToggle";
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
      /*%FSM<LINK "ERROR">*/
      case (call {/*%FSM<CONDITION>*/
      _mode == ""
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

    DISPLAY displayaddeventhandler ["unload","
    	BIS_fnc_heliportMenuUpgrade_camera cameraeffect ['terminate','back']; camdestroy BIS_fnc_heliportMenuUpgrade_camera;
    	if (!isnil 'BIS_fnc_heliportMenuUpgrade_preview') then {
    		{
    			deletevehicle _x;
    		} foreach BIS_fnc_heliportMenuUpgrade_preview;
    	};
    "];

    //--- Dialog IDC
    BIS_fnc_heliportMenuUpgrade_config = [MENU_CLASS] call BIS_fnc_heliportDialogInit;
    BIS_fnc_heliportMenuUpgrade_class = "Upgrades";
    if (isnil "BIS_fnc_heliportMenuUpgrade_toggle") then {
    	BIS_fnc_heliportMenuUpgrade_toggle = [0,0,0,0]
    };

    //--- Money
    call BIS_fnc_heliportMoneyDisplay;

    //--- Header
    _idc = ([MENU_CONFIG,"textHeader"] call BIS_fnc_getIDC);
    CONTROL ctrlsetstructuredtext parsetext "<t size='1.4'>Upgrades</t>";

    //--- Listbox - Heliports
    _idc = ([MENU_CONFIG,"ListHeliport"] call BIS_fnc_getIDC);
    CONTROL call BIS_fnc_heliportListboxHeliports;
    CONTROL lbsetcursel (BIS_fnc_heliportMenuUpgrade_toggle select 1);

    //--- Camera
    _camera = "camera" camcreate [
    	(position hsim_heliportLogic select 0),
    	(position hsim_heliportLogic select 1),
    	30
    ];
    _camera cameraeffect ["internal","back"];
    _camera campreparetarget player;
    _camera camcommitprepared 0;
    BIS_fnc_heliportMenuUpgrade_camera = _camera;
    showcinemaborder false;

    //--- Execute
    {
    	_idc = ([MENU_CONFIG,_x] call BIS_fnc_getIDC);
    	CONTROL ctrladdeventhandler [
    		"LBSelChanged",
    		format ["['%1',_this] call BIS_fnc_heliportMenuUpgrade;",_x]
    	];
    } foreach [
    	"ListCategories",
    	"ListItems",
    	"ListHeliport"
    ];

    {
    	_idc = ([MENU_CONFIG,_x] call BIS_fnc_getIDC);
    	CONTROL buttonsetaction format ["['%1',-1] call BIS_fnc_heliportMenuUpgrade;",_x];
    } foreach [
     	"ButtonOK",
    	"ButtonBack",
    	"ButtonToggle"
    ];
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
    _heliport = CONTROL lbdata _lbId;

    BIS_fnc_heliportMenuUpgrade_toggle set [1,_lbId];

    _idc = ([MENU_CONFIG,"ListCategories"] call BIS_fnc_getIDC);
    lbclear CONTROL;
    /*%FSM</STATEINIT>*/
    switch(true) do
    {
      /*%FSM<LINK "__">*/
      case (call {/*%FSM<CONDITION>*/
      MENU_TOGGLE == 1
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "Current";
      };
      /*%FSM</LINK>*/
      /*%FSM<LINK "___1">*/
      case (call {/*%FSM<CONDITION>*/
      MENU_TOGGLE == 0
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "New";
      };
      /*%FSM</LINK>*/
      };
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "ListCategories">*/
  case ("ListCategories"):
  {
    /*%FSM<STATEINIT>*/
    BIS_fnc_heliportMenuUpgrade_listItems = [];

    //--- Read heliport
    _idc = ([MENU_CONFIG,"ListHeliport"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _heliport = CONTROL lbdata _lbId;

    //--- Read category
    _idc = ([MENU_CONFIG,"ListCategories"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _category = CONTROL lbdata _lbId;
    _cfgCategory = configfile >> "CfgBase" >> _heliport >> MENU_PATH >> _category;

    BIS_fnc_heliportMenuUpgrade_toggle set [2,_lbId];

    //--- Clear the list
    _idc = ([MENU_CONFIG,"ListItems"] call BIS_fnc_getIDC);
    lbclear CONTROL;

    //--- Clear previous preview
    if (!isnil "BIS_fnc_heliportMenuUpgrade_preview") then {
    	{
    		deletevehicle _x;
    	} foreach BIS_fnc_heliportMenuUpgrade_preview;
    };
    /*%FSM</STATEINIT>*/
    switch(true) do
    {
      /*%FSM<LINK "__">*/
      case (call {/*%FSM<CONDITION>*/
      MENU_TOGGLE == 1
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "Current_1";
      };
      /*%FSM</LINK>*/
      /*%FSM<LINK "___1">*/
      case (call {/*%FSM<CONDITION>*/
      MENU_TOGGLE == 0
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "New_1";
      };
      /*%FSM</LINK>*/
      };
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "ButtonToggle">*/
  case ("ButtonToggle"):
  {
    /*%FSM<STATEINIT>*/
    _toggle = (MENU_TOGGLE + 1) % 2;
    BIS_fnc_heliportMenuUpgrade_toggle = [_toggle,0,0,0];

    _idc = ([MENU_CONFIG,"ButtonOK"] call BIS_fnc_getIDC);
    CONTROL ctrlsettext (["Purchase","Sell"] select MENU_TOGGLE);
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
    //--- Read params
    _itemParams = BIS_fnc_heliportMenuUpgrade_ItemCurrent;
    _helicopter = _itemParams select 0;
    _path = _itemParams select 0;
    _price = _itemParams select 8;
    _positions = _itemParams select 9;
    _configName = configname _path;

    //--- Read heliport
    _idc = ([MENU_CONFIG,"ListHeliport"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _heliport = CONTROL lbdata _lbId;

    //--- Read category
    _idc = ([MENU_CONFIG,"ListCategories"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _category = CONTROL lbdata _lbId;

    //--- Remove money
    [-_price] call BIS_fnc_heliportMoneyAdd;

    //--- Find free slot
    _listUpgradePositions = _heliport call BIS_fnc_heliportUpgradePositions;
    _position = "";
    {
    	if !(_x in _listUpgradePositions) exitwith {_position = _x};
    } foreach _positions;

    //--- Save into DB
    [
    	MENU_PATH,
    	[_heliport,MENU_PATH,_category,_configName],
    	[_path,_position]
    ] call BIS_fnc_heliportDBAdd;

    [_category,_configName] call BIS_fnc_heliportUpgradeAdd;
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
  /*%FSM<STATE "Current">*/
  case ("Current"):
  {
    /*%FSM<STATEINIT>*/
    //--- Current
    _listCategories = [hsim_heliportDB,[_heliport,MENU_PATH]] call BIS_fnc_dbClassList;
    {
    	_category = [hsim_heliportDB,[_heliport,MENU_PATH,_x,"config"]] call BIS_fnc_dbValueReturn;
    	if (isclass _category) then {

    		_show = gettext (_category >> "show");
    		if (_show == "") then {_show = "true";};

    		if (call compile _show) then {
    			_displayName = _category call bis_fnc_displayName;
    			_lbId = CONTROL lbadd _displayName;
    			CONTROL lbsetdata [_lbId,configname _category];
    		};
    	};
    } foreach _listCategories;
    /*%FSM</STATEINIT>*/
    switch(true) do
    {
      /*%FSM<LINK "True">*/
      case (call {/*%FSM<CONDITION>*/
      true
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "ListHeliport_1";
      };
      /*%FSM</LINK>*/
      };
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "New">*/
  case ("New"):
  {
    /*%FSM<STATEINIT>*/
    //--- New
    _cfgUpgrades = configfile >> "CfgBase" >> _heliport >> MENU_PATH;
    for "_cat" from 0 to (count _cfgUpgrades - 1) do {
    	_category = _cfgUpgrades select _cat;
    	if (isclass _category) then {

    		_show = gettext (_category >> "show");
    		if (_show == "") then {_show = "true";};

    		if (call compile _show) then {
    			_displayName = _category call bis_fnc_displayName;
    			_lbId = CONTROL lbadd _displayName;
    			CONTROL lbsetdata [_lbId,configname _category];
    		};
    	};
    };
    /*%FSM</STATEINIT>*/
    switch(true) do
    {
      /*%FSM<LINK "True">*/
      case (call {/*%FSM<CONDITION>*/
      true
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "ListHeliport_1";
      };
      /*%FSM</LINK>*/
      };
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "Current_1">*/
  case ("Current_1"):
  {
    /*%FSM<STATEINIT>*/
    //--- Current
    _listItems = [hsim_heliportDB,[_heliport,MENU_PATH,_category]] call BIS_fnc_dbClassReturn;
    for "_i" from 0 to (count _listItems - 1) step 2 do {
    	_current = _listItems select _i;

    	if (_current call BIS_fnc_dbIsClass) then {
    		_item = [hsim_heliportDB,[_heliport,MENU_PATH,_category,_current,"config"]] call BIS_fnc_dbValueReturn;

    		if (typename _item == typename configfile) then {
    			_configName = configname _item;
    			_displayName = _item call bis_fnc_displayName;
    			_libTextDesc = gettext (_item >> "libTextDesc");
    			_scope = getnumber (_item >> "scope");
    			_show = [_item,"show"] call bis_fnc_heliportCondition;
    			_enable = [_item,"enable"] call bis_fnc_heliportCondition;
    			_enableText = gettext (_item >> "enableText");
    			_forced = getnumber (_item >> "forced");
    			_price = getnumber (_item >> "price");
    			//_positions = getarray (_item >> "positions");
    			_positions = [hsim_heliportDB,[_heliport,MENU_PATH,_category,_configName,"position"]] call BIS_fnc_dbValueReturn;
    			_composition = gettext (_item >> "composition");

    			//--- Default values
    			if (_scope == 0) then {_scope = 2;};
    			_price = 10e10;

    			//--- Add item
    			_lbId = CONTROL lbadd _displayName;
    			CONTROL lbsetdata [_lbId,_configName];

    			//--- Add item to variable
    			BIS_fnc_heliportMenuUpgrade_listItems = BIS_fnc_heliportMenuUpgrade_listItems + [[
    				_item,
    				_displayName,
    				_libTextDesc,
    				_scope,
    				_show,
    				_enable,
    				_enableText,
    				_forced,
    				_price,
    				_positions,
    				_composition
    			]];
    		};
    	};
    };
    /*%FSM</STATEINIT>*/
    switch(true) do
    {
      /*%FSM<LINK "True">*/
      case (call {/*%FSM<CONDITION>*/
      true
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "ListCategories_1";
      };
      /*%FSM</LINK>*/
      };
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "New_1">*/
  case ("New_1"):
  {
    /*%FSM<STATEINIT>*/
    //--- New
    for "_upg" from 0 to (count _cfgCategory - 1) do {
    	_item = _cfgCategory select _upg;
    	if (isclass _item) then {
    		_configName = configname _item;
    		_displayName = _item call bis_fnc_displayName;
    		_libTextDesc = gettext (_item >> "libTextDesc");
    		_scope = getnumber (_item >> "scope");
    		_show = [_item,"show"] call bis_fnc_heliportCondition;
    		_enable = [_item,"enable"] call bis_fnc_heliportCondition;
    		_enableText = gettext (_item >> "enableText");
    		_forced = getnumber (_item >> "forced");
    		_price = getnumber (_item >> "price");
    		_positions = getarray (_item >> "positions");
    		_composition = gettext (_item >> "composition");

    		//--- Default values
    		if (_scope == 0) then {_scope = 2;};

    		//--- Already owned
    		_isOwned = [hsim_heliportDB,[_heliport,MENU_PATH,_category,_configName]] call BIS_fnc_dbClassCheck;

    		if (_scope == 2 && !_isOwned) then {

    			//--- Item slots
    			_listUpgradePositions = _heliport call BIS_fnc_heliportUpgradePositions;
    			_positionSlot = "";
    			{
    				if !(_x in _listUpgradePositions) exitwith {_positionSlot = _x};
    			} foreach _positions;
    			_isFreeSlot = _positionSlot != "";

    			//--- Not hidden
    			if (call compile _show) then {

    				//--- Add item
    				_lbId = CONTROL lbadd _displayName;
    				CONTROL lbsetdata [_lbId,_configname];

    				//--- Disable item
    				if (!(call compile _enable) || (call BIS_fnc_heliportMoney) < _price || !_isFreeSlot) then {
    					_lbcolor = CONTROL lbcolor _lbId;
    					_lbcolor set [3,(_lbColor select 3) / 2];
    					CONTROL lbsetcolor [_lbId,_lbcolor];
    				};

    				//--- Add item to variable
    				BIS_fnc_heliportMenuUpgrade_listItems = BIS_fnc_heliportMenuUpgrade_listItems + [[
    					_item,
    					_displayName,
    					_libTextDesc,
    					_scope,
    					_show,
    					_enable,
    					_enableText,
    					_forced,
    					_price,
    					_positions,
    					_composition
    				]];
    			};
    		};
    	};
    };
    /*%FSM</STATEINIT>*/
    switch(true) do
    {
      /*%FSM<LINK "True">*/
      case (call {/*%FSM<CONDITION>*/
      true
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "ListCategories_1";
      };
      /*%FSM</LINK>*/
      };
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "Current_2">*/
  case ("Current_2"):
  {
    /*%FSM<STATEINIT>*/
    /*%FSM</STATEINIT>*/
    switch(true) do
    {
      /*%FSM<LINK "True">*/
      case (call {/*%FSM<CONDITION>*/
      true
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "ListItems";
      };
      /*%FSM</LINK>*/
      };
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "New_2">*/
  case ("New_2"):
  {
    /*%FSM<STATEINIT>*/
    //--- Item preview
    _listUpgradePositions = _heliport call BIS_fnc_heliportUpgradePositions;
    _positionSlot = "";
    {
    	if !(_x in _listUpgradePositions) exitwith {_positionSlot = _x};
    } foreach _positions;
    _isFreeSlot = _positionSlot != "";

    _logic = missionnamespace getvariable _positionSlot;
    if (!isnil "_logic" && _composition != "") then {
    	_position = position _logic;
    	_direction = direction _logic;
    	BIS_fnc_heliportMenuUpgrade_preview = [_position,_direction,_composition] call BIS_fnc_ObjectsMapper;
    };
    /*%FSM</STATEINIT>*/
    switch(true) do
    {
      /*%FSM<LINK "True">*/
      case (call {/*%FSM<CONDITION>*/
      true
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "ListItems";
      };
      /*%FSM</LINK>*/
      };
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "ListItems_1">*/
  case ("ListItems_1"):
  {
    /*%FSM<STATEINIT>*/
    //--- Clear previous preview
    if (!isnil "BIS_fnc_heliportMenuUpgrade_preview") then {
    	{
    		deletevehicle _x;
    	} foreach BIS_fnc_heliportMenuUpgrade_preview;
    };

    private ["_isFreeSlot"];
    _lbId = _input select 1;
    if (_lbId < 0) exitwith {

    	//--- No items - display nothing
    	_idc = ([MENU_CONFIG,"TextDescriptionHeader"] call BIS_fnc_getIDC);
    	CONTROL ctrlsetstructuredtext parsetext "";
    	_idc = ([MENU_CONFIG,"TextDescriptionPrice"] call BIS_fnc_getIDC);
    	CONTROL ctrlsetstructuredtext parsetext "";
    	_idc = ([MENU_CONFIG,"TextDescription"] call BIS_fnc_getIDC);
    	CONTROL ctrlsetstructuredtext parsetext "";
    	_idc = ([MENU_CONFIG,"ButtonOK"] call BIS_fnc_getIDC);
    	CONTROL ctrlenable false;

    	//--- Terminate FSM
    	_finalStateArray = [_state];
    };
    BIS_fnc_heliportMenuUpgrade_toggle set [3,_lbId];

    _itemParams = BIS_fnc_heliportMenuUpgrade_listItems select _lbId;
    BIS_fnc_heliportMenuUpgrade_ItemCurrent = _itemParams;

    _path = _itemParams select 0;
    _displayName = _itemParams select 1;
    _libTextDesc = _itemParams select 2;
    _scope = _itemParams select 3;
    _show = _itemParams select 4;
    _enable = _itemParams select 5;
    _enableText = _itemParams select 6;
    _forced = _itemParams select 7;
    _price = _itemParams select 8;
    _positions = _itemParams select 9;
    _composition = _itemParams select 10;

    //--- Read heliport
    _idc = ([MENU_CONFIG,"ListHeliport"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _heliport = CONTROL lbdata _lbId;

    //--- Find free slot
    _position = if (MENU_TOGGLE == 0) then {
    	_listUpgradePositions = _heliport call BIS_fnc_heliportUpgradePositions;
    	_position = "";
    	{
    		if !(_x in _listUpgradePositions) exitwith {_position = _x};
    	} foreach _positions;
    	_isFreeSlot = _position != "";
    	if !(_isFreeSlot) then {
    		_enableText = "Not enough space to build";
    		_position = _positions select 0;
    	};
    	_position
    } else {
    	_positions
    };

    //--- Preview position
    if (_heliport == worldname) then {
    	_logicPosition = missionnamespace getvariable _position;
    	_camera = BIS_fnc_heliportMenuUpgrade_camera;
    	_camera campreparetarget _logicPosition;
    	_camera camcommitprepared 1;
    };
    /*%FSM</STATEINIT>*/
    switch(true) do
    {
      /*%FSM<LINK "__">*/
      case (call {/*%FSM<CONDITION>*/
      MENU_TOGGLE == 1
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "Current_2";
      };
      /*%FSM</LINK>*/
      /*%FSM<LINK "___1">*/
      case (call {/*%FSM<CONDITION>*/
      MENU_TOGGLE == 0
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "New_2";
      };
      /*%FSM</LINK>*/
      };
  };
  /*%FSM</STATE>*/
  };
};
switch (_state) do
{
  /*%FSM<STATE "ListItems">*/
  case ("ListItems"):
  {
    /*%FSM<STATEINIT>*/
    //--- Upgrade name
    _idc = ([MENU_CONFIG,"TextDescriptionHeader"] call BIS_fnc_getIDC);
    CONTROL ctrlsetstructuredtext parsetext ("<t align='left' size='1.4'>" + _displayName + "</t>");

    //--- Price
    _idc = ([MENU_CONFIG,"TextDescriptionPrice"] call BIS_fnc_getIDC);
    if (MENU_TOGGLE == 0) then {
    	_textPrice = format ["<t align='left'>$ %1</t>",_price];
    	if (!call compile _enable || _price > (call BIS_fnc_heliportMoney) || !_isFreeSlot) then {
    		_textReason = if (call compile _enable && _isFreeSlot) then {"Not enough money"} else {_enableText};
    		_textPrice = format ["<t color='#ff0000'>(%1) %2</t>",_textReason,_textPrice];
    	};
    	CONTROL ctrlsetstructuredtext parsetext _textPrice;
    } else {
    	CONTROL ctrlsetstructuredtext parsetext "";
    };

    //--- Description
    _idc = ([MENU_CONFIG,"TextDescription"] call BIS_fnc_getIDC);
    CONTROL ctrlsetstructuredtext parsetext format ["<t align='left'>%1</t>",_libTextDesc];

    //--- Disable 'Confirm' button
    _idc = ([MENU_CONFIG,"ButtonOK"] call BIS_fnc_getIDC);
    CONTROL ctrlenable (
    	_price <= (call BIS_fnc_heliportMoney)
    	&&
    	call compile _enable
    	&&
    	_isFreeSlot
    );
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
  /*%FSM<STATE "ListHeliport_1">*/
  case ("ListHeliport_1"):
  {
    /*%FSM<STATEINIT>*/
    CONTROL lbsetcursel (BIS_fnc_heliportMenuUpgrade_toggle select 2);
    /*%FSM</STATEINIT>*/
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "ListCategories_1">*/
  case ("ListCategories_1"):
  {
    /*%FSM<STATEINIT>*/
    CONTROL lbsetcursel (BIS_fnc_heliportMenuUpgrade_toggle select 3);
    /*%FSM</STATEINIT>*/
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "ERROR">*/
  case ("ERROR"):
  {
    /*%FSM<STATEINIT>*/
    /*%FSM</STATEINIT>*/
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "Refresh_the_list">*/
  case ("Refresh_the_list"):
  {
    /*%FSM<STATEINIT>*/
    _idc = ([MENU_CONFIG,"ListHeliport"] call BIS_fnc_getIDC);
    ["ListHeliport",[CONTROL,lbcursel CONTROL]] call BIS_fnc_heliportMenuUpgrade;
    /*%FSM</STATEINIT>*/
  };
  /*%FSM</STATE>*/
};
/*%FSM</COMPILE>*/