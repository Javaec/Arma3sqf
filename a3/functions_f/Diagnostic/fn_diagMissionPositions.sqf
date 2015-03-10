/*
	Author: Karel Moricky

	Description:
	Displays positions of units from all missions

	Parameter(s):
	0: CONFIG - config path which will be scanned (default: configfile >> "CfgMissions")
	1: (Optional): BOOL - when true, displays all units, otherwise just player positions (default: false)
	2: (Optional): BOOL - when true, scan will perceive the main folder as campaign (required when param 0 is direct path to campaign)

	Returns:
	BOOL
*/

#define ICON_SIZE	26
#define DELETE_CONFIG	diag_mergeconfigfile ["O:\arma3\A3\Functions_F\Diagnostic\fn_diagMissionPositions_delete.cfg"];

startloadingscreen [""];

_cfgStart = [_this,0,configfile >> "CfgMissions",[configfile]] call bis_fnc_param;
_showAll = [_this,1,false,[false]] call bis_fnc_param;
_isCampaign = [_this,2,false,[false]] call bis_fnc_param;

_campaignDirectory = if (_isCampaign) then {"*"} else {""};
												
_playerIcon = gettext (configfile >> "cfgingameui" >> "islandmap" >> "iconPlayer");
_playerColor = getarray (configfile >> "cfgingameui" >> "islandmap" >> "colorMe");
_wpIcon = gettext (configfile >> "RscDisplayArcadeMap" >> "controlsBackground" >> "CA_Map" >> "Waypoint" >> "icon");
_wpColor = getarray (configfile >> "RscDisplayArcadeMap" >> "controlsBackground" >> "CA_Map" >> "Waypoint" >> "color");
_wpLineColor = getarray (configfile >> "CfgInGameUI" >> "IslandMap" >> "colorActiveMission");

_charDot = toarray "." select 0;


_fn_posLimit = {
	_posX = _this select 0;
	_posY = _this select 1;
	if (_posX < _posXmin || _posXmin == 0) then {_posXmin = _posX;};
	if (_posX > _posXmax || _posXmax == 0) then {_posXmax = _posX;};

	if (_posY < _posYmin || _posYmin == 0) then {_posYmin = _posY;};
	if (_posY > _posYmax || _posYmax == 0) then {_posYmax = _posY;};

	_listX set [count _listX,_posX];
	_listY set [count _listY,_posY];
};

_explore = {
	private ["_class","_class","_campaignDirectory","_class","_directory","_template"];
	_class = _this select 0;
	_campaignDirectory = _this select 1;

	_directory = gettext (_class >> "directory");
	_template = gettext (_class >> "template");

	if (_template != "") then {_directory = _campaignDirectory + "\missions\" + _template;};

	if (configname _class == "Campaigns") then {_campaignDirectory = "*";};

	if (_directory != "") then {

		//if !(_campaignDirectory in ["","*"]) then {
		if (_campaignDirectory == "*") then {
			private ["_ext","_cfgCampaign","_chapter"];
			_isCampaign = false;

			//--- Campaign
			_ext = "O:\arma3\" + _directory + "\description.ext";
			DELETE_CONFIG
			diag_mergeconfigfile [_ext];

			_campaignDirectory = _directory;
			_cfgCampaign = configfile >> "Campaign";
			for "_a" from 0 to (count _cfgCampaign - 1) do {
				_chapter = _cfgCampaign select _a;
				if (isclass _chapter) then {
					//[0,_chapter,_campaignDirectory] call bis_fnc_log;

					//--- We need to go deeper!
					for "_c" from 0 to (count _chapter - 1) do {
						_subclass = _chapter select _c;
						if (isclass _subclass) then {
							[_subclass,_campaignDirectory] call _explore;
						};
					};
				};
			};
		} else {
			private ["_sqm","_cfgMission","_briefingname","_groups","_group","_vehicles","_veh","_vehicle","_side","_position","_azimut","_player"];

			//--- Mission
			_sqm = "O:\arma3\" + _directory + "\mission.sqm";
			DELETE_CONFIG
			diag_mergeconfigfile [_sqm];

			//--- Detect island
			_directoryArray = toarray _directory;
			_terrainArray = [];
			{
				_terrainArray set [count _terrainArray,_x];
				if (_x == _charDot) then {_terrainArray = [];};
			} foreach _directoryArray;
			_terrain = tostring _terrainArray;

			_posXmin = 0;
			_posXmax = 0;
			_posYmin = 0;
			_posYmax = 0;
			_listX = [];
			_listY = [];

			if (_terrain == worldname) then {
				_cfgMission = configfile >> "Mission";
				if (isclass _cfgMission) then {
					_briefingname = gettext (_cfgMission >> "intel" >> "briefingname");
					_groups = _cfgMission >> "groups";
					for "_g" from 0 to (count _groups - 1) do {
						_group = _groups select _g;
						if (isclass _group) then {

							//--- Vehicles
							_playerGroup = false;
							_leaderPos = [];
							_vehicles = _group >> "vehicles";
							for "_v" from 0 to (count _vehicles - 1) do {
								_veh = _vehicles select _v;
								if (isclass _veh) then {
									_vehicle = gettext (_veh >> "vehicle");
									_side = gettext (_veh >> "side");
									_position = getarray (_veh >> "position");
									_azimut = getnumber (_veh >> "azimut");
									_player = gettext (_veh >> "player");
									_leader = getnumber (_veh >> "leader");

									_pos = [_position select 0,_position select 2];
									_icon = gettext (configfile >> "cfgvehicles" >> _vehicle >> "icon");

									_vehicleIcon = gettext (configfile >> "CfgVehicleIcons" >> _icon);
									if (_vehicleIcon != "") then {_icon = _vehicleIcon;};

									_isPlayer = _player in ["PLAYER COMMANDER","PLAYER DRIVER","PLAYER GUNNER"];
									if (_isPlayer) then {_playerGroup = true;};

									if (_leader > 0 || _isPlayer) then {_leaderPos = _pos;};

									_sideId = [
										"EAST",
										"WEST",
										"GUER",
										"CIV",
										"",
										"",
										"",
										"LOGIC",
										"AMBIENT LIFE"	//--- Ambient life in editor
									] find (toupper _side);
									_color = _sideId call bis_fnc_sideColor;

									if (_showAll || _isPlayer) then {
										BIS_fnc_diagMissionPositions_drawUnits set [
											count BIS_fnc_diagMissionPositions_drawUnits,
											[
												_icon,
												_color,
												_pos,
												ICON_SIZE,
												ICON_SIZE,
												_azimut,
												"",
												false
											]
										];

										if (_isPlayer) then {
											BIS_fnc_diagMissionPositions_drawUnits set [
												count BIS_fnc_diagMissionPositions_drawUnits,
												[
													_playerIcon,
													_playerColor,
													_pos,
													ICON_SIZE,
													ICON_SIZE,
													0,
													_briefingName,
													false
												]
											];
											_pos call _fn_posLimit;
										};
									};
								};
							};

							//--- Waypoints
							_waypoints = _group >> "waypoints";
							_posOld = _leaderPos;
							for "_w" from 0 to (count _waypoints - 1) do {
								_wp = _waypoints select _w;
								if (isclass _wp) then {
									_position = getarray (_wp >> "position");
									_pos = [_position select 0,_position select 2];
									if (_showAll || _playerGroup) then {
										if (_playerGroup) then {_pos call _fn_posLimit;};
										BIS_fnc_diagMissionPositions_drawUnits set [
											count BIS_fnc_diagMissionPositions_drawUnits,
											[
												_wpIcon,
												_wpColor,
												_pos,
												ICON_SIZE/2,
												ICON_SIZE/2,
												0,
												"",
												false
											]
										];
										BIS_fnc_diagMissionPositions_drawUnits set [
											count BIS_fnc_diagMissionPositions_drawUnits,
											[
												_posOld,
												_pos,
												_wpLineColor
											]
										];

										if (_playerGroup && false) then {
											_posXavg = (_posOld select 0) + ((_pos select 0) - (_posOld select 0)) / 2;
											_posYavg = (_posOld select 1) + ((_pos select 1) - (_posOld select 1)) / 2;
											_posDir = [_posOld,_pos] call bis_fnc_dirto;
											_posDis = _pos distance _posOld;
											BIS_fnc_diagMissionPositions_drawUnits set [
												count BIS_fnc_diagMissionPositions_drawUnits,
												[
													[_posXavg,_posYavg],
													(_posDis * 0.4) max 250 min 2500,
													(_posDis * 0.7) max 250,
													_posDir,
													_playerColor,
													//"#(argb,8,8,3)color(1,1,1,1)"
													gettext (configfile >> "CfgMarkerBrushes" >> "Horizontal" >> "texture")
												]
											];
										};
									};
									_posOld = _pos;
								};
							};
						};
					};
				};

/*
				//--- Mission area
				_areaW = _posXmax - _posXmin;
				_areaH = _posYmax - _posYmin;
				BIS_fnc_diagMissionPositions_drawUnits set [
					count BIS_fnc_diagMissionPositions_drawUnits,
					[
						[_posXmin + _areaW / 2,_posYmin + _areaH / 2],
						_areaW / 2,
						_areaH / 2,
						0,
						[1,0,1,1],
						""
					]
				];

				_posXavg = 0;
				_posYavg = 0;
				{_posXavg = _posXavg + _x} foreach _listX;
				{_posYavg = _posYavg + _x} foreach _listY;
				_posXavg = _posXavg / (count _listX);
				_posYavg = _posYavg / (count _listY);
				BIS_fnc_diagMissionPositions_drawUnits set [
					count BIS_fnc_diagMissionPositions_drawUnits,
					[
						[_posXavg,_posYavg],
						32,
						32,
						0,
						[1,1,1,0.5],
						"#(argb,8,8,3)color(1,1,1,1)"
					]
				];
*/
			};
		};
	} else {
		//--- We need to go deeper!
		for "_c" from 0 to (count _class - 1) do {
			_subclass = _class select _c;
			if (isclass _subclass) then {
				[_subclass,_campaignDirectory] call _explore;
			};
		};
	};
};

//--- Map handler
disableserialization;
_ctrlMap = (finddisplay 12) displayctrl 51;
BIS_fnc_diagMissionPositions_drawUnits = [];
BIS_fnc_diagMissionPositions_draw = {
	_ctrlMap = _this select 0;
	{
		_drawParams = _x;
		switch (count _drawParams) do {
			case 3: { //--- Line
				_ctrlMap drawarrow _drawParams;
			};
			case 6: { //--- Ellipse
				_ctrlMap drawellipse _drawParams;
			};
			case 8: { //--- Icon
				_ctrlMap drawicon _drawParams;
			};
		};
	} foreach BIS_fnc_diagMissionPositions_drawUnits;
};
if !(isnil "BIS_fnc_diagMissionPositions_drawEH") then {_ctrlMap ctrlremoveeventhandler ["draw",BIS_fnc_diagMissionPositions_drawEH]};
BIS_fnc_diagMissionPositions_drawEH = _ctrlMap ctrladdeventhandler ["draw","_this call BIS_fnc_diagMissionPositions_draw;"];


//--- Execute
[_cfgStart,_campaignDirectory] call _explore;
//DELETE_CONFIG
endloadingscreen;
true