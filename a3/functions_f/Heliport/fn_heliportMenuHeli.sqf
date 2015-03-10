/*%FSM<COMPILE "C:\BIS\fsmeditor\fsm2sqfCall.cfg, fn_heliportMenuHeli">*/
/*%FSM<HEAD>*/
/*
item0[] = {"START",0,250,-150.000000,-300.000000,-50.000000,-250.000000,0.000000,"START"};
item1[] = {"ERROR",8,218,-25.000000,-300.000000,75.000000,-250.000000,-1.000000,"ERROR"};
item2[] = {"ERROR",1,250,100.000000,-300.000000,200.000000,-250.000000,0.000000,"ERROR"};
item3[] = {"",7,210,-103.999992,-179.000000,-96.000008,-171.000000,0.000000,""};
item4[] = {"ListHeliport",4,218,-25.000000,-200.000000,75.000000,-150.000000,0.000000,"ListHeliport"};
item5[] = {"ListHeliport",1,250,100.000000,-200.000000,200.000000,-150.000000,0.000000,"ListHeliport"};
item6[] = {"ListHelicopters",4,218,-25.000000,-100.000000,75.000000,-50.000000,0.000000,"ListHelicopters"};
item7[] = {"ListHelicopters",1,250,100.000000,-100.000000,200.000000,-50.000000,0.000000,"ListHelicopters"};
item8[] = {"",7,210,-104.000000,-79.000000,-96.000000,-71.000000,0.000000,""};
item9[] = {"ListCategories",4,218,-25.000000,0.000000,75.000000,50.000000,0.000000,"ListCategories"};
item10[] = {"ListCategories",1,250,100.000000,0.000000,200.000000,50.000000,0.000000,"ListCategories"};
item11[] = {"",7,210,-104.000000,21.000010,-96.000000,28.999990,0.000000,""};
item12[] = {"ListItems",4,218,-25.000000,125.000000,75.000000,175.000000,0.000000,"ListItems"};
item13[] = {"ListItems",2,4346,100.000000,100.000000,200.000000,200.000000,0.000000,"ListItems"};
item14[] = {"",7,210,-104.000000,146.000015,-96.000000,154.000000,0.000000,""};
item15[] = {"INIT",4,218,-25.000000,500.000000,75.000000,550.000000,0.000000,"INIT"};
item16[] = {"INIT",2,250,100.000000,500.000000,200.000000,550.000000,0.000000,"INIT"};
item17[] = {"",7,210,-104.000053,520.999878,-95.999954,529.000122,0.000000,""};
item18[] = {"true",8,218,225.000000,450.000000,325.000000,500.000000,0.000000,"true"};
item19[] = {"Refresh_the_list",1,250,350.000000,450.000000,450.000000,500.000000,0.000000,"Refresh" \n "the list"};
item20[] = {"",7,210,271.000000,520.999878,279.000000,529.000122,0.000000,""};
item21[] = {"ButtonBack",4,218,-25.000000,325.000000,75.000000,375.000000,0.000000,"ButtonBack"};
item22[] = {"ButtonBack",1,250,100.000000,325.000000,200.000000,375.000000,0.000000,"ButtonBack"};
item23[] = {"ButtonOK",4,218,-25.000000,400.000000,75.000000,450.000000,0.000000,"ButtonOK"};
item24[] = {"ButtonOK",2,250,100.000000,400.000000,200.000000,450.000000,0.000000,"ButtonOK"};
item25[] = {"",7,210,-104.000000,346.000000,-96.000008,354.000031,0.000000,""};
item26[] = {"",7,210,-104.000023,421.000031,-95.999985,428.999969,0.000000,""};
item27[] = {"",7,210,271.000000,421.000031,279.000000,428.999969,0.000000,""};
item28[] = {"True",8,218,225.000000,125.000000,325.000000,175.000000,0.000000,"True"};
item29[] = {"Preview",1,250,350.000000,100.000000,450.000000,200.000000,0.000000,"Preview"};
item30[] = {"",7,210,-103.999992,596.000000,-96.000000,604.000000,0.000000,""};
item31[] = {"unLoad",4,218,-25.000000,575.000000,75.000000,625.000000,0.000000,"unLoad"};
item32[] = {"unLoad",1,250,100.000000,575.000000,200.000000,625.000000,0.000000,"unLoad"};
item33[] = {"",7,210,-103.999992,696.000000,-96.000000,704.000000,0.000000,""};
item34[] = {"mouseMoving",4,218,-25.000000,675.000000,75.000000,725.000000,0.000000,"mouseMoving"};
item35[] = {"mouseMoving",1,250,100.000000,675.000000,200.000000,725.000000,0.000000,"mouseMoving"};
item36[] = {"",7,210,-104.000000,771.000000,-96.000000,779.000000,0.000000,""};
item37[] = {"mouseButtonDown",4,218,-25.000000,750.000000,75.000000,800.000000,0.000000,"mouseButtonDown"};
item38[] = {"mouseButtonDown",1,250,100.000000,750.000000,200.000000,800.000000,0.000000,"mouseButtonDown"};
item39[] = {"",7,210,-104.000000,846.000000,-96.000000,854.000000,0.000000,""};
item40[] = {"mouseButtonUp",4,218,-25.000000,825.000000,75.000000,875.000000,0.000000,"mouseButtonUp"};
item41[] = {"mouseButtonUp",1,250,100.000000,825.000000,200.000000,875.000000,0.000000,"mouseButtonUp"};
item42[] = {"ButtonAssign",4,218,-25.000000,250.000000,75.000000,300.000000,0.000000,"ButtonAssign"};
item43[] = {"ButtonAssign",1,250,100.000000,250.000000,200.000000,300.000000,0.000000,"ButtonAssign"};
item44[] = {"",7,210,-104.000000,271.000000,-96.000008,279.000000,0.000000,""};
item45[] = {"",7,210,-104.000000,921.000000,-96.000000,929.000000,0.000000,""};
item46[] = {"mouseZChanged",4,218,-25.000000,900.000000,75.000000,950.000000,0.000000,"mouseZChanged"};
item47[] = {"mouseZChanged",1,250,100.000000,900.000000,200.000000,950.000000,0.000000,"mouseZChanged"};
item48[] = {"",7,210,-104.000000,1021.000122,-96.000000,1029.000000,0.000000,""};
item49[] = {"sliderPosChanged",4,218,-25.000000,1000.000000,75.000000,1050.000000,0.000000,"sliderPosChanged"};
item50[] = {"sliderPosChanged",1,250,100.000000,1000.000000,200.000000,1050.000000,0.000000,"sliderPosChanged"};
link0[] = {0,1};
link1[] = {0,3};
link2[] = {0,8};
link3[] = {0,11};
link4[] = {0,14};
link5[] = {0,17};
link6[] = {0,25};
link7[] = {0,26};
link8[] = {0,30};
link9[] = {0,33};
link10[] = {0,36};
link11[] = {0,39};
link12[] = {0,44};
link13[] = {0,45};
link14[] = {0,48};
link15[] = {1,2};
link16[] = {3,4};
link17[] = {4,5};
link18[] = {6,7};
link19[] = {8,6};
link20[] = {9,10};
link21[] = {11,9};
link22[] = {12,13};
link23[] = {13,28};
link24[] = {14,12};
link25[] = {15,16};
link26[] = {16,20};
link27[] = {17,15};
link28[] = {18,19};
link29[] = {20,18};
link30[] = {21,22};
link31[] = {23,24};
link32[] = {24,27};
link33[] = {25,21};
link34[] = {26,23};
link35[] = {27,18};
link36[] = {28,29};
link37[] = {30,31};
link38[] = {31,32};
link39[] = {33,34};
link40[] = {34,35};
link41[] = {36,37};
link42[] = {37,38};
link43[] = {39,40};
link44[] = {40,41};
link45[] = {42,43};
link46[] = {44,42};
link47[] = {45,46};
link48[] = {46,47};
link49[] = {48,49};
link50[] = {49,50};
globals[] = {25.000000,1,0,0,16777215,640,480,1,67,6316128,1,-109.034599,390.493256,531.092468,-344.298370,513,899,1};
window[] = {2,-1,-1,-1,-1,972,-1296,-175,204,3,530};
*//*%FSM</HEAD>*/
private ["_state", "_finalStateArray"];
/*%FSM<PRIVATEVARIABLES>*/
#define MENU_CLASS	"RscDisplayHeliportHeli"
#define MENU_CONFIG	(BIS_fnc_heliportMenuHeli_config)
#define MENU_PATH	(BIS_fnc_heliportMenuHeli_class)
#define MENU_TOGGLE	(BIS_fnc_heliportMenuHeli_toggle select 0)
#define DISPLAY	(uinamespace getvariable MENU_CLASS)
#define CONTROL	(DISPLAY displayctrl _idc)

private [
	"_mode",
	"_input",
	"_idc",
	"_lbId",
	"_heliport",
	"_helicopter",
	"_item",
	"_itemName",
	"_category",
	"_cfgHelicopter",
	"_cfgCategory",
	"_isOwned"
];
/*%FSM</PRIVATEVARIABLES>*/
_state="START";
_finalStateArray = ["ERROR", "ListHeliport", "ListHelicopters", "ListCategories", "Refresh_the_list", "ButtonBack", "Preview", "unLoad", "mouseMoving", "mouseButtonDown", "mouseButtonUp", "ButtonAssign", "mouseZChanged", "sliderPosChanged"];
while {!(_state in _finalStateArray)} do
{
  switch (_state) do
  {
  /*%FSM<STATE "START">*/
  case ("START"):
  {
    /*%FSM<STATEINIT>*/
    _mode = [_this,0,"",[""]] call bis_fnc_param;
    _input = [_this,1,-1] call bis_fnc_param;
    /*%FSM</STATEINIT>*/
    switch(true) do
    {
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
      /*%FSM<LINK "ListHelicopters">*/
      case (call {/*%FSM<CONDITION>*/
      _mode == "ListHelicopters"
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "ListHelicopters";
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
      /*%FSM<LINK "unLoad">*/
      case (call {/*%FSM<CONDITION>*/
      _mode == "unLoad"
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "unLoad";
      };
      /*%FSM</LINK>*/
      /*%FSM<LINK "mouseMoving">*/
      case (call {/*%FSM<CONDITION>*/
      _mode == "mouseMoving"
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "mouseMoving";
      };
      /*%FSM</LINK>*/
      /*%FSM<LINK "mouseButtonDown">*/
      case (call {/*%FSM<CONDITION>*/
      _mode == "mouseButtonDown"
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "mouseButtonDown";
      };
      /*%FSM</LINK>*/
      /*%FSM<LINK "mouseButtonUp">*/
      case (call {/*%FSM<CONDITION>*/
      _mode == "mouseButtonUp"
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "mouseButtonUp";
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
      /*%FSM<LINK "mouseZChanged">*/
      case (call {/*%FSM<CONDITION>*/
      _mode == "mouseZChanged"
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "mouseZChanged";
      };
      /*%FSM</LINK>*/
      /*%FSM<LINK "sliderPosChanged">*/
      case (call {/*%FSM<CONDITION>*/
      _mode == "sliderPosChanged"
      /*%FSM</CONDITION>*/}):
      {
        /*%FSM<ACTION>*/
        /*%FSM</ACTION>*/
        _state = "sliderPosChanged";
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
  /*%FSM<STATE "ListItems">*/
  case ("ListItems"):
  {
    /*%FSM<STATEINIT>*/
    //--- Read heliport
    _idc = ([MENU_CONFIG,"ListHeliport"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _heliport = CONTROL lbdata _lbId;

    //--- Read helicopters
    _idc = ([MENU_CONFIG,"ListHelicopters"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _helicopter = CONTROL lbdata _lbId;
    _isOwnedHelicopter = (CONTROL lbvalue _lbId) > 0;

    //--- Read category
    _idc = ([MENU_CONFIG,"ListCategories"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _category = CONTROL lbdata _lbId;

    //--- Read item
    _idc = ([MENU_CONFIG,"ListItems"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _itemName = CONTROL lbdata _lbId;
    _isOwned = (CONTROL lbvalue _lbId) > 0;

    //--- Nothing selected - terminate
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

    BIS_fnc_heliportMenuHeli_toggle set [3,_lbId];

    //--- Get config
    _item = if (_category != "") then {

    	//--- Item
    	configfile >> "CfgBase" >> _heliport >> MENU_PATH >> _helicopter >> _category >> _itemName;
    } else {

    	//--- Helicopter
    	_isOwned = _isOwnedHelicopter;
    	configfile >> "CfgBase" >> _heliport >> MENU_PATH >> _helicopter;
    };

    //--- Get config params
    _displayName = _item call bis_fnc_displayName;
    _libTextDesc = gettext (_item >> "libTextDesc");
    _enable = [_item,"enable"] call bis_fnc_heliportCondition;
    _enableText = gettext (_item >> "enableText");
    _price = getnumber (_item >> "price");
    _weight = getnumber (_item >> "weight");
    _missionSpecific = getnumber (_item >> "missionSpecific");
    _areFreeHelislots = ([] call bis_fnc_heliporthelislots > 0) || _category != "" || _isOwned;

    //--- Text functions
    _fnc_buttonOK = {
    	private ["_text","_price","_color","_disable"];
    	_text = _this select 0;
    	_price = _this select 1;
    	_disable = [_this,2,false] call bis_fnc_param;
    	_color = if (_disable) then {
    		"#66ffffff"
    	} else {
    			if (_price < 0) then {"#ccff8833"} else {"#cc33ff33"};
    	};
    	CONTROL ctrlenable !_disable;
    	CONTROL ctrlsetstructuredtext parsetext format [
    		"<t color='%3'>%1<t align='right'>$%2</t></t>",
    		_text,
    		(abs _price) call bis_fnc_numbertext,
    		_color
    	];
    };
    _fnc_weight = {
    	_idc = ([MENU_CONFIG,"TextDescriptionPrice"] call BIS_fnc_getIDC);
    	CONTROL ctrlsetstructuredtext parsetext format ["<t align='right'>Weight: <t size='1.4'>%1 kg</t></t>",_weight];
    };

    //--- Title
    _idc = ([MENU_CONFIG,"TextDescriptionHeader"] call BIS_fnc_getIDC);
    CONTROL ctrlsetstructuredtext parsetext ("<t align='left' size='1.4'>" + _displayName + "</t>");

    //--- Description and color settings
    _showColor = getnumber (_item >> "showColor");
    if (_showColor > 0) then {

    	//--- Color settings
    	_idc = ([MENU_CONFIG,"TopRightColors"] call BIS_fnc_getIDC);
    	CONTROL ctrlsetfade 0;
    	CONTROL ctrlcommit 0;
    	CONTROL ctrlenable true;
    	ctrlsetfocus CONTROL;

    	_idc = ([MENU_CONFIG,"TextDescription"] call BIS_fnc_getIDC);
    	CONTROL ctrlsetfade 1;
    	CONTROL ctrlcommit 0;
    	CONTROL ctrlenable false;

    	_colorR = [hsim_heliportDB,[_heliport,MENU_PATH,_helicopter,"colorR"],0.42] call BIS_fnc_dbValueReturn;
    	_colorG = [hsim_heliportDB,[_heliport,MENU_PATH,_helicopter,"colorG"],0.42] call BIS_fnc_dbValueReturn;
    	_colorB = [hsim_heliportDB,[_heliport,MENU_PATH,_helicopter,"colorB"],0.35] call BIS_fnc_dbValueReturn;

    	[hsim_heliportDB,[_heliport,MENU_PATH,_helicopter,"colorR"],_colorR] call BIS_fnc_dbValueSet;
    	[hsim_heliportDB,[_heliport,MENU_PATH,_helicopter,"colorG"],_colorG] call BIS_fnc_dbValueSet;
    	[hsim_heliportDB,[_heliport,MENU_PATH,_helicopter,"colorB"],_colorB] call BIS_fnc_dbValueSet;

    	_idc = ([MENU_CONFIG,"sliderColorR"] call BIS_fnc_getIDC);
    	CONTROL slidersetposition (_colorR * 10);
    	_idc = ([MENU_CONFIG,"sliderColorG"] call BIS_fnc_getIDC);
    	CONTROL slidersetposition (_colorG * 10);
    	_idc = ([MENU_CONFIG,"sliderColorB"] call BIS_fnc_getIDC);
    	CONTROL slidersetposition (_colorB * 10);

    	["sliderPosChanged",[-1]] spawn bis_fnc_heliportMenuHeli;

    } else {

    	//--- Item description
    	_idc = ([MENU_CONFIG,"TextDescription"] call BIS_fnc_getIDC);
    	CONTROL ctrlsetstructuredtext parsetext format ["<t align='left'>%1</t>",_libTextDesc];
    	CONTROL call bis_fnc_ctrltextheight;
    	CONTROL ctrlsetfade 0;
    	CONTROL ctrlcommit 0;
    	CONTROL ctrlenable true;
    	ctrlsetfocus CONTROL;

    	_idc = ([MENU_CONFIG,"TopRightColors"] call BIS_fnc_getIDC);
    	CONTROL ctrlsetfade 1;
    	CONTROL ctrlcommit 0;
    	CONTROL ctrlenable false;
    };

    //--- Weight
    [true] spawn BIS_fnc_heliportMoneyDisplay;

    //--- Assign button
    _idc = ([MENU_CONFIG,"ButtonAssign"] call BIS_fnc_getIDC);
    CONTROL ctrlshow false;

    //--- Owned?
    if (_isOwned) then {

    	//--- Purchase button
    	_idc = ([MENU_CONFIG,"ButtonOK"] call BIS_fnc_getIDC);
    	CONTROL ctrlenable true;

    	if (_category != "") then {

    		/////////////////////////////////////////////////////////////////////////
    		//--- Owned Component
    		/////////////////////////////////////////////////////////////////////////

    		_active = [hsim_heliportDB,[_heliport,MENU_PATH,_helicopter,_category,_itemName,"active"],true] call BIS_fnc_dbValueReturn;
    		if (_active) then {
    			CONTROL ctrlsettext localize "STR_HSIM_BIS_fnc_heliportMenuHeli_ComponentDisable";
    		} else {
    			CONTROL ctrlsettext localize "STR_HSIM_BIS_fnc_heliportMenuHeli_ComponentEnable";
    		};

    		//--- Weight
    		[] call _fnc_weight;
    	} else {

    		/////////////////////////////////////////////////////////////////////////
    		//--- Owned Helicopter
    		/////////////////////////////////////////////////////////////////////////
    		if (_itemName == "m") then {

    			_helicopterObject = missionnamespace getvariable _helicopter;
    			_helicopterMode = _helicopterObject getvariable ["HSim_maintenanceMode",false];
    			_price = -(_helicopterObject call bis_fnc_heliportMaintenanceCost);
    			if (_price == 0) then {
    				//[1,_helicopterObject] call bis_fnc_heliportMaintenance;
    				_helicopterMode = false;
    			};
    			
    			if (_helicopterMode) then {
    				_disable = false;
    				_textButton = if (([] call BIS_fnc_heliportMoney) + _price < 0) then {
    					_disable = true;
    					localize "STR_HSIM_BIS_fnc_heliportMenuHeli_NoMoney"
    				} else {
    					localize "STR_HSIM_BIS_fnc_heliportMenuHeli_Repair"
    				};
    				[_textButton,_price,_disable] call _fnc_buttonOK;
    			} else {
    				[localize "STR_HSIM_BIS_fnc_heliportMenuHeli_NoMaintenance",0,true] call _fnc_buttonOK;
    			};

    		} else {

    			//-- Do not allow selling of last helicopter
    			_textButton = localize "STR_HSIM_BIS_fnc_heliportMenuHeli_Sell";
    			_listHelicopters = [hsim_heliportDB,[_heliport,MENU_PATH]] call bis_fnc_dbClassList;
    			_heliCount = 0;
    			{
    				_config = [hsim_heliportDB,[_heliport,MENU_PATH,_x,"config"]] call bis_fnc_dbValueReturn;
    				if !(isnil "_config") then {
    					if ((getnumber (_config >> "missionSpecific")) == 0) then {
    						_heliCount = _heliCount + 1;
    					};
    				};
    			} foreach _listHelicopters;
    			_disable = _heliCount <= 1;//(count _listHelicopters <= 1);

    			//--- Mission specific helicopter
    			if (_missionSpecific == 1) then {
    				_textButton = localize "STR_HSIM_BIS_fnc_heliportMenuHeli_CannotSell";
    				_disable = true;
    			};

    			//--- Sell
    			_price = -round (_price / 2);
    			[_textButton,_price,_disable] call _fnc_buttonOK;

    			//--- Sell price
    			_idc = ([MENU_CONFIG,"TextDescriptionPrice"] call BIS_fnc_getIDC);
    			CONTROL ctrlsetstructuredtext parsetext "";

    			//--- Assign button
    			_idc = ([MENU_CONFIG,"ButtonAssign"] call BIS_fnc_getIDC);
    			CONTROL ctrlshow true;

    			_pilotAssigned = [
    				0,
    				[_heliport,MENU_PATH,_helicopter]
    			] call bis_fnc_heliportHeliAssigned;
    			_pilotAssigned = [hsim_heliportDB,_pilotAssigned + ["config"]] call bis_fnc_dbvalueReturn;
    			_pilotAssigned = if (!isnil "_pilotAssigned") then {
    				_pilotAssigned call bis_fnc_displayName;
    			} else {
    				""
    			};
    			if (_missionSpecific == 1) then {
    				CONTROL ctrlenable false;
    				CONTROL ctrlsettext localize "STR_HSIM_BIS_fnc_heliportMenuHeli_HeliContract";
    			} else {
    				CONTROL ctrlenable true;
    				if (_pilotAssigned == "") then {
    					CONTROL ctrlsettext localize "STR_HSIM_BIS_fnc_heliportMenuHeli_HeliAssign";
    				} else {
    					CONTROL ctrlsettext format [localize "STR_HSIM_BIS_fnc_heliportMenuHeli_HeliAssigned" + " %1",_pilotAssigned];
    				};
    			};
    		};
    	};
    } else {

    	/////////////////////////////////////////////////////////////////////////
    	//--- Available Helicopter / Component
    	/////////////////////////////////////////////////////////////////////////

    	//--- Weight
    	[] call _fnc_weight;

    	//--- Reason for disabling
    	_textReason = "Purchase";
    	if (
    		!call compile _enable
    		||
    		(call BIS_fnc_heliportMoney) + _price < 0
    		||
    		!_areFreeHelislots
    	) then {
    		_textReason = _enableText;
    		if (call compile _enable) then {_textReason = localize "STR_HSIM_BIS_fnc_heliportMenuHeli_NoMoney"};
    		if (!_areFreeHelislots) then {_textReason = localize "STR_HSIM_BIS_fnc_heliportMenuHeli_NoHangar"};
    	};
    	//CONTROL ctrlsetstructuredtext parsetext _textReason;

    	//--- Purchase button
    	_idc = ([MENU_CONFIG,"ButtonOK"] call BIS_fnc_getIDC);
    	_enableButton = (
    		//--- Player has enough money
    		(call BIS_fnc_heliportMoney) + _price >= 0
    		&&
    		//--- Helicopter is enabled
    		call compile _enable
    		&&
    		//--- Free helispot is available (not required for heli upgrades)
    		_areFreeHelislots
    	);
    	CONTROL ctrlenable _enableButton;
    	[_textReason,_price,!_enableButton] call _fnc_buttonOK;
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
        _state = "Preview";
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

    //--- Dialog IDC
    BIS_fnc_heliportMenuHeli_config = [MENU_CLASS] call BIS_fnc_heliportDialogInit;
    BIS_fnc_heliportMenuHeli_class = "Helicopters";
    if (isnil "BIS_fnc_heliportMenuHeli_toggle") then {
    	BIS_fnc_heliportMenuHeli_toggle = [0,0,0,0];
    };
    BIS_fnc_heliportMenuHeli_mouse = [];

    //--- Hide color
    _idc = ([MENU_CONFIG,"TopRightColors"] call BIS_fnc_getIDC);
    CONTROL ctrlsetfade 1;
    CONTROL ctrlcommit 0;

    //--- Money
    [true] spawn BIS_fnc_heliportMoneyDisplay;

    //--- Header
    _idc = ([MENU_CONFIG,"TextHeader"] call BIS_fnc_getIDC);
    CONTROL ctrlsetstructuredtext parsetext "<t size='1.4'>Helicopters</t>";

    //--- Listbox - Heliports
    _idc = ([MENU_CONFIG,"ListHeliport"] call BIS_fnc_getIDC);
    CONTROL call BIS_fnc_heliportListboxHeliports;
    CONTROL lbsetcursel (BIS_fnc_heliportMenuHeli_toggle select 0);

    _listHelipads = [hsim_heliportDB,[worldname,"Upgrades","Helipads"]] call BIS_fnc_dbClassList;
    BIS_fnc_heliportMenuHeli_helipad = missionnamespace getvariable ("hsim_" + (_listHelipads select 0));

    //--- Camera
    BIS_fnc_heliportMenuHeli_cameraDir = 90;
    BIS_fnc_heliportMenuHeli_cameraAlt = 1;
    BIS_fnc_heliportMenuHeli_cameraZoom = 0.7;
    BIS_fnc_heliportMenuHeli_cameraTarget = position BIS_fnc_heliportMenuHeli_helipad;

    _camera = "camera" camcreate position BIS_fnc_heliportMenuHeli_helipad;
    _camera cameraeffect ["internal","back"];
    _camera campreparetarget BIS_fnc_heliportMenuHeli_helipad;
    _camera campreparefocus [-1,-1];
    _camera campreparefov BIS_fnc_heliportMenuHeli_cameraZoom;
    _camera camcommitprepared 0;
    BIS_fnc_heliportMenuHeli_camera = _camera;
    showcinemaborder false;

    //--- Make player invisible
    player hideobject true;


    //--- Clicked on listbox
    BIS_fnc_heliportMenuHeli_listboxTimer = diag_ticktime;
    {
    	_idc = [MENU_CONFIG,_x] call BIS_fnc_getIDC;
    	CONTROL ctrladdeventhandler [
    		"LBSelChanged",
    		format ["['%1',_this] call BIS_fnc_heliportMenuHeli;",_x]
    	];
    	CONTROL ctrladdeventhandler ["mousemoving","BIS_fnc_heliportMenuHeli_listboxTimer = diag_ticktime;"];
    	CONTROL ctrladdeventhandler ["mouseholding","BIS_fnc_heliportMenuHeli_listboxTimer = diag_ticktime;"];
    } foreach [
    	"ListHelicopters",
    	"ListCategories",
    	"ListItems",
    	"ListHeliport"
    ];

    //--- Double-click on item (Purchase / Sell)
    _idc = [MENU_CONFIG,"ListItems"] call BIS_fnc_getIDC;
    CONTROL ctrladdeventhandler ["LBDblClick","
     startloadingscreen [''];
    	['ButtonOK'] spawn BIS_fnc_heliportMenuHeli;
    "];

    //--- Double click on helicopter (Assign helicopter)
    _idc = [MENU_CONFIG,"ListHelicopters"] call BIS_fnc_getIDC;
    CONTROL ctrladdeventhandler ["LBDblClick","
    	if ((_this select 1) == 0) then {
    		['ButtonAssign'] spawn BIS_fnc_heliportMenuHeli;
    	};
    "];

    {
    	_idc = ([MENU_CONFIG,_x] call BIS_fnc_getIDC);
    	CONTROL buttonsetaction format ["['%1'] spawn BIS_fnc_heliportMenuHeli;",_x];
    } foreach [
     	"ButtonOK",
    	"ButtonBack",
    	"ButtonAssign"
    ];

    //--- Color sliders
    {
    	_idc = [MENU_CONFIG,_x] call BIS_fnc_getIDC;
    	CONTROL ctrladdeventhandler [
    		"sliderPosChanged",
    		format ["['sliderPosChanged',[%1,_this]] call BIS_fnc_heliportMenuHeli;",_foreachindex]
    	];
    } foreach [
    	"sliderColorR",
    	"sliderColorG",
    	"sliderColorB"
    ];

    //--- Other
    {
    	DISPLAY displayaddeventhandler [
    		_x,
    		format ["['%1',_this] call BIS_fnc_heliportMenuHeli;",_x]
    	];
    } foreach [
    	"mouseMoving",
    	"mouseButtonDown",
    	"mouseButtonUp",
    	"mouseZChanged",
    	"unLoad"
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
  /*%FSM<STATE "ButtonOK">*/
  case ("ButtonOK"):
  {
    /*%FSM<STATEINIT>*/
    _loadingScreen = [""];

    //--- OK button disabled - cannot purchase
    _idc = ([MENU_CONFIG,"ButtonOK"] call BIS_fnc_getIDC);
    if !(ctrlenabled CONTROL) exitwith {
    	endloadingscreen;

    	//--- Terminate FSM
    	_finalStateArray = [_state];
    };

    //--- Read heliport
    _idc = ([MENU_CONFIG,"ListHeliport"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _heliport = CONTROL lbdata _lbId;

    //--- Read helicopters
    _idc = ([MENU_CONFIG,"ListHelicopters"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _helicopter = CONTROL lbdata _lbId;
    _isOwnedHelicopter = (CONTROL lbvalue _lbId) > 0;

    //--- Read category
    _idc = ([MENU_CONFIG,"ListCategories"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _category = CONTROL lbdata _lbId;

    //--- Read item
    _idc = ([MENU_CONFIG,"ListItems"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _itemName = CONTROL lbdata _lbId;
    _isOwned = (CONTROL lbvalue _lbId) > 0;

    _item = if (_category != "") then {
    	configfile >> "CfgBase" >> _heliport >> MENU_PATH >> _helicopter >> _category >> _itemName;
    } else {
    	configfile >> "CfgBase" >> _heliport >> MENU_PATH >> _helicopter;
    };

    if (_isOwnedHelicopter && _category == "") then {

    	if (_itemName == "m") then {
    		_helicopterObject = missionnamespace getvariable _helicopter;

    		//--- Remove money
    		_price = (_helicopterObject call bis_fnc_heliportMaintenanceCost);
    		[-_price] call BIS_fnc_heliportMoneyAdd;

    		//--- Repair helicopter
    		[-1,_helicopterObject] call bis_fnc_heliportMaintenance; //--- Reset
    		[+1,_helicopterObject] call bis_fnc_heliportMaintenance; //--- Disable

    	} else {

    		//--- Sell helicopter
    		_price = getnumber (_item >> "price");
    		_price = _price / 2;

    		//--- Confirmation
    		if !(
    			([
    				format [
    					localize "STR_hsim_bis_fnc_heliportmenuheli_confirmsell",
    					_item call bis_fnc_displayName,
    					(abs _price) call bis_fnc_numbertext
    				],
    				nil,
    				nil,
    				true
    			] call bis_fnc_guiMessage) select 0
    		) exitwith {};
    		startloadingscreen _loadingScreen;

    		//--- Sell
    		[-_price] call BIS_fnc_heliportMoneyAdd;

    		//--- Delete helicopter
    		[_helicopter] call BIS_fnc_heliportHeliRemove;

    		//--- Auto assign
    		[_heliport,true] call bis_fnc_heliportHeliAssign;
    	};
    } else {

    	if (_isOwned) then {
    		startloadingscreen _loadingScreen;

    		//--- Install / Uninstall
    		_active = [hsim_heliportDB,[_heliport,MENU_PATH,_helicopter,_category,_itemName,"active"],true] call BIS_fnc_dbValueReturn;
    		[
    			hsim_heliportDB,
    			[_heliport,MENU_PATH,_helicopter,_category,_itemName,"active"],
    			!_active
    		] call BIS_fnc_dbValueSet;
    		
    		[BIS_fnc_heliportMenuHeli_preview,_helicopter,_item] call bis_fnc_heliportHeliInit;

    	} else {

    		//--- Purchase
    		_price = getnumber (_item >> "price");

    		//--- Confirmation
    		if !(
    			([
    				format [
    					localize "STR_HSIM_BIS_fnc_heliportMenuHeli_ConfirmPurchase",
    					_item call bis_fnc_displayName,
    					(abs _price) call bis_fnc_numbertext
    				],
    				nil,
    				nil,
    				true
    			] call bis_fnc_guiMessage) select 0
    		) exitwith {};
    		startloadingscreen _loadingScreen;

    		//--- Remove money
    		[_price] call BIS_fnc_heliportMoneyAdd;

    		//--- Save into DB
    		_dbAdd = if (_category == "") then {

    			//--- Helicopter
    			[
    				MENU_PATH,
    				[_heliport,MENU_PATH,_helicopter],
    				[_item]
    			] call BIS_fnc_heliportDBAdd;

    			//--- Create helicopter
    			[_helicopter] call BIS_fnc_heliportHeliAdd;

    		} else {

    			//--- Upgrade
    			[
    				MENU_PATH + "_U",
    				[_heliport,MENU_PATH,_helicopter,_category,_itemName],
    				[_item]
    			] call BIS_fnc_heliportDBAdd;

    			[BIS_fnc_heliportMenuHeli_preview,_helicopter,_item] call bis_fnc_heliportHeliInit;

    			BIS_fnc_heliportMenuHeli_toggle set [3,0];
    		};
    	};
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
    ["Mode '%1' not found",_mode] call bis_fnc_error;
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
    _heliport = CONTROL lbdata _lbId;

    BIS_fnc_heliportMenuHeli_toggle set [0,_lbId];

    //--- Clear list
    _idc = ([MENU_CONFIG,"ListHelicopters"] call BIS_fnc_getIDC);
    lbclear CONTROL;


    //--- Fill the list - Helicopters
    _cfgHelicopters = configfile >> "cfgbase" >> _heliport >> MENU_PATH;
    [
    	CONTROL,
    	_cfgHelicopters,
    	[_heliport,MENU_PATH],
    	{[] call bis_fnc_heliporthelislots > 0}
    ] call bis_fnc_heliportMenuItem;

    CONTROL lbsetcursel (BIS_fnc_heliportMenuHeli_toggle select 1);
    /*%FSM</STATEINIT>*/
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "ListHelicopters">*/
  case ("ListHelicopters"):
  {
    /*%FSM<STATEINIT>*/
    //--- Read heliport
    _idc = ([MENU_CONFIG,"ListHeliport"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _heliport = CONTROL lbdata _lbId;

    //--- Read helicopters
    _idc = ([MENU_CONFIG,"ListHelicopters"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _helicopter = CONTROL lbdata _lbId;
    _cfgHelicopter = configfile >> "CfgBase" >> _heliport >> MENU_PATH >> _helicopter;
    _isOwned = (CONTROL lbvalue _lbId) > 0;

    //--- Set current item (reset when helicopter was changed)
    if ((BIS_fnc_heliportMenuHeli_toggle select 1) != _lbId) then {
    	BIS_fnc_heliportMenuHeli_toggle set [2,0];
    	BIS_fnc_heliportMenuHeli_toggle set [3,0];
    };
    BIS_fnc_heliportMenuHeli_toggle set [1,_lbId];

    //--- Clear the category list
    _idc = ([MENU_CONFIG,"ListCategories"] call BIS_fnc_getIDC);
    lbclear CONTROL;

    if (_lbId < 0) exitwith {
    	//--- Terminate FSM
    	_finalStateArray = [_state];
    };

    //--- Fill the list - Categories
    _lbId = CONTROL lbadd localize "STR_HSIM_BIS_fnc_heliportMenuHeli_MenuHelicopter";
    CONTROL lbsetdata [_lbId,""];

    if (_isOwned) then {

    	//--- Owned helicopter
    	[
    		CONTROL,
    		_cfgHelicopter,
    		[]
    	] call bis_fnc_heliportMenuItem;
    };
    CONTROL lbsetcursel (BIS_fnc_heliportMenuHeli_toggle select 2);
    /*%FSM</STATEINIT>*/
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "ListCategories">*/
  case ("ListCategories"):
  {
    /*%FSM<STATEINIT>*/
    //--- Read heliport
    _idc = ([MENU_CONFIG,"ListHeliport"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _heliport = CONTROL lbdata _lbId;

    //--- Read helicopters
    _idc = ([MENU_CONFIG,"ListHelicopters"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _helicopter = CONTROL lbdata _lbId;
    _isOwnedHelicopter = (CONTROL lbvalue _lbId) > 0;
    _cfgHelicopter = configfile >> "CfgBase" >> _heliport >> MENU_PATH >> _helicopter;

    //--- Read category
    _idc = ([MENU_CONFIG,"ListCategories"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _category = CONTROL lbdata _lbId;

    //--- Nothing selected - terminate
    if (_lbId < 0) exitwith {
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

    if ((BIS_fnc_heliportMenuHeli_toggle select 2) != _lbId) then {
    	BIS_fnc_heliportMenuHeli_toggle set [3,0];
    };
    BIS_fnc_heliportMenuHeli_toggle set [2,_lbId];

    //--- Clear the list
    _idc = ([MENU_CONFIG,"ListItems"] call BIS_fnc_getIDC);
    lbclear CONTROL;

    //--- Fill the list - Items
    if (_category != "") then {

    	//--- Category
    	[
    		CONTROL,
    		configfile >> "CfgBase" >> _heliport >> MENU_PATH >> _helicopter >> _category,
    		[_heliport,MENU_PATH,_helicopter,_category]
    	] call bis_fnc_heliportMenuItem;
    	CONTROL lbsetcursel (BIS_fnc_heliportMenuHeli_toggle select 3);
    } else {

    	//--- New helicopter
    	_lbId = CONTROL lbadd localize "STR_HSIM_BIS_fnc_heliportMenuHeli_MenuHelicopter";
    	CONTROL lbsetdata [_lbId,""];

    	//--- Maintenance
    	if (_isOwnedHelicopter) then {
    		_lbId = CONTROL lbadd localize "STR_HSIM_BIS_fnc_heliportMenuHeli_MenuMaintenance";
    		CONTROL lbsetdata [_lbId,"m"];
    	};

    	CONTROL lbsetcursel 0;
    };
    /*%FSM</STATEINIT>*/
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "Refresh_the_list">*/
  case ("Refresh_the_list"):
  {
    /*%FSM<STATEINIT>*/
    startloadingscreen [""];

    _idc = ([MENU_CONFIG,"ListHeliport"] call BIS_fnc_getIDC);
    ["ListHeliport",[CONTROL,lbcursel CONTROL]] call BIS_fnc_heliportMenuHeli;

    [true] spawn BIS_fnc_heliportMoneyDisplay;

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
  /*%FSM<STATE "Preview">*/
  case ("Preview"):
  {
    /*%FSM<STATEINIT>*/
    //--- Camera
    //_vehicle = missionnamespace getvariable _helicopter;
    _components = getarray (_item >> "components");
    _textures = getarray (_item >> "textures");

    //--- Disable real helicopter
    {
    	_heliObject = missionnamespace getvariable _x;
    	_heliObject hideobject false;
    } foreach ([hsim_heliportDB,[_heliport,MENU_PATH]] call bis_fnc_dbClassList);

    _heliObject = missionnamespace getvariable _helicopter;
    _heliObject hideobject true;

    //--- Helicopter preview
    private ["_preview"];
    _preview = BIS_fnc_heliportMenuHeli_preview;
    if (isnil "_preview") then {_preview = objnull};
    _previewType = gettext (configfile >> "CfgBase" >> _heliport >> MENU_PATH >> _helicopter >> "vehicle");

    if (typeof _preview != _previewType) then {

    	//--- Delete previous
    	deletevehicle _preview;

    	//--- Create new preview helicopter
    	_helipad = BIS_fnc_heliportMenuHeli_helipad;
    	_preview = createvehicle [_previewType,position _helipad,[],0,"none"];
    	BIS_fnc_heliportMenuHeli_preview = _preview;

    	_preview setpos position _helipad;
    	_preview setdir direction _helipad;

    	//--- Reset camera
    	BIS_fnc_heliportMenuHeli_mouse = [controlnull,1,0,0,false,false,false];
    	[
    		"mouseMoving",[0,0,0]
    	] call BIS_fnc_heliportMenuHeli;
    	BIS_fnc_heliportMenuHeli_mouse = [];

    	if (_category == "") then {
    		_preview setvariable ["BIS_isOwned",_isOwned];
    	};
    };

    [_preview,_helicopter,_item,false] call bis_fnc_heliportHeliInit;

    /*
    //--- Preview items (only when not disabled)
    _active = if (_category != "") then {
    	if (_isOwned) then {
    		//[hsim_heliportDB,[_heliport,MENU_PATH,_helicopter,_category,_itemName,"active"],true] call BIS_fnc_dbValueReturn;
    		true
    	} else {
    		true
    	};
    } else {
    	true
    };
    */

    //if (_active) then {
    	{
    		_preview animate [_x,1];
    	} foreach _components;
    	{
    		_preview setobjecttexture [_foreachindex,_x];
    	} foreach _textures;
    //};
    /*%FSM</STATEINIT>*/
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "unLoad">*/
  case ("unLoad"):
  {
    /*%FSM<STATEINIT>*/
    BIS_fnc_heliportMenuHeli_camera cameraeffect ['terminate','back'];
    camdestroy BIS_fnc_heliportMenuHeli_camera;

    deletevehicle BIS_fnc_heliportMenuHeli_preview;

    //--- Show all hidden helicopters
    {
    	_heliObject = missionnamespace getvariable _x;
    	_heliObject hideobject false;
    } foreach ([hsim_heliportDB,[worldname,MENU_PATH]] call bis_fnc_dbClassList);


    BIS_fnc_heliportMenuHeli_helipad = nil;
    BIS_fnc_heliportMenuHeli_camera = nil;
    BIS_fnc_heliportMenuHeli_cameraDir = nil;
    BIS_fnc_heliportMenuHeli_cameraAlt = nil;
    BIS_fnc_heliportMenuHeli_preview = nil;
    BIS_fnc_heliportMenuHeli_mouse = nil;

    //--- Hide money
    [false] spawn BIS_fnc_heliportMoneyDisplay;

    //--- Apply changes to original
    {
    	_vehicle = missionnamespace getvariable _x;
    	[_vehicle,_x] call bis_fnc_heliportHeliInit;
    } foreach ([hsim_heliportDB,[worldname,MENU_PATH]] call bis_fnc_dbClassList);

    //--- Make player visible
    player hideobject false;
    /*%FSM</STATEINIT>*/
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "mouseMoving">*/
  case ("mouseMoving"):
  {
    /*%FSM<STATEINIT>*/
    if (count BIS_fnc_heliportMenuHeli_mouse > 0) then {

    	_x = _input select 1;
    	_y = _input select 2;
    	_button = BIS_fnc_heliportMenuHeli_mouse select 1;
    	_ctrl = BIS_fnc_heliportMenuHeli_mouse select 5;

    	if (_button > 0) then {

    		_camera = BIS_fnc_heliportMenuHeli_camera;
    		if (_ctrl) then {

    			//--- Camera target
    			_cameraTarget = BIS_fnc_heliportMenuHeli_cameraTarget;
    			_cameraTargetZ = (_cameraTarget select 2) - _y;
    			_cameraTargetZ = _cameraTargetZ max -5 min 5;
    			_cameraTarget set [2,_cameraTargetZ];

    			_camera = BIS_fnc_heliportMenuHeli_camera;
    			_camera campreparetarget _cameraTarget;

    		} else {

    			//--- Camera pos
    			BIS_fnc_heliportMenuHeli_cameraDir = BIS_fnc_heliportMenuHeli_cameraDir + _x;
    			BIS_fnc_heliportMenuHeli_cameraAlt = (BIS_fnc_heliportMenuHeli_cameraAlt + _y) max 0 min 15;
    			_preview = BIS_fnc_heliportMenuHeli_preview;
    			_cameraPos = [
    				_preview,
    				sizeof typeof _preview * 1,
    				BIS_fnc_heliportMenuHeli_cameraDir
    			] call BIS_fnc_relPos;
    			_cameraPos set [2,BIS_fnc_heliportMenuHeli_cameraAlt];
    			_camera campreparepos _cameraPos;
    		};
    		_camera camcommitprepared 0;
    	};
    };
    /*%FSM</STATEINIT>*/
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "mouseButtonDown">*/
  case ("mouseButtonDown"):
  {
    /*%FSM<STATEINIT>*/
    _button = _input select 1;

    BIS_fnc_heliportMenuHeli_mouse = _input;

    false
    /*%FSM</STATEINIT>*/
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "mouseButtonUp">*/
  case ("mouseButtonUp"):
  {
    /*%FSM<STATEINIT>*/
    //_key = _input select 1;
    //BIS_fnc_heliportMenuHeli_keys = BIS_fnc_heliportMenuHeli_keys - [_key];

    BIS_fnc_heliportMenuHeli_mouse = [];

    false
    /*%FSM</STATEINIT>*/
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "ButtonAssign">*/
  case ("ButtonAssign"):
  {
    /*%FSM<STATEINIT>*/
    //--- Read heliport
    _idc = ([MENU_CONFIG,"ListHeliport"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _heliport = CONTROL lbdata _lbId;

    //--- Read helicopters
    _idc = ([MENU_CONFIG,"ListHelicopters"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _helicopter = CONTROL lbdata _lbId;
    _isOwnedHelicopter = (CONTROL lbvalue _lbId) > 0;

    if (_isOwnedHelicopter) then {

    	[
    		_heliport,
    		_helicopter,
    		"player"
    	] call bis_fnc_heliportHeliAssign;

    	//--- Assign button
    	_idc = ([MENU_CONFIG,"ButtonAssign"] call BIS_fnc_getIDC);
    	CONTROL ctrlshow true;

    	_pilotAssigned = [
    		0,
    		[_heliport,MENU_PATH,_helicopter]
    	] call bis_fnc_heliportHeliAssigned;
    	_pilotAssigned = [hsim_heliportDB,_pilotAssigned + ["config"]] call bis_fnc_dbvalueReturn;
    	_pilotAssigned = if (!isnil "_pilotAssigned") then {
    		_pilotAssigned call bis_fnc_displayName;
    	} else {
    		""
    	};
    	CONTROL ctrlsettext format [localize "STR_HSIM_BIS_fnc_heliportMenuHeli_HeliAssigned" + " %1",_pilotAssigned];

    } else {
    	//["Cannot assign '%1', helicopter is not owned",_helicopter] call bis_fnc_error;
    };
    /*%FSM</STATEINIT>*/
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "mouseZChanged">*/
  case ("mouseZChanged"):
  {
    /*%FSM<STATEINIT>*/
    if ((diag_ticktime - BIS_fnc_heliportMenuHeli_listboxTimer) > 0.1) then {
    	_zoom = -(_input select 1) / 20;
    	BIS_fnc_heliportMenuHeli_cameraZoom = BIS_fnc_heliportMenuHeli_cameraZoom + _zoom;
    	BIS_fnc_heliportMenuHeli_cameraZoom = BIS_fnc_heliportMenuHeli_cameraZoom max 0.1 min 0.8;

    	_camera = BIS_fnc_heliportMenuHeli_camera;
    	_camera campreparefov BIS_fnc_heliportMenuHeli_cameraZoom;
    	_camera camcommitprepared 0;
    };
    /*%FSM</STATEINIT>*/
  };
  /*%FSM</STATE>*/
  /*%FSM<STATE "sliderPosChanged">*/
  case ("sliderPosChanged"):
  {
    /*%FSM<STATEINIT>*/
    private ["_idc","_lbId","_heliport","_helicopter","_cfgHelicopter","_colorId","_sliderPos","_color","_colorR","_colorG","_colorB"];

    //--- Read heliport
    _idc = ([MENU_CONFIG,"ListHeliport"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _heliport = CONTROL lbdata _lbId;

    //--- Read helicopters
    _idc = ([MENU_CONFIG,"ListHelicopters"] call BIS_fnc_getIDC);
    _lbId = lbcursel CONTROL;
    _helicopter = CONTROL lbdata _lbId;
    _cfgHelicopter = configfile >> "CfgBase" >> _heliport >> MENU_PATH >> _helicopter;


    //--- Load colors
    _colorId = _input select 0;
    if (_colorId >= 0) then {
    	_sliderPos = ((_input select 1) select 1) / 10;
    	_color = ["colorR","colorG","colorB"] select _colorId;

    	[hsim_heliportDB,[_heliport,MENU_PATH,_helicopter,_color],_sliderPos] call BIS_fnc_dbValueSet;
    };


    //--- Preview
    _colorR = [hsim_heliportDB,[_heliport,MENU_PATH,_helicopter,"colorR"]] call BIS_fnc_dbValueReturn;
    _colorG = [hsim_heliportDB,[_heliport,MENU_PATH,_helicopter,"colorG"]] call BIS_fnc_dbValueReturn;
    _colorB = [hsim_heliportDB,[_heliport,MENU_PATH,_helicopter,"colorB"]] call BIS_fnc_dbValueReturn;


    waituntil {!isnil "BIS_fnc_heliportMenuHeli_preview"};

    _color = format [
    	"#(argb,8,8,3)color(%1,%2,%3,1)",
    	_colorR,
    	_colorG,
    	_colorB
    ];
    for "_t" from 0 to 10 do {
    	BIS_fnc_heliportMenuHeli_preview setobjecttexture [
    		_t,
    		_color
    	];
    };

    //--- Show values
    _idc = ([MENU_CONFIG,"valueColorR"] call BIS_fnc_getIDC);
    CONTROL ctrlsettext format ["%1/255",round (_colorR * 255)];
    _idc = ([MENU_CONFIG,"valueColorG"] call BIS_fnc_getIDC);
    CONTROL ctrlsettext format ["%1/255",round (_colorG * 255)];
    _idc = ([MENU_CONFIG,"valueColorB"] call BIS_fnc_getIDC);
    CONTROL ctrlsettext format ["%1/255",round (_colorB * 255)];


    //[_colorR,_colorG,_colorB,BIS_fnc_heliportMenuHeli_preview] call bis_fnc_log;
    /*%FSM</STATEINIT>*/
  };
  /*%FSM</STATE>*/
};
/*%FSM</COMPILE>*/