/*%FSM<COMPILE "C:\BIS\fsmeditor\fsm2sqfCall.cfg, fn_heliportMenuStaff">*/
/*%FSM<HEAD>*/
/*
item0[] = {"START",0,250,-125.000000,-200.000000,-25.000000,-150.000000,0.000000,"START"};
item1[] = {"ERROR",8,218,0.000000,-200.000000,100.000000,-150.000000,-1.000000,"ERROR"};
item2[] = {"ERROR",1,250,125.000000,-200.000000,225.000000,-150.000000,0.000000,"ERROR"};
item3[] = {"INIT",4,218,0.000000,600.000000,100.000000,650.000000,0.000000,"INIT"};
item4[] = {"INIT",2,4346,125.000000,600.000000,225.000000,650.000000,0.000000,"INIT"};
item5[] = {"",7,210,-79.000046,620.999878,-70.999954,629.000061,0.000000,""};
item6[] = {"true",8,218,250.000000,675.000000,350.000000,725.000000,0.000000,"true"};
item7[] = {"Refresh_the_list",1,250,375.000000,675.000000,475.000000,725.000000,0.000000,"Refresh" \n "the list"};
item8[] = {"",7,210,296.000000,620.999878,304.000000,629.000061,0.000000,""};
item9[] = {"ListHeliport",4,218,0.000000,-100.000000,100.000000,-50.000000,0.000000,"ListHeliport"};
item10[] = {"ListHeliport",2,250,125.000000,-125.000000,225.000000,-25.000000,0.000000,"ListHeliport"};
item11[] = {"___1",4,218,250.000000,-125.000000,350.000000,-75.000000,0.000000,"0"};
item12[] = {"__",4,218,250.000000,-75.000000,350.000000,-25.000000,0.000000,"1"};
item13[] = {"Current",2,250,375.000000,-75.000000,475.000000,-25.000000,0.000000,"Current"};
item14[] = {"New",2,250,375.000000,-125.000000,475.000000,-75.000000,0.000000,"New"};
item15[] = {"True",8,218,500.000000,-100.000000,600.000000,-50.000000,0.000000,"True"};
item16[] = {"ListHeliport_1",1,250,625.000000,-125.000000,725.000000,-25.000000,0.000000,"ListHeliport"};
item17[] = {"",7,210,-78.999992,-79.000000,-71.000008,-71.000000,0.000000,""};
item18[] = {"ListCategories",4,218,0.000000,25.000000,100.000000,75.000000,0.000000,"ListCategories"};
item19[] = {"ListCategories",2,250,125.000000,0.000000,225.000000,100.000000,0.000000,"ListCategories"};
item20[] = {"___1",4,218,250.000000,0.000000,350.000000,50.000000,0.000000,"0"};
item21[] = {"__",4,218,250.000000,50.000000,350.000000,100.000000,0.000000,"1"};
item22[] = {"Current_1",2,250,375.000000,50.000000,475.000000,100.000000,0.000000,"Current"};
item23[] = {"New_1",2,250,375.000000,0.000000,475.000000,50.000000,0.000000,"New"};
item24[] = {"True",8,218,500.000000,25.000000,600.000000,75.000000,0.000000,"True"};
item25[] = {"ListCategories_1",1,250,625.000000,0.000000,725.000000,100.000000,0.000000,"ListCategories"};
item26[] = {"",7,210,-79.000000,45.999992,-71.000000,54.000008,0.000000,""};
item27[] = {"ListItems",4,218,0.000000,150.000000,100.000000,200.000000,0.000000,"ListItems"};
item28[] = {"ListItems",2,250,125.000000,125.000000,225.000000,225.000000,0.000000,"ListItems"};
item29[] = {"",7,210,-78.999931,171.000000,-71.000069,179.000000,0.000000,""};
item30[] = {"ButtonToggle",4,218,0.000000,350.000000,100.000000,400.000000,0.000000,"ButtonToggle"};
item31[] = {"ButtonToggle",2,250,125.000000,350.000000,225.000000,400.000000,0.000000,"ButtonToggle"};
item32[] = {"ButtonBack",4,218,0.000000,275.000000,100.000000,325.000000,0.000000,"ButtonBack"};
item33[] = {"ButtonBack",1,250,125.000000,275.000000,225.000000,325.000000,0.000000,"ButtonBack"};
item34[] = {"ButtonOK",4,218,0.000000,425.000000,100.000000,475.000000,0.000000,"ButtonOK"};
item35[] = {"ButtonOK",2,250,125.000000,425.000000,225.000000,475.000000,0.000000,"ButtonOK"};
item36[] = {"",7,210,-78.999992,371.000000,-71.000008,379.000000,0.000000,""};
item37[] = {"",7,210,-79.000000,296.000000,-71.000000,304.000000,0.000000,""};
item38[] = {"",7,210,-79.000015,445.999969,-70.999985,454.000031,0.000000,""};
item39[] = {"",7,210,296.000000,371.000000,304.000000,379.000000,0.000000,""};
item40[] = {"",7,210,296.000000,446.000000,304.000000,454.000000,0.000000,""};
item41[] = {"ButtonAssign",4,218,0.000000,500.000000,100.000000,550.000000,0.000000,"ButtonAssign"};
item42[] = {"ButtonAssign",2,250,125.000000,500.000000,225.000000,550.000000,0.000000,"ButtonAssign"};
item43[] = {"",7,210,-79.000000,521.000061,-71.000000,529.000000,0.000000,""};
item44[] = {"",7,210,296.000000,521.000061,304.000000,529.000000,0.000000,""};
item45[] = {"Nothing_selected",4,218,250.000000,125.000000,350.000000,175.000000,1.000000,"Nothing" \n "selected"};
item46[] = {"True",8,218,250.000000,175.000000,350.000000,225.000000,0.000000,"True"};
item47[] = {"Terminate",1,250,625.000000,125.000000,725.000000,175.000000,0.000000,"Terminate"};
item48[] = {"ListItems_1",1,250,625.000000,175.000000,725.000000,225.000000,0.000000,"ListItems"};
link0[] = {0,1};
link1[] = {0,5};
link2[] = {0,17};
link3[] = {0,26};
link4[] = {0,29};
link5[] = {0,36};
link6[] = {0,37};
link7[] = {0,38};
link8[] = {0,43};
link9[] = {1,2};
link10[] = {3,4};
link11[] = {4,8};
link12[] = {5,3};
link13[] = {6,7};
link14[] = {8,6};
link15[] = {9,10};
link16[] = {10,11};
link17[] = {10,12};
link18[] = {11,14};
link19[] = {12,13};
link20[] = {13,15};
link21[] = {14,15};
link22[] = {15,16};
link23[] = {17,9};
link24[] = {18,19};
link25[] = {19,20};
link26[] = {19,21};
link27[] = {20,23};
link28[] = {21,22};
link29[] = {22,24};
link30[] = {23,24};
link31[] = {24,25};
link32[] = {26,18};
link33[] = {27,28};
link34[] = {28,45};
link35[] = {28,46};
link36[] = {29,27};
link37[] = {30,31};
link38[] = {31,39};
link39[] = {32,33};
link40[] = {34,35};
link41[] = {35,40};
link42[] = {36,30};
link43[] = {37,32};
link44[] = {38,34};
link45[] = {39,6};
link46[] = {40,6};
link47[] = {41,42};
link48[] = {42,44};
link49[] = {43,41};
link50[] = {44,6};
link51[] = {45,47};
link52[] = {46,48};
globals[] = {25.000000,1,0,0,16777215,640,480,1,49,6316128,1,-140.377716,435.396362,823.823181,-68.629578,482,899,1};
window[] = {2,-1,-1,-1,-1,914,-1181,-60,146,3,499};
*//*%FSM</HEAD>*/
private ["_state", "_finalStateArray"];
/*%FSM<PRIVATEVARIABLES>*/
#define MENU_CLASS	"RscDisplayHeliportStaff"
#define MENU_CONFIG	BIS_fnc_heliportMenuStaff_config
#define MENU_PATH	BIS_fnc_heliportMenuStaff_class
#define MENU_TOGGLE	(BIS_fnc_heliportMenuStaff_toggle select 0)
#define DISPLAY		(uinamespace getvariable MENU_CLASS)
#define CONTROL		(DISPLAY displayctrl _idc)

private [
	"_mode",
	"_input",
	"_idc",
	"_lbId",
	"_heliport",
	"_category",
	"_cfgCategory",
	"_lbId"
];
/*%FSM</PRIVATEVARIABLES>*/
_state="START";
_finalStateArray = ["ERROR", "Refresh_the_list", "ListHeliport_1", "ListCategories_1", "ButtonBack", "Terminate", "ListItems_1"];
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
    /*%FSM</STATEINIT>*/
    switch(true) do
    {
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
      /*%FSM<LINK "ButtonAssign">*/
      case (call {/*%FSM<CONDITION>*/
      _mode == "ButtonAssign"
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "ButtonAssign";
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

    DISPLAY displayaddeventhandler ["unload","
    	BIS_fnc_heliportMenuStaff_camera cameraeffect ['terminate','back'];
    	camdestroy BIS_fnc_heliportMenuStaff_camera;
    	deletevehicle BIS_fnc_heliportMenuStaff_sphere;
    	if (!isnil 'BIS_fnc_heliportMenuStaff_preview') then {
    		deletevehicle BIS_fnc_heliportMenuStaff_preview;
    	};

    	skiptime (-daytime + BIS_fnc_heliportMenuStaff_daytime);
    "];

    //--- Dialog IDC
    BIS_fnc_heliportMenuStaff_config = [MENU_CLASS] call BIS_fnc_heliportDialogInit;
    BIS_fnc_heliportMenuStaff_class = "Staff";
    if (isnil "BIS_fnc_heliportMenuStaff_toggle") then {
    	BIS_fnc_heliportMenuStaff_toggle = [0,0,0,0];
    };
    BIS_fnc_heliportMenuStaff_preview = objnull;

    //--- Money
    call BIS_fnc_heliportMoneyDisplay;

    //--- Header
    _idc = ([MENU_CONFIG,"textHeader"] call BIS_fnc_getIDC);
    CONTROL ctrlsetstructuredtext parsetext "<t size='1.4'>Staff</t>";

    //--- Listbox - Heliports
    _idc = ([MENU_CONFIG,"ListHeliport"] call BIS_fnc_getIDC);
    CONTROL call BIS_fnc_heliportListboxHeliports;
    CONTROL lbsetcursel (BIS_fnc_heliportMenuStaff_toggle select 1);

    //--- Camera background
    _sphere_alt = 100;
    _sphere = createvehicle ["Sphere_HalfVisible_H",position hsim_heliportLogic,[],0,"none"];
    _sphere setpos [
    	(position hsim_heliportLogic select 0),
    	(position hsim_heliportLogic select 1),
    	_sphere_alt
    ];
    _sphere setdir 270;
    _sphere setObjecttexture [0,"hsim\data_h\data\env_land_co.paa"];
    BIS_fnc_heliportMenuStaff_sphere = _sphere;

    //--- Camera
    _cameraPos = [_sphere,1,90] call BIS_fnc_relPos;
    _cameraPos set [2,_sphere_alt + 1.6];
    _camera = "camera" camcreate _cameraPos;
    _camera cameraeffect ["internal","back"];
    _camera campreparetarget _sphere;
    _camera campreparefocus [-1,-1];
    _camera camcommitprepared 0;
    BIS_fnc_heliportMenuStaff_camera = _camera;
    showcinemaborder false;

    BIS_fnc_heliportMenuStaff_daytime = daytime;
    skiptime (-daytime + 10);




    //--- Execute
    {
    	_idc = ([MENU_CONFIG,_x] call BIS_fnc_getIDC);
    	CONTROL ctrladdeventhandler [
    		"LBSelChanged",
    		format ["['%1',_this] call BIS_fnc_heliportMenuStaff;",_x]
    	];
    } foreach [
    	"ListCategories",
    	"ListItems",
    	"ListHeliport"
    ];

    {
    	_idc = ([MENU_CONFIG,_x] call BIS_fnc_getIDC);
    	CONTROL buttonsetaction format ["['%1',-1] spawn BIS_fnc_heliportMenuStaff;",_x];
    } foreach [
     	"ButtonOK",
    	"ButtonBack",
    	"ButtonToggle",
    	"ButtonAssign"
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

    BIS_fnc_heliportMenuStaff_toggle set [1,_lbId];

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
  /*%FSM<STATE "Current">*/
  case ("Current"):
  {
    /*%FSM<STATEINIT>*/
    //--- Current
    _listCategories = [hsim_heliportDB,[_heliport,MENU_PATH]] call BIS_fnc_dbClassReturn;
    for "_i" from 0 to (count _listCategories - 1) step 2 do {
    	_current = _listCategories select _i;

    	if (_current call BIS_fnc_dbIsClass) then {
    		_path = [hsim_heliportDB,[_heliport,MENU_PATH,_current,"config"]] call BIS_fnc_dbValueReturn;
    		if (typename _path == typename configfile) then {
    			_configName = configname _path;
    			_displayName = gettext (_path >> "displayname");
    			_lbId = CONTROL lbadd _displayName;
    			CONTROL lbsetdata [_lbId,_configName];
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
  /*%FSM<STATE "New">*/
  case ("New"):
  {
    /*%FSM<STATEINIT>*/
    //--- New
    _cfgUpgrades = configfile >> "CfgBase" >> _heliport >> MENU_PATH;
    for "_cat" from 0 to (count _cfgUpgrades - 1) do {
    	_category = _cfgUpgrades select _cat;
    	if (isclass _category) then {
    		_displayName = gettext (_category >> "displayname");
    		_lbId = CONTROL lbadd _displayName;
    		CONTROL lbsetdata [_lbId,configname _category];
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
  /*%FSM<STATE "ListCategories">*/
  case ("ListCategories"):
  {
    /*%FSM<STATEINIT>*/
    BIS_fnc_heliportMenuStaff_listItems = [];

    //--- Read heliport
    _idc = ([MENU_CONFIG,"ListHeliport"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _heliport = CONTROL lbdata _lbId;

    //--- Read category
    _idc = ([MENU_CONFIG,"ListCategories"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _category = CONTROL lbdata _lbId;
    _cfgCategory = configfile >> "CfgBase" >> _heliport >> MENU_PATH >> _category;

    BIS_fnc_heliportMenuStaff_toggle set [2,_lbId];

    //--- Clear the list
    _idc = ([MENU_CONFIG,"ListItems"] call BIS_fnc_getIDC);
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
    			//_priceDuration = getnumber (_item >> "priceDuration");
    			_priceDuration = [hsim_heliportDB,[_heliport,MENU_PATH,_category,_configName,"priceDuration"]] call BIS_fnc_dbValueReturn;
    			_priceDuration = _priceDuration - (call BIS_fnc_heliportTurn);
    			_performance = getnumber (_item >> "performance");
    			_vehicle = gettext (_item >> "vehicle");
    			_init = gettext (_item >> "init");

    			//--- Default values
    			if (_scope == 0) then {_scope = 2;};
    			_price = 10e10;

    			//--- Add item
    			_lbId = CONTROL lbadd _displayName;
    			CONTROL lbsetdata [_lbId,_configName];

    			//--- Add item to variable
    			BIS_fnc_heliportMenuStaff_listItems = BIS_fnc_heliportMenuStaff_listItems + [[
    				_item,
    				_displayName,
    				_libTextDesc,
    				_scope,
    				_show,
    				_enable,
    				_enableText,
    				_forced,
    				_price,
    				_priceDuration,
    				_performance,
    				_vehicle,
    				_init
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
    		_priceDuration = getnumber (_item >> "priceDuration");
    		_performance = getnumber (_item >> "performance");
    		_vehicle = gettext (_item >> "vehicle");
    		_init = gettext (_item >> "init");

    		//--- Default values
    		if (_scope == 0) then {_scope = 2;};
    		if (_priceDuration <= 0) then {_priceDuration = 1;};

    		//--- Already owned
    		_isOwned = [hsim_heliportDB,[_heliport,MENU_PATH,_category,_configName]] call BIS_fnc_dbClassCheck;

    		if (_scope == 2 && !_isOwned) then {
    			if (call compile _show) then {

    				//--- Add item
    				_lbId = CONTROL lbadd _displayName;
    				CONTROL lbsetdata [_lbId,_configname];

    				//--- Disable item
    				if (!(call compile _enable) || (call BIS_fnc_heliportMoney) < _price) then {
    					_lbcolor = CONTROL lbcolor _lbId;
    					_lbcolor set [3,(_lbColor select 3) / 2];
    					CONTROL lbsetcolor [_lbId,_lbcolor];
    				};

    				//--- Add item to variable
    				BIS_fnc_heliportMenuStaff_listItems = BIS_fnc_heliportMenuStaff_listItems + [[
    					_item,
    					_displayName,
    					_libTextDesc,
    					_scope,
    					_show,
    					_enable,
    					_enableText,
    					_forced,
    					_price,
    					_priceDuration,
    					_performance,
    					_vehicle,
    					_init
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
  /*%FSM<STATE "ListItems">*/
  case ("ListItems"):
  {
    /*%FSM<STATEINIT>*/
    _lbId = _input select 1;

    BIS_fnc_heliportMenuStaff_toggle set [3,_lbId];
    /*%FSM</STATEINIT>*/
    switch(true) do
    {
      /*%FSM<LINK "Nothing_selected">*/
      case (call {/*%FSM<CONDITION>*/
      _lbId < 0
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "Terminate";
      };
      /*%FSM</LINK>*/
      /*%FSM<LINK "True">*/
      case (call {/*%FSM<CONDITION>*/
      true
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "ListItems_1";
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
    BIS_fnc_heliportMenuStaff_toggle = [_toggle,0,0,0];

    _idc = ([MENU_CONFIG,"ButtonOK"] call BIS_fnc_getIDC);
    CONTROL ctrlsettext (["Hire","Dismiss"] select MENU_TOGGLE);
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
    _itemParams = BIS_fnc_heliportMenuStaff_ItemCurrent;
    _path = _itemParams select 0;
    _price = _itemParams select 8;
    _priceDuration = _itemParams select 9;
    if (_priceDuration >= 0) then {_priceDuration = _priceDuration + call BIS_fnc_heliportTurn};
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

    //--- Save into DB
    [
    	MENU_PATH,
    	[_heliport,MENU_PATH,_category,configname _path],
    	[_path,_priceDuration]
    ] call BIS_fnc_heliportDBAdd;

    [_category,_configName] call BIS_fnc_heliportStaffAdd;
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
  /*%FSM<STATE "ButtonAssign">*/
  case ("ButtonAssign"):
  {
    /*%FSM<STATEINIT>*/
    //--- Read params
    _itemParams = BIS_fnc_heliportMenuStaff_ItemCurrent;
    _path = _itemParams select 0;
    _configName = configname _path;

    //--- Read heliport
    _idc = ([MENU_CONFIG,"ListHeliport"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _heliport = CONTROL lbdata _lbId;

    //--- Select helicopter
    [_heliport,_configName] call BIS_fnc_heliportMenuHeliList;
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
  /*%FSM<STATE "Refresh_the_list">*/
  case ("Refresh_the_list"):
  {
    /*%FSM<STATEINIT>*/
    _idc = ([MENU_CONFIG,"ListHeliport"] call BIS_fnc_getIDC);
    ["ListHeliport",[CONTROL,lbcursel CONTROL]] call BIS_fnc_heliportMenuStaff;
    /*%FSM</STATEINIT>*/
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "ListHeliport_1">*/
  case ("ListHeliport_1"):
  {
    /*%FSM<STATEINIT>*/
    CONTROL lbsetcursel (BIS_fnc_heliportMenuStaff_toggle select 2);
    /*%FSM</STATEINIT>*/
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "ListCategories_1">*/
  case ("ListCategories_1"):
  {
    /*%FSM<STATEINIT>*/
    CONTROL lbsetcursel (BIS_fnc_heliportMenuStaff_toggle select 3);
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
  /*%FSM<STATE "Terminate">*/
  case ("Terminate"):
  {
    /*%FSM<STATEINIT>*/
    //--- No items - display nothing
    _idc = ([MENU_CONFIG,"TextDescriptionHeader"] call BIS_fnc_getIDC);
    CONTROL ctrlsetstructuredtext parsetext "";
    _idc = ([MENU_CONFIG,"TextDescriptionPrice"] call BIS_fnc_getIDC);
    CONTROL ctrlsetstructuredtext parsetext "";
    _idc = ([MENU_CONFIG,"TextDescription"] call BIS_fnc_getIDC);
    CONTROL ctrlsetstructuredtext parsetext "";
    idc = ([MENU_CONFIG,"ButtonOK"] call BIS_fnc_getIDC);
    CONTROL ctrlenable false;
    _idc = ([MENU_CONFIG,"ButtonAssign"] call BIS_fnc_getIDC);
    CONTROL ctrlshow false;

    if (!isnil "BIS_fnc_heliportMenuStaff_preview") then {
    	deletevehicle BIS_fnc_heliportMenuStaff_preview;
    };

    _sphere = BIS_fnc_heliportMenuStaff_sphere;
    _camera = BIS_fnc_heliportMenuStaff_camera;

    _cameraPos = [_sphere,0.15,direction _camera - 90] call BIS_fnc_relPos;
    _cameraPos set [2,(position _sphere select 2) + 1.55];
    _camera campreparetarget _cameraPos;
    _camera camcommitprepared 0;

    //--- Terminate FSM
    //_finalStateArray = [_state];
    /*%FSM</STATEINIT>*/
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "ListItems_1">*/
  case ("ListItems_1"):
  {
    /*%FSM<STATEINIT>*/
    //--- Read heliport
    _idc = ([MENU_CONFIG,"ListHeliport"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _heliport = CONTROL lbdata _lbId;

    //--- Read category
    _idc = ([MENU_CONFIG,"ListCategories"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _category = CONTROL lbdata _lbId;
    _categoryType = configfile >> "CfgBase" >> _heliport >> MENU_PATH >> _category >> "type";

    //--- Read items
    _idc = ([MENU_CONFIG,"ListItems"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;

    _itemParams = BIS_fnc_heliportMenuStaff_listItems select _lbId;
    BIS_fnc_heliportMenuStaff_ItemCurrent = _itemParams;

    _path = _itemParams select 0;
    _displayName = _item call bis_fnc_displayName;
    _libTextDesc = _itemParams select 2;
    _scope = _itemParams select 3;
    _show = [_item,"show"] call bis_fnc_heliportCondition;
    _enable = [_item,"enable"] call bis_fnc_heliportCondition;
    _enableText = _itemParams select 6;
    _forced = _itemParams select 7;
    _price = _itemParams select 8;
    _priceDuration = _itemParams select 9;
    _performance = _itemParams select 10;
    _vehicle = _itemParams select 11;
    _configName = configname _path;

    //--- Upgrade name
    _idc = ([MENU_CONFIG,"TextDescriptionheader"] call BIS_fnc_getIDC);
    _performanceScale = round (_performance * 5);
    _performanceText = "";
    for "_p" from 0 to 4 do {
    	_image = if (_performanceScale <= _p) then {
    		"hsim\ui_h\data\ui_task_created_ca.paa"
    	} else {
    		"hsim\ui_h\data\ui_task_done_ca.paa"
    	};
    	_performanceText = _performanceText + format ["<img image='%1' />",_image];
    };
    CONTROL ctrlsetstructuredtext parsetext ("<t align='left' size='1.4'>" + _displayName + "</t><t align='right'>" + _performanceText + "</t>");

    //--- Price
    _idc = ([MENU_CONFIG,"TextDescriptionPrice"] call BIS_fnc_getIDC);
    if (MENU_TOGGLE == 0) then {
    	_textPrice = format ["<t align='left'>$ %1 / %2</t>",_price,_priceDuration];
    	if (!call compile _enable || _price > (call BIS_fnc_heliportMoney)) then {
    		_textReason = if (call compile _enable) then {"Not enough money"} else {_enableText};
    		_textPrice = format ["<t color='#ff0000'>(%1) %2</t>",_textReason,_textPrice];
    	};
    	CONTROL ctrlsetstructuredtext parsetext _textPrice;
    } else {
    	_textPrice = if (_priceDuration < 0) then {
    		"N/A"
    	} else {
    		format ["Remaining contracts: %1",_priceDuration]
    	};
    	_textPrice = "<t align='left'>" + _textPrice + "</t>";
    	CONTROL ctrlsetstructuredtext parsetext _textPrice;
    };


    //--- Description
    _idc = ([MENU_CONFIG,"TextDescription"] call BIS_fnc_getIDC);
    CONTROL ctrlsetstructuredtext parsetext format ["<t align='left'>%1</t>",_libTextDesc];


    //--- Assigned helicopter
    _helicopter = [hsim_heliportDB,[_heliport,MENU_PATH,_category,_configName,"helicopter"]] call BIS_fnc_dbValueReturn;
    _cfgHelicopter = [hsim_heliportDB,[_heliport,"Helicopters",_helicopter,"config"]] call BIS_fnc_dbValueReturn;

    _displayName = if !(isnil "_cfgHelicopter") then {
    	gettext (_cfgHelicopter >> "displayname");
    } else {
    	""
    };
    if (_displayName == "") then {_displayName = "No helicopter"};
    _idc = ([MENU_CONFIG,"ButtonAssign"] call BIS_fnc_getIDC);
    CONTROL ctrlsettext _displayName;


    //--- Disable 'Confirm' button
    _idc = ([MENU_CONFIG,"ButtonOK"] call BIS_fnc_getIDC);
    CONTROL ctrlenable (
    	_price <= (call BIS_fnc_heliportMoney)
    	&&
    	call compile _enable
    );


    //--- Hide 'Assign' button
    _idc = ([MENU_CONFIG,"ButtonAssign"] call BIS_fnc_getIDC);
    CONTROL ctrlshow (
    	MENU_TOGGLE == 1
    	&&
    	getnumber(_categoryType) == 1
    );

    //--- Item preview
    if (!isnil "BIS_fnc_heliportMenuStaff_preview") then {
    	deletevehicle BIS_fnc_heliportMenuStaff_preview;
    };

    _sphere = BIS_fnc_heliportMenuStaff_sphere;
    _camera = BIS_fnc_heliportMenuStaff_camera;
    _previewPos = position _sphere;
    _preview = createvehicle [_vehicle,_previewPos,[],0,"none"];
    _preview setpos _previewPos;
    _preview setdir (direction _camera + 180 + 15);
    _preview attachto [_sphere];
    _preview switchmove "aidlpercmstpsnonwnondnon_player_idlesteady02";
    _preview playmovenow "aidlpercmstpsnonwnondnon_player_idlesteady02";

    _cameraDelay = if (isnull BIS_fnc_heliportMenuStaff_preview) then {0} else {0.3};
    _cameraPos = [_preview,0.15,direction _camera - 90] call BIS_fnc_relPos;
    _cameraPos set [2,(position _preview select 2) + 1.55];
    _camera campreparetarget _cameraPos;
    _camera campreparefov (0.5);
    _camera camcommitprepared _cameraDelay;

    BIS_fnc_heliportMenuStaff_preview = _preview;
    /*%FSM</STATEINIT>*/
  };
  /*%FSM</STATE>*/
};
/*%FSM</COMPILE>*/