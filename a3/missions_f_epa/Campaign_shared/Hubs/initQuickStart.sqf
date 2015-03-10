scriptName "initQuickStart.sqf";

/*--------------------------------------------------------------------------------------------------

	QUICKSTART & STRATEGIC MAP

	Handles:
	--------
	* initialization of strategic map
	* strategic map interaction

--------------------------------------------------------------------------------------------------*/
BIS_QuickStart_addAction =
{
	private ["_object","_distance","_label"];

	_object = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_distance = 4;

	//ensure there is no delay in showing the action
	player reveal _object;

	_label = localize "str_a3_cfgvehicles_modulestrategicmapmoduleopen_f_0";
	_label = format["<img image='%1' size='1.8'/> <t size='1.2'>%2</t>","\A3\Ui_f\data\Map\GroupIcons\badge_gs.paa",_label];

	_object addAction
	[
		_label,
		{
			//show HQ marker
			"BIS_mrkHubCenter" setMarkerAlpha 1;

			[ "hide", BIS_fnc_showHubMarkers_markersonhub ] spawn BIS_fnc_ShowMarkers;
			_this call BIS_QuickStart_exec;
		},
		[],
		10e10,
		true,
		true,
		"",
		format["((vehicle player) distance (vehicle %1) <= %2) && !(BIS_FFDetected) && (BIS_selectedMission == '')", _object, _distance]
	];
};

/*
Tiggered by executing user action on the whiteboard object.

1. gathers info from CFG
2. generates the strategic map
3. opens the map with pre-generated params
*/
BIS_QuickStart_exec =
{
	disableserialization;

	private["_parentDisplay","_mapCenter","_missionsData","_ORBAT","_markers","_images","_overcast","_isNight","_mapDisplay"];
	private["_mClass","_mPos","_mOnClick","_mName","_mDesc","_mPlayer","_mOverview","_mSize","_mDescExt"];
	private["_missions"];

	//per-mission specific data loaded from CFG
	_missions = [[],["isSkirmish","isHub"]] call BIS_fnc_camp_getLinkedMissions;

	_missionsData = [];

	{
		_mClass 	= _x;

		/*
		_mName		= ["Missions",_mClass,"name"] call BIS_fnc_getCfgData;
		_mDesc		= ["Missions",_mClass,"desc"] call BIS_fnc_getCfgData;
		_mOverview	= ["Missions",_mClass,"overview"] call BIS_fnc_getCfgData;
		*/

		_mDescExt	= [_mClass] call BIS_fnc_camp_getMissionDescData;

		_mName		= _mDescExt select 4;
		_mDesc		= _mDescExt select 2;
		_mOverview	= _mDescExt select 3;


		_mPos		= ["Missions",_mClass,"QuickStart","position"] call BIS_fnc_getCfgData;
		_mPlayer	= format["%1. %2",[player,"displayNameShort"] call BIS_fnc_rankParams,name player];

		_mSize		= 1;
		_mOnClick	= BIS_QuickStart_onMissionSelected;

		_missionsData = _missionsData +
		[[
			_mPos,
			_mOnClick,
			_mName,
			_mDesc,
			_mPlayer,
			_mOverview,
			_mSize,
			[_mClass]
		]]
	}
	forEach _missions;

	//per-hub specific data
	_parentDisplay 	= [] call bis_fnc_displayMission;
	_mapCenter 		= position player;
	_ORBAT 			= [];
	_markers 		= [];
	_images 		= [];
	_overcast 		= overcast;
	_isNight 		= !((dayTime > 6) && (dayTime < 20));

	_mapDisplay =
	[
		_parentDisplay,
		_mapCenter,
		_missionsData,
		_ORBAT,
		_markers,
		_images,
		_overcast,
		_isNight,
		1,
		true
	]
	call BIS_fnc_strategicMapOpen;

	waitUntil{!(isNull _mapDisplay)};

	waitUntil{(isNull _mapDisplay)};

	//hide HQ marker
	"BIS_mrkHubCenter" setMarkerAlpha 0;
};

BIS_QuickStart_onMissionSelected =
{
	private["_params","_mission"];

	_params = _this select 9;

	if (count _params == 0) exitWith
	{
		["ERROR: Class of the selected mission not defined!"] call BIS_fnc_log;
	};

	_mission = _params select 0;

	["[QuickStart]: Mission '%1' selected!",_mission] call BIS_fnc_logFormat;

	//store the selected mission in gvar
	BIS_selectedMission = _mission;

	//end hub if module "HubBriefing" is not loaded
	if ("HubBriefing" in BIS_HubComponents) exitWith
	{
		[_mission,2] call BIS_HubBriefing_exec;
	};

	["[QuickStart]: Exiting hub with ending: '%1'!",_mission] call BIS_fnc_logFormat;

	[_mission,true,0] call BIS_fnc_endMission;
};