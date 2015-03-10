/*
	File: ui_loadingText.sqf
	Author: Karel Moricky

	Description:
		Loading screen hints

	Returned value(s):
		Nothing
*/
#define DISPLAY			(_this select 0)
#define RSCLOADINGHINT		(DISPLAY displayctrl 8400)
#define RSCLOADINGBCG		(DISPLAY displayctrl 8401)
#define RSCLOADINGPROGRESS	(DISPLAY displayctrl 104)
#define RSCLOADINGPROGRESSBCG	(DISPLAY displayctrl 1201)
#define RSCLOADINGPIC		(DISPLAY displayctrl 105)
#define RSCLOADINGPICDEF	(DISPLAY displayctrl 1200)

with (uinamespace) do {

	_id = _this select 1;

	//--- Savegame screen - disable blur
	if (_id == 6) exitwith {
		"dynamicBlur" ppEffectAdjust [0];
		"dynamicBlur" ppEffectCommit 0.0;
		"dynamicBlur" ppEffectEnable false;
	};

	_this = _this select 0;

	///////////////////////////////////////////////////////////////////////////////////////////
	//--- Initial loading - maintain visual style of RscDisplayStart
	if !(uinamespace getvariable ["BIS_initGame",false]) exitwith {
		RSCLOADINGPROGRESS ctrlshow false;
		RSCLOADINGPROGRESSBCG ctrlshow false;
		RSCLOADINGHINT ctrlshow false;
		RSCLOADINGBCG ctrlshow false;
		RSCLOADINGPIC ctrlshow false;
		RSCLOADINGPICDEF ctrlsettextcolor [1,1,1,1];
		RSCLOADINGPICDEF ctrlcommit 0;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	//--- Read texts
	_areMissionLoadingTexts = isclass (missionconfigfile >> "cfgLoadingTexts");
	_path = if (_areMissionLoadingTexts) then {missionconfigfile} else {configfile};
	_loadingTexts = if (isnil "BIS_loadingTexts" || _areMissionLoadingTexts) then {
		_loadingTexts = [];
		_cfgLoadingTexts = _path >> "cfgLoadingTexts";
		for "_s" from 0 to (count _cfgLoadingTexts - 1) do {
			_textConfig = _cfgLoadingTexts select _s;
			if (isclass _textConfig) then {
				_textArray = getarray (_textConfig >> "text");
				if (count _textArray > 0) then {

					//--- Text lines
					_text = "";
					_textParams = getarray (_textConfig >> "params");
					_textParamsCompile = getarray (_textConfig >> "paramsCompile");
					{
						_textParamsCompile set [_foreachindex,call compile _x];
					} foreach _textParamsCompile;
					{
						_text = _text + format ([_x] + _textParams + _textParamsCompile) + "<br />";
					} foreach _textArray;

					//--- Header
					_textHeader = gettext (_textConfig >> "title");
					_text =  "<t size='1.5' color='#66ffffff' shadow='0'>" + _textHeader + "</t><br />" + _text;
					
					_loadingTexts set [count _loadingTexts,parsetext _text];
				};
			};
		};

		//--- Save global loading texts
		if (!_areMissionLoadingTexts) then {BIS_loadingTexts = _loadingTexts;};

		_loadingTexts
	} else {
		BIS_loadingTexts
	};

	_refreshDelay = if (isnil "BIS_loadingTextsRefresh" || _areMissionLoadingTexts) then {
		_refreshDelay = getnumber (_path >> "cfgLoadingTexts" >> "refreshDelay");
		if (_refreshDelay <= 0) then {
			_refreshDelay = 30
		} else {
			if (!_areMissionLoadingTexts) then {BIS_loadingTextsRefresh = _refreshDelay};
		};
		_refreshDelay
	} else {
		BIS_loadingTextsRefresh
	};
	if (isnil "BIS_loadingTextsRefreshRandom") then {
		BIS_loadingTextsRefreshRandom = random (_refreshDelay * (count _loadingTexts));
	};

	//--- Display text
	if (count _loadingTexts > 0) then {
		_loadText = _loadingTexts select (floor ((diag_tickTime + BIS_loadingTextsRefreshRandom) / _refreshDelay) % (count _loadingTexts));

		//_loadText = parsetext "<img image='A3\ui_f\data\igui\ico_cpt_music_ON_ca' size='2' /> When in helicopter, turn the music ON!";


		//--- Move loading text in the middle of loading text area
		RSCLOADINGHINT ctrlsetstructuredtext _loadText;
		_ctrlpos = ctrlposition RSCLOADINGHINT;
		_ctrlpos set [3,ctrltextheight RSCLOADINGHINT];
		_y = (safezoneY + safezoneH) - ((_ctrlPos select 1) + (_ctrlPos select 3));
		_ctrlpos set [1,(_ctrlPos select 1) + _y / 2 - 0.02];
		RSCLOADINGHINT ctrlsetposition _ctrlpos;
		RSCLOADINGHINT ctrlcommit 0;

		RSCLOADINGBCG ctrlshow true;
	} else {
		RSCLOADINGHINT ctrlsettext "";
		RSCLOADINGBCG ctrlshow false;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	//--- Read pictures
	if (isnil "BIS_loadingScreens") then {
		BIS_loadingScreens = [];
		_cfgLoadingScreens = configfile >> "cfgLoadingscreens";
		for "_s" from 0 to (count _cfgLoadingScreens - 1) do {
			_screen = _cfgLoadingScreens select _s;
			if (isclass _screen) then {
				_screen = gettext (_screen >> "text");
				if (_screen != "") then {
					BIS_loadingScreens set [count BIS_loadingScreens,_screen];
				};
			};
		};
	};

	//--- Show picture only when not set by mission
	_loadScreen = gettext (missionconfigfile >> "loadScreen");
	if (_loadScreen == "") then {
		_refreshDelay = if (isnil "BIS_loadingScreensRefresh") then {
			_refreshDelay = getnumber (configfile >> "cfgLoadingscreens" >> "refreshDelay");
			if (_refreShDelay == 0) then {_refreshDelay = 30} else {BIS_loadingScreensRefresh = _refreshDelay};
			_refreshDelay
		} else {
			BIS_loadingScreensRefresh
		};

		//--- Display picture
		if (count BIS_loadingScreens > 0) then {
			_loadScreen = gettext (missionconfigfile >> "loadScreen");
			if (_loadScreen == "") then {_loadScreen = BIS_loadingScreens select (floor ((diag_tickTime + BIS_loadingTextsRefreshRandom) / _refreshDelay) % (count BIS_loadingScreens))};
			RSCLOADINGPIC ctrlsettext _loadScreen;

			//MUF-commented, we don't want loading screen recoloring in A3----------------------------------------------------------		
			//--- Set color
			// _colorText = ["GUI","BCG_RGB"] call bis_fnc_displayColorGet;
			// _colorText set [3,1]; //--- Full alpha
			// _colorAverage = (_colorText select 0) + (_colorText select 1) + (_colorText select 2);

			//--- Normalize
			// _diff = 0.1;
			// _limit = 1.5;
			// if (_colorAverage < _limit) then {
				// _diff = _diff + (_limit - _colorAverage) / 3;
			// };
			// _colorText set [0,(_colorText select 0) + _diff];
			// _colorText set [1,(_colorText select 1) + _diff];
			// _colorText set [2,(_colorText select 2) + _diff];
			// RSCLOADINGPIC ctrlsettextcolor _colorText;
			//MUF-commented, we don't want loading screen recoloring in A3----------------------------------------------------------	
		};
	};
};