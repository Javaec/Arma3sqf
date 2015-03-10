#include "\A3\ui_f\hpp\defineResincl.inc"
#include "\A3\ui_f\hpp\defineResinclDesign.inc"
#include "\A3\ui_f\hpp\defineCommonGrids.inc"

_mode = _this select 0;
_params = _this select 1;
_class = _this select 2;

switch _mode do {
	case "onLoad": {
		_display = _params select 0;
		_isDebriefing = (ctrlidd _display) > 0;

		//--- Get ending type
		_win = _class == "RscDisplayDebriefing";
		_win = _win && (missionnamespace getvariable ["BIS_fnc_missionHandlers_win",_win]);
		_end = missionnamespace getvariable ["BIS_fnc_missionHandlers_end",""]; //--- ToDo: Detect end type in engine
		_endTemplate = [["CfgDebriefing",_end]] call bis_fnc_loadClass;
		_validEnd = _win && _end != "" && _end != "endDefault";

		//--- Load ending template
		_titleText = gettext (_endTemplate >> "title");
		_subtitleText = gettext (_endTemplate >> "subtitle");
		_descriptionText = gettext (_endTemplate >> "description");
		if (_descriptionText == "") then {_descriptionText = "%1";};
		_descriptionParams = missionnamespace getvariable ["RscDisplayDebriefing_params",[]];
		if (typename _descriptionParams != typename []) then {_descriptionParams = [_descriptionParams];};
		_descriptionText = format ([_descriptionText] + _descriptionParams);
		_pictureText = gettext (_endTemplate >> "picture");
		_pictureBackgroundText = gettext (_endTemplate >> "pictureBackground");
		_pictureText = _pictureText call bis_fnc_textureMarker;
		_pictureColor = getarray (_endTemplate >> "pictureColor");
		_pictureColor = if (count _pictureColor == 4) then {_pictureColor call bis_fnc_colorConfigToRGBA;} else {[1,1,1,1]};
		_showScore =  getnumber (_endTemplate >> "showScore") > 0 || ({_x call bis_fnc_respawnTickets >= 0} count [east,west,resistance,civilian] == {playableSlotsNumber _x > 0} count [east,west,resistance,civilian]);

		_countdown = _display displayctrl IDC_RSCDISPLAYDEBRIEFING_DLCCOUNTDOWN;
		_countdown ctrlshow false;

		//--- Title
		_title = _display displayctrl IDC_RSCDISPLAYDEBRIEFING_TITLE;
		if (_titleText == "") then {
			_titleText = if (_win) then {
				gettext (configfile >> "CfgDebriefing" >> "titleEndDefault");
			} else {
				gettext (configfile >> "CfgDebriefing" >> "titleFailDefault");
			};
		};
		_title ctrlsettext toupper _titleText;
		if !(_win) then {
			//--- Orange text when failed
			_titleColor = ["IGUI","WARNING_RGB"] call bis_fnc_displaycolorget;
			_titleColor set [3,1];
			_title ctrlsettextcolor _titleColor
		};

		//--- Subtitle
		_subtitle = _display displayctrl IDC_RSCDISPLAYDEBRIEFING_SUBTITLE;
		if (_subtitleText != "") then {
			_subtitle ctrlsettext toupper _subtitleText;
		} else {
			_subtitle ctrlsetfade 1;
			_subtitle ctrlcommit 0;
		};

		//--- Description
		_description =_display displayctrl IDC_RSCDISPLAYDEBRIEFING_DESCRIPTIONTEXT;
		if (_descriptionText != "") then {
			_description ctrlsetstructuredtext parsetext _descriptionText;
		} else {
			_description ctrlsetfade 1;
			_description ctrlcommit 0;
			_descriptionBackground =_display displayctrl IDC_RSCDISPLAYDEBRIEFING_DESCRIPTIONBACKGROUND;
			_descriptionBackground ctrlsetbackgroundcolor [0,0,0,0];
		};
		_descriptionPos = ctrlposition _description;
		_descriptionPos set [3,ctrltextheight _description];
		_description ctrlsetposition _descriptionPos;
		_description ctrlcommit 0;

		//--- Mission Picture
		_missionPicture = _display displayctrl IDC_RSCDISPLAYDEBRIEFING_MISSIONPICTURE;
		if !(istext (_endTemplate >> "pictureBackground")) then {_pictureBackgroundText = gettext (missionconfigfile >> "overviewPicture");};
		if (_pictureBackgroundText != "") then {
			_missionPicture ctrlsettext _pictureBackgroundText;
		} else {
			_missionPicture ctrlsetfade 1;
			_missionPicture ctrlcommit 0;
		};

		//--- Side score
		if !(_showScore) then {

			//--- Picture
			_picture = _display displayctrl IDC_RSCDISPLAYDEBRIEFING_PICTURE;
			_picture ctrlsettextcolor _pictureColor;
			if (_pictureText != "") then {
				_picture ctrlsettext _pictureText;
			} else {
				_picture ctrlsetfade 1;
				_picture ctrlcommit 0;
			};
		} else {
			_slots = missionnamespace getvariable "RscDisplayDebriefing_slots";
			if (isnil "_slots") then {

				_sides = [west,east,resistance];
				_sidesSorted = [[],[],[]];
				_sidesLeft = [];
				_sidesCenter = [];
				_sidesRight = [];
				_slots = ["","","","",""];

				//--- Remove sides without players
				{
					if (playableslotsnumber _x == 0) then {_sides = _sides - [_x];};
				} foreach _sides;

				if (count _sides > 0) then {

					//--- Sort allies together
					{
						_side = _x;
						{
							if ({[_side,_x] call bis_fnc_arefriendly} count _x == count _x) exitwith {_x set [count _x,_side];};
						} foreach _sidesSorted;
					} foreach _sides;

					//--- Remove empty sections
					{
						if (count _x == 0) then {_sidesSorted set [_foreachindex,-1];};
					} foreach _sidesSorted;
					_sidesSorted = _sidesSorted - [-1];

					_textTemplate = "<t align='center' shadow='2'><img image='%1' size='2' shadow='0' /><br /><t size='1.5'>%2</t></t>";
					_slotsVS = [];
					_slotsFactions = switch (count _sidesSorted) do {
						case 1: {
							switch (count (_sidesSorted select 0)) do {
								case 1: {[[2]]};
								case 2: {[[1,3]]};
								case 3: {[[1,2,3]]};
							};
						};
						case 2: {
							_slotsLeft = switch (count (_sidesSorted select 0)) do {
								case 1: {[1]};
								case 2: {[0,1]};
							};
							_slotsRight = switch (count (_sidesSorted select 1)) do {
								case 1: {[3]};
								case 2: {[3,4]};
							};
							_slotsVS = [2]; 
							[_slotsLeft,_slotsRight]
						};
						case 3: {
							switch (count _sidesSorted) do {
								case 1: {[[2]]};
								case 2: {_slotsVS = [2]; [[1],[3]]};
								case 3: {_slotsVS = [1,3]; [[0],[2],[4]]};
							};
						};
					};
					{
						_sides = _sidesSorted select _foreachindex;
						{
							_side = _sides select _foreachindex;
							_faction = _side call bis_fnc_playersidefaction;
							_icon = gettext (configfile >> "cfgfactionclasses" >> _faction >> "icon");
							if (_icon == "") then {_icon = (_side call bis_fnc_sidecolor) call bis_fnc_colorRGBAtoTexture;};

							_score = [_side] call bis_fnc_respawnTickets;
							if (_score < 0) then {_score = scoreside _side;} else {_ticketSides set [count _ticketSides,_side];};
							_slots set [_x,format [_textTemplate,_icon,_score]];
						} foreach _x;
					} foreach _slotsFactions;
					{
						_slots set [_x,format ["<br /><t align='center'>%1</t>","VS"]]; //--- ToDo: Localize
					} foreach _slotsVS;
				};
			};

			//--- Draw
			_idcs = [
				IDC_RSCDISPLAYDEBRIEFING_SIDE1,
				IDC_RSCDISPLAYDEBRIEFING_SIDE2,
				IDC_RSCDISPLAYDEBRIEFING_SIDE3,
				IDC_RSCDISPLAYDEBRIEFING_SIDE4,
				IDC_RSCDISPLAYDEBRIEFING_SIDE5
			];
			{
				_ctrl = _display displayctrl (_idcs select _foreachindex);
				_ctrl ctrlsetstructuredtext parsetext _x;
			} foreach _slots;

			missionnamespace setvariable ["RscDisplayDebriefing_slots",_slots];
		};

		if (_isDebriefing) then {
			/////////////////////////////////////////////////////////////////////////////////

			//--- Static debriefing
			if !(isnil {missionnamespace getvariable "RscDisplayDebriefing_noise"}) then {
				("BIS_fnc_endMission_end" call bis_fnc_rscLayer) cuttext ["","plain"];
			};

			_noiseID = IGUI_CLASSES find "RscNoise";
			if (_noiseID >= 0) then {
				private ["_mode","_params","_class","_display"];
				_noiseDisplay = IGUI_DISPLAYS select _noiseID;
				["onLoad",[_noiseDisplay],"RscNoise"] call RscNoise_script;

				_params spawn {
					missionnamespace setvariable ["RscNoise_color",[1,1,1,1]];
					_color = [1,1,1,1];
					while {(_color select 3) > 0.25} do {
						_color set [3,(_color select 3) - 0.03];
						missionnamespace setvariable ["RscNoise_color",_color];
						uisleep 0.1;
					};
				};
			};

			//--- Set player's name
			(_display displayctrl IDC_RSCDISPLAYDEBRIEFING_PLAYERNAME) ctrlSetText profileName;
			[_display, IDC_RSCDISPLAYDEBRIEFING_PLAYERNAME] call (uinamespace getvariable 'BIS_fnc_setIDCStreamFriendly');

			//--- Smooth transition
			{
				_control = _display displayctrl _x;
				_control ctrlsetfade 1;
				_control ctrlcommit 0;
				_control ctrlsetfade 0;
				_control ctrlcommit 0.5;
			} foreach [
				IDC_RSCDISPLAYDEBRIEFING_SECTIONBACKGROUND,
				IDC_RSCDISPLAYDEBRIEFING_MAINBACKGROUND,
				IDC_RSCDISPLAYDEBRIEFING_PLAYERNAME,
				IDC_RSCDISPLAYDEBRIEFING_OBJECTIVESBACKGROUND,
				IDC_RSCDISPLAYDEBRIEFING_STATBACKGROUND,
				IDC_RSCDISPLAYDEBRIEFING_DESCRIPTIONBACKGROUND,
				IDC_RSCDISPLAYDEBRIEFING_MISSIONPICTURE,
				IDC_RSCDISPLAYDEBRIEFING_SECTION,
				IDC_RSCDISPLAYDEBRIEFING_DESCRIPTION,
				IDC_RSCDISPLAYDEBRIEFING_OBJECTIVES,
				IDC_RSCDISPLAYDEBRIEFING_STAT,
				IDC_ME_RETRY,
				IDC_DEBRIEFING_RESTART,
				IDC_RSCDISPLAYDEBRIEFING_DLCGENERALGROUP,
				IDC_RSCDISPLAYDEBRIEFING_DLCBAR,
				IDC_RSCDISPLAYDEBRIEFING_DLCLOCKICON,
				IDC_RSCDISPLAYDEBRIEFING_LISTGROUP
			];

			//--- Initialize sections
			_sections = [
				[localize "STR_A3_RscDisplayDebriefing_section_Mission","%mission"]
			];

			//--- Summary
			if (_end != "") then {
				_sections = [[localize "STR_A3_RscDisplayDebriefing_section_Debriefing","%debriefing"]] + _sections;
			};

			//--- DLC Debriefing --------------------------------------------------------------------------------------
			//If DLC is not owned and its asset was used in the mission, display DLC debriefing. Detection is performed in RscDisplayMission.sqf-TODO-remove this detection from RscDisplayMission
			if(getTotalDLCUsageTime > 0) then //TODO-switch back on
			{
				//Overview picture
				_ctrl = _display displayctrl IDC_RSCDISPLAYDEBRIEFING_DLCOVERVIEWPICTURE;
				_ctrl ctrlSetText getText(missionconfigfile >> "overviewPicture");
				
				//Overview text
				_ctrl = _display displayctrl IDC_RSCDISPLAYDEBRIEFING_DLCOVERVIEWTEXT;
				_ctrl ctrlSetText (localize "STR_A3_DLC_DEBRIEFING_TEXT_GENERIC");
				
				//AllAssets, Karts, Heli and Marksmen button.
				_assetsButton = _display displayctrl IDC_RSCDISPLAYDEBRIEFING_DLCBUTTONALLASSETS;
				_assetsButton ctrladdeventhandler ["buttonclick","with uinamespace do {['DLCTabClicked',_this,''] call RscDisplayDebriefing_script}"];
				_kartButton = _display displayctrl IDC_RSCDISPLAYDEBRIEFING_DLCBUTTONKARTS;
				_kartButton ctrladdeventhandler ["buttonclick","with uinamespace do {['DLCTabClicked',_this,''] call RscDisplayDebriefing_script}"];
				_heliButton = _display displayctrl IDC_RSCDISPLAYDEBRIEFING_DLCBUTTONHELI;
				_heliButton ctrladdeventhandler ["buttonclick","with uinamespace do {['DLCTabClicked',_this,''] call RscDisplayDebriefing_script}"];
				_markButton = _display displayctrl IDC_RSCDISPLAYDEBRIEFING_DLCBUTTONMARKSMEN;
				_markButton ctrladdeventhandler ["buttonclick","with uinamespace do {['DLCTabClicked',_this,''] call RscDisplayDebriefing_script}"];
				
				_nonOwnedUsedDLCs = [];
				
				{
					_nonOwnedUsedDLCs = _nonOwnedUsedDLCs + [_x select 1]; //288xxx in _nonOwnedUsedDLCs - TODO
				} forEach (getDLCAssetsUsage);
				
				//Check what tabs should be disabled
				//All assets
				if(count _nonOwnedUsedDLCs == 0) then
				{
					_assetsButton ctrlEnable false;
				}
				else
				{
					_assetsButton ctrlEnable true;
				};
				
				//Kart
				if(288520 in _nonOwnedUsedDLCs) then
				{	
					_kartButton ctrlEnable true;
				}
				else
				{
					_kartButton ctrlEnable false;
				};
				
				//Heli
				if(304380 in _nonOwnedUsedDLCs) then
				{
					_heliButton ctrlEnable true;
				}
				else
				{
					_heliButton ctrlEnable false;
				};
				
				//Mark - TODO - enable as soon as appID is known
				_markButton ctrlEnable false;
				// if(xxxxxx in _nonOwnedUsedDLCs) then
				// {
					// _markButton ctrlEnable true;
				// }
				// else
				// {
					// _markButton ctrlEnable false;
				// };


				//Simulate click on Assets button (Assets tab should be selected and listed).
				['DLCTabClicked', [_assetsButton], ''] spawn RscDisplayDebriefing_script;
				_sections = [[localize "STR_A3_dlc_debriefing_footer","%dlcdebriefing"]] + _sections; //DLC Content text in the switch	
			};
			//DLC Debriefing --------------------------------------------------------------------------------------	

			//--- MP Table
			if (ismultiplayer && difficultyenabled "netStats") then {
				_sections set [count _sections,[localize "STR_A3_RscDisplayDebriefing_section_Score","%score"]];
			};

			{
				_title = gettext (_x >> "title");
				_variable = gettext (_x >> "variable");
				_variableValue = missionnamespace getvariable [_variable,""];
				_variableValue = [_variableValue,0,"",[""]] call bis_fnc_paramin;
				if (_variableValue != "") then {
					_sections set [count _sections,[_title,_variable]];
				};
			} foreach ((missionconfigfile >> "CfgDebriefingSections") call bis_fnc_subclasses);

			//--- Add sections
			_section = _display displayctrl IDC_RSCDISPLAYDEBRIEFING_SECTION;
			{
				_lbAdd = _section lbadd format ["%1 (%2/%3)",_x select 0,_foreachindex + 1,count _sections];
				_section lbsetdata [_lbAdd,_x select 1];
			} foreach _sections;
			_section ctrladdeventhandler [
				"lbselchanged",
				format ["with uinamespace do {['sectionChanged',_this,''] call %1_script};",_class]
			];
			_section lbsetcursel 0;
			//ctrlsetfocus _section;


			_ratingValue = missionnamespace getvariable ["BIS_fnc_missionHandlers_rating",0];
			if (_ratingValue < -100000) then {_ratingValue = 0;};
	/*
			_timeValue = if (_win) then {
				missionnamespace getvariable ["BIS_fnc_missionHandlers_time",time];
			} else {
				[false,false] call bis_fnc_trackMissionTime
			};
	*/
			_timeValue = time;
			_timeValue = _timeValue / 3600;
			_loadsValue = missionnamespace getvariable ["BIS_fnc_missionHandlers_reloads",0];

			_ratingValueBest = profilenamespace getvariable [missionname + "_bestRating",_ratingValue];
			_timeValueBest = profilenamespace getvariable [missionname + "_bestTime",_timeValue];
			_loadsValueBest = profilenamespace getvariable [missionname + "_bestReloads",_loadsValue];

			_isRatingRecord = false;
			_isTimeRecord = false;
			_isLoadsRecord = false;
			if (_validEnd) then {
				_isRatingRecord = _ratingValue >= _ratingValueBest;
				_isTimeRecord = _timeValue <= _timeValueBest;
				_isLoadsRecord = _loadsValue <= _loadsValueBest;

				_ratingValueBest = _ratingValueBest max _ratingValue;
				_timeValueBest = _timeValueBest min _timeValue;
				_loadsValueBest = _loadsValueBest min _loadsValue;
			};

			_setColor = {
				_condition = _this select 0;
				_current = _this select 1;
				_best = _this select 2;
				if (_validEnd) then {
					if (_condition) then {_current ctrlsettextcolor [1,1,1,1];} else {_best ctrlsettextcolor [1,1,1,1];};
				};
			};

			_rating = _display displayctrl IDC_RSCDISPLAYDEBRIEFING_RATING;
			_rating ctrlsettext str _ratingValue;
			_ratingBest = _display displayctrl IDC_RSCDISPLAYDEBRIEFING_RATINGBEST;
			_ratingBest ctrlsettext format ["(%1)",_ratingValueBest];
			[_isRatingRecord,_rating,_ratingBest] call _setColor;

			_time = _display displayctrl IDC_RSCDISPLAYDEBRIEFING_TIME;
			_time ctrlsettext ([_timeValue,"HH:MM:SS"] call bis_fnc_timetostring);
			_timeBest = _display displayctrl IDC_RSCDISPLAYDEBRIEFING_TIMEBEST;
			_timeBest ctrlsettext format ["(%1)",([_timeValueBest,"HH:MM:SS"] call bis_fnc_timetostring)];
			[_isTimeRecord,_time,_timeBest] call _setColor;

			_loads = _display displayctrl IDC_RSCDISPLAYDEBRIEFING_LOADS;
			_loads ctrlsettext str _loadsValue;
			_loadsBest = _display displayctrl IDC_RSCDISPLAYDEBRIEFING_LOADSBEST;
			_loadsBest ctrlsettext format ["(%1)",_loadsValueBest];
			[_isLoadsRecord,_loads,_loadsBest] call _setColor;

			_loadsText = _display displayctrl IDC_RSCDISPLAYDEBRIEFING_LOADSTEXT;
			if (ismultiplayer) then {
				_loadsText ctrlsettext (localize "str_a3_RscDisplayDebriefing_LoadsText_mp");
			} else {
				_loadsText ctrlsettext (localize "str_a3_RscDisplayDebriefing_LoadsText");
			};

			if (_validEnd) then {
				profilenamespace setvariable [missionname + "_bestRatingt",_ratingValueBest];
				profilenamespace setvariable [missionname + "_bestTime",_timeValueBest];
				profilenamespace setvariable [missionname + "_bestReloads",_loadsValueBest];
				saveprofilenamespace;
			};
			
			//Disable Continue button and section switch for 5s
			if(getTotalDLCUsageTime > 0) then
			{
				_buttonContinue = _display displayctrl IDC_CANCEL;
				_buttonContinue ctrlenable false;
				_section ctrlenable false;
				_countdown ctrlshow true;
				
				[_buttonContinue, _section, _countdown] spawn
				{
					disableserialization;
					_buttonContinue = _this select 0;
					_section = _this select 1;
					_countdown = _this select 2;
					_waitTime = 10;
				
					while {_waitTime >= 0} do
					{
						_countdown ctrlSetText (format["%1", _waitTime]);
						_waitTime = _waitTime - 1;
						uisleep 1;
					};

					_buttonContinue ctrlenable true;
					_section ctrlenable true;
					_countdown ctrlshow false;
				};
			};
			
			
		} else {
			/////////////////////////////////////////////////////////////////////////////////

			//--- Animated outro screen
			_allowPPeffects = missionnamespace getvariable ["RscMissionEnd_allowPPeffects",true];
			missionnamespace setvariable ["RscMissionEnd_allowPPeffects",nil];

			_titlePosFinal = ctrlposition _title;
			_titlePosStart = +_titlePosFinal;
			_titlePosStart set [0,(_titlePosStart select 0) + (_titlePosStart select 2) / 2];
			_titlePosStart set [2,0];
			_title ctrlsetposition _titlePosStart;
			_title ctrlcommit 0;
			_title ctrlsetposition _titlePosFinal;
			_title ctrlcommit 0.2;

			//--- Subtitle
			if (_subtitleText != "") then {
				_subtitlePosFinal = ctrlposition _subtitle;
				_subtitlePosStart = +_subtitlePosFinal;
				_subtitlePosStart set [0,(_subtitlePosStart select 0) + (_subtitlePosStart select 2) / 2];
				_subtitlePosStart set [2,0];
				_subtitle ctrlsetposition _subtitlePosStart;
				_subtitle ctrlcommit 0;
				_subtitle ctrlshow false;
				[_subtitle,_subtitlePosFinal] spawn {
					disableserialization;
					_subtitle = _this select 0;
					_subtitlePosFinal = _this select 1;
					sleep 2;
					_subtitle = _this select 0;
					_subtitle ctrlshow true;
					_subtitle ctrlsetposition _subtitlePosFinal;
					_subtitle ctrlcommit 0.4;
				};
			} else {
				_subtitle ctrlshow false;
			};

			//--- Monochromatic post-process
			if (_allowPPeffects) then {
				RscMissionEnd_colorCorrection = ppeffectcreate ["ColorCorrections",1616];
				RscMissionEnd_colorCorrection ppeffectforceinNVG true;
				RscMissionEnd_colorCorrection ppEffectEnable true;
				RscMissionEnd_colorCorrection ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [0.4, 0.4, 0.4, 1], [1, 1, 1, 1.0]];
				RscMissionEnd_colorCorrection ppEffectCommit 0;
				RscMissionEnd_colorCorrection ppEffectAdjust [1, 1, -0.1, [1, 1, 1, 0], [0.4, 0.4, 0.4, 0], [1, 1, 1, 1.0]];
				RscMissionEnd_colorCorrection ppEffectCommit 0.2;

				RscMissionEnd_filmGrain = ppeffectcreate ["filmGrain",2005];
				RscMissionEnd_filmGrain ppeffectforceinNVG true;
				RscMissionEnd_filmGrain ppEffectEnable true;
				RscMissionEnd_filmGrain ppEffectAdjust [0, 1, 1, 0.1, 1, true];
				RscMissionEnd_filmGrain ppEffectCommit 0;
				RscMissionEnd_filmGrain ppEffectAdjust [0.1, 1, 1, 0.1, 1, true];
				RscMissionEnd_filmGrain ppEffectCommit 0.2;

				RscMissionEnd_radialBlur = ppeffectcreate ["RadialBlur",167];
				RscMissionEnd_radialBlur ppeffectforceinNVG true;
				RscMissionEnd_radialBlur ppeffectenable true;
				RscMissionEnd_radialBlur ppeffectadjust [0,0,0,0];
				RscMissionEnd_radialBlur ppeffectcommit 0;
				RscMissionEnd_radialBlur ppeffectadjust [0.005,0,0.25,0.25];
				RscMissionEnd_radialBlur ppeffectcommit 0.2;

				[_display] spawn {
					disableserialization;
					_display = _this select 0;
					waituntil {isnull _display};
					ppeffectdestroy [
						RscMissionEnd_colorCorrection,
						RscMissionEnd_filmGrain,
						RscMissionEnd_radialBlur
					];
				};
			};

		};
	};
	case "sectionChanged": {
		_section = _params select 0;
		_lb = _params select 1;
		_data = _section lbdata _lb;
		_display = ctrlparent _section;

		_showSection = {
			_display = _this select 0;
			_show = _this select 1;

			//--- Hide all
			{
				_control = _display displayctrl _x;
				_control ctrlshow false;
				_control ctrlenable false;
			} foreach [
				IDC_RSCDISPLAYDEBRIEFING_MISSIONPICTURE,
				IDC_RSCDISPLAYDEBRIEFING_SUMMARY,
				IDC_RSCDISPLAYDEBRIEFING_DESCRIPTIONBACKGROUND,
				IDC_RSCDISPLAYDEBRIEFING_DESCRIPTION,
				IDC_RSCDISPLAYDEBRIEFING_DATA,
				IDC_RSCDISPLAYDEBRIEFING_STATBACKGROUND,
				IDC_RSCDISPLAYDEBRIEFING_STAT,
				IDC_RSCDISPLAYDEBRIEFING_OBJECTIVESBACKGROUND,
				IDC_RSCDISPLAYDEBRIEFING_OBJECTIVES,
				IDC_RSCDISPLAYDEBRIEFING_CUSTOM,
				IDC_RSCDISPLAYDEBRIEFING_SIDES,
				IDC_RSCDISPLAYDEBRIEFING_DLCGENERALGROUP,
				IDC_RSCDISPLAYDEBRIEFING_DLCBAR,
				IDC_RSCDISPLAYDEBRIEFING_DLCLOCKICON,
				IDC_RSCDISPLAYDEBRIEFING_LISTGROUP
			];

			//--- Show required
			{
				_control = _display displayctrl _x;
				_control ctrlshow true;
				_control ctrlenable true;
			} foreach _show;

			//--- Disable non-active
			{
				_control = _display displayctrl _x;
				_control ctrlenable false;
			} foreach [
				IDC_RSCDISPLAYDEBRIEFING_MISSIONPICTURE
			];
		};

		disableDebriefingStats;
		switch _data do {

			//--- DLC Advertisment
			case "%dlcdebriefing": {
				[
					_display,
					[	
						IDC_RSCDISPLAYDEBRIEFING_DLCGENERALGROUP,
						IDC_RSCDISPLAYDEBRIEFING_DLCBAR,
						IDC_RSCDISPLAYDEBRIEFING_DLCLOCKICON,
						IDC_RSCDISPLAYDEBRIEFING_LISTGROUP
					]
				] call _showSection;
			};

			//--- Summary
			case "%debriefing": {
				[
					_display,
					[
						IDC_RSCDISPLAYDEBRIEFING_MISSIONPICTURE,
						IDC_RSCDISPLAYDEBRIEFING_SUMMARY,
						IDC_RSCDISPLAYDEBRIEFING_DESCRIPTIONBACKGROUND,
						IDC_RSCDISPLAYDEBRIEFING_DESCRIPTION,
						IDC_RSCDISPLAYDEBRIEFING_SIDES
					]
				] call _showSection;
			};
			//--- Mission
			case "%mission": {
				[
					_display,
					[
						IDC_RSCDISPLAYDEBRIEFING_DATA,
						IDC_RSCDISPLAYDEBRIEFING_OBJECTIVESBACKGROUND,
						IDC_RSCDISPLAYDEBRIEFING_OBJECTIVES,
						IDC_RSCDISPLAYDEBRIEFING_STATBACKGROUND,
						IDC_RSCDISPLAYDEBRIEFING_STAT
					]
				] call _showSection;
			};
			//--- Score
			case "%score": {
				[
					_display,
					[
					]
				] call _showSection;

				left = getNumber(configFile >> "RscDisplayDebriefing" >> "controls" >> "MainBackground" >> "x");
				top = getNumber(configFile >> "RscDisplayDebriefing" >> "controls" >> "MainBackground" >> "y");
				width = getNumber(configFile >> "RscDisplayDebriefing" >> "controls" >> "MainBackground" >> "w");
				height = getNumber(configFile >> "RscDisplayDebriefing" >> "controls" >> "MainBackground" >> "h");
				enableDebriefingStats [left, top, width, height];
			};

			//--- Custom
			default {
				[
					_display,
					[
						IDC_RSCDISPLAYDEBRIEFING_CUSTOM
					]
				] call _showSection;

				_custom = _display displayctrl IDC_RSCDISPLAYDEBRIEFING_CUSTOMTEXT;
				_customText = missionnamespace getvariable [_data,""];
				_custom ctrlsetstructuredtext parsetext _customText;
				_customPos = ctrlposition _custom;
				_customPos set [3,ctrltextheight _custom];
				_custom ctrlsetposition _customPos;
				_custom ctrlcommit 0;
			};
		};

	};
	
	
	case "DLCTabClicked":
	{
		disableserialization;
		_tabButton = _params select 0;
		_display = ctrlparent _tabButton;
		_assetsArray = [];
		_nonOwnedUsedModels = [];
		
		{
			_nonOwnedUsedModels = _nonOwnedUsedModels + [_x select 0];
		} forEach (getDLCAssetsUsage);

		//Set highlight to proper tab
		_tabButtonsIDCs =
		[
			IDC_RSCDISPLAYDEBRIEFING_DLCBUTTONALLASSETS,
			IDC_RSCDISPLAYDEBRIEFING_DLCBUTTONKARTS,
			IDC_RSCDISPLAYDEBRIEFING_DLCBUTTONHELI,
			IDC_RSCDISPLAYDEBRIEFING_DLCBUTTONMARKSMEN
		];
		
		{
			if(_x != ctrlIDC _tabButton) then
			{
				_unselectedTabButton = _display displayctrl _x;
				_unselectedTabButton ctrlSetBackgroundColor [0,0,0,1];
				_unselectedTabButton ctrlSetTextColor [1,1,1,1];
			};
		} forEach _tabButtonsIDCs;
		
		_tabButton ctrlSetBackgroundColor [1,1,1,1];
		_tabButton ctrlSetTextColor [0,0,0,1];

		switch (ctrlIDC _tabButton) do
		{
			case IDC_RSCDISPLAYDEBRIEFING_DLCBUTTONALLASSETS:
			{
				//Kart, Heli, Mark
				_assetsArray = ((configfile >> "CfgMods" >> "Kart" >> "Assets") call bis_fnc_returnChildren) +
				               ((configfile >> "CfgMods" >> "Heli" >> "Assets") call bis_fnc_returnChildren) +
					       ((configfile >> "CfgMods" >> "Marksman" >> "Assets") call bis_fnc_returnChildren);
			};
			case IDC_RSCDISPLAYDEBRIEFING_DLCBUTTONKARTS:
			{
				//Kart
				_assetsArray = ((configfile >> "CfgMods" >> "Kart" >> "Assets") call bis_fnc_returnChildren);
			};
			case IDC_RSCDISPLAYDEBRIEFING_DLCBUTTONHELI:
			{
				//Heli
				_assetsArray = ((configfile >> "CfgMods" >> "Heli" >> "Assets") call bis_fnc_returnChildren);
			};
			case IDC_RSCDISPLAYDEBRIEFING_DLCBUTTONMARKSMEN:
			{
				//Mark
				_assetsArray = ((configfile >> "CfgMods" >> "Marksman" >> "Assets") call bis_fnc_returnChildren);
			};
		};
		
		
		
	
		//--------------------------- Fill ListGroup --------------------------------------------------------------------------------

		_ListGroup = _display displayctrl IDC_RSCDISPLAYDEBRIEFING_LISTGROUP;
		
		//Delete the group and create it again, so it is empty (command for clearing is not available)
		//Only group created by the script can be deleted.
		ctrlDelete _ListGroup;
		_listGroupCfg = configfile >> "RscDisplayDebriefing_ListGroup";	
		_ListGroup = _display ctrlCreate ["RscControlsGroupNoHScrollbars", IDC_RSCDISPLAYDEBRIEFING_LISTGROUP];
		
		_ListGroup ctrlSetPosition [getNumber(_listGroupCfg >> "x"),
					    getNumber(_listGroupCfg >> "y"),
					    getNumber(_listGroupCfg >> "w"),
					    getNumber(_listGroupCfg >> "h")];

		_ListGroup ctrlCommit 0;
		//Sum of heights of all previous items
		_totalHeight = 0;
		
		{ //Search Karts - Assets. _x is assets class in cfgMods
			private["_blackBackgroundCtrl"];
		
			_picture = "";
			_dlcLogo = "";
			_displayName = "";
			_description = "";
			_totalTimeHmsArray = [];
			_sessionTimeHmsArray = [];
			_reference = [_x, "reference",[]] call bis_fnc_returnConfigEntry;  //Search the selected asset for reference parameter. If not found, return empty array.
			
			_highlightColor = ["GUI", "BCG_RGB"] call BIS_fnc_displayColorGet;
			_highlightColor set [3, 1]; //set alpha to 1

			if((count _reference) != 0) then
			{
				//Try to read from vehicle config
				_itemConfigEntry = [_reference, configfile] call bis_fnc_loadclass; //tries to load the class according to path in reference.
				_model = [_itemConfigEntry, "model", ""] call bis_fnc_returnConfigEntry;
				
				//If model string from config begins with "\", remove it.
				if( ([_model, 0, 0] call bis_fnc_trimstring) == "\") then
				{
					_model = [_model, 1] call bis_fnc_trimstring;
				};
				
				//Model must be found, since usage is checked for models
				if((_model != "") && ({_x == _model} count _nonOwnedUsedModels) > 0) then
				{
					_picture = [_itemConfigEntry, "overviewPicture", ""] call bis_fnc_returnConfigEntry;
					_displayName = [_itemConfigEntry, "displayName", ""] call bis_fnc_returnConfigEntry;
					_description = [_itemConfigEntry >> "Library", "libTextDesc", ""] call bis_fnc_returnConfigEntry;
					
					//If reference or the parameter was not found read from cfgMods
					if(_picture == "") then
					{
						_picture = gettext(_x >> "overviewPicture");
					};
						
					_dlcType = configSourceMod _itemConfigEntry;
					
					switch (_dlcType) do
					{
						case "kart":
						{
							_dlcLogo = [configfile >> "CfgMods" >> "Kart", "logo", ""] call bis_fnc_returnConfigEntry;
						};
						
						case "heli":
						{
							_dlcLogo = [configfile >> "CfgMods" >> "Heli", "logo", ""] call bis_fnc_returnConfigEntry;
						};
						
						//Mark appId unknown
						// case "Marksman":
						// {
							//_dlcLogo = [configfile >> "CfgMods" >> "Marksmen", "logo", ""] call bis_fnc_returnConfigEntry;
							// uiNamespace setVariable ["RscDisplayDebriefing_appId", xxxxxxxxx];
						// };
						
						// default
						// {
							////Bundle
							// uiNamespace setVariable ["RscDisplayDebriefing_appId", 304400];
							// BIS_testtest = 304400;
						// };
					};
					
					if(_displayName == "") then
					{
						_displayName = gettext(_x >> "displayName");
					};
					
					if(_description == "") then
					{
						_description = gettext(_x >> "description");
					};
					
					//_model = [_itemConfigEntry, "model", ""] call bis_fnc_returnConfigEntry;
					_timesArray = getDLCAssetsUsageByName _model;
					_sessionTimeHmsArray = [_timesArray select 0, "HH:MM:SS", true] call bis_fnc_secondsToString;
					_totalTimeHmsArray = [_timesArray select 1, "HH:MM:SS", true] call bis_fnc_secondsToString;
					

					//?? TODO - Add IDC increment (maybe not necessary).
					{ //Item creation
						private["_newControl"];
						
						_idc = getNumber(_x >> "idc");
						_parentClass = configName(inheritsFrom _x);
						
						_posX = getNumber(_x >> "x");
						//Y needs to be computed from Y and H of the previous item, since height changes dynamically with description height.
						_posY = _totalHeight + getNumber(_x >> "y");
						_posW = getNumber(_x >> "w");
						_posH = getNumber(_x >> "h");
						
						_newControl = _display ctrlCreate [_parentClass, _idc, _ListGroup];
						_newControl ctrlSetPosition [_posX, _posY, _posW, _posH];
						_newControl ctrlCommit 0;
						
						//Background (more items)
						_colorBackground = getArray(_x >> "colorBackground");
						if(count _colorBackground == 4) then
						{
							_newControl ctrlSetBackgroundColor _colorBackground;
						};
						
						//Black background - uses height of description text
						if(_idc == IDC_RSCDISPLAYDEBRIEFING_ITEMBACKGROUNDBLACK) then
						{
							//Store handle of the black background control, so its height could be adjusted according to description height.
							//Since description is defined after black background, description will be processed later.
							_blackBackgroundCtrl = _newControl;
						};
						
						//Picture
						if(_idc == IDC_RSCDISPLAYDEBRIEFING_ITEMPICTURE) then
						{
							_newControl ctrlSetText _picture;
						};
						
						//DLC Logo
						if(_idc == IDC_RSCDISPLAYDEBRIEFING_ITEMDLCLOGO) then
						{
							_newControl ctrlSetText _dlcLogo;
						};

						//Name
						if(_idc == IDC_RSCDISPLAYDEBRIEFING_ITEMNAME) then
						{
							_newControl ctrlSetText _displayName;
							_newControl ctrlSetTextColor _highlightColor;
						};
						
						//Statistics - Fill with text only if reference was found (see above)
						//Session statistic
						if(count _sessionTimeHmsArray > 0) then
						{
							if(_idc == IDC_RSCDISPLAYDEBRIEFING_ITEMTEXTSESSIONTIME) then
							{
								_newControl ctrlSetText (localize "STR_A3_TIME_TRIALS_SESSION");
							};
							
							if(_idc == IDC_RSCDISPLAYDEBRIEFING_ITEMSESSIONTIME) then
							{
								_newControl ctrlSetText (format[localize "STR_A3_RSCDISPLAYDEBRIEFING_TIME_FORMAT", _sessionTimeHmsArray select 0, _sessionTimeHmsArray select 1, _sessionTimeHmsArray select 2]);
								_newControl ctrlSetTextColor _highlightColor;
							};
						};

						//Total statistic
						if(count _totalTimeHmsArray > 0) then
						{
							if(_idc == IDC_RSCDISPLAYDEBRIEFING_ITEMTEXTTOTALTIME) then
							{
								_newControl ctrlSetText (localize "STR_A3_FIRING_DRILLS_HINT_RESULTS_TOTAL");
							};
							
							if(_idc == IDC_RSCDISPLAYDEBRIEFING_ITEMTOTALTIME) then
							{
								_newControl ctrlSetText (format[localize "STR_A3_RSCDISPLAYDEBRIEFING_TIME_FORMAT", _totalTimeHmsArray select 0, _totalTimeHmsArray select 1, _totalTimeHmsArray select 2]);
								_newControl ctrlSetTextColor _highlightColor;
							};
						};
						
						//Purchase button
						if(_idc == IDC_RSCDISPLAYDEBRIEFING_BUTTONPURCHASE) then
						{
							_newControl ctrlSetText (localize "STR_A3_BUTTON_PURCHASE");
						
							switch (_dlcType) do
							{
								case "kart":
								{
									_newControl ctrladdeventhandler ["buttonclick","openDlcPage 288520;"];
								};
								
								case "heli":
								{
									_newControl ctrladdeventhandler ["buttonclick","openDlcPage 304380;"];
								};
								
								//Mark appId unknown
								// case "Marksman":
								// {
									//_newControl ctrladdeventhandler ["buttonclick","openDlcPage xxxxxxx;"];
								// };
								
								default
								{
									//Bundle
									_newControl ctrladdeventhandler ["buttonclick","openDlcPage 304400;"];
								};
							};
						};
						
						//Description - must be processed last (means that must be last in config), since it changes _totalHeight
						if(_idc == IDC_RSCDISPLAYDEBRIEFING_ITEMDESCRIPTION) then
						{
							_newControl ctrlSetText _description;
							//Only description should change its height according to textHeight.
							_posH = ctrlTextHeight _newControl;
							_newControl ctrlSetPosition [_posX, _posY, _posW, _posH];
							_newControl ctrlCommit 0;
							
							//1.4-title+spaces, 4.4-semi transparent background + 1 dark background because of Purchase button - TODO: read from config
							_blackBackH = (_posH + (1.4 * GUI_GRID_CENTER_H)) max (5.4 * GUI_GRID_CENTER_H);
							_blackBackPos = ctrlPosition _blackBackgroundCtrl;
							_blackBackgroundCtrl ctrlSetPosition [_blackBackPos select 0, _blackBackPos select 1, _blackBackPos select 2, _blackBackH];
							_blackBackgroundCtrl ctrlCommit 0;
							
							_totalHeight = _totalHeight + _blackBackH + (0.5 * GUI_GRID_CENTER_H); //Spacing 0.5
						};
					} foreach ((configfile >> "RscDisplayDebriefing_ItemTemplate") call bis_fnc_returnChildren);
				};
			};
		} foreach _assetsArray;
		//--------------------------- Fill ListGroup --------------------------------------------------------------------------------

	}; //DLC tab clicked case
	
	
	
	case "onUnload": {
		if (missionnamespace getvariable ["RscDisplayDebriefing_noise",false]) then {
			0 cuttext ["","black"];
			1 cuttext ["","plain"];
		};
	};
};
