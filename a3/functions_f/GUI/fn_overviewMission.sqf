#define CONTROL_SHOW(CONTROL) \
	CONTROL ctrlshow true; \
	CONTROL ctrlsetfade 0; \
	CONTROL ctrlcommit 0;

#define CONTROL_HIDE(CONTROL) \
	CONTROL ctrlshow false; \
	CONTROL ctrlsetfade 1; \
	CONTROL ctrlcommit 0;

disableserialization;

private ["_display","_idcHTML","_config","_ctrlHTML","_ctrlBackground","_ctrlPicture","_ctrlStructuredText","_ctrlStatistics","_overview","_picture"];
_display = [_this,0,displaynull,[displaynull]] call bis_fnc_param;
_config = [_this,1,configfile,[configfile]] call bis_fnc_param;
_idcHTML = [_this,2,0,[0]] call bis_fnc_param;

//--- Display custom overview
_ctrlHTML = _display displayCtrl _idcHTML;
if (isnull _ctrlHTML) exitwith {["Control %1 not found",_idcHTML] call bis_fnc_error};

_ctrlBackground = _display displayCtrl 1002;
_ctrlPicture = _display displayCtrl 1200;
_ctrlStructuredText = _display displayCtrl 1100;
_ctrlStatistics = _display displayCtrl 1101;

if (isnil "_config") then {_config = configfile};

if (istext (_config >> "overviewText") || istext (_config >> "overviewPicture")) then {

	//--- Picture
	_picture = getText (_config >> "overviewPicture");
	if (_picture != "") then {
		_ctrlPicture ctrlSetText _picture;
	};

	//--- Overview
	_overview = getText (_config >> "overviewText");
	if (_overview != "") then {	
		_ctrlStructuredText ctrlSetStructuredText parsetext _overview;
	};

	//--- Statistics
	if (!isnull _ctrlStatistics) then {
		_statistics = getText (_config >> "statistics");
		if (_statistics != "") then {
			_statistics = _class call compile _statistics;
			if (typename _statistics == typename "") then {_statistics = parsetext _statistics;};
			if (typename _statistics != typename (parsetext "")) then {_statistics = parsetext str _statistics;};
			_ctrlStatistics ctrlSetStructuredText _statistics;
		} else {
			_ctrlStatistics ctrlSetStructuredText (parseText "");
		};
	};

	//--- Show background
	CONTROL_SHOW(_ctrlStructuredText)
	CONTROL_SHOW(_ctrlStatistics)
	CONTROL_SHOW(_ctrlPicture)
	CONTROL_SHOW(_ctrlBackground)

	//--- Hide overview.html control
	//RscDisplayCampaignLoad_HTMLsize = ctrlposition _ctrlHTML;
	//_ctrlHTML ctrlsetposition [0,0,0,0];
	CONTROL_HIDE(_ctrlHTML)
} else {

	//--- Show overview.html control
	//_ctrlHTML ctrlsetposition RscDisplayCampaignLoad_HTMLsize;
	CONTROL_SHOW(_ctrlHTML)

	//--- Hide picture and text
	CONTROL_HIDE(_ctrlStructuredText)
	CONTROL_HIDE(_ctrlStatistics)
	CONTROL_HIDE(_ctrlPicture)
	CONTROL_HIDE(_ctrlBackground)
};
