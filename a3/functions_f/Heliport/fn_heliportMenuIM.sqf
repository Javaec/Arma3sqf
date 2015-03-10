/*%FSM<COMPILE "C:\BIS\fsmeditor\fsm2sqfCall.cfg, fn_heliportMenuIM">*/
/*%FSM<HEAD>*/
/*
item0[] = {"START",0,250,-100.000000,-200.000000,0.000000,-150.000000,0.000000,"START"};
item1[] = {"ERROR",8,218,25.000000,-200.000000,125.000000,-150.000000,-1.000000,"ERROR"};
item2[] = {"ERROR",1,250,150.000000,-200.000000,250.000000,-150.000000,0.000000,"ERROR"};
item3[] = {"INIT",4,218,25.000000,125.000000,125.000000,175.000000,0.000000,"INIT"};
item4[] = {"INIT",1,4346,150.000000,125.000000,250.000000,175.000000,0.000000,"INIT"};
item5[] = {"",7,210,-54.000053,145.999878,-45.999947,154.000122,0.000000,""};
item6[] = {"ButtonBack",4,218,25.000000,50.000000,125.000000,100.000000,0.000000,"ButtonBack"};
item7[] = {"ButtonBack",1,250,150.000000,50.000000,250.000000,100.000000,0.000000,"ButtonBack"};
item8[] = {"",7,210,-53.999958,70.999992,-46.000042,79.000008,0.000000,""};
item9[] = {"ListItems",4,218,25.000000,-75.000000,125.000000,-25.000000,0.000000,"ListItems"};
item10[] = {"ListItems",1,250,150.000000,-75.000000,250.000000,-25.000000,0.000000,"ListItems"};
item11[] = {"",7,210,-54.000000,-54.000015,-46.000000,-45.999985,0.000000,""};
link0[] = {0,1};
link1[] = {0,5};
link2[] = {0,8};
link3[] = {0,11};
link4[] = {1,2};
link5[] = {3,4};
link6[] = {5,3};
link7[] = {6,7};
link8[] = {8,6};
link9[] = {9,10};
link10[] = {11,9};
globals[] = {25.000000,1,0,0,16777215,640,480,1,12,6316128,1,-149.545303,415.342346,365.652618,-373.552612,519,899,1};
window[] = {2,-1,-1,-1,-1,937,-1088,33,169,3,536};
*//*%FSM</HEAD>*/
private ["_state", "_finalStateArray"];
/*%FSM<PRIVATEVARIABLES>*/
#define MENU_CLASS	"RscDisplayHeliportIM"
#define MENU_CONFIG	BIS_fnc_heliportMenuIM_config
#define MENU_PATH	BIS_fnc_heliportMenuIM_class
#define MENU_TOGGLE	BIS_fnc_heliportMenuIM_toggle
#define DISPLAY		(uinamespace getvariable MENU_CLASS)
#define CONTROL		(DISPLAY displayctrl _idc)

private [
	"_mode",
	"_input",
	"_idc",
	"_lbId",
	"_heliport",
	"_factionCategory"
];
/*%FSM</PRIVATEVARIABLES>*/
_state="START";
_finalStateArray = ["ERROR", "INIT", "ButtonBack", "ListItems"];
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
  /*%FSM<STATE "INIT">*/
  case ("INIT"):
  {
    /*%FSM<STATEINIT>*/
    createdialog MENU_CLASS;
    waituntil {!isnil {DISPLAY}};

    startloadingscreen [""];


    //--- Dialog IDC
    BIS_fnc_heliportMenuIM_config = [MENU_CLASS] call BIS_fnc_heliportDialogInit;
    BIS_fnc_heliportMenuIM_class = "IM";

    //--- Money
    [true] spawn BIS_fnc_heliportMoneyDisplay;

    //--- Header
    _idc = ([MENU_CONFIG,"textHeader"] call BIS_fnc_getIDC);
    CONTROL ctrlsettext "IM History";

    //--- Text field
    _idc = ([MENU_CONFIG,"TextDescription"] call BIS_fnc_getIDC);
    _pos = ctrlposition CONTROL;
    _pos set [3,(_pos select 3) * 1.5];
    CONTROL ctrlsetposition _pos;
    //CONTROL ctrlcommit 0;

    //--- Execute
    {
    	_idc = ([MENU_CONFIG,_x] call BIS_fnc_getIDC);
    	CONTROL ctrladdeventhandler [
    		"LBSelChanged",
    		format ["['%1',_this] call BIS_fnc_heliportMenuIM;",_x]
    	];
    } foreach [
    	"ListItems"
    ];

    {
    	_idc = ([MENU_CONFIG,_x] call BIS_fnc_getIDC);
    	CONTROL buttonsetaction format ["['%1',-1] spawn BIS_fnc_heliportMenuIM;",_x];
    } foreach [
    	"ButtonBack"
    ];


    _idc = ([MENU_CONFIG,"ListItems"] call BIS_fnc_getIDC);
    _listHeliports = [] call bis_fnc_heliportGetHeliports;
    {
    	_heliport = _x;
    	_listMissions = [] call bis_fnc_heliportMissionList;
    	{
    		_item = campaignconfigfile >> "campaign" >> "missions" >> _x;
    		if (isclass _item) then {

    			_terrain = gettext (_item >> "terrain");
    			if (_terrain == _heliport) then {

    				_im = format ["STR_HSim_%1_im_1",_x];
    				if (_im call bis_fnc_isLocalized) then {

    					_displayName = gettext (_item >> "displayName");
    					if (_displayName == "") then {_displayName = _configName;};

    					_lbId = CONTROL lbadd _displayName;
    					CONTROL lbsetdata [_lbId,_x];
    				};
    			};
    		};
    	} foreach _listMissions;
    } foreach _listHeliports;

    CONTROL lbsetcursel 0;

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
  /*%FSM<STATE "ListItems">*/
  case ("ListItems"):
  {
    /*%FSM<STATEINIT>*/
    _lbId = _input select 1;
    if (_lbId < 0) exitwith {

    	//--- No items - display nothing
    	_idc = ([MENU_CONFIG,"TextDescriptionHeader"] call BIS_fnc_getIDC);
    	CONTROL ctrlsetstructuredtext parsetext "";
    	_idc = ([MENU_CONFIG,"TextDescription"] call BIS_fnc_getIDC);
    	CONTROL ctrlsetstructuredtext parsetext "";

    	//--- Terminate FSM
    	_finalStateArray = [_state];
    };

    _idc = ([MENU_CONFIG,"ListItems"] call BIS_fnc_getIDC);
    _configname = CONTROL lbdata _lbId;
    _displayname = CONTROL lbtext _lbId;
    _libTextDesc = "XXX";

    //--- Item name
    _idc = ([MENU_CONFIG,"TextDescriptionHeader"] call BIS_fnc_getIDC);
    CONTROL ctrlsettext _displayName;

    //--- Person colors
    _tags = ["T","J","K","C","M","S","I","-"];
    _tagColors = ["#0000ff","#00ff00","#ffff00","#00ffff","#ff6666","#cccccc","#cccccc","#000000"];

    //--- Display mission info
    _br = "<br />";
    _text = "";
    _ddot = toarray ":" select 0;
    _dash = "-";
    _time = 0;
    _emoticon_smile = "<img image='hsim\ui_h\data\icons\emoticons\smile_1_ca.paa' />";
    _emoticon_LOL = "<img image='hsim\ui_h\data\icons\emoticons\smile_2_ca.paa' />";
    _emoticon_sad = "<img image='hsim\ui_h\data\icons\emoticons\smile_3_ca.paa' />";

    for "_i" from 1 to 25 do {

    	_im = format ["STR_HSim_%1_im_%2",_configname,_i];
    	if !(_im call bis_fnc_islocalized) exitwith {};

    	_im = localize _im;
    	if (parsenumber _im != 0) then {
    		_time = _time + (parsenumber _im) / 3600;
    	} else {
    		_imArray = toarray _im;
    		_imTag = tostring [_imArray select 0];
    		_imName = localize format ["STR_HSim_IM_%1",_imTag];
    		if ((_imArray select 1) == _ddot) then {
    			_imArray set [0,-1];
    			_imArray set [1,-1];
    			_imArray = _imArray - [-1];
    		};
    		_im = tostring _imArray;
    		_im = format [_im,_emoticon_smile,_emoticon_LOL,_emoticon_sad];

    		_time = if (_time == 0) then {
    			8 + (count _imArray % 9) + (count _imArray % 60) / 10
    		} else {
    			_time + (count _imArray / 5000)
    		};
    		//_imColor = if (_imTag == "T") then {"#0000ff"} else {"#00ff00"};
    		_imColor = _tagColors select (_tags find _imTag);
    		_text = if (_imTag != _dash) then {
    			_text + format [
    				"<t color='#000000'>%1</t> <t shadow='1' color='%4'>%2:</t> %3<br />",
    				[_time,"HH:MM:SS"] call bis_fnc_timetostring,
    				_imName,
    				_im,
    				_imColor
    			]
    		} else {
    			_text + format [
    				"<t color='#000000'>%1</t><br />",
    				_im
    			]
    		};
    	};
    };
    _text = "<t shadow='0'>" + _text + "</t>";


    _idc = ([MENU_CONFIG,"TextDescription"] call BIS_fnc_getIDC);
    CONTROL ctrlsetstructuredtext parsetext format ["<t align='left' size='1'>%1</t>",_text];
    CONTROL call bis_fnc_ctrltextheight;
    /*%FSM</STATEINIT>*/
  };
  /*%FSM</STATE>*/
};
/*%FSM</COMPILE>*/