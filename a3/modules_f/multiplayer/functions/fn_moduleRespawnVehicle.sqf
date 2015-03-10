/*
	Author: Karel Moricky

	Description:
	Set vehicle respawn, compatible both with SP and MP.

	Parameter(s):
		0: OBJECT - vehicle
		1:
			NUMBER - respawn delay in seconds (default is 0)
			BOOL - true to remove vehicle respawn (further params are ignored), false to check if the vehicle is marked for respawn
		2: NUMBER - how long until the vehicle is automatically respawned after its crew leaves it (default is 0, i.e., disabled)
		3: NUMBER - number of time the vehicle can be respawned (default is -1, i.e., unlimited)
		4: 	CODE - code executed upon respawn. Passed arguments are [<newVehicle>,<oldVehicle>]. The old vehicle is deleted only after this code is completed.
			ARRAY
				CODE - code
				ARRAY - array of code input parameters
		5: NUMBER - type of respawn position:
			0 = where it started
			1 = where it was destroyed
			2 = on vehicle's side respawn marker (e.g., "respawn_vehicle_west")
			3 = on BLUFOR respawn marker
			4 = on OPFOR respawn marker
			5 = on Independent respawn marker
			6 = on Civilian respawn marker
			7 = on side respawn marker of unit which destroyed the vehicle
			8 = on respawn modules synchronized with the vehicle
		6: NUMBER - position selection type (0 = random, 1 = newest, 2 = oldest)
		7: NUMBER - type of old vehicle deletion (0 = don't delete, 1 = delete, 2 = delete with an explosion effect)
		8: BOOL - true to show notifcation when the vehicle is respawned
		9: BOOL - true to enable forced respawn, where the original vehicle is moved to to respawn position as if it was respawned (defaulkt
		10: NUMBER - how far from a player or respawn position until the vehicle is automatically respawned after its crew leaves it (default is 0, i.e., disabled)

	Returns:
	BOOL
*/
private ["_logic"];

_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;

if (typeof _logic == "ModuleRespawnVehicle_F") then {

	//--- Module
	private ["_units","_activated"];
	_units = [_this,1,[],[[]]] call bis_fnc_param;
	_activated = [_this,2,true,[true]] call bis_fnc_param;
	if (_activated) then {
		private ["_delay","_desertedDelay","_respawnCount","_init","_position","_wreck"];
		_delay =		(_logic getvariable ["Delay","0"]) call bis_fnc_parsenumber;
		_desertedDelay =	(_logic getvariable ["DesertedDelay","-1"]) call bis_fnc_parsenumber; //--- Obsolete, left because of backward compatibility
		_desertedDistance =	(_logic getvariable ["DesertedDistance","-1"]) call bis_fnc_parsenumber;
		_respawnCount =		(_logic getvariable ["RespawnCount","-1"]) call bis_fnc_parsenumber;
		_init =			compile (_logic getvariable ["Init",""]);
		_position =		(_logic getvariable ["Position","0"]) call bis_fnc_parsenumber;
		_positionType =		(_logic getvariable ["PositionType","0"]) call bis_fnc_parsenumber;
		_wreck =		((_logic getvariable ["Wreck","2"]) call bis_fnc_parsenumber);
		_showNotification =	((_logic getvariable ["ShowNotification","1"]) call bis_fnc_parsenumber);
		_forcedRespawn =	((_logic getvariable ["ForcedRespawn","0"]) call bis_fnc_parsenumber);

		{
			private ["_veh"];
			_veh = vehicle _x;
			if (_veh iskindof "AllVehicles") then {
				[_veh,_delay,_desertedDelay,_respawnCount,_init,_position,_positionType,_wreck,_showNotification,_forcedRespawn,_desertedDistance] call bis_fnc_moduleRespawnVehicle;
			};
		} foreach (synchronizedobjects _logic);
	} else {

	};
	true
} else {

	//--- Script
	private ["_veh","_delay","_desertedDelay","_respawnCount","_init","_position","_wreck","_showNotification","_forcedRespawn","_killer","_first"];
	_veh = _logic;

	_delay =		[_this,1,getnumber (missionconfigfile >> "respawnVehicleDelay"),[0,false]] call bis_fnc_param;
	_desertedDelay =	[_this,2,0,[0]] call bis_fnc_param;
	_respawnCount =		[_this,3,-1,[0]] call bis_fnc_param;
	_init =			[_this,4,{},[{},[]]] call bis_fnc_param;
	_position =		[_this,5,0,[0,[]]] call bis_fnc_param;
	_positionType =		[_this,6,0,[0]] call bis_fnc_param;
	_wreck =		[_this,7,2,[0]] call bis_fnc_param;
	_showNotification =	[_this,8,2,[0,true]] call bis_fnc_param;
	_forcedRespawn =	[_this,9,0,[0,true]] call bis_fnc_param;
	_desertedDistance =	[_this,10,0,[0]] call bis_fnc_param;
	_killer =		[_this,11,objnull,[objnull]] call bis_fnc_param;
	_first = _veh getvariable ["BIS_fnc_moduleRespawnVehicle_first",false];
	if (typename _showNotification == typename true) then {_showNotification = [0,1] select _showNotification};
	if (typename _forcedRespawn == typename true) then {_forcedRespawn = [0,1] select _forcedRespawn};

	//--- Remove respawn
	if (typename _delay == typename false) exitwith {
		if (_delay) then {
			_mpkilled = _veh getvariable ["BIS_fnc_moduleRespawnVehicle_mpkilled",-1];
			_getout = _veh getvariable ["BIS_fnc_moduleRespawnVehicle_getout",-1];
			_veh removempeventhandler ["mpkilled",_mpkilled];
			_veh removeeventhandler ["getout",_getout];

			_veh setvariable ["BIS_fnc_moduleRespawnVehicle_mpkilled",nil,true];
			_veh setvariable ["BIS_fnc_moduleRespawnVehicle_getout",nil,true];
			_veh setvariable ["BIS_fnc_moduleRespawnVehicle_data",nil,true];
			_veh setvariable ["BIS_fnc_moduleRespawnVehicle_pos",nil,true];
			_veh setvariable ["BIS_fnc_moduleRespawnVehicle_posType",nil,true];
			_veh setvariable ["BIS_fnc_moduleRespawnVehicle_first",nil,true];
			true
		} else {
			(_veh getvariable ["BIS_fnc_moduleRespawnVehicle_posType",-1])
		};
	};

	_simulation = tolower gettext (configfile >> "cfgvehicles" >> typeof _veh >> "simulation");
	if !(_simulation in ["car","carx","tank","tankx","helicopter","helicopterx","helicopterrtd","airplane","airplanex","ship","shipx","submarinex"]) exitwith {
		["Vehicle %1 of type ""%2"" has simulation ""%3"", must be ""carx"", ""tankx"", ""helicopterx"", ""helicopterrtd"", ""airplanex"", ""shipx"" or ""submarinex""",_veh,typeof _veh,_simulation] call bis_fnc_error;
		false
	};

	if (alive _veh && !_first) then {

		//--- Add
		_veh setvariable ["BIS_fnc_moduleRespawnVehicle_data",[_delay,_desertedDelay,_respawnCount,_init,_position,_positionType,_wreck,_showNotification,_forcedRespawn,_desertedDistance],true];
		_veh setvariable ["BIS_fnc_moduleRespawnVehicle_pos",[getposatl _veh,direction _veh],true];
		_veh setvariable ["BIS_fnc_moduleRespawnVehicle_posType",_position,true];

		private ["_mpkilled"];
		_mpkilled = _veh getvariable ["BIS_fnc_moduleRespawnVehicle_mpkilled",-1];
		if (_mpkilled < 0) then {
			_mpkilled = _veh addmpeventhandler [
				"mpkilled",
				{
					if (isserver) then {
						_veh = _this select 0;
						_killer = _this select 1;
						_data = _veh getvariable ["BIS_fnc_moduleRespawnVehicle_data",[]];
						([_veh] + _data + [_killer]) spawn BIS_fnc_moduleRespawnVehicle;
					};
				}
			];
			_veh setvariable ["BIS_fnc_moduleRespawnVehicle_mpkilled",_mpkilled,true];
		};

		if (_desertedDelay >= 0 || _desertedDistance >= 0) then {
			private ["_getout"];
			_getout = _veh getvariable ["BIS_fnc_moduleRespawnVehicle_getout",-1];
			if (_getout < 0) then {
				_getout = _veh addeventhandler [
					"getout",
					{
						_veh = _this select 0;
						if (isserver) then {
							_data = _veh getvariable ["BIS_fnc_moduleRespawnVehicle_data",[]];
							_desertedDelay = [_data,1,-1,[0]] call bis_fnc_param;
							_desertedDistance = [_data,9,-1,[0]] call bis_fnc_param;
							if ({alive _x} count crew _veh == 0 && (_desertedDelay > 0 || _desertedDistance > 0)) then {

								_desertedScript = _veh getvariable "BIS_fnc_moduleRespawnVehicle_desertedScript";
								if !(isnil {_desertedScript}) then {terminate _desertedScript;};

								_desertedScript = [_veh,_desertedDelay,_desertedDistance] spawn {
									scriptname "BIS_fnc_moduleRespawnVehicle_desertedScript";
									_veh = _this select 0;
									_desertedDelay = _this select 1;
									_desertedDistance = _this select 2;
									_time = time + _desertedDelay;
									waituntil {
										sleep 1;
										_safePositions = (playableunits + switchableunits);
										{
											if (_veh in synchronizedobjects _x) then {_safePositions pushback _x;};
										} foreach (entities "modulerespawnposition_f");
										(time > _time && {_x distance _veh < _desertedDistance} count _safePositions == 0)
										||
										!alive _veh
									};

									//--- Respawn only when vehicle is alive (to prevent double respawn if it's destroyed)
									if (alive _veh && {alive _x} count crew _veh == 0) then {
										_veh setvariable ["BIS_fnc_moduleRespawnVehicle_first",true];
										_data = _veh getvariable ["BIS_fnc_moduleRespawnVehicle_data",[]];
										([_veh] + _data) call BIS_fnc_moduleRespawnVehicle;
									};
								};
								_veh setvariable ["BIS_fnc_moduleRespawnVehicle_desertedScript",_desertedScript];
							};
						};
					}
				];
				_veh setvariable ["BIS_fnc_moduleRespawnVehicle_getout",_getout,true];
			};
		};
		if (_forcedRespawn > 0) then {
			_veh setvariable ["BIS_fnc_moduleRespawnVehicle_first",true];
			_data = _veh getvariable ["BIS_fnc_moduleRespawnVehicle_data",[]];
			([_veh] + _data) call BIS_fnc_moduleRespawnVehicle;
		};
	} else {

		//--- Determine side
		private ["_sides","_side"];
		_sides = [east,west,resistance,civilian];
		_side = switch _position do {
			case 3;
			case 4;
			case 5;
			case 6: {_sides select ((_position - 3) max 0 min 3)}; //--- Custom side
			case 7: {side group _killer}; //--- Side of whoever destroyed the vehicle
			default {sideunknown}; //--- Default vehicle side (will be calculated afterwards)
		};
		if !(_side in _sides) then {_side = [_veh,true] call bis_fnc_objectSide;}; //--- Default vehicle side

		//--- Wait
		if !(_first) then {
			_time = time + (_delay max 0.1); //--- Add minimum delay to prevent being damaged from old vehicle explosion
			waituntil {time > _time};
		};
		if (isnull _veh) exitwith {}; //--- Vehicle deleted meanwhile, terminate

		//--- Execute
		private ["_respawnName","_respawnPos","_respawnDir","_respawnPosPrecise"];
		_respawnName = "";
		_respawnPos = getposatl _veh;
		_respawnDir = direction _veh;
		_respawnPosPrecise = false;
		_respawnPositionModules = [];

		//--- Find suitable respawn marker
		private ["_simulation"];
		_simulation = tolower gettext (configfile >> "cfgvehicles" >> typeof _veh >> "simulation");
		if (_position > 0) then {
			private ["_markerTypesAll","_markerTypes","_respawnMarkers"];

			_markerTypesAll = ["respawn_unknown","respawn_motor","respawn_armor","respawn_air","respawn_plane"];
			_markerTypes = switch (_simulation) do {
				case "car";
				case "carx":		{["respawn_unknown","respawn_motor"]};
				case "tank";
				case "tankx":		{["respawn_unknown","respawn_armor"]};
				case "helicopter";
				case "helicopterrtd";
				case "helicopterx":	{["respawn_unknown","respawn_air"]};
				case "airplane";
				case "airplanex":	{["respawn_unknown","respawn_plane"]};
				case "ship";
				case "shipx";
				case "submarinex":	{["respawn_unknown","respawn_naval"]};
				default			{["respawn_unknown"]};
			};

			//--- Find respawn markers
			_respawnMarkers = [];
			if (_position == 8) then {
				//--- Get only synced respawn positions
				{
					if (_veh in synchronizedobjects _x) then {
						_respawnMarkers = _respawnMarkers + (_x getvariable "respawn");
						_respawnPositionModules pushback _x;
					};
				} foreach (entities "modulerespawnposition_f");
			} else {
				//--- Get all markers
				_respawnMarkers = [_side,true] call bis_fnc_getRespawnMarkers;
			};
			{
				_xType = tolower markertype _x;
				if ((_xType in _markerTypesAll) && !(_xType in _markerTypes)) then {_respawnMarkers set [_foreachindex,""];};
			} foreach _respawnMarkers;
			_respawnMarkers = _respawnMarkers - [""];

			if (count _respawnMarkers > 0) then {
				private ["_respawnMarker"];
				_respawnMarker = switch _positionType do {
					case 1: {_respawnMarkers select (count _respawnMarkers - 1)}; //--- Newest
					case 2: {_respawnMarkers select 0}; //--- Oldest
					default {_respawnMarkers call bis_fnc_selectrandom}; //--- Random
				};
				_resnawnName = markertext _respawnMarker;
				_respawnPos = markerpos _respawnMarker;
				_respawnDir = markerdir _respawnMarker;
				if (_respawnDir > 360) then {_respawnDir = _respawnDir / 360;};
			} else {
				if (_position != 1) then {_respawnPos = [];};
			};
		};

		//--- Use starting position (when desired, or when no suitable respawn marker was found and vehicle is not disabled)
		if (_position == 0 || (count _respawnPos == 0 && simulationenabled _veh)) then {
			private ["_respawnStart"];
			_respawnStart = _veh getvariable ["BIS_fnc_moduleRespawnVehicle_pos",[_respawnPos,_respawnDir]];
			_respawnPos = _respawnStart select 0;
			_respawnDir = _respawnStart select 1;
			_respawnPosPrecise = true;
		};

		if (count _respawnPos > 0) then {
			private ["_vehVar","_vehType","_special","_newVeh","_cfgVeh","_displayName","_picture","_dangerClose"];

			_vehVar = _veh call bis_fnc_objectvar;
			_vehType = typeof _veh;

			//--- Get rid of the old vehicle when it's too close to the respawn position (unless it's the death pos)
			if (_position != 1 && _respawnPos distance _veh < (sizeof _vehType) * 0.5) then {
				_veh setpos [10,10,10];
				_veh enablesimulation false;
			};

			//--- Create the new vehicle
			//_respawnPos = _respawnPos findEmptyPosition [0,50,_vehType];
			_special = if ((_respawnPos select 2) > 2) then {"fly"} else {"none"};
			_newVeh = createvehicle [_vehType,_respawnPos,[],sizeof _vehType,_special];
			_newVeh setdir _respawnDir;
			_newVeh setvehiclevarname _vehVar;
			[_newVeh,_vehVar] call bis_fnc_objectvar;

			//--- Use precise starting position
			if (_respawnPosPrecise) then {_newVeh setposatl _respawnPos;};

			//--- Repeat
			if (_respawnCount > 0 && !_first) then {_respawnCount = _respawnCount - 1;};

			//--- Init respawn on the new vehicle
			_newVeh setvariable ["BIS_fnc_moduleRespawnVehicle_first",false,true];
			if (_respawnCount != 0) then {
				_forcedRespawn = 0;
				[_newVeh,_delay,_desertedDelay,_respawnCount,_init,_position,_positionType,_wreck,_showNotification,_forcedRespawn,_desertedDistance] spawn bis_fnc_moduleRespawnVehicle;
			};

			//--- Resynchronize respawn modules
			{
				_x synchronizeobjectsremove [_veh];
				_x synchronizeobjectsadd [_newVeh];
			} foreach _respawnPositionModules;

			//--- Create UAV crew (only when there was any in the original vehicle)
			_curatorAddCrew = false;
			if (getnumber (configfile >> "cfgvehicles" >> typeof _veh >> "isUAV") > 0 && count crew _veh > 0) then {
				createvehiclecrew _newVeh;
				_curatorAddCrew = true;
			};

			//--- Give the vehicle to curator
			{
				_x addcuratoreditableobjects [[_newVeh],_curatorAddCrew];
			} foreach objectcurators _veh;

			//--- Give planes forward velocity (has to be executed after curator registration)
			if (_special == "fly" && _simulation in ["airplane","airplanex"]) then {
				_newVeh setvelocity ([vectordir _newVeh,69] call bis_fnc_vectormultiply);;
			};

			//--- Show notification
			if (_showNotification > 0) then {
				_cfgVeh = configfile >> "cfgvehicles" >> _vehType;
				_displayName = gettext (_cfgVeh >> "displayName");
				_picture = (gettext (_cfgVeh >> "picture")) call bis_fnc_textureVehicleIcon;
				if (_respawnName == "") then {_respawnName = format [localize "str_a3_bis_fnc_respawnmenuposition_grid",mapgridposition (position _newVeh)];}; //--- ToDo: Localize
				[["RespawnVehicle",[_displayName,_respawnName,_picture]],"BIS_fnc_showNotification",_side] call bis_fnc_mp;
			};

			//--- Execute custom init
			_initScript = if (typeName _init == typeName []) then
			{
				([_newVeh,_veh]+(_init select 1)) spawn (_init select 0);
			}
			else
			{
				[_newVeh,_veh] spawn _init;
			};
			[missionnamespace,"respawn",[_newVeh,_veh]] spawn bis_fnc_callscriptedeventhandler;

			//--- Delete the old vehicle
			if (_wreck > 0) then {
				if (simulationenabled _veh) then {
					//--- Delete after init code is finished (in separate thread, so this one can continue)
					[_newVeh,_veh,_wreck,_initScript] spawn {
						_newVeh = _this select 0;
						_veh = _this select 1;
						_wreck = _this select 2;
						_initScript = _this select 3;
						waituntil {scriptdone _initScript};
						if (_wreck == 2) then {
							private ["_boom"];
							_newVeh allowdamage false;
							_boom = createvehicle ["M_AT",position _veh,[],0,"none"];
							_boom setvelocity [0,0,-1];
							sleep 0.5;
							_newVeh allowdamage true;
						};
						deletevehicle _veh;
					};
				} else {
					//--- Delete without any effects
					deletevehicle _veh;
				};
			};
		} else {
			["Vehicle %1 not respawned, %2 side marker is missing.",_veh,_side] call bis_fnc_logFormat;
			if (_first) then {deletevehicle _veh;};
		};
	};
	true
};