#include "\A3\ui_f\hpp\defineResincl.inc"

_mode = _this select 0;
_params = _this select 1;
_class = _this select 2;

switch _mode do {

	case "onLoad": {

		//--- set player's name
		(_display displayctrl 8434) ctrlSetText profileName;
		[_display, 8434] call (uinamespace getvariable 'BIS_fnc_setIDCStreamFriendly');

		//Scenarios title change must be in spawn otherwise engine overwrites it.
		_params spawn
		{
			disableSerialization;
			_title = uinamespace getvariable ["RscDisplaySingleMission_title", toUpper (localize "STR_A3_RSCDISPLAYMAIN_BUTTONSCENARIOS")]; // SCENARIOS
			_display = _this select 0;
			_control = _display displayctrl 106;
			_control ctrlsettext _title;
			uinamespace setvariable ["RscDisplaySingleMission_title",nil];
		};
		
		//Campaign Title - set text to Campaign or Bootcamp
		_ctrlTitle = _display displayctrl 1000;
		_titleText = uinamespace getvariable ["RscDisplayCampaignLoad_title", toUpper (localize "STR_A3_RSCDISPLAYMAIN_BUTTONCAMPAIGN")]; // CAMPAIGN
		_ctrlTitle ctrlSetText _titleText;

		_overviewGroup = _display displayctrl 2300;
		_overviewGroup ctrlenable false;

		_overviewNoise = _display displayctrl 1201;
		_overviewNoise ctrlsettext "#(ai,512,256,1)perlinNoise(512,256,0,1)";

		_display displayaddeventhandler ["mousemoving","with uinamespace do {['Noise',_this,''] call RscDisplaySingleMission_script};"];
		_display displayaddeventhandler ["mouseholding","with uinamespace do {['Noise',_this,''] call RscDisplaySingleMission_script};"];
		
		//Stripe colour. TODO: Having one .sqf for two displays (Scenarios and Campaign) may result in IDC conflicts.
		_scenariosDLCStripe = _display displayctrl 121;
		_campaignDLCStripe = _display displayctrl 147;
		_stripeColor = getArray(configfile >> "CfgMods" >> "Kart" >> "dlcColor");
		if(count _stripeColor == 4) then
		{
			_scenariosDLCStripe ctrlSetTextColor _stripeColor;
			_campaignDLCStripe ctrlSetTextColor _stripeColor;
		};
		
		//Fill in the Challenges overview if available
		_tree = _display displayctrl 101;
		_tree ctrladdeventhandler ["TreeSelChanged", "with uinamespace do {['TreeSelChanged',_this,''] call RscDisplaySingleMission_script};"];
	};

	case "Noise": {
		disableSerialization;
		_display = _params select 0;

		_overviewGroup = _display displayctrl 2300;
		_overviewNoise = _display displayctrl 1201;
		_overviewPicture = _display displayctrl IDC_SINGLE_PICTURE;
		if (isnull _overviewPicture) then {_overviewPicture = _display displayctrl IDC_CAMPAIGN_PICTURE;};
		_pos = ctrlposition _overviewGroup;
		_posW = _pos select 2;
		_posH = _pos select 3;

		_color = if (ctrltext _overviewPicture == "") then {[0.5,0.5,0.5,1]} else {[1,1,1,0.12]};
		_overviewNoise ctrlsetposition [
			-random _posW,
			-random _posH,
			_posW * 2,
			_posH * 2
		];
		_overviewNoise ctrlsettextcolor _color;
		_overviewNoise ctrlcommit 0;
	};
	
	case "TreeSelChanged": {
	
		_tree = _params select 0;
		_display = ctrlparent _tree;
		_overviewGroup = _display displayCtrl 2301;
		_overviewGroupCfg = configfile >> "RscDisplaySingleMission" >> "controls" >> "OverviewControlsGroup";
		_challengesOverviewGroup = _display displayCtrl 2302;
		_challengesOverviewGroupCfg = configfile >> "RscDisplaySingleMission_ChallengeOverviewGroup";
		_challengesOverviewGroupH = getNumber(_challengesOverviewGroupCfg >> "h");
		_missionClassName = _tree tvData (tvCurSel _tree);
		_overviewScriptPath = "";
		
		//Delete the challenges group and create it again, so it is empty (command for clearing is not available)
		//Only group created by the script can be deleted.
		ctrlDelete _challengesOverviewGroup;
		_challengesOverviewGroup = _display ctrlCreate ["RscControlsGroupNoHScrollbars", 2302];
		
		_challengesOverviewGroup ctrlSetPosition [getNumber(_challengesOverviewGroupCfg >> "x"),
							  getNumber(_challengesOverviewGroupCfg >> "y"),
							  getNumber(_challengesOverviewGroupCfg >> "w"),
							  getNumber(_challengesOverviewGroupCfg >> "h")];
		_challengesOverviewGroup ctrlCommit 0;
		
		//Find overviewScript in the mission config - TODO: won't be read from description.ext, since it is not yet loaded. Do we want to solve it in code?
		//Find the selected mission in cfgMissions
		{			
			if(_missionClassName == configName _x) then
			{
				//_overviewScriptPath = [configfile >> "CfgMissions" >> "Challenges" >> "Time_Trials" >> "Helicopters" >> _missionClassName, "overviewScript", ""] call bis_fnc_returnConfigEntry;
				_overviewScriptPath = [_x, "overviewScript",""] call bis_fnc_returnConfigEntry;
			};
		} foreach ([(configfile >> "CfgMissions"), 3] call bis_fnc_returnChildren);

		if(_overviewScriptPath != "") then
		{
			//Decrease height of the overview group and show the challenges group
			_overviewGroup ctrlSetPosition [getNumber(_overviewGroupCfg >> "x"),
							getNumber(_overviewGroupCfg >> "y"),
							getNumber(_overviewGroupCfg >> "w"),
							getNumber(_overviewGroupCfg >> "h") - _challengesOverviewGroupH];
			_overviewGroup ctrlCommit 0;
			_challengesOverviewGroup ctrlShow true;
			[_display, _missionClassName] call (compile preprocessFileLineNumbers _overviewScriptPath);
		}
		else
		{
			//Hide challenges group and increase height of the overview group.
			_challengesOverviewGroup ctrlShow false;
			_overviewGroup ctrlSetPosition [getNumber(_overviewGroupCfg >> "x"),
							getNumber(_overviewGroupCfg >> "y"),
							getNumber(_overviewGroupCfg >> "w"),
							getNumber(_overviewGroupCfg >> "h")];
			_overviewGroup ctrlCommit 0;
		};
		

		//Zooming of overview picture - currently switched off
		// _overviewGroup = _display displayctrl 2300;
		// _overviewPicture = _display displayctrl IDC_SINGLE_PICTURE;
		// if (isnull _overviewPicture) then {_overviewPicture = _display displayctrl IDC_CAMPAIGN_PICTURE;};

		// _coef = 1.1;
		// _pos = ctrlposition _overviewGroup;
		// _posX = 0;
		// _posY = 0;
		// _posW = _pos select 2;
		// _posH = _pos select 3;
		// _posFinal = [_posX,_posY,_posW,_posH];
		// _pos = [
			// _posX - (_posW * _coef - _posW) / 2,
			// _posY - (_posH * _coef - _posH) / 2,
			// _posW * _coef,
			// _posH * _coef
		// ];
		// _overviewPicture ctrlsetposition _pos;
		// _overviewPicture ctrlcommit 0;
		// _overviewPicture ctrlsetposition _posFinal;
		// _overviewPicture ctrlcommit 1;
	};

	default {};
};