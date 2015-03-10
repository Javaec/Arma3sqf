#include "\A3\ui_f\hpp\defineCommonGrids.inc"

_mode = _this select 0;
_params = _this select 1;
_class = _this select 2;

switch _mode do {

	//--- Display load
	case "onLoad": {
		private ["_display","_ehCode","_ehMoving","_ehHolding"];

		//--- Color Init
		_display = _params select 0;
		_ehKeyDown = _display displayaddeventhandler ["keydown","with uinamespace do {['keyDown',_this,''] call RscDisplayMain_script;};"];

		//--- Hide player's name if Stream Friendly UI is on. It is shown via RscDisplayGameOptions.sqf
		[_display, 109] call (uinamespace getvariable 'BIS_fnc_setIDCStreamFriendly');

		//--- Assign default values
		with uinamespace do {

			//--- Get colors and grids
			true call bis_fnc_displayColorGet;
			false call bis_fnc_guiGridToProfile;

			//--- Apply colors to main menu
			[configfile >> _class,_display] call bis_fnc_displayColorSet;
		};

		//--- News
		_display call bis_fnc_guiNewsfeed;

		//--- Disable listbox used for alphabetical sorting
		(_display displayctrl 1555) ctrlenable false;

		//Set title text toUpper
		_control = _display displayctrl 1003;
		_control ctrlSetText (toUpper (ctrlText _control));


		//IDC_MAIN_CAMPAIGN 	      143
		//IDC_SP_MISSION              103
		//IDC_MAIN_MULTIPLAYER        105


		//--- Play button
		_button = _display displayctrl 138;
		_button ctrladdeventhandler ["buttonclick","with uinamespace do {['playButton',_this,''] spawn RscDisplayMain_script};"];

		(_display displayctrl 101) ctrlSetFade 1;	//Campaign
		(_display displayctrl 150) ctrlSetFade 1;	//Showcases
		(_display displayctrl 151) ctrlSetFade 1;	//Challenges
		(_display displayctrl 103) ctrlSetFade 1;	//Scenarios
		(_display displayctrl 105) ctrlSetFade 1;	//Multiplayer

		(_display displayctrl 101) ctrlCommit 0;	//Campaign
		(_display displayctrl 150) ctrlCommit 0;	//Showcases
		(_display displayctrl 151) ctrlCommit 0;	//Challenges
		(_display displayctrl 103) ctrlCommit 0;	//Scenarios
		(_display displayctrl 105) ctrlCommit 0;	//Multiplayer

		//--- Hide all buttons from Play - must be here to enable proper focusing
		(_display displayctrl 101) ctrlEnable false;	//Campaign
		(_display displayctrl 150) ctrlEnable false;	//Showcases
		(_display displayctrl 151) ctrlEnable false;	//Challenges
		(_display displayctrl 103) ctrlEnable false;	//Scenarios
		(_display displayctrl 105) ctrlEnable false;	//Multiplayer


		//--- Learn button
		_button = _display displayctrl 2423;
		_button ctrladdeventhandler ["buttonclick","with uinamespace do {['learnButton',_this,''] spawn RscDisplayMain_script};"];

		(_display displayctrl 149) ctrlSetFade 1;	//Bootcamp
		(_display displayctrl 152) ctrlSetFade 1;	//VR Training
		(_display displayctrl 2421) ctrlSetFade 1;	//Virtual Arsenal
		(_display displayctrl 143) ctrlSetFade 1;	//Field Manual
		(_display displayctrl 2422) ctrlSetFade 1;	//Community Guide

		(_display displayctrl 149) ctrlCommit 0;	//Bootcamp
		(_display displayctrl 152) ctrlCommit 0;	//VR Training
		(_display displayctrl 2421) ctrlCommit 0;	//Virtual Arsenal
		(_display displayctrl 143) ctrlCommit 0;	//Field Manual
		(_display displayctrl 2422) ctrlCommit 0;	//Community Guide

		//--- Hide all buttons from Play - must be here to enable proper focusing
		(_display displayctrl 149) ctrlEnable false;	//Bootcamp
		(_display displayctrl 152) ctrlEnable false;	//VR Training
		(_display displayctrl 2421) ctrlEnable false;	//Virtual Arsenal
		(_display displayctrl 143) ctrlEnable false;	//Field Manual
		(_display displayctrl 2422) ctrlEnable false;	//Community Guide


		//--- Options button
		_button = _display displayctrl 102;
		_button ctrladdeventhandler ["buttonclick","with uinamespace do {['optionsButton',_this,''] spawn RscDisplayMain_script};"];

		//TODO - implementovat promennou, ktera si bude pamatovat stav akordeonu (je potreba pri navratu z jineho dialogu do main menu)
		(_display displayctrl 301) ctrlSetFade 1;	//Video
		(_display displayctrl 302) ctrlSetFade 1;	//Audio
		(_display displayctrl 303) ctrlSetFade 1;	//Controls
		(_display displayctrl 307) ctrlSetFade 1;	//Game Options
		(_display displayctrl 1001) ctrlSetFade 1;	//Profile
		(_display displayctrl 140) ctrlSetFade 1;	//Expansions

		(_display displayctrl 301) ctrlCommit 0;
		(_display displayctrl 302) ctrlCommit 0;
		(_display displayctrl 303) ctrlCommit 0;
		(_display displayctrl 307) ctrlCommit 0;
		(_display displayctrl 1001) ctrlCommit 0;
		(_display displayctrl 140) ctrlCommit 0;

		//--- Hide all buttons from Options - must be here to enable proper focusing
		(_display displayctrl 301) ctrlEnable false;	//Video
		(_display displayctrl 302) ctrlEnable false;	//Audio
		(_display displayctrl 303) ctrlEnable false;	//Controls
		(_display displayctrl 307) ctrlEnable false;	//Game Options
		(_display displayctrl 1001) ctrlEnable false;	//Profile
		(_display displayctrl 140) ctrlEnable false;	//Expansions

		//E3--------------------
		//if( getNumber(configfile >> "isDemo") == 1 ) then
		//{
			//PLUG IN AS SOON AS playMission command works - no need to, button is ifndefed in config
			// (_display displayctrl 138) ctrlSetFade 1;	//Play - hide and disable it
			// (_display displayctrl 138) ctrlCommit 0;
			// (_display displayctrl 138) ctrlEnable false;
			// (_display displayctrl 190) ctrlSetFade 0;	//Show E3_Play
			// (_display displayctrl 190) ctrlCommit 0;
			// (_display displayctrl 190) ctrlEnable true;
			// (_display displayctrl 190) ctrladdeventhandler ["buttonclick","with uinamespace do {['E3_PlayButton',_this,''] call RscDisplayMain_script};"];

			//(_display displayctrl 142) ctrlEnable false;	//Editor - Pettka: do not disable in demo
			//(_display displayctrl 1001) ctrlEnable false;	//Profile
			//(_display displayctrl 140) ctrlEnable false;	//Expansions
			//(_display displayctrl 2405) ctrlEnable false;	//Credits



			//to know if the cheat was activated
			//uiNamespace setVariable ["BIS_isCheatOptions", false];
			//uiNamespace setVariable ["BIS_isCheatC", false];

			//set tooltips
			//(_display displayctrl 138) ctrlSetTooltip (localize "STR_MAIN_SINGLEPLAYER_TOOLTIP");		//Play
			//(_display displayctrl 2418) ctrlSetTooltip (localize "STR_TOOLTIP_MAIN_CHALLENGES");		//Challenges - Tooltip set in hpp ("Coming soon!"), no need to change here.
			//(_display displayctrl 103) ctrlSetTooltip (localize "STR_TOOLTIP_MAIN_SCENARIOS");		//Scenarios

			_versionText = (_display displayctrl 1008);
			_versionNumber = (_display displayctrl 118);
			_productVersionArray = productVersion;

			if((_productVersionArray select 1) == "Arma3AlphaLite") then
			{
				(_display displayctrl 105) ctrlSetTooltip "Available in non-Lite version - upgrade now!";	//Multiplayer, PA-Lite - Do not localize, alpha has expired

				//Lite does not have Development branch and should never indicate its branch
				_versionText ctrlSetText "Alpha Lite";								//Version name - Do not localize, alpha has expired
			}
			else
			{
				//To be sure check length of the array (ProductVersion still works differently in different game versions. Remove this check as soon as it is unified.)
				if(count _productVersionArray >= 5) then
				{
					if ((_productVersionArray select 4) == "Development") then
					{
						_versionText ctrlSetText (localize "STR_A3_RSCDISPLAY_LOADING_DEV");
					};
				}
			};

			if(_productVersionArray select 5) then
			{
				//Modded game
				_versionText ctrlSetPosition [(SafezoneX + SafezoneW - (15.3 * GUI_GRID_W)), (23 * GUI_GRID_H + GUI_GRID_Y)];
				_versionText ctrlCommit 0;
				_versionNumber ctrlSetPosition [(SafezoneX + SafezoneW - (5.6 * GUI_GRID_W)), (23 * GUI_GRID_H + GUI_GRID_Y)];
				_versionNumber ctrlCommit 0;
				_trafficLight = (_display displayctrl 121);
				_trafficLight ctrlShow true;
			};

			//disable buttons
			// if(profileNamespace getvariable ["BIS_E3", false]) then
			// {
				// (_display displayctrl 102) ctrlEnable false;	//Options
				// (_display displayctrl 106) ctrlEnable false;	//Exit
			// };
		//};
		// else
		// {
			// uiNamespace setVariable ["BIS_isCheatC", true];
		// };
		//E3--------------------

		//Variables for tracking state of accordions (expanded/collapsed)-----------------------------------------------------------------
		uiNamespace setVariable ["BIS_MainMenu_isPlayExpanded", false];
		uiNamespace setVariable ["BIS_MainMenu_isLearnExpanded", false];

		if(uiNamespace getVariable ["BIS_MainMenu_isOptionsExpanded", false]) then
		{
			// If variable exists and is true, set it to false and click on Options - this will expand the Options accordion again.
			// When exitting Profile with OK, Main Menu is reloaded by the engine. This is needed to leave accordion expanded.
			uiNamespace setVariable ["BIS_MainMenu_isOptionsExpanded", false];
			['optionsButton', [_display displayctrl 102], ''] spawn RscDisplayMain_script; //simulate click on Options button
			waitUntil{!(uiNamespace getVariable "BIS_MainMenu_isOptionsExpanded")}; //Wait until Options collapse
		}
		else
		{
			// If false variable doesn't exist or is false. Create it and set it to false, this leaves accordion collapsed.
			// Used when Main Menu is loaded for the first time (when game started).
			uiNamespace setVariable ["BIS_MainMenu_isOptionsExpanded", false];
		};
		//Variables for tracking state of accordions (expanded/collapsed)-----------------------------------------------------------------

		//Welcome Screen
		if(!isAutotest) then
		{
			if ((configName (configFile >> "CfgPatches" >> "A3_Missions_F_EPC")) != "") then
			{
				//Full game
				//Showing the Welcome Screen once per profile
				if ((profileNamespace getVariable ["BIS_welcomeScreenShown", 0]) <= 0) then
				{
					//If any welcome was not already shown to any profile this session, show it.
					if (!(uiNamespace getVariable ["BIS_welcomeScreenShown", false])) then
					{
						_display createDisplay "RscDisplayWelcome";
					}
					else
					{
						//If any welcome already shown to another profile, assume seen and register.
						private ["_shown"];
						_shown = profileNamespace getVariable ["BIS_welcomeScreenShown", 0];
						_shown = _shown + 1;
						profileNamespace setVariable ["BIS_welcomeScreenShown", _shown];
						saveProfileNamespace;
					};
				}
				else
				{
					//Showing the Helicopters Welcome Screen once per profile
					if ((profileNamespace getVariable ["BIS_welcomeScreenHelicoptersShown", 0]) <= 0) then
					{
						//Test Helicopters DLC is installed
						if ((configName (configFile >> "CfgPatches" >> "A3_Missions_F_Heli")) != "") then
						{
							//If any welcome was not already shown to any profile this session, show it.
							if (!(uiNamespace getVariable ["BIS_welcomeScreenHelicoptersShown", false])) then
							{
								_display createDisplay "RscDisplayWelcome";
							}
							else
							{
								//If any welcome already shown to another profile, assume seen and register.
								private ["_shown"];
								_shown = profileNamespace getVariable ["BIS_welcomeScreenHelicoptersShown", 0];
								_shown = _shown + 1;
								profileNamespace setVariable ["BIS_welcomeScreenHelicoptersShown", _shown];
								saveProfileNamespace;
							};
						};
					};
				};
			}
			else
			{
				//Trial
				//If any welcome was not already shown to any profile this session, show it.
				if (!(uiNamespace getVariable ["BIS_welcomeScreenShown", false])) then
				{
					_display createDisplay "RscDisplayWelcome";
				};
			};
		};
	};

	/*  //IDCs info
	IDC_MAIN_SINGLEPLAYER       138
	IDC_SP_EDITOR 		    142 //IDC_MAIN_EDITOR 115 - this is 3D editor
	Profile              idc = 1001	//scripted
	IDC_MAIN_OPTIONS            102
	IDC_MAIN_MOD_LAUNCHER       140
	Credits		            none //scripted
	IDC_MAIN_CUSTOM             104  //All Missions - CONFLICT
	*/

	//E3--------------------
	// case "E3_PlayButton": {

		// if( getNumber(configfile >> "isDemo") == 1 ) then
		// {
			// [] spawn
			// {
				// sleep 0.005;
				// playMission ["E3_2012", "A.Stratis"]; //TODO-check description.ext, command playMission does not work
			// };
		// };
	// };

	//E3--------------------



	//--- Play button
	case "playButton": {

		disableserialization;
		_ctrl = _params select 0;
		_display = ctrlparent _ctrl;

		//_isDemo = getNumber(configfile >> "isDemo");
		//_offset = 0; //Spotlight
		//_offsetShowcases =  -1.1; //0; //Hardcoded to -1.1 since we want showcases visible all the time
		// _offsetCredits = 0;
		// if( _isDemo == 1 ) then
		// {
			// //_offset = 1.1;
			// //_offsetShowcases = -1.1; //in DEMO move everything above Showcases upwards to make room for Showcases button
			// _offsetCredits = 1.1;	 //in DEMO move everything above Credits downwards, since Credits are removed in demo
		// };

		// If campaign is defined in configfile >> "CfgMissions" >> "Campaigns",
		// move everything above Campaign upwards to make room for Campaign button
		_isCampaignPresent = false;
		_offsetCampaign = 0;
		if( count((configfile>>"cfgMissions">>"campaigns") call bis_fnc_subClasses) > 0) then//&& (uiNamespace getVariable ["BIS_isCheatC", false]) ) then
		{
			_isCampaignPresent = true;
			_offsetCampaign = -1.1;
		};

		//If Options are expanded, collapse it
		if(uiNamespace getvariable "BIS_MainMenu_isOptionsExpanded") then
		{
			['optionsButton', [_display displayctrl 102], ''] spawn RscDisplayMain_script; //simulate click on Options button
			waitUntil{!(uiNamespace getVariable "BIS_MainMenu_isOptionsExpanded")}; //Wait until Options collapse
		};

		//If Learn is expanded, collapse it
		if(uiNamespace getvariable "BIS_MainMenu_isLearnExpanded") then
		{
			['learnButton', [_display displayctrl 2423], ''] spawn RscDisplayMain_script; //simulate click on Learn button
			waitUntil{!(uiNamespace getVariable "BIS_MainMenu_isLearnExpanded")}; //Wait until Learn collapses
		};

		//if Play is expanded (Campaign button is shown), collapse it and vice versa
		//if(ctrlFade (_display displayCtrl 143) < 0.5) then
		_upperPartTime = 0.3; //0.05 for each button + 0.05 pause
		_buttonsTime = 0.05;

		if(uiNamespace getvariable "BIS_MainMenu_isPlayExpanded") then
		{
			//hide buttons and collapse accordion
			//move down - background, title, player's name, play, editor, profile, options

			//Game Logo
			_control = _display displayctrl 1202;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (10.4 * GUI_GRID_H + GUI_GRID_Y)];//9.3 //_offset
			_control ctrlCommit _upperPartTime;

			//Title background
			_control = _display displayctrl 1050;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (14.2 * GUI_GRID_H + GUI_GRID_Y)];//13.1 //_offset
			_control ctrlCommit _upperPartTime;

			//Title
			_control = _display displayctrl 1003;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (14.2 * GUI_GRID_H + GUI_GRID_Y)];//13.1 //_offset
			_control ctrlCommit _upperPartTime;

			//Player's name
			_control = _display displayctrl 109;
			_control ctrlSetPosition [(8.5 * GUI_GRID_W + GUI_GRID_X), (14.2 * GUI_GRID_H + GUI_GRID_Y)];//13.1 //_offset
			_control ctrlCommit _upperPartTime;

			// if (_isDemo != 1) then
			// {
				// //Play Spotlight button
				// _control = _display displayctrl 2419;
				// _control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (14.2 * GUI_GRID_H + GUI_GRID_Y)];
				// _control ctrlCommit _upperPartTime;
			// };

			//Play button
			_control = _display displayctrl 138;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (15.3 * GUI_GRID_H + GUI_GRID_Y)];
			_control ctrlCommit _upperPartTime;

			(_display displayctrl 101) ctrlSetFade 1;		//Campaign
			(_display displayctrl 150) ctrlSetFade 1;		//Showcases
			(_display displayctrl 151) ctrlSetFade 1;		//Challenges
			(_display displayctrl 103) ctrlSetFade 1;		//Scenarios
			(_display displayctrl 105) ctrlSetFade 1;		//Multiplayer

			(_display displayctrl 101) ctrlCommit _buttonsTime;	//Campaign
			uiSleep _buttonsTime;
			(_display displayctrl 150) ctrlCommit _buttonsTime;	//Showcases
			uiSleep _buttonsTime;
			(_display displayctrl 151) ctrlCommit _buttonsTime;	//Challenges
			uiSleep _buttonsTime;
			(_display displayctrl 103) ctrlCommit _buttonsTime;	//Scenarios
			uiSleep _buttonsTime;
			(_display displayctrl 105) ctrlCommit _buttonsTime;	//Multiplayer

			(_display displayctrl 101) ctrlEnable false;		//Campaign
			(_display displayctrl 150) ctrlEnable false;		//Showcases
			(_display displayctrl 151) ctrlEnable false;		//Challenges
			(_display displayctrl 103) ctrlEnable false;		//Scenarios
			(_display displayctrl 105) ctrlEnable false;		//Multiplayer

			uiNamespace setVariable ["BIS_MainMenu_isPlayExpanded", false];
			//set focus to Options button
			ctrlSetFocus (_display displayctrl 138);
		}
		else
		{
			//expand accordion and show buttons

			//Game Logo
			_control = _display displayctrl 1202;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), ((6 + _offsetCampaign) * GUI_GRID_H + GUI_GRID_Y)];//6 //_offset //+ _offsetShowcases
			_control ctrlCommit _upperPartTime;

			//Title background
			_control = _display displayctrl 1050;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), ((9.8 + _offsetCampaign) * GUI_GRID_H + GUI_GRID_Y)];//9.8 //_offset // + _offsetShowcases
			_control ctrlCommit _upperPartTime;

			//Title
			_control = _display displayctrl 1003;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), ((9.8 + _offsetCampaign) * GUI_GRID_H + GUI_GRID_Y)];//9.8 //_offset // + _offsetShowcases
			_control ctrlCommit _upperPartTime;

			//Player's name
			_control = _display displayctrl 109;
			_control ctrlSetPosition [(8.5 * GUI_GRID_W + GUI_GRID_X), ((9.8 + _offsetCampaign) * GUI_GRID_H + GUI_GRID_Y)];//9.8 //_offset // + _offsetShowcases
			_control ctrlCommit _upperPartTime;

			// if (_isDemo != 1) then
			// {
				// //Play Spotlight button
				// _control = _display displayctrl 2419;
				// _control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), ((10.9 + _offsetShowcases + _offsetCampaign)* GUI_GRID_H + GUI_GRID_Y)];
				// _control ctrlCommit _upperPartTime;
			// };

			//Play button
			_control = _display displayctrl 138;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), ((10.9 + _offsetCampaign) * GUI_GRID_H + GUI_GRID_Y)];  // + _offsetShowcases
			_control ctrlCommit _upperPartTime;



			//Buttons moved only because of absence of credits in DEMO -------------------------------------
			//if (_isDemo == 1) then //to not do the computations when not in demo
			//{

				if (_isCampaignPresent) then
				{
					//Campaign button - move and enable it only if campaign is defined
					_control = _display displayctrl 101;
					_control ctrlSetPosition [(2 * GUI_GRID_W + GUI_GRID_X), (10.9 * GUI_GRID_H + GUI_GRID_Y)];
					_control ctrlCommit _upperPartTime;

					_control ctrlEnable true;
					_control ctrlCommit 0;
				};

				//Showcases button
				_control = _display displayctrl 150;
				_control ctrlSetPosition [(2 * GUI_GRID_W + GUI_GRID_X), (12 * GUI_GRID_H + GUI_GRID_Y)];
				_control ctrlCommit _upperPartTime;

				//Challenges button
				_control = _display displayctrl 151;
				_control ctrlSetPosition [(2 * GUI_GRID_W + GUI_GRID_X), (13.1 * GUI_GRID_H + GUI_GRID_Y)];
				_control ctrlCommit _upperPartTime;

				//Scenarios button
				_control = _display displayctrl 103;
				_control ctrlSetPosition [(2 * GUI_GRID_W + GUI_GRID_X), (14.2 * GUI_GRID_H + GUI_GRID_Y)];
				_control ctrlCommit _upperPartTime;
				_control ctrlEnable true;

				//Multiplayer button
				_control = _display displayctrl 105;
				_control ctrlSetPosition [(2 * GUI_GRID_W + GUI_GRID_X), (15.3 * GUI_GRID_H + GUI_GRID_Y)];
				_control ctrlCommit _upperPartTime;
			//};
			//Buttons moved only because of absence of credits in DEMO -------------------------------------


			//Enable buttons if not in demo, or if in demo and cheat is active
			//if ( ( getNumber(configfile >> "isDemo") != 1 ) || ((getNumber(configfile >> "isDemo") == 1) && (uiNamespace getvariable "BIS_isCheatOptions")) ) then
			//if (_isDemo == 1) then //Commented since we want Showcases visible all the time.
			//{
				////BIS_isCheatOptions is defined only in demo. Enable buttons only in demo, when cheat is enabled
				// if(uiNamespace getvariable "BIS_isCheatOptions") then
				// {
					////enable buttons - for DEMO, they stay disabled
					// (_display displayctrl 301) ctrlEnable true;	//Video
					// (_display displayctrl 302) ctrlEnable true;	//Audio
					// (_display displayctrl 307) ctrlEnable true;	//Game Options
				// };

				// (_display displayctrl 150) ctrlEnable true;	//Showcases - enable only in DEMO (Showcases button is present only there)
				// (_display displayctrl 150) ctrlSetFade 0;
				// (_display displayctrl 150) ctrlCommit 0;
			//};

			(_display displayctrl 150) ctrlEnable true;	//Showcases
			(_display displayctrl 151) ctrlEnable true;	//Challenges
			//(_display displayctrl 103) ctrlEnable true;	//Scenarios


			if((productVersion select 1) == "Arma3") then//&& !(profileNamespace getvariable ["BIS_E3", false]) ) then
			{
				//Enable MP in Alpha, but leave it disabled in Alpha(Lite)
				(_display displayctrl 105) ctrlEnable true;	//Multiplayer
			};

			//--- Show all buttons from Play
			if (_isCampaignPresent) then
			{
				(_display displayctrl 101) ctrlSetFade 0;	//Campaign - show only if campaign is defined
			};
			(_display displayctrl 150) ctrlSetFade 0;	//Showcases
			(_display displayctrl 151) ctrlSetFade 0;	//Challenges
			(_display displayctrl 103) ctrlSetFade 0;	//Scenarios
			(_display displayctrl 105) ctrlSetFade 0;	//Multiplayer

			uiSleep 0.05;

			//From bottom to top
			(_display displayctrl 105) ctrlCommit 0.1;	//Multiplayer
			uiSleep _buttonsTime;
			(_display displayctrl 103) ctrlCommit 0.1;	//Scenarios
			uiSleep _buttonsTime;
			(_display displayctrl 151) ctrlCommit 0.1;	//Challenges
			uiSleep _buttonsTime;
			(_display displayctrl 150) ctrlCommit 0.1;	//Showcases
			uiSleep _buttonsTime;
			if (_isCampaignPresent) then
			{
				(_display displayctrl 101) ctrlCommit 0.1;//Campaign - show only if campaign is defined
			};


			uiNamespace setVariable ["BIS_MainMenu_isPlayExpanded", true];
			//set focus to Play button
			ctrlSetFocus (_display displayctrl 138);
		};
	};



	//--- Options button
	case "learnButton": {

		disableserialization;
		_ctrl = _params select 0;
		_display = ctrlparent _ctrl;

		//If Play is expanded, collapse it
		if(uiNamespace getvariable "BIS_MainMenu_isPlayExpanded") then
		{
			['playButton', [_display displayctrl 138], ''] spawn RscDisplayMain_script;	//simulate click on Play button
			waitUntil{!(uiNamespace getVariable "BIS_MainMenu_isPlayExpanded")}; //Wait until Play collapses
		};

		//If Options are expanded, collapse it
		if(uiNamespace getvariable "BIS_MainMenu_isOptionsExpanded") then
		{
			['optionsButton', [_display displayctrl 102], ''] spawn RscDisplayMain_script;	//simulate click on Options button
			waitUntil{!(uiNamespace getVariable "BIS_MainMenu_isOptionsExpanded")};		//Wait until Options collapse
		};

		_upperPartTime = 0.3;	//0.04 for each button + 0.06 pause
		_buttonsTime = 0.04;	//to have upper time same as in Play

		if(uiNamespace getvariable "BIS_MainMenu_isLearnExpanded") then
		{
			//hide buttons and collapse accordion
			//move down - background, title, player's name, play, editor, profile, options


			//Game Logo
			_control = _display displayctrl 1202;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (10.4 * GUI_GRID_H + GUI_GRID_Y)];//9.3 //_offset
			_control ctrlCommit _upperPartTime;

			//Title background
			_control = _display displayctrl 1050;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (14.2 * GUI_GRID_H + GUI_GRID_Y)];//13.1 //_offset
			_control ctrlCommit _upperPartTime;

			//Title
			_control = _display displayctrl 1003;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (14.2 * GUI_GRID_H + GUI_GRID_Y)];//13.1 //_offset
			_control ctrlCommit _upperPartTime;

			//Player's name
			_control = _display displayctrl 109;
			_control ctrlSetPosition [(8.5 * GUI_GRID_W + GUI_GRID_X), (14.2 * GUI_GRID_H + GUI_GRID_Y)];//13.1 //_offset
			_control ctrlCommit _upperPartTime;

			//Play button
			_control = _display displayctrl 138;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (15.3 * GUI_GRID_H + GUI_GRID_Y)];
			_control ctrlCommit _upperPartTime;

			//Editor button
			_control = _display displayctrl 142;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (16.4 * GUI_GRID_H + GUI_GRID_Y)];
			_control ctrlCommit _upperPartTime;

			//Learn button
			_control = _display displayctrl 2423;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (17.5 * GUI_GRID_H + GUI_GRID_Y)];
			_control ctrlCommit _upperPartTime;

			(_display displayctrl 149) ctrlSetFade 1;	//Bootcamp
			(_display displayctrl 152) ctrlSetFade 1;	//VR Training
			(_display displayctrl 2421) ctrlSetFade 1;	//Virtual Arsenal
			(_display displayctrl 143) ctrlSetFade 1;	//Field Manual
			(_display displayctrl 2422) ctrlSetFade 1;	//Community Guide

			(_display displayctrl 149) ctrlCommit _buttonsTime;
			uiSleep _buttonsTime;
			(_display displayctrl 152) ctrlCommit _buttonsTime;
			uiSleep _buttonsTime;
			(_display displayctrl 2421) ctrlCommit _buttonsTime;
			uiSleep _buttonsTime;
			(_display displayctrl 143) ctrlCommit _buttonsTime;
			uiSleep _buttonsTime;
			(_display displayctrl 2422) ctrlCommit _buttonsTime;

			(_display displayctrl 149) ctrlEnable false;	//Bootcamp
			(_display displayctrl 152) ctrlEnable false;	//VR Training
			(_display displayctrl 2421) ctrlEnable false;	//Virtual Arsenal
			(_display displayctrl 143) ctrlEnable false;	//Field Manual
			(_display displayctrl 2422) ctrlEnable false;	//Community Guide

			uiNamespace setVariable ["BIS_MainMenu_isLearnExpanded", false];
			//set focus to Learn button
			ctrlSetFocus (_display displayctrl 2423);
		}
		else
		{
			//Expand accordion and show buttons

			//Game Logo
			_control = _display displayctrl 1202;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (4.9 * GUI_GRID_H + GUI_GRID_Y)];//2.7 //_offset
			_control ctrlCommit _upperPartTime;

			//Title background
			_control = _display displayctrl 1050;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (8.7 * GUI_GRID_H + GUI_GRID_Y)];//6.5 //_offset
			_control ctrlCommit _upperPartTime;

			//Title
			_control = _display displayctrl 1003;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (8.7 * GUI_GRID_H + GUI_GRID_Y)];//6.5 //_offset
			_control ctrlCommit _upperPartTime;

			//Player's name
			_control = _display displayctrl 109;
			_control ctrlSetPosition [(8.5 * GUI_GRID_W + GUI_GRID_X), (8.7 * GUI_GRID_H + GUI_GRID_Y)];//6.5 //_offset
			_control ctrlCommit _upperPartTime;

			//Play button
			_control = _display displayctrl 138;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (9.8 * GUI_GRID_H + GUI_GRID_Y)];
			_control ctrlCommit _upperPartTime;

			//Editor button
			_control = _display displayctrl 142;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (10.9 * GUI_GRID_H + GUI_GRID_Y)];
			_control ctrlCommit _upperPartTime;

			//Options button
			_control = _display displayctrl 2423;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (12 * GUI_GRID_H + GUI_GRID_Y)];
			_control ctrlCommit _upperPartTime;


			//when not in demo, enable buttons
			(_display displayctrl 149) ctrlEnable true;	//Bootcamp
			(_display displayctrl 152) ctrlEnable true;	//VR Training
			(_display displayctrl 2421) ctrlEnable true;	//Virtual Arsenal
			(_display displayctrl 143) ctrlEnable true;	//Field Manual
			(_display displayctrl 2422) ctrlEnable true;	//Community Guide

			//--- Show all buttons from Learn
			(_display displayctrl 149) ctrlSetFade 0;	//Bootcamp
			(_display displayctrl 152) ctrlSetFade 0;	//VR Training
			(_display displayctrl 2421) ctrlSetFade 0;	//Virtual Arsenal
			(_display displayctrl 143) ctrlSetFade 0;	//Field Manual
			(_display displayctrl 2422) ctrlSetFade 0;	//Community Guide

			uiSleep 0.05;

			//From bottom to top
			(_display displayctrl 2422) ctrlCommit 0.1;	//Community Guide
			uiSleep _buttonsTime;
			(_display displayctrl 143) ctrlCommit 0.1;	//Field Manual
			uiSleep _buttonsTime;
			(_display displayctrl 2421) ctrlCommit 0.1;	//Virtual Arsenal
			uiSleep _buttonsTime;
			(_display displayctrl 152) ctrlCommit 0.1;	//VR Training
			uiSleep _buttonsTime;
			(_display displayctrl 149) ctrlCommit 0.1;	//Bootcamp

			uiNamespace setVariable ["BIS_MainMenu_isLearnExpanded", true];
			//set focus to Options button
			ctrlSetFocus (_display displayctrl 2423);
		};
	};




	//--- Options button
	case "optionsButton": {

		disableserialization;
		_ctrl = _params select 0;
		_display = ctrlparent _ctrl;

		//_isDemo = getNumber(configfile >> "isDemo");
		//_offset = 0; //Spotlight
		// _offsetCredits = 0;
		// if( _isDemo == 1 ) then
		// {
			// //_offset = 1.1;
			// _offsetCredits = 1.1;	 //in DEMO move everything above Credits downwards, since Credits are removed in demo
		// };

		//If Play is expanded, collapse it
		if(uiNamespace getvariable "BIS_MainMenu_isPlayExpanded") then
		{
			['playButton', [_display displayctrl 138], ''] spawn RscDisplayMain_script; //simulate click on Options button //TEST-was: call
			waitUntil{!(uiNamespace getVariable "BIS_MainMenu_isPlayExpanded")}; //Wait until Play collapses
		};

		//If Learn is expanded, collapse it
		if(uiNamespace getvariable "BIS_MainMenu_isLearnExpanded") then
		{
			['learnButton', [_display displayctrl 2423], ''] spawn RscDisplayMain_script; //simulate click on Options button
			waitUntil{!(uiNamespace getVariable "BIS_MainMenu_isLearnExpanded")}; //Wait until Options collapse
		};

		//if options are expanded (Video Options button is shown), collapse it and vice versa
		//if(ctrlFade (_display displayCtrl 301) < 0.5) then
		_upperPartTime = 0.3;	//0.04 for each button + 0.06 pause
		_buttonsTime = 0.04;	//to have upper time same as in Play

		if(uiNamespace getvariable "BIS_MainMenu_isOptionsExpanded") then
		{
			//hide buttons and collapse accordion
			//move down - background, title, player's name, play, editor, profile, options

			//Game Logo
			_control = _display displayctrl 1202;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (10.4 * GUI_GRID_H + GUI_GRID_Y)];//9.3 //_offset
			_control ctrlCommit _upperPartTime;

			//Title background
			_control = _display displayctrl 1050;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (14.2 * GUI_GRID_H + GUI_GRID_Y)];//13.1 //_offset
			_control ctrlCommit _upperPartTime;

			//Title
			_control = _display displayctrl 1003;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (14.2 * GUI_GRID_H + GUI_GRID_Y)];//13.1 //_offset
			_control ctrlCommit _upperPartTime;

			//Player's name
			_control = _display displayctrl 109;
			_control ctrlSetPosition [(8.5 * GUI_GRID_W + GUI_GRID_X), (14.2 * GUI_GRID_H + GUI_GRID_Y)];//13.1 //_offset
			_control ctrlCommit _upperPartTime;

			// if (_isDemo != 1) then
			// {
				// //Play Spotlight button
				// _control = _display displayctrl 2419;
				// _control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (14.2 * GUI_GRID_H + GUI_GRID_Y)];
				// _control ctrlCommit _upperPartTime;
			// };


			//Play button
			_control = _display displayctrl 138;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (15.3 * GUI_GRID_H + GUI_GRID_Y)];
			_control ctrlCommit _upperPartTime;

			//Editor button
			_control = _display displayctrl 142;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (16.4 * GUI_GRID_H + GUI_GRID_Y)];
			_control ctrlCommit _upperPartTime;

			//Learn button
			_control = _display displayctrl 2423;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (17.5 * GUI_GRID_H + GUI_GRID_Y)];
			_control ctrlCommit _upperPartTime;

			//Profile button
			//_control = _display displayctrl 1001;
			//_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (15.3 * GUI_GRID_H + GUI_GRID_Y)];
			//_control ctrlCommit _upperPartTime;

			//Options button
			_control = _display displayctrl 102;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (18.6 * GUI_GRID_H + GUI_GRID_Y)];
			_control ctrlCommit _upperPartTime;

			(_display displayctrl 301) ctrlSetFade 1;	//Video
			(_display displayctrl 302) ctrlSetFade 1;	//Audio
			(_display displayctrl 303) ctrlSetFade 1;	//Controls
			(_display displayctrl 307) ctrlSetFade 1;	//Game Options
			(_display displayctrl 1001) ctrlSetFade 1;	//Profile
			(_display displayctrl 140) ctrlSetFade 1;	//Expansions

			(_display displayctrl 301) ctrlCommit _buttonsTime;
			uiSleep _buttonsTime;
			(_display displayctrl 302) ctrlCommit _buttonsTime;
			uiSleep _buttonsTime;
			(_display displayctrl 303) ctrlCommit _buttonsTime;
			uiSleep _buttonsTime;
			(_display displayctrl 307) ctrlCommit _buttonsTime;
			uiSleep _buttonsTime;
			(_display displayctrl 1001) ctrlCommit _buttonsTime;
			uiSleep _buttonsTime;
			(_display displayctrl 140) ctrlCommit _buttonsTime;

			(_display displayctrl 301) ctrlEnable false;	//Video
			(_display displayctrl 302) ctrlEnable false;	//Audio
			(_display displayctrl 303) ctrlEnable false;	//Controls
			(_display displayctrl 307) ctrlEnable false;	//Game Options
			(_display displayctrl 1001) ctrlEnable false;	//Profile
			(_display displayctrl 140) ctrlEnable false;	//Expansions

			uiNamespace setVariable ["BIS_MainMenu_isOptionsExpanded", false];
			//set focus to Options button
			ctrlSetFocus (_display displayctrl 102);
		}
		else
		{
			//expand accordion and show buttons

			//Game Logo
			_control = _display displayctrl 1202;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (3.8 * GUI_GRID_H + GUI_GRID_Y)];//2.7 //_offset
			_control ctrlCommit _upperPartTime;

			//Title background
			_control = _display displayctrl 1050;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (7.6 * GUI_GRID_H + GUI_GRID_Y)];//6.5 //_offset
			_control ctrlCommit _upperPartTime;

			//Title
			_control = _display displayctrl 1003;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (7.6 * GUI_GRID_H + GUI_GRID_Y)];//6.5 //_offset
			_control ctrlCommit _upperPartTime;

			//Player's name
			_control = _display displayctrl 109;
			_control ctrlSetPosition [(8.5 * GUI_GRID_W + GUI_GRID_X), (7.6 * GUI_GRID_H + GUI_GRID_Y)];//6.5 //_offset
			_control ctrlCommit _upperPartTime;

			// if (_isDemo != 1) then
			// {
				// //Play Spotlight button
				// _control = _display displayctrl 2419;
				// _control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (7.6 * GUI_GRID_H + GUI_GRID_Y)];
				// _control ctrlCommit _upperPartTime;
			// };

			//Play button
			_control = _display displayctrl 138;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (8.7 * GUI_GRID_H + GUI_GRID_Y)];
			_control ctrlCommit _upperPartTime;

			//Editor button
			_control = _display displayctrl 142;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (9.8 * GUI_GRID_H + GUI_GRID_Y)];
			_control ctrlCommit _upperPartTime;

			//Profile button
			//_control = _display displayctrl 1001;
			//_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (10.9 * GUI_GRID_H + GUI_GRID_Y)];
			//_control ctrlCommit _upperPartTime;

			//Learn button
			_control = _display displayctrl 2423;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (10.9 * GUI_GRID_H + GUI_GRID_Y)];
			_control ctrlCommit _upperPartTime;

			//Options button
			_control = _display displayctrl 102;
			_control ctrlSetPosition [(1 * GUI_GRID_W + GUI_GRID_X), (12 * GUI_GRID_H + GUI_GRID_Y)];
			_control ctrlCommit _upperPartTime;

			//Enable buttons if not in demo, or if in demo and cheat is active
			//if ( ( getNumber(configfile >> "isDemo") != 1 ) || ((getNumber(configfile >> "isDemo") == 1) && (uiNamespace getvariable "BIS_isCheatOptions")) ) then
			//if ( getNumber(configfile >> "isDemo") == 1 ) then
			//{
				//BIS_isCheatOptions is defined only in demo. Enable buttons only in demo, when cheat is enabled
				//if(uiNamespace getvariable "BIS_isCheatOptions") then
				//{
					//enable buttons - for DEMO, they stay disabled
					// (_display displayctrl 301) ctrlEnable true;	//Video
					// (_display displayctrl 302) ctrlEnable true;	//Audio
					// (_display displayctrl 307) ctrlEnable true;	//Game Options
				//	(_display displayctrl 1001) ctrlEnable true;	//Profile
				//	(_display displayctrl 140) ctrlEnable true;	//Expansions
				//};

			//};
			//else
			//{
				//when not in demo, enable buttons
				// (_display displayctrl 301) ctrlEnable true;	//Video
				// (_display displayctrl 302) ctrlEnable true;	//Audio
				// (_display displayctrl 307) ctrlEnable true;	//Game Options
			//	(_display displayctrl 1001) ctrlEnable true;	//Profile
			//	(_display displayctrl 140) ctrlEnable true;	//Expansions
			//};


			//when not in demo, enable buttons
			(_display displayctrl 301) ctrlEnable true;	//Video
			(_display displayctrl 302) ctrlEnable true;	//Audio
			(_display displayctrl 303) ctrlEnable true;	//Controls
			(_display displayctrl 307) ctrlEnable true;	//Game Options
			(_display displayctrl 1001) ctrlEnable true;	//Profile
			(_display displayctrl 140) ctrlEnable true;	//Expansions

			//--- Show all buttons from Options
			(_display displayctrl 301) ctrlSetFade 0;	//Video
			(_display displayctrl 302) ctrlSetFade 0;	//Audio
			(_display displayctrl 303) ctrlSetFade 0;	//Controls
			(_display displayctrl 307) ctrlSetFade 0;	//Game Options
			(_display displayctrl 1001) ctrlSetFade 0;	//Profile
			(_display displayctrl 140) ctrlSetFade 0;	//Expansions

			uiSleep 0.05;

			//From bottom to top
			(_display displayctrl 140) ctrlCommit 0.1;	//Expansions
			uiSleep _buttonsTime;
			(_display displayctrl 1001) ctrlCommit 0.1;	//Profile
			uiSleep _buttonsTime;
			(_display displayctrl 307) ctrlCommit 0.1;	//Game Options
			uiSleep _buttonsTime;
			(_display displayctrl 303) ctrlCommit 0.1;	//Controls
			uiSleep _buttonsTime;
			(_display displayctrl 302) ctrlCommit 0.1;	//Audio
			uiSleep _buttonsTime;
			(_display displayctrl 301) ctrlCommit 0.1;	//Video

			uiNamespace setVariable ["BIS_MainMenu_isOptionsExpanded", true];
			//set focus to Options button
			ctrlSetFocus (_display displayctrl 102);
		};
	};

	//--- Display onload
	case "onUnload": {

	};

	//--- Display onload
	case "keyDown":
	{
		_display = _params select 0;
		_key = _params select 1;
		_shift = _params select 2;
		_ctrlKey = _params select 3;
		_alt = _params select 4;

		// if( getNumber(configfile >> "isDemo") == 1 ) then
		// {
			// if (_ctrlKey && _shift && _alt) then {

				// if (_key == 0x18) then 						//CTRL + SHIFT + ALT + O (as Options) was pressed
				// {
					// //invert the cheat value
					// uiNamespace setVariable ["BIS_isCheatOptions", !(uiNamespace getvariable "BIS_isCheatOptions")];

					// // NO NEED TO DO THIS FOR DEMO news:k1kt08$97g$1@new-server.localdomain
					// //Enable/disable buttons according the new cheat, but only when accordeon is expanded.
					// // if(ctrlFade (_display displayCtrl 301) < 0.5) then
					// if(uiNamespace getvariable "BIS_MainMenu_isOptionsExpanded") then
					// {
						// _isCheat = uiNamespace getvariable "BIS_isCheatOptions";
						// // (_display displayctrl 301) ctrlEnable _isCheat;	//Video
						// // (_display displayctrl 302) ctrlEnable _isCheat;	//Audio
						// // (_display displayctrl 307) ctrlEnable _isCheat;	//Game Options
						// (_display displayctrl 1001) ctrlEnable _isCheat;	//Profile
						// (_display displayctrl 140) ctrlEnable _isCheat;		//Expansions
					// };

					// // if(ctrlEnabled (_display displayCtrl 301)) then 	//Video enabled, disable Video, Audio, Game
					// // {
						// // (_display displayctrl 301) ctrlEnable false;	//Video
						// // (_display displayctrl 302) ctrlEnable false;	//Audio
						// // (_display displayctrl 307) ctrlEnable false;	//Game Options
					// // }
					// // else
					// // {
						// // (_display displayctrl 301) ctrlEnable true;	//Video
						// // (_display displayctrl 302) ctrlEnable true;	//Audio
						// // (_display displayctrl 307) ctrlEnable true;	//Game Options
					// //};
				// };
			// };

			// if (_ctrlKey && _alt && (_key == 0x2E)) then
			// {
				// //Invert the cheat value
				// uiNamespace setVariable ["BIS_isCheatC", !(uiNamespace getvariable "BIS_isCheatC")];

				// _campaignButton = _display displayctrl 101;

				// if(uiNamespace getvariable "BIS_isCheatC") then
				// {
					// //if cheat is active
					// _campaignButton ctrlSetText "Presentation";
					// _campaignButton ctrlSetTooltip "Start or continue the presentation.";
				// }
				// else
				// {
					// //if cheat is not active
					// _campaignButton ctrlSetText "Campaign";
					// _campaignButton ctrlSetTooltip "Start or continue the campaign.";
				// };

				// //If Play is expanded, collapse it and then expand it again
				// if(uiNamespace getvariable "BIS_MainMenu_isPlayExpanded") then
				// {
					// ['playButton', [_display displayctrl 138], ''] call RscDisplayMain_script; //simulate click on Play button (collapse)
					// ['playButton', [_display displayctrl 138], ''] call RscDisplayMain_script; //simulate click on Play button (expand)
				// };
			// };

			//E3 cheat, E-key
			// if (_ctrlKey && _alt && (_key == 0x12)) then
			// {
				// //Invert the cheat value
				// profileNamespace setVariable ["BIS_E3", !(profileNamespace getvariable ["BIS_E3", false])];
				// saveProfileNamespace;

				// if(profileNamespace getvariable "BIS_E3") then
				// {
					// //disable buttons
					// (_display displayctrl 105) ctrlEnable false;	//Multiplayer
					// (_display displayctrl 106) ctrlEnable false;	//Exit

					// //If Options are expanded, collapse them and disable the button
					// if(uiNamespace getvariable "BIS_MainMenu_isOptionsExpanded") then
					// {
						// ['optionsButton', [_display displayctrl 102], ''] call RscDisplayMain_script; //simulate click on Options button (collapse)
					// };

					// (_display displayctrl 102) ctrlEnable false;	//Options
				// }
				// else
				// {
					// //enable buttons
					// (_display displayctrl 105) ctrlEnable true;	//Multiplayer
					// (_display displayctrl 102) ctrlEnable true;	//Options
					// (_display displayctrl 106) ctrlEnable true;	//Exit
				// };
			// };
		//};

	};

	//--- Nothing
	default {};
};