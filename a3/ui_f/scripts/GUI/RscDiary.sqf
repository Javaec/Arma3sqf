#include "\A3\ui_f\hpp\defineResincl.inc"

#define CONTROL (_display displayctrl _idc)

disableserialization;

_mode = _this select 0;
_params = _this select 1;
_class = _this select 2;

switch _mode do {

	case "TaskTooltip_onMouseEnter":
	{
		//["[i] Event 'onMouseEnter' triggered: %1 | %2",_params,_class] call BIS_fnc_logFormat;

		missionNamespace setVariable ["RscDiaryTaskMarkers_showTooltip", true];
	};
	case "TaskTooltip_onMouseExit":
	{
		//["[i] Event 'onMouseExit' triggered: %1 | %2",_params,_class] call BIS_fnc_logFormat;

		missionNamespace setVariable ["RscDiaryTaskMarkers_showTooltip", false];
	};
	case "TaskTooltip_onButtonClick":
	{

		//["[i] Event 'onButtonClick' triggered: %1 | %2",_params,_class] call BIS_fnc_logFormat;

		private["_taskID"];

		_taskID = missionNamespace getVariable ["RscDiaryTaskMarkers_mouseOverMarker", taskNull];

		//if assigned, then unassign
		if (taskState _taskID == "Assigned") then
		{
			_task = player createSimpleTask ["REMOVE_ME"];
			player setCurrentTask _task;
			player removeSimpleTask _task;
		}
		//if unassigned, then assign
		else
		{
			player setCurrentTask _taskID;
		};
	};

	case "onLoad": {

		_display = _params select 0;

		//add event handlers for storing the current root and sub-menu selection
		missionNamespace setVariable ["RscDiaryTaskMarkers_menu0Selected", ""];
		missionNamespace setVariable ["RscDiaryTaskMarkers_menu1Selected", ""];
		missionNamespace setVariable ["RscDiaryTaskMarkers_selectedTaskID", -1];

		_idc = IDC_DIARY_TOPIC_LIST;
		CONTROL ctrlAddEventHandler ["LBSelChanged",
		{
			private["_ctrl","_lbIndex","_lbData"];

			_ctrl = _this select 0;
			_lbIndex = _this select 1;
			_lbData = _ctrl lbdata _lbIndex;

			if (_lbData != "Tasks") then
			{
				missionNamespace setVariable ["RscDiaryTaskMarkers_menu0Selected", ""];
			}
			else
			{
				missionNamespace setVariable ["RscDiaryTaskMarkers_menu0Selected", _lbData];
			};
		}];

		_idc = IDC_DIARY_TOPIC_LISTINDEX;
		CONTROL ctrlAddEventHandler ["LBSelChanged",
		{
			private["_ctrl","_lbIndex","_lbData","_taskID"];

			_ctrl = _this select 0;
			_lbIndex = _this select 1;
			_lbData = _ctrl lbdata _lbIndex;

			missionNamespace setVariable ["RscDiaryTaskMarkers_menu1Selected", _lbData];

			_taskID = parseNumber(_lbData select [4,100]);
			missionNamespace setVariable ["RscDiaryTaskMarkers_selectedTaskID", _taskID];
		}];

		//--- Hide player's name when Stream Friendly UI is on.
		[_display, 111] call (uinamespace getvariable 'BIS_fnc_setIDCStreamFriendly');

		//--- Hide the black overlay (not in task list)
		_ctrlMap = _display displayctrl IDC_MAP;
		_fadeDelay = if (isnull _ctrlMap) then {0} else {0.75};
		_fade = _display displayctrl 1099;
		_fade ctrlsetfade 1;
		_fade ctrlcommit _fadeDelay;

		//--- Custom mission name
		_missionName = missionnamespace getvariable ["bis_fnc_moduleMissionName_name",""];
		if (_missionName != "") then {
			[_display displayctrl IDC_DIARY_MISSION_NAME,_missionName] spawn {
				disableserialization;
				(_this select 0) ctrlsettext (_this select 1);
			};
		};

		//--- Disable map buttons when map is no present (i.e. in task log after pressing 'J')
		_idc = IDC_MAP;
		RscDiary_playerAlpha = 0;
		RscDiary_playerPosTime = 0;
		RscDiary_playerPos = [0,0,0];
		if (isnull CONTROL) then {
			{
				_idc = _x;
				CONTROL ctrlenable false;
				CONTROL ctrlsettextcolor [1,1,1,0.2];
				CONTROL ctrlcommit 0;
			} foreach [1201,1202];

			_idc = 1005;
			CONTROL ctrlsetfade 1;
			CONTROL ctrlcommit 0;
		} else {

			_trackColor = getarray (configfile >> "cfgWrapperUI" >> "Cursors" >> "Track" >> "color");
			{
				_trackColor set [_foreachindex,_x call bis_fnc_parsenumber];
			} foreach _trackColor;

			if (false) then {
				_colorSelect = getarray (configfile >> "cfgIngameUi" >> "islandMap" >> "colorSelect");
				{
					_colorSelect set [_foreachindex,_x call bis_fnc_parsenumber];
				} foreach _colorSelect;

				_playerCfg = configfile >> "cfgingameui" >> "islandmap" >> "meCircle";
				_playerColor = getarray (_playerCfg >> "color");
				{
					_colorPlayer set [_foreachindex,_x call bis_fnc_parsenumber];
				} foreach _colorPlayer;
				_playerSize = getnumber (_playerCfg >> "size");
				_playerRefreshDelay = getnumber (_playerCfg >> "refreshDelay");

				CONTROL ctrladdeventhandler [
					"draw",
					format [
						"
							_map = _this select 0;
							with uinamespace do {
								if (difficultyEnabled 'map') then {
									{
										_map drawLine [position _x,position player,%1];
									} foreach groupSelectedUnits player;
								} else {
									_veh = vehicle player;
									if (!(_veh iskindof 'air') && !(_veh iskindof 'tank')) then {
										_pos = if (time > RscDiary_playerPosTime) then {
											_pos = position player;
											_posX = _pos select 0;
											_posY = _pos select 1;
											_pos set [0,_posX + cos _posY * (%3 / 2)];
											_pos set [1,_posY + sin _posX * (%3 / 2)];
											RscDiary_playerPos = _pos;
											RscDiary_playerPosTime = time + %4;
											_pos
										} else {
											RscDiary_playerPos
										};

										_color = %2;
										_map drawEllipse [
											_pos,
											%3,
											%3,
											0,
											_color,
											''
										];

										_colorAlpha = uinamespace getvariable ['RscDiary_playerAlpha',0];
										_color set [3,_colorAlpha];
										_map drawEllipse [
											_pos,
											%3,
											%3,
											0,
											_color,
											'#(argb,8,8,3)color(1,1,1,0.5)'
										];
										RscDiary_playerAlpha = (RscDiary_playerAlpha - 0.005);
									};
								};
							};
						",
						/* %1 */ _colorSelect,
						/* %2 */ _playerColor,
						/* %3 */ _playerSize,
						/* %4 */ _playerRefreshDelay
					]
				];
			};

			//draw the new task markers
			CONTROL ctrlAddEventHandler ["draw",
			{
				#include "RscDiaryTaskMarkers.sqf"
			}];

			//add click even handler to allow deselect of the selected task
			CONTROL ctrlAddEventHandler ["MouseButtonClick",
			{
				private["_mouseOver","_map"];

				_map = _this select 0;
				_mouseOver = ctrlMapMouseOver _map;

				if !(count _mouseOver == 2 && {_mouseOver select 0 == "task"}) then
				{
					//select the "Map" item in the root menu
					(findDisplay 12 displayctrl IDC_DIARY_TOPIC_LIST) lbSetCurSel 0;
				};
			}];


			//add mouse down even handler to allow task selection with single mouse click
			CONTROL ctrlAddEventHandler ["MouseButtonDown",
			{
				//["[i] _this: %1",_this] call BIS_fnc_logFormat;

				private["_mouseOver","_map"];

				_map = _this select 0;
				_mouseOver = ctrlMapMouseOver _map;

				if (count _mouseOver == 2 && {_mouseOver select 0 == "task"}) then
				{
					private["_task","_taskID","_customData","_taskData","_ctrlMenu0","_ctrlMenu1","_i","_lbTaskClass"];

					_task = _mouseOver select 1;
					_customData = player getVariable ["BIS_fnc_setTaskLocal_customData",[]];

					_i = (_customData find _task) + 1;

					if (_i == 0) exitWith {};	//task was not found in the custom data

					_taskData = _customData select _i;
					_taskID = _taskData select 1;
					_lbTaskClass = format["Task%1",_taskID];

					//handle the selection of the "Task" section
					_ctrlMenu0 = (findDisplay 12 displayctrl IDC_DIARY_TOPIC_LIST);
					_i = 0;
					while {(_ctrlMenu0 lbValue _i) != 0 && {(_ctrlMenu0 lbData _i) != "Tasks"}} do
					{
						_i = _i + 1;
					};
					if ((_ctrlMenu0 lbData _i) == "Tasks") then
					{
						_ctrlMenu0 lbSetCurSel _i;
					};

					//handle the selection of the clicked task in the task list
					_ctrlMenu1 = (findDisplay 12 displayctrl IDC_DIARY_TOPIC_LISTINDEX);
					_i = 0;
					while {(_ctrlMenu1 lbData _i) != _lbTaskClass} do
					{
						_i = _i + 1;
					};

					if ((_ctrlMenu1 lbData _i) == _lbTaskClass) then
					{
						_ctrlMenu1 lbSetCurSel _i;
					};
				};
			}];

			//--- Grid and elevation next to cursor
			CONTROL ctrladdeventhandler [
				"mousemoving",
				format [
					"
						_map = _this select 0;
						_text = (ctrlparent _map) displayctrl 1016;
						if (_this select 3) then {
							_mapPos = _map ctrlmapscreentoworld [_this select 1,_this select 2];
							_textPos = ctrlposition _text;
							_textPos set [0,(_this select 1) + 0.02];
							_textPos set [0,(_this select 1) + (_textPos select 2) / 4];
							_textPos set [1,(_this select 2) - (_textPos select 3) / 2];
							_text ctrlsetposition _textPos;
							_text ctrlsettext format [
								'%2\n%3 m',
								mapgridposition _mapPos,
								round getterrainheightasl _mapPos
							];
							_text ctrlsettextcolor %1;
							_text ctrlsetfade 0;
							_text ctrlenable false;
							_text ctrlcommit 0;
						} else {
							_text ctrlsetfade 1;
							_text ctrlcommit 0;
						};
					",
					/* %1 */ _trackColor,"%1","%2"
				]
			];

			//--- Alt + Click teleport
			CONTROL ctrladdeventhandler [
				"mousebuttonclick",
				"
					if (!isnull (finddisplay 26) || cheatsenabled) then {
						_map = _this select 0;
						_button = _this select 1;
						_mX = _this select 2;
						_mY = _this select 3;
						_shift = _this select 4;
						_alt = _this select 6;

						if (_button == 0 && _alt) then {
							_pos = _map ctrlmapscreentoworld [_mX,_mY];
							vehicle cameraon setpos [_pos select 0,_pos select 1,position vehicle cameraon select 2];
							_dir = direction vehicle cameraon;

							if (_shift) then {
								_vehs = [vehicle cameraon];
								{
									_veh = vehicle _x;
									if !(_veh in _vehs) then {
										_veh setpos ([_pos,10 * (count _vehs),_dir + 180] call bis_fnc_relpos);
										_veh setdir _dir;
										_vehs set [count _vehs,_veh];
									};
								} foreach (units cameraon - [cameraon]);
							};
						};
					};
				"
			];
		};

		_idc = 2012;
		CONTROL ctrlenable false;


		//--- Disable back button in GetReady display
		_idc = 1;
		if !(isnull CONTROL) then {
			_idc = 2;
			CONTROL ctrlenable false;
			CONTROL ctrlsettextcolor [1,1,1,0.2];
		};

		//--- Add Dedicated Server Control
		//if (isMultiplayer) then {player createDiarySubject ["DSInterface",localize "STR_DISP_SERVER_CONTROL"]};
	};

	case "ButtonPlayer": {
		_display = ctrlparent (_params select 0);
		_idc = 51;
		_veh = vehicle player;
		if (difficultyEnabled 'map' || (_veh iskindof 'air') || (_veh iskindof 'tank')) then {
			CONTROL ctrlmapanimadd [1,0.1,position vehicle player];
			ctrlmapanimcommit CONTROL;
		} else {
			_playerCfg = configfile >> "cfgingameui" >> "islandmap" >> "meCircle";
			_playerSize = getnumber (_playerCfg >> "size");

			RscDiary_playerAlpha = 1;
			_pos = position player;
			_posX = _pos select 0;
			_posY = _pos select 1;
			_pos set [0,_posX + cos _posY * (_playerSize / 2)];
			_pos set [1,_posY + sin _posX * (_playerSize / 2)];
			CONTROL ctrlmapanimadd [1,0.1,_pos];
			ctrlmapanimcommit CONTROL;
		};
	};
	case "ButtonTextures": {
		_display = ctrlparent (_params select 0);
		ctrlactivate (_display displayctrl 107);
	};
};