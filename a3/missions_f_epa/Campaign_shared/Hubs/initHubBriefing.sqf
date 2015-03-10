scriptName "initHubBriefing.sqf";

/*--------------------------------------------------------------------------------------------------

	3D ANIMATED MISSION BRIEFING

--------------------------------------------------------------------------------------------------*/

#define EH_SKIP			(uiNamespace getVariable "BIS_HubBriefing_ehSkip")
#define EH_SKIP_SET_NIL		uiNamespace setVariable ["BIS_HubBriefing_ehSkip",nil]

//remove the 'KeyDown' event handler (just for sure)
disableSerialization;

waitUntil{!(isNull ([] call BIS_fnc_displayMission))};

if (!(isNil {EH_SKIP})) then
{
	["[HubBriefing][i] The 'KeyDown' event handler 'BIS_HubIntro_ehSkip' successfuly removed!"] call BIS_fnc_logFormat;

	([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown',EH_SKIP];
	EH_SKIP_SET_NIL;
};

BIS_HubBriefing_identities = [];
BIS_HubBriefing_hideAfter = [];
BIS_HubBriefing_showAfter = [];

//[_mission] call BIS_HubBriefing_setupArmory;
BIS_HubBriefing_setupArmory =
{
	private["_mission","_exit","_cfg","_units","_startPoints","_endPoints","_staticPoints","_armorer"];
	private["_fn_sendSoldier","_fn_placeSoldier"];

	//private functions ------------------------------------------------------------------------

	_fn_sendSoldier	=
	{
		private["_unitVar","_start","_end","_unit"];

		_unitVar = _this select 0;
		_start	 = _this select 1;
		_end	 = _this select 2;
		_unit	 = missionnamespace getVariable [_unitVar,objNull];

		//release the unit from ambient animation
		_unit call BIS_fnc_ambientAnim__terminate;

		//repos the unit
		_unit setPosASL getPosASL _start;
		_unit setDir getDir _start;

		//send unit to the exit point
		_unit setUnitPos "UP";
		(group _unit) setBehaviour "CARELESS";
		(group _unit) setCombatMode "BLUE";
		_unit forceWalk true;

		_unit doMove (getPosASL _end);
		_unit moveTo (getPosASL _end);
		(group _unit) move (getPosASL _end);

		[_unit,_exit,_end] spawn
		{
			scriptName "initHubBriefing.sqf: soldier walking from armory";

			private["_unit","_exit","_point","_exitPos","_animset"];

			_unit 	= _this select 0;
			_exit 	= _this select 1;
			_point  = _this select 2;

			waituntil
			{
				sleep 0.05;

				((_unit distance _exit < 10) && (speed _unit < 0.2))
			};

			_exitPos = getPosASL _exit;
			_exitPos set [2, 1.75];

			_unit lookAt _exitPos;
			_unit doWatch _exitPos;

			//set animation
			_animset = _point getVariable ["BIS_UseAnimSet",""];

			if (_animset == "") then
			{
				_animset = "STAND";
				_unit setUnitPos "UP";
			};

			[_unit,_animset,"ASIS",nil,true] call BIS_fnc_ambientAnim;
		};
	};

	_fn_placeSoldier =
	{
		private["_unitVar","_unit","_point","_animset","_group"];

		_unitVar = _this select 0;
		_point 	 = _this select 1;
		_unit	 = missionnamespace getVariable [_unitVar,objNull];

		_unit call BIS_fnc_ambientAnim__terminate;

		//reposition the unit & set direction
		_unit setPosASL getPosASL _point;
		_unit setDir getDir _point;

		//set animation
		_animset = _point getVariable ["BIS_UseAnimSet",""];

		if (_animset == "") then
		{
			_animset = "STAND";
			_unit setUnitPos "UP";
		};

		[_unit,_animset,"ASIS",_point] call BIS_fnc_ambientAnim;
	};

	//input ------------------------------------------------------------------------------------
	_mission 	= [_this,0] call BIS_fnc_param;
	_units 	 	= ([_mission] call BIS_fnc_camp_getCharacters) - ["bis_inf"];
	_cfg 		= [_mission] call BIS_fnc_camp_getMissionDesc;
	_exit		= ["Missions",_mission,"HubBriefing","AssemblePoint","position"] call BIS_fnc_getCfgDataObject;

	/*------------------------------------------------------------------------------------------

		SETUP SOLDIERS WALKING TO ASSEMBLY POINT

	------------------------------------------------------------------------------------------*/

	if (true) then
	{
		private["_unit","_staticUnits","_walkingUnits","_onArmory","_unit"];

		_walkingUnits = [];
		_staticUnits  = [];

		//remove all units not involved in the armory -> assembly point part
		{
			_onArmory = [_cfg,"Characters",_x,"HubPresence","assemble"] call BIS_fnc_getCfgDataBool;

			if (_onArmory) then
			{
				_walkingUnits set [count _walkingUnits, _x];
			}
			else
			{
				_unit = [_x,_mission] call BIS_HubBriefing_getUnit;

				//hide the units
				_unit hideObject true;
				_unit enableSimulation false;
				_unit setPosASL [100,100,0];
			};
		}
		forEach _units;

		if (count _walkingUnits == 0) exitWith {};

		while {(count _walkingUnits > count _staticUnits) && (count _walkingUnits > 1)} do
		{
			_unit = _walkingUnits call BIS_fnc_selectRandom;

			_staticUnits = _staticUnits + [_unit];
			_walkingUnits = _walkingUnits - [_unit];
		};

		//categorize the points

		/*
			50% of the units will be ported and setuped on the exit spot
			remaining units will be placed at _startPoints and send to _endPoints
		*/

		_armorer	= ["Missions",_mission,"HubBriefing","Armory","unitName"] call BIS_fnc_getCfgDataObject;
		_startPoints 	= _armorer nearObjects ["Sign_Arrow_Direction_Blue_F",35];
		_endPoints   	= _exit nearObjects ["Sign_Arrow_Direction_Yellow_F",15];
		_staticPoints	= _exit nearObjects ["Sign_Arrow_Direction_Green_F",15];

		//place static soldiers --------------------------------------------------------------------
		private["_p1","_p2"];

		{
			if !(count _staticPoints > 0) exitwith
			{
				["[HubBriefing] Not enough snappoints for static soldiers @ exit point!"] call BIS_fnc_error;
			};

			//roll 2x, select closer
			_p1 = floor random(count _staticPoints);
			_p2 = floor random(count _staticPoints);
			if (_p2 < _p1) then {_p1 = _p2};

			_point = _staticPoints select _p1;
			_staticPoints = _staticPoints - [_point];

			[_x,_point] call _fn_placeSoldier;
		}
		forEach _staticUnits;


		//send walking soldiers --------------------------------------------------------------------
		private["_p1","_p2","_start","_end"];

		{
			if !(count _startPoints > 0) exitwith
			{
				["[HubBriefing] Not enough startpoints for walking soldiers!"] call BIS_fnc_error;
			};
			if !(count _endPoints > 0) exitwith
			{
				["[HubBriefing] Not enough endpoints for walking soldiers!"] call BIS_fnc_error;
			};

			//startpoint
			_start 	 	= _startPoints call BIS_fnc_selectRandom;
			_startPoints	= _startPoints - [_start];

			//endpoint: roll 2x, select closer
			_p1 = floor random(count _endPoints);
			_p2 = floor random(count _endPoints);
			if (_p2 < _p1) then {_p1 = _p2};

			_end = _endPoints select _p1;
			_endPoints = _endPoints - [_end];

			[_x,_start,_end] call _fn_sendSoldier;
		}
		forEach _walkingUnits;
	};

	/*------------------------------------------------------------------------------------------

		CREATE ARMORY SCENE

	------------------------------------------------------------------------------------------*/
	private["_armorer","_point"];

	_armorer	= ["Missions",_mission,"HubBriefing","Armory","unitName"] call BIS_fnc_getCfgDataObject;
	_point 		= ["Missions",_mission,"HubBriefing","Armory","position"] call BIS_fnc_getCfgDataObject;

	//setup armorer ----------------------------------------------------------------------------
	private["_animset","_script"];

	_animset  = _armorer getVariable ["BIS_fnc_ambientAnim__animset",""];

	if (_animset != "") then
	{
		_armorer call BIS_fnc_ambientAnim__terminate;
	};

	{_armorer disableAI _x} forEach ["AUTOTARGET", "FSM", "MOVE", "TARGET"];
	_armorer switchMove "hubbriefing_loop";

	//setup player -----------------------------------------------------------------------------
	private["_dir","_endPos","_startPos","_animset","_group","_teleportTo","_playerHeight","_triggerHeight"];

	_teleportTo 	= ["Missions",_mission,"HubBriefing","Armory","teleportTo"] call BIS_fnc_getCfgDataBool;

	_dir 	  	= getDir _point;
	_endPos	 	= getPosASL _point;

	private["_useBlackOut","_autoRearm"];

	_useBlackOut 	= ["Missions",_mission,"HubBriefing","Armory","blackOut"] call BIS_fnc_getCfgDataBool;
	_autoRearm 	= ["Missions",_mission,"HubBriefing","Armory","autoRearm"] call BIS_fnc_getCfgDataBool;

	if (_teleportTo) then
	{
		//reposition the unit & set direction
		player setPosASL _endPos;
		player setDir _dir;
	}
	else
	{
		//un-lock player from the spot
		if (primaryWeapon player != "") then
		{
			player playMoveNow "amovpercmstpslowwrfldnon";
		}
		else
		{
			player playMoveNow "amovpercmstpsnonwnondnon";
		};

		//hide cinematic borders
		if (missionNamespace getVariable ["BIS_fnc_cinemaBorder_shown",false]) then {[1,nil,false] spawn BIS_fnc_cinemaBorder;};

		//black in
		["bis_hubbriefing"] call BIS_fnc_blackIn; waitUntil {BIS_fnc_blackIn_completed};
	};
};

//action on the trigger npc
BIS_HubBriefing_setupArmorer =
{
	private ["_armorer","_mission","_label","_distance","_fn_execAutoEquip","_point","_pos","_dir"];

	_mission 	= [_this, 0, BIS_selectedMission, [""]] call BIS_fnc_param;
	_label	 	= localize "STR_A3_RequiredGear_UserAction";
	_distance 	= 5;
	_armorer	= ["Missions",_mission,"HubBriefing","Armory","unitName"] call BIS_fnc_getCfgDataObject;
	_point 		= ["Missions",_mission,"HubBriefing","Armory","position"] call BIS_fnc_getCfgDataObject;
	_dir 	  	= getDir _point;
	_pos	 	= getPosASL _point;

	//ensure there is no delay in showing the action
	(group player) reveal _armorer;

	_fn_execAutoEquip =
	{
		private["_mission","_pos","_dir"];

		_mission = (_this select 3) select 0;
		_pos 	 = (_this select 3) select 1;
		_dir 	 = (_this select 3) select 2;

		["[HubBriefing][i] Auto equip executed!"] call BIS_fnc_logFormat;

		//blackout
		["bis_recommendedgear",true] call BIS_fnc_blackOut; waitUntil {BIS_fnc_blackOut_completed};

		//auto-setup gear on player for next mission
		[_mission,"bis_inf"] call BIS_fnc_camp_setupCharacter;

		sleep 0.1;

		//reposition the unit, set direction & play standing anim
		player setPosASL _pos;
		player setDir _dir;

		if (primaryWeapon player != "") then
		{
			player switchMove "amovpercmstpslowwrfldnon";
		}
		else
		{
			player switchMove "amovpercmstpsnonwnondnon";
		};

		player setUnitPos "UP";

		//update armory composition
		["bis_inf"] call BIS_Armory_visualizePool;

		//black in
		["bis_recommendedgear",true] call BIS_fnc_blackIn;

		//play conversation
		[_mission,"HubBriefing","RecommendedGearApplied"] call BIS_Conversations_play;
	};

	_label = format["<img image='%1' size='1.8'/> <t size='1.2'>%2</t>","\A3\Ui_f\data\IGUI\Cfg\Actions\reammo_ca.paa",_label];

	_armorer addAction
	[
		_label,
		_fn_execAutoEquip,
		[_mission,_pos,_dir],
		10e10,
		true,
		true,
		"",
		format["([%1,%2] call BIS_AiInteraction_isInFrontOf) && !(BIS_FFDetected) && (BIS_SelectedMission == '%3')", _armorer, _distance, _mission]
	];
};

//[_mission,_mode] call BIS_HubBriefing_setupBriefing;
BIS_HubBriefing_setupBriefing =
{
	//init -------------------------------------------------------------------------------------
	private["_cfgMissionDesc","_points","_point","_mission","_mode","_units","_center","_stage"];

	/*
	_mode:
	---------------------------------
	0: fullstart - in time
	1: fullstart - late
	2: quickstart
	3: fullstart - triggered by proximity trigger
	*/

	_mission 	= [_this, 0] call BIS_fnc_param;
	_mode		= [_this, 1] call BIS_fnc_param;
	_units 	 	= [_this, 2] call BIS_fnc_param;
	_cfgMissionDesc = [_this, 3] call BIS_fnc_param;

	_center 	= ["Missions",_mission,"HubBriefing","center"] call BIS_fnc_getCfgDataObject;
	_points 	= _center nearObjects ["Sign_Arrow_Direction_Yellow_F",10];

	_stage		= ["stage"] call BIS_fnc_getCfgData;

	//local functions --------------------------------------------------------------------------
	private["_fn_getSnappoint","_fn_setupUnit"];

	//_snappoint = _point call _fn_getSnappoint;
	_fn_getSnappoint =
	{
		private["_chairs","_chair","_anim"];

		_chairs = (_this nearObjects ["Land_CampingChair_V2_F",0.65]) + (_this nearObjects ["Land_ChairWood_F",0.65]);

		if (count _chairs == 0) exitWith
		{
			_this
		};

		_chair = _chairs select 0;
		_anim = _this getVariable ["BIS_UseAnimSet",""];

		if (_anim != "") then
		{
			_chair setVariable ["BIS_UseAnimSet",_anim];
		}
		else
		{
			_chair setVariable ["BIS_UseAnimSet","SIT1"];
		};

		_chair
	};

	//[_unitVar,_point] call _fn_setupUnit;
	_fn_setupUnit =
	{
		private["_unitVar","_unit","_point","_animset","_group","_identity","_xIdentity","_class","_squadMemberVars"];

		//["[HubBriefing] Function '_fn_setupUnit' called with: %1",_this] call BIS_fnc_logFormat;

		_unitVar  = _this select 0;		//empty string used for dummy soldiers
		_point 	  = _this select 1;
		_unit	  = missionnamespace getVariable [_unitVar,objNull];

		_identity = [_cfgMissionDesc,"Characters",_unitVar,"identity"] call BIS_fnc_getCfgData;

		if (isNil "_identity") then
		{
			_identity = _unit getVariable ["BIS_identity",""];
		};

		_identity = toLower _identity;

		if (isNull _unit && _identity != "" && _unitVar != "") then
		{
			{
				_xIdentity = toLower (_x getVariable ["BIS_identity",""]);

				if (_xIdentity == _identity) exitWith
				{
					_unit = _x;
				};
			}
			forEach allUnits;
		};

		if (_identity in BIS_HubBriefing_identities) exitWith
		{
			//["[HubBriefing][!] Unit cannot be setuped, it's identity is already used on the scene!"] call BIS_fnc_logFormat;

			missionnamespace setVariable [_unitVar,_unit];

			objNull
		};

		_squadMemberVars =
		[
			"BIS_squadMember1",
			"BIS_squadMember2",
			"BIS_squadMember3",
			"BIS_squadMember4",
			"BIS_squadMember5",
			"BIS_squadMember6",
			"BIS_squadMember7",
			"BIS_squadMember8",
			"BIS_squadMember9",
			"BIS_squadMember10"
		];

		if ({_x == vehicleVarName _unit} count _squadMemberVars > 0) then
		{
			["[HubBriefing][i] Deleting unit: _unitVar = %1 | _unit = %3 | _identity = %2",_unitVar,_identity,_unit] call BIS_fnc_logFormat;

			deleteVehicle _unit; waitUntil{isNull _unit};
		};

		//create unit if it doesn't exist
		if (isNull _unit) then
		{
			private["_classes"];

			_classes = if (_stage == "A") then
			{
			[
				"B_Soldier_F",
				"B_Soldier_F",
				"B_Soldier_F",
				"B_Crew_F",
				"B_Recon_F",
				"B_Soldier_AR_F",
				"B_officer_F"
			];
			}
			else
			{
			[
				"B_G_Soldier_F",
				"B_G_Soldier_lite_F",
				"B_G_Soldier_GL_F",
				"B_G_Soldier_M_F",
				"B_G_Soldier_AR_F",
				"B_G_Soldier_F",
				"B_G_Soldier_F"
			];
			};

			_class  = _classes call BIS_fnc_selectRandom;

			_group 	= createGroup west;
			_unit 	= _group createUnit [_class,getPos _point,[],0,"NONE"];

			if (_identity != "") then
			{
				[_unit,_identity] call BIS_fnc_camp_setIdentity;
			};

			//["[HubBriefing] New unit created for briefing: _unitVar = %1 | _unit = %3 | _identity = %2",_unitVar,_identity,_unit] call BIS_fnc_logFormat;
		}
		else
		{
			//["[HubBriefing] Existing unit re-positioned for briefing: _unitVar = %1 | _unit = %3 | _identity = %2",_unitVar,_identity,_unit] call BIS_fnc_logFormat;

			//make sure unit is not looped or attached by BIS_fnc_ambientAnim;
			_unit call BIS_fnc_ambientAnim__terminate;
		};

		//store identity of created unit
		if (_identity != "") then
		{
			BIS_HubBriefing_identities set [count BIS_HubBriefing_identities, _identity];
		};

		//store dummy soldiers, so they can be deleted afterwards
		if (_unitVar == "") then
		{
			BIS_HubBriefing_hideAfter set [count BIS_HubBriefing_hideAfter, _unit];
		}
		else
		{
			//["[HubBriefing] Storing unit to gvar: _unitVar = %1 | _unit = %3 | _identity = %2",_unitVar,_identity,_unit] call BIS_fnc_logFormat;

			//store unit under gvar
			missionnamespace setVariable [_unitVar,_unit];
		};

		//waitUntil{isNull(_unit getVariable ["BIS_fnc_ambientAnim__logic",objNull])};

		//remove unwanted items
		_unit unassignItem "NVGoggles"; removeAllItems _unit;

		//check if should snap to object instead
		_point = _point call _fn_getSnappoint;

		//reposition the unit & set direction
		_unit setPosASL getPosASL _point;
		_unit setDir getDir _point;
		_unit enableSimulation true;

		//set animation
		_animset = _point getVariable ["BIS_UseAnimSet",""];

		if (_animset == "") then
		{
			if ((_point isKindOf "Land_CampingChair_V2_F") || (_point isKindOf "Land_ChairWood_F")) then
			{
				_animset = ["SIT1","SIT2","SIT3"] call BIS_fnc_selectRandom;
				_unit setUnitPos "Middle";
			}
			else
			{
				_animset = "STAND";
				_unit setUnitPos "UP";
			};
		};

		[_unit,_animset,"ASIS",_point] call BIS_fnc_ambientAnim;

		_unit
	};

	//set time ---------------------------------------------------------------------------------
	private["_offsetBriefing","_offsetTravel","_dateOp","_dateBriefing","_weather","_skipTimeAllowed"];

	//destroy the briefing timer
	if !(isNil "BIS_fnc_camp_loadMissionIntel_timerHandle") then
	{
		if !(scriptDone BIS_fnc_camp_loadMissionIntel_timerHandle) then
		{
			terminate BIS_fnc_camp_loadMissionIntel_timerHandle;
		};
	};

	_offsetBriefing	 = 15;
	_offsetTravel	 = (([BIS_PER_phase] call BIS_fnc_camp_getTimelinePhaseTravelTimes) select 0) * 60;

	_dateOp		 = [BIS_PER_phase] call BIS_fnc_camp_getTimelinePhaseDate;
	_dateBriefing	 = [_dateOp,[0,0,0,0,-_offsetBriefing-_offsetTravel]] call BIS_fnc_vectorAdd;
	_weather 	 = [BIS_PER_phase] call BIS_fnc_camp_getTimelinePhaseWeather;
	_skipTimeAllowed = ["Missions",_mission,"HubBriefing","skipTime"] call BIS_fnc_getCfgDataBool;

	if (_skipTimeAllowed) then
	{
		[_dateBriefing,_weather,false,false] spawn BIS_fnc_camp_setTimeWeather;
	};

	[] spawn
	{
		scriptName "initHubBriefing.sqf: force off rain loop";

		while {true} do
		{
			sleep 0.1;
			0 setRain 0;
		};
	};

	//create vehicles on the assemble point ----------------------------------------------------
	private["_point","_class","_vehicle"];

	{
		_class = ["Missions",_mission,"HubBriefing","AssemblePoint",_x,"vehicleClass"] call BIS_fnc_getCfgData;

		if (_class != "") then
		{
			_point   = ["Missions",_mission,"HubBriefing","AssemblePoint",_x,"position"] call BIS_fnc_getCfgDataObject;
			_vehicle = createVehicle [_class, getPos _point, [], 0, "NONE"];
			_vehicle setPosASL getPosASL _point;
			_vehicle setDir getDir _point;
			_vehicle lock 3;
		};
	}
	forEach ["Vehicle1","Vehicle2","Vehicle3"];

	//update whiteboard ------------------------------------------------------------------------
	private["_board","_path"];

	_board 	= ["Missions",_mission,"HubBriefing","Whiteboard","object"] call BIS_fnc_getCfgDataObject;
	_path 	= ["Missions",_mission,"HubBriefing","Whiteboard","texture"] call BIS_fnc_getCfgData;

	if (_path != "") then
	{
		_board setObjectTexture [0, _path];
	};

	//setup speaker ----------------------------------------------------------------------------
	private["_speaker","_animset","_point"];

	_speaker = ["Missions",_mission,"HubBriefing","SpecialCharacters","Speaker","unitName"] call BIS_fnc_getCfgDataObject;
	_point   = ["Missions",_mission,"HubBriefing","SpecialCharacters","Speaker","position"] call BIS_fnc_getCfgDataObject;

	if (BIS_DebugMode && BIS_ShowHelpers) then
	{
		_point hideObject false;
	};

	_animset = _speaker getVariable ["BIS_fnc_ambientAnim__animset",""];

	if (_animset != "") then
	{
		_speaker call BIS_fnc_ambientAnim__terminate;
	};

	{_speaker disableAI _x} forEach ["AUTOTARGET", "FSM", "MOVE", "TARGET", "ANIM"];

	_speaker setPosASL getPosASL _point;
	_speaker setDir getDir _point;

	//setup special characters -----------------------------------------------------------------
	private["_unitVar","_point","_unit"];

	{
		_unitVar = ["Missions",_mission,"HubBriefing","SpecialCharacters",_x,"unitName"] call BIS_fnc_getCfgData;

		if (_unitVar != "") then
		{
			_point  = ["Missions",_mission,"HubBriefing","SpecialCharacters",_x,"position"] call BIS_fnc_getCfgDataObject;

			_unit = [_unitVar,_point] call _fn_setupUnit;

			//spot was not used, make it available for squad members
			if ((isNull _unit) && (_x != "HotSeat")) then
			{
				_points set [count _points, _point];
			};
		};
	}
	forEach ["HotSeat","VIP1","VIP2","VIP3"];

	//setup soldiers ---------------------------------------------------------------------------
	private["_xtraCount","_xtraClasses"];

	_xtraCount 	= ["Missions",_mission,"HubBriefing","XtraCharacters","count"] call BIS_fnc_getCfgData;
	_xtraClasses	= ["Missions",_mission,"HubBriefing","XtraCharacters","classes"] call BIS_fnc_getCfgData;

	for "_i" from 0 to (_xtraCount - 1) do
	{
		if (_i < count _xtraClasses) then
		{
			_units set [count _units,_xtraClasses select _i];
		}
		else
		{
			_units set [count _units,""];
		};
	};

	//hide units that should not be slacking around
	{
		if (_x getVariable ["BIS_noBriefing",false]) then
		{
			BIS_HubBriefing_showAfter set [count BIS_HubBriefing_showAfter, _x];
		};
	}
	forEach (allMissionObjects "Man");

	//reorganize snappoints according to the distance from the briefing center
	_points = [_points,[_center],{_input0 distance _x},"ASCEND"] call BIS_fnc_sortBy;

	private["_p1","_p2"];

	{
		if !(count _points > 0) exitwith
		{
			["[HubBriefing] Not enough snappoints for squad members!"] call BIS_fnc_error;
		};

		//roll 2x, select closer
		_p1 = floor random(count _points);
		_p2 = floor random(count _points);
		if (_p2 < _p1) then {_p1 = _p2};

		_point = _points select _p1;
		_points = _points - [_point];

		[_x,_point] call _fn_setupUnit;
	}
	forEach _units;

	//setup player -----------------------------------------------------------------------------
	private["_point","_dir","_startPos","_endPos","_walkDistanceShort","_walkDistanceLong"];

	//turn off nvgoggles
	player action ["nvGogglesOff", player];

	_point	  = ["Missions",_mission,"HubBriefing","Player","position"] call BIS_fnc_getCfgDataObject;
	_dir 	  = getDir _point;
	_endPos	  = getPosASL _point;

	if (_mode == 2 || _mode == 3) then
	{
		//reposition the unit & set direction
		player setPosASL _endPos;
		player setDir _dir;

		if (primaryWeapon player != "") then {player playMoveNow "HubSpectator_stand"} else {player playMoveNow "HubSpectator_standU"};
	}
	else
	{
		_walkDistanceShort = ["Hubs",missionName,"HubBriefing","walkDistanceShort"] call BIS_fnc_getCfgData;
		_walkDistanceLong  = ["Hubs",missionName,"HubBriefing","walkDistanceLong"] call BIS_fnc_getCfgData;

		if (_mode == 1) then
		{
			_startPos = [getPosASL _point, _walkDistanceLong, _dir - 180] call BIS_fnc_relPos;
		}
		else
		{
			_startPos = [getPosASL _point, _walkDistanceShort, _dir - 180] call BIS_fnc_relPos;
		};

		[_startPos,_dir,_endPos] spawn
		{
			waitUntil {BIS_fnc_blackIn_fading};

			scriptName "initHubBriefing.sqf: player briefing walk in";

			//reposition the unit & set direction
			player setPosASL (_this select 0);
			player setDir (_this select 1);

			//set animation
			if (primaryWeapon player != "") then {player switchMove "HubSpectator_walk"} else {player switchMove "HubSpectator_walkU"};

			waituntil
			{
				((getPosASL player) distance (_this select 2) < 0.75) || !(animationState player == "HubSpectator_walk" || animationState player == "HubSpectator_walkU")
			};

			switch (toLower(animationState player)) do
			{
				case "hubspectator_walk":
				{
					player playMoveNow "HubSpectator_stand";
				};
				case "hubspectator_walku":
				{
					player playMoveNow "HubSpectator_standU";
				};
				default
				{
				};
			};
		};
	};

};

//_unit = ["bis_attacklead","a_m05"] call BIS_HubBriefing_getUnit;
BIS_HubBriefing_getUnit =
{
	private["_unitVar","_unit","_mission"];

	_unitVar = [_this, 0] call BIS_fnc_param;
	_mission = [_this, 1, missionName] call BIS_fnc_param;

	if (typeName _unitVar == typeName "") then
	{
		_unit = missionNamespace getVariable [_unitVar,objNull];

		if (isNull _unit) then
		{
			private["_class","_side","_group","_cfg"];

			_cfg 	 = [_mission] call BIS_fnc_camp_getMissionDesc;
			_cfg 	 = _cfg >> "Characters" >> _unitVar;

			_class  = [_cfg,"appearance"] call BIS_fnc_getCfgData;;
			_side 	= getNumber(configfile >> "cfgVehicles" >> _class >> "side");
			_side 	= [east,west,resistance,civilian] select _side;

			_group 	= createGroup _side;
			_unit 	= _group createUnit [_class,[120,120,0],[],0,"NONE"];

			missionNamespace setVariable [_unitVar,_unit];
			_unit setVehicleVarName _unitVar;
		};
	}
	else
	{
		_unit = _unitVar;
	};

	_unit
};

BIS_HubBriefing_play =
{
	scriptName "initHubBriefing.sqf: play";

	private["_mission","_timeout","_prefix","_timekeys","_topic","_offset","_sentenceToPlay","_index","_actor","_bikb","_animation","_lastSentence","_weapon","_point"];

	_mission	= _this select 0;

	_actor 		= ["Missions",_mission,"HubBriefing","Cutscene","actor"] call BIS_fnc_getCfgDataObject;
	_weapon		= ["Missions",_mission,"HubBriefing","Cutscene","weapon"] call BIS_fnc_getCfgData;
	_prefix 	= ["Missions",_mission,"HubBriefing","Cutscene","prefix"] call BIS_fnc_getCfgData;
	_timekeys 	= ["Missions",_mission,"HubBriefing","Cutscene","timekeys"] call BIS_fnc_getCfgData;
	_topic 		= ["Missions",_mission,"HubBriefing","Cutscene","topic"] call BIS_fnc_getCfgData;
	_bikb 		= ["Missions",_mission,"HubBriefing","Cutscene","bikb"] call BIS_fnc_getCfgData;
	_offset		= ["Missions",_mission,"HubBriefing","Cutscene","offset"] call BIS_fnc_getCfgData;
	_animation	= ["Missions",_mission,"HubBriefing","Cutscene","anim"] call BIS_fnc_getCfgData;
	_lastSentence	= ["Missions",_mission,"HubBriefing","Cutscene","last"] call BIS_fnc_getCfgData;
	_point		= ["Missions",_mission,"HubBriefing","SpecialCharacters","Speaker","position"] call BIS_fnc_getCfgDataObject;

	if !(alive _actor && canMove _actor) exitWith {};

	//used to timeout from cutscene when the cutscene is not implemented yet
	_timeout	= ["Missions",_mission,"HubBriefing","Cutscene","timeout"] call BIS_fnc_getCfgData;

	if (_timeout > 0) then
	{
		_timeout spawn
		{
			scriptName "initHubBriefing.sqf: briefing time out safecheck";

			sleep _this;

			BIS_HubBriefing_skip = true;
		};
	};

	removeAllWeapons _actor;

	if (_weapon != "") then
	{
		_actor addWeapon _weapon;
	};

	//disable mimics on the briefing actor
	_actor enableMimics false;

	_sentenceToPlay = "";

	detach _actor;
	_actor kbAddTopic [_topic,_bikb,""];

	BIS_HubBriefing_play_spawned = [];

	/*
	["[ ] _actor = %1",_actor] call BIS_fnc_logFormat;
	["[ ] _prefix = %1",_prefix] call BIS_fnc_logFormat;
	["[ ] _topic = %1",_topic] call BIS_fnc_logFormat;
	["[ ] _bikb = %1",_bikb] call BIS_fnc_logFormat;
	["[ ] _timekeys = %1",_timekeys] call BIS_fnc_logFormat;
	["[ ] _animation = %1",_animation] call BIS_fnc_logFormat;
	*/

	_index = 0;
	{
		 if (BIS_HubBriefing_skip) exitWith {};

		 _sentenceToPlay = call compile format ["'%1%2'",_prefix,_index];

		 BIS_HubBriefing_play_spawned set
		 [count BIS_HubBriefing_play_spawned,
		 	[_x,_sentenceToPlay,_index,_topic,_offset,_actor] spawn
			{
				scriptName "initHubBriefing.sqf: cutscene playback";

				private ["_t","_timekey","_index","_offset","_sentenceToPlay","_topic","_actor"];

				_timekey 	= _this select 0;
				_sentenceToPlay = _this select 1;
				_index 		= _this select 2;
				_topic  	= _this select 3;
				_offset 	= _this select 4;
				_actor 		= _this select 5;
				_t = time;

				if !(alive _actor && canMove _actor) exitWith {};

				waitUntil
				{
					(time >= (_t + _timekey + _offset)) || (BIS_HubBriefing_skip)
				};

				if (BIS_HubBriefing_skip) exitWith {};

				_actor kbTell [_actor,_topic,_sentenceToPlay];

				waitUntil
				{
					(_actor kbWasSaid [_actor,_topic,_sentenceToPlay,60]) || (BIS_HubBriefing_skip)
				};
			}
		];

		 _index = _index + 1;
	}
	forEach _timekeys;

	_actor setPosASL getPosASL _point;
	_actor setDir getDir _point;

	_actor switchMove _animation;

	waitUntil
	{
		if (BIS_HubBriefing_skip) exitWith {};

		sleep 0.1;

		(({scriptDone _x} count BIS_HubBriefing_play_spawned) == (count BIS_HubBriefing_play_spawned) - 1);
	};

	sleep _lastSentence;

	//re-enable mimics on the briefing actor
	_actor enableMimics true;
};

//[_mission] call BIS_HubBriefing_getRequiredGearText;
BIS_HubBriefing_getRequiredGearText =
{
	private["_mission","_unit","_requiredGear","_forHint"];

	_mission = [_this,0,BIS_selectedMission] call BIS_fnc_param;
	_unit	 = [_this,1,"bis_inf",[[],""]] call BIS_fnc_param;
	_forHint = [_this,2,true,[true]] call BIS_fnc_param;

	if (typeName _unit == typeName objNull) then
	{
		_unit = vehicleVarName _unit;
	};

	_requiredGear = [_mission,"bis_inf",true] call BIS_fnc_camp_getRequiredGear;

	private["_requiredText"];

	if (_forHint) then
	{
		_requiredText = "";
	}
	else
	{
		_requiredText = "<br/><br/>" + (localize "STR_A3_RequiredGear_ListTitle");
	};

	private["_displayName","_iconPath","_type","_class","_addCount","_requiredCount","_checkbox"];

	{
		if (true) then
		{
			_type	     	= [_x, 0, "", [""]] call bis_fnc_param;
			_class	     	= [_x, 1, "", [""]] call bis_fnc_param;
			_addCount    	= [_x, 2, 1, [123]] call bis_fnc_param;
			_requiredCount  = [_x, 4, 1, [123]] call bis_fnc_param;
			_displayName 	= [_x, 5, "", [""]] call bis_fnc_param;
			_iconPath    	= [_x, 6, "", [""]] call bis_fnc_param;

			if (_addCount > 0) then
			{
				_checkbox = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
			}
			else
			{
				_checkbox = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
			};

			if (_displayName == "") exitWith {};

			if (_requiredCount > 1) then
			{
				if (_forHint) then
				{
					_requiredText = _requiredText + format["<br/><img width='12' height='12' color='#ffffff' image='%4'/> %2 (%1x)",_requiredCount,_displayName,_iconPath,_checkbox];
				}
				else
				{
					_requiredText = _requiredText + format["<br/><img width='12' height='12' color='#ffffff' image='%4'/> %2 (%1x)",_requiredCount,_displayName,_iconPath,_checkbox];
				};
			}
			else
			{
				if (_forHint) then
				{
					_requiredText = _requiredText + format["<br/><img width='12' height='12' color='#ffffff' image='%4'/> %2",_requiredCount,_displayName,_iconPath,_checkbox];
				}
				else
				{
					_requiredText = _requiredText + format["<br/><img width='12' height='12' color='#ffffff' image='%4'/> %2",_requiredCount,_displayName,"%2",_checkbox];
				};
			};
		};
	}
	forEach _requiredGear;

	_requiredText
};

//[] call BIS_HubBriefing_isNearArmory;
BIS_HubBriefing_isNearArmory =
{
	private["_mission","_triggerLong","_return","_playerPos","_armoryPos","_playerHeight","_armoryHeight","_heightDelta","_armoryPoint"];

	_mission  	= [_this,0,BIS_selectedMission] call BIS_fnc_param;
	_triggerLong 	= ["Missions",_mission,"HubBriefing","Armory","triggerLong"] call BIS_fnc_getCfgData;
	_heightDelta 	= ["Missions",_mission,"HubBriefing","Armory","triggerHeightDelta"] call BIS_fnc_getCfgData;

	_armoryPoint	= ["Missions",_mission,"HubBriefing","Armory","position"] call BIS_fnc_getCfgDataObject;
	_armoryPos	= getPosASL _armoryPoint;
	_armoryHeight	= _armoryPos select 2;

	_playerPos	= getPosASL player;
	_playerHeight	= _playerPos select 2;

	if ((_playerPos distance _armoryPos < _triggerLong) && (abs(_playerHeight - _armoryHeight) < _heightDelta)) then
	{
		_return = true;
	}
	else
	{
		_return = false;
	};

	_return
};

//[] call BIS_HubBriefing_isAtArmory;
BIS_HubBriefing_isAtArmory =
{
	private["_mission","_triggerClose","_return","_playerPos","_armoryPos","_playerHeight","_armoryHeight","_heightDelta","_armoryPoint"];

	_mission  	= [_this,0,BIS_selectedMission] call BIS_fnc_param;
	_triggerClose 	= ["Missions",_mission,"HubBriefing","Armory","triggerClose"] call BIS_fnc_getCfgData;
	_heightDelta 	= ["Missions",_mission,"HubBriefing","Armory","triggerHeightDelta"] call BIS_fnc_getCfgData;

	_armoryPoint	= ["Missions",_mission,"HubBriefing","Armory","position"] call BIS_fnc_getCfgDataObject;
	_armoryPos	= getPosASL _armoryPoint;
	_armoryHeight	= _armoryPos select 2;

	_playerPos	= getPosASL player;
	_playerHeight	= _playerPos select 2;

	if ((_playerPos distance _armoryPos < _triggerClose) && (abs(_playerHeight - _armoryHeight) < _heightDelta)) then
	{
		_return = true;
	}
	else
	{
		_return = false;
	};

	_return
};

//[_mission,_mode] spawn BIS_HubBriefing_exec;
BIS_HubBriefing_exec =
{
	BIS_HubBriefing_executed = true;

	if (BIS_FFDetected) exitWith {};

	disableSerialization;

	/*
	_mode:
	---------------------------------
	0: fullstart - in time
	1: fullstart - late
	2: quickstart
	3: fullstart - triggered by proximity trigger
	*/

	private["_mission","_mode","_cfgMissionDesc","_units"];

	_mission 	= [_this,0,BIS_selectedMission] call BIS_fnc_param;
	_mode	 	= [_this,1,0,[123]] call BIS_fnc_param;
	_cfgMissionDesc = [_mission] call BIS_fnc_camp_getMissionDesc;
	_units 	 	= [_mission] call BIS_fnc_camp_getCharacters;

	/*------------------------------------------------------------------------------------------

		BRIEFING CODE

	------------------------------------------------------------------------------------------*/
	if !(BIS_skipBriefingCutscene) then
	{
		private ["_speaker","_onBriefing","_unitsBriefing","_skipTimeAllowed"];

		_unitsBriefing	=+ _units - ["bis_inf"];
		_speaker 	= ["Missions",_mission,"HubBriefing","SpecialCharacters","Speaker","unitName"] call BIS_fnc_getCfgDataObject;

		//black out & wait
		if (_mode == 2) then
		{
			["bis_hubbriefing",false] call BIS_fnc_blackOut;	//instant blackOut
		}
		//smooth blackout
		else
		{
			["bis_hubbriefing",true] call BIS_fnc_blackOut;		//smooth blackOut
		};

		//pause ambient conversations
		BIS_fnc_camp_ambientTalk__paused = true;

		//filter out units that are not tagged for briefing ----------------------------------------
		{
			_onBriefing = [_cfgMissionDesc,"Characters",_x,"HubPresence","briefing"] call BIS_fnc_getCfgDataBool;

			if (_onBriefing) then
			{
				_unitsBriefing set [_forEachIndex,toLower _x];
			}
			else
			{
				_unitsBriefing set [_forEachIndex,""];
			};
		}
		forEach _unitsBriefing; _unitsBriefing = _unitsBriefing - [""];

		//add skip mechanics -----------------------------------------------------------------------
		BIS_HubBriefing_skip = false;

		private["_ehSkip"];

		_ehSkip = ([] call BIS_fnc_displayMission) displayAddEventHandler
		[
			"KeyDown",
			"
				if (_this select 1 == 57) then
				{
					if (BIS_HubBriefing_skip) exitWith {};

					playSound ['click',true];

					BIS_HubBriefing_skip = true;
				};

				if !((_this select 1) in (actionKeys 'PersonView' + [1])) then {true};
			"
		];

		uiNamespace setVariable ["BIS_HubBriefing_ehSkip",_ehSkip];

		waitUntil{BIS_fnc_blackOut_completed};

		//setup 3d scene ---------------------------------------------------------------------------
		[_mission,_mode,_unitsBriefing,_cfgMissionDesc] call BIS_HubBriefing_setupBriefing;

		//toggle light setup & sunglasses hiding/unhiding
		BIS_DayTime_forceUpdate = true;

		//instantly create cinematic borders
		if !(missionNamespace getVariable ["BIS_fnc_cinemaBorder_shown",false]) then {[0,0,false] call BIS_fnc_cinemaBorder;};

		if !(BIS_HubBriefing_skip) then
		{
			_skipTimeAllowed = ["Missions",_mission,"HubBriefing","skipTime"] call BIS_fnc_getCfgDataBool;

			if (_skipTimeAllowed) then
			{
				[getPosASL player,date,"","auto"] spawn BIS_fnc_camp_showOSD;
			};

			//start cutscene -------------------------------------------------------------------
			private["_script"];

			_script = [_mission] spawn BIS_HubBriefing_play;

			//black in & wait
			["bis_hubbriefing"] call BIS_fnc_blackIn; waitUntil{BIS_fnc_blackIn_completed};

			waitUntil {scriptDone _script || BIS_HubBriefing_skip};

			//black out & wait
			["bis_hubbriefing"] call BIS_fnc_blackOut; waitUntil{BIS_fnc_blackOut_completed};
		};

		//remove the 'KeyDown' event handler
		if (!(isNil {EH_SKIP})) then
		{
			([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown',EH_SKIP];
			uiNamespace setVariable ["BIS_HubBriefing_ehSkip",nil];
		};

		//repos & reset briefing speaker -----------------------------------------------------------
		if (true) then
		{
			[_speaker,"BRIEFING","ASIS"] call BIS_fnc_ambientAnim;
		};

		//hide units that were there only for briefing ---------------------------------------------
		{
			_x call BIS_fnc_ambientAnim__terminate;

			_x hideObject true;
			_x enableSimulation false;
			_x setPosASL [2800,1769,0];
		}
		forEach BIS_HubBriefing_hideAfter;

		//un-hide units that were hidden only for briefing -----------------------------------------
		{
			_x hideObject false;
			_x enableSimulation true;
		}
		forEach BIS_HubBriefing_showAfter;

	};

	BIS_HubBriefing_finished = true;

	/*------------------------------------------------------------------------------------------

		END MISSION IF STARTED VIA QUICK START OR BEING LATE ON BRIEFING

	------------------------------------------------------------------------------------------*/
	if !(_mode == 0 || _mode == 3) exitWith
	{
		//setup gear on all units
		{
			[_mission,_x] call BIS_fnc_camp_setupCharacter;
		}
		forEach _units;

		//end mission
		["[HubBriefing] Exiting hub with ending: '%1'!",_mission] call BIS_fnc_logFormat;

		[_mission,true,2] call BIS_fnc_endMission;
	};

	/*------------------------------------------------------------------------------------------

		ARMORY SETUP

	------------------------------------------------------------------------------------------*/

	//setup gear on all units, but player, for next mission
	{
		[_mission,_x] call BIS_fnc_camp_setupCharacter;
	}
	forEach (_units - ["bis_inf"]);

	//update armory composition wpn holder items ---------------------------------------
	private["_xAdjustArmory","_unitsArmory"];

	_unitsArmory = [];

	{
		_xAdjustArmory 	= [_cfgMissionDesc,"Characters",_x,"adjustArmory"] call BIS_fnc_getCfgDataBool;

		if (_xAdjustArmory) then
		{
			_unitsArmory set [count _unitsArmory,_x];
		};
	}
	forEach _units;

	//add player's required gear into pool
	private["_requiredGear","_have","_need","_requiredGearAdded"];

	_requiredGear = [_mission,"bis_inf",true] call BIS_fnc_camp_getRequiredGear;
	_requiredGearAdded = false;

	{
		_have = _x call BIS_fnc_camp_poolCount;
		_need = [_x, 2, 1, [123]] call bis_fnc_param;

		if (_need > _have) then
		{
			_x set [2,_need - _have];
			_x call BIS_fnc_camp_poolAdd;

			_requiredGearAdded = true;
		};
	}
	forEach _requiredGear;

	if (count _unitsArmory > 0 || _requiredGearAdded) then
	{
		_unitsArmory call BIS_Armory_visualizePool;
	};

	//setup the scene ------------------------------------------------------------------
	private ["_onAssemble","_unitsAssemble"];

	[_mission] call BIS_HubBriefing_setupArmory;

	/*------------------------------------------------------------------------------------------

		ASSEMBLE NOTIFICATIONS & AMBIENT CONVERSATIONS

	------------------------------------------------------------------------------------------*/
	//un-pause ambient conversations
	[] spawn
	{
		sleep 10;

		BIS_fnc_camp_ambientTalk__paused = false;
	};

	BIS_HubBriefing_timeOver = false;

	[] spawn
	{
		private["_t1","_t2"];

		sleep 20;

		_t1 = time + 7*60;
		_t2 = time + 10*60;

		//show notification: player has 10 mins to gear up
		["ExfilNotification",["0","10"]] call BIS_fnc_showNotification;

		waitUntil
		{
			sleep 1;

			(time > _t1)
		};

		//show notification: player has 3 mins to gear up
		["ExfilNotification",["0","03"]] call BIS_fnc_showNotification;

		waitUntil
		{
			sleep 1;

			(time > _t2)
		};

		BIS_HubBriefing_timeOver = true;
	};

	/*------------------------------------------------------------------------------------------

		SETUP NAVIGATION: ARMORY & ASSEMBLE POINT

	------------------------------------------------------------------------------------------*/
	BIS_HubBriefing_autoRearmed = false;
	BIS_HubBriefing_canAssemble = false;

	[_mission] spawn
	{
		private["_mission"];

		_mission = _this select 0;

		private["_taskArmoryTitle","_taskArmoryDesc","_taskArmoryMrk","_taskAssembleTitle","_taskAssembleDesc","_taskAssembleMrk"];
		private["_autoRearm","_requiredGear","_location","_locationPrev","_armoryPoint","_assemblyPoint","_requiredGearUnfiltered"];

		_location 	= "";
		_locationPrev 	= "";

		_autoRearm 	= ["Missions",_mission,"HubBriefing","Armory","autoRearm"] call BIS_fnc_getCfgDataBool;
		_armoryPoint	= ["Missions",_mission,"HubBriefing","Armory","position"] call BIS_fnc_getCfgDataObject;
		_assemblyPoint	= ["Missions",_mission,"HubBriefing","AssemblePoint","position"] call BIS_fnc_getCfgDataObject;

		private["_playerPos","_armoryPos","_assemblyPos","_playerHeight","_armoryHeight","_assemblyHeight"];

		_armoryPos	= getPosASL _armoryPoint;
		_armoryHeight	= _armoryPos select 2;
		_assemblyPos	= getPosASL _assemblyPoint;
		_assemblyHeight = _assemblyPos select 2;

		_requiredGearUnfiltered = [_mission,"bis_inf",true] call BIS_fnc_camp_getRequiredGear;

		private["_requiredGearTextHintCurrent","_requiredGearTextHintPrev","_shownHint","_requiredGearTextTaskCurrent","_requiredGearTextTaskPrev"];

		_requiredGearTextHintCurrent = "";
		_requiredGearTextHintPrev    = "";
		_requiredGearTextTaskCurrent = "";
		_requiredGearTextTaskPrev    = "";

		while {(!BIS_HubBriefing_timeOver)} do
		{
			if (!BIS_HubBriefing_timeOver) then
			{
				sleep 1;

				_playerPos	= getPosASL player;
				_playerHeight	= _playerPos select 2;

				if (BIS_HubBriefing_autoRearmed) then {_autoRearm = false;};

				_requiredGear = [_mission,"bis_inf"] call BIS_fnc_camp_getRequiredGear;

				if (_autoRearm || count _requiredGear > 0) then
				{
					_location = "ARMORY";
				}
				else
				{
					_location = "ASSEMBLE_POINT";
				};

				//update required gear text continuously
				if (count _requiredGearUnfiltered > 0) then
				{
					_requiredGearTextTaskCurrent = [_mission,"bis_inf",false] call BIS_HubBriefing_getRequiredGearText;
					_requiredGearTextHintCurrent = [_mission,"bis_inf",true] call BIS_HubBriefing_getRequiredGearText;

					//update task if something changes
					if (_requiredGearTextTaskCurrent != _requiredGearTextTaskPrev) then
					{
						if ((player call BIS_fnc_taskCurrent) != "BIS_GoArmory") exitWith {};

						["BIS_GoArmory",[_taskArmoryDesc + _requiredGearTextTaskCurrent,_taskArmoryTitle,_taskArmoryMrk]] call BIS_fnc_taskSetDescription;

						_requiredGearTextTaskPrev = _requiredGearTextTaskCurrent;
					};

					//show hint only @ armory
					if ([] call BIS_HubBriefing_isNearArmory) then
					{
						_shownHint = missionNamespace getVariable ["BIS_fnc_advHint_state",[]];
						_shownHint = [_shownHint, 0, "", [""]] call bis_fnc_param;

						//update only opened hint
						if (_shownHint != "RequiredGear") exitWith {};

						//do not refresh the hint if the content is same
						if (_requiredGearTextHintPrev == _requiredGearTextHintCurrent) exitWith {};

						["[i] HINT REFRESHED!"] call BIS_fnc_logFormat;

						[["Hub","RequiredGear"],10e10,"!([] call BIS_HubBriefing_isNearArmory)",10e10,"!([] call BIS_HubBriefing_isNearArmory)",true,true,false,_shownHint != "RequiredGear"] call BIS_fnc_advHint;

						_requiredGearTextHintPrev = _requiredGearTextHintCurrent;
					};
				};

				if (_location == _locationPrev) exitWith {};

				if (_location == "ARMORY") then
				{
					["[HubBriefing][i] Navigation updated -> ARMORY"] call BIS_fnc_logFormat;

					BIS_HubBriefing_canAssemble = false;

					_taskArmoryTitle = ["Hubs",missionName,"Tasks","BIS_GoArmory","title"] call BIS_fnc_getCfgData;
					_taskArmoryDesc  = format[(["Hubs",missionName,"Tasks","BIS_GoArmory","desc"] call BIS_fnc_getCfgData),"<br/>"];
					_taskArmoryMrk	 = ["Hubs",missionName,"Tasks","BIS_GoArmory","marker"] call BIS_fnc_getCfgData;

					_taskAssembleTitle = ["Hubs",missionName,"Tasks","BIS_Assemble","title"] call BIS_fnc_getCfgData;
					_taskAssembleDesc  = format[(["Hubs",missionName,"Tasks","BIS_Assemble","desc"] call BIS_fnc_getCfgData),"<br/>"];
					_taskAssembleMrk   = ["Hubs",missionName,"Tasks","BIS_Assemble","marker"] call BIS_fnc_getCfgData;

					//create new (current) task "BIS_GoArmory" if it doesn't exist
					if !("BIS_GoArmory" call BIS_fnc_taskExists) then
					{
						[player,"BIS_GoArmory",[_taskArmoryDesc,_taskArmoryTitle,_taskArmoryMrk],[_armoryPoint,true],true,nil,true] call BIS_fnc_taskCreate;
					}
					else
					{
						//["BIS_GoArmory",[_taskArmoryDesc + _requiredGearTextTaskCurrent,_taskArmoryTitle,_taskArmoryMrk]] call BIS_fnc_taskSetDescription;

						if ((player call BIS_fnc_taskCurrent) != "BIS_GoArmory") then
						{
							"BIS_GoArmory" call BIS_fnc_taskSetCurrent;
						};
					};

					//cancel task "BIS_Assemble" if it exists
					if ("BIS_Assemble" call BIS_fnc_taskExists) then
					{
						["BIS_Assemble","CANCELED",false] call BIS_fnc_taskSetState;
					};
				}
				else
				{
					["[HubBriefing][i] -> ASSEMBLE_POINT"] call BIS_fnc_logFormat;

					BIS_HubBriefing_canAssemble = true;

					_taskArmoryTitle   = ["Hubs",missionName,"Tasks","BIS_GoArmoryOptional","title"] call BIS_fnc_getCfgData;
					_taskArmoryDesc    = format[(["Hubs",missionName,"Tasks","BIS_GoArmoryOptional","desc"] call BIS_fnc_getCfgData),"<br/>"];
					_taskArmoryMrk	   = ["Hubs",missionName,"Tasks","BIS_GoArmoryOptional","marker"] call BIS_fnc_getCfgData;

					_taskAssembleTitle = ["Hubs",missionName,"Tasks","BIS_Assemble","title"] call BIS_fnc_getCfgData;
					_taskAssembleDesc  = format[(["Hubs",missionName,"Tasks","BIS_Assemble","desc"] call BIS_fnc_getCfgData),"<br/>"];
					_taskAssembleMrk   = ["Hubs",missionName,"Tasks","BIS_Assemble","marker"] call BIS_fnc_getCfgData;

					//update task "BIS_GoArmory" if it exists
					if ("BIS_GoArmory" call BIS_fnc_taskExists) then
					{
						//update text
						["BIS_GoArmory",[_taskArmoryDesc + _requiredGearTextTaskCurrent,_taskArmoryTitle,_taskArmoryMrk]] call BIS_fnc_taskSetDescription;

						//update state according to player's distance
						if ([_mission] call BIS_HubBriefing_isNearArmory) then
						{
							["BIS_GoArmory","SUCCEEDED",true] call BIS_fnc_taskSetState;
						}
						else
						{
							["BIS_GoArmory","CANCELED",false] call BIS_fnc_taskSetState;
						};
					}
					else
					{
						//[player,"BIS_GoArmory",[_taskArmoryDesc,_taskArmoryTitle,_taskArmoryMrk],[_armoryPoint,true],false,nil,true] call BIS_fnc_taskCreate;

						//display notification about possible re-arming @ armory
						[] spawn
						{
							sleep 8;

							["ArmoryRearm"] call BIS_fnc_showNotification;
						};
					};

					//create new task "BIS_Assemble" if it doesn't exist or make it current
					if !("BIS_Assemble" call BIS_fnc_taskExists) then
					{
						[player,"BIS_Assemble",[_taskAssembleDesc,_taskAssembleTitle,_taskAssembleMrk],[_assemblyPoint,true],true,nil,true] call BIS_fnc_taskCreate;
					}
					else
					{
						"BIS_Assemble" call BIS_fnc_taskSetCurrent;
					};
				};

				_locationPrev = _location;
			};
		};
	};

	/*------------------------------------------------------------------------------------------

		SETUP TRIGGERS: ARMORY & ASSEMBLE POINT

	------------------------------------------------------------------------------------------*/

	[_mission] spawn
	{
		private["_mission","_trigger","_triggerLast"];

		_mission     = _this select 0;
		_trigger     = "";
		_triggerLast = "";

		private["_taskArmoryTitle","_taskArmoryDesc","_taskArmoryMrk","_taskAssembleTitle","_taskAssembleDesc","_taskAssembleMrk"];
		private["_armoryPoint","_assemblyPoint","_armoryClose","_armoryLong","_armoryHDelta"];

		_armoryPoint	= ["Missions",_mission,"HubBriefing","Armory","position"] call BIS_fnc_getCfgDataObject;
		_armoryClose	= ["Missions",_mission,"HubBriefing","Armory","triggerClose"] call BIS_fnc_getCfgData;
		_armoryLong	= ["Missions",_mission,"HubBriefing","Armory","triggerLong"] call BIS_fnc_getCfgData;
		_armoryHDelta 	= ["Missions",_mission,"HubBriefing","Armory","triggerHeightDelta"] call BIS_fnc_getCfgData;

		_assemblyPoint	= ["Missions",_mission,"HubBriefing","AssemblePoint","position"] call BIS_fnc_getCfgDataObject;

		private["_playerPos","_armoryPos","_assemblyPos","_playerHeight","_armoryHeight","_assemblyHeight","_cfgMissionDesc","_missionName"];

		_armoryPos	= getPosASL _armoryPoint;
		_armoryHeight	= _armoryPos select 2;
		_assemblyPos	= getPosASL _assemblyPoint;
		_assemblyHeight = _assemblyPos select 2;

		_cfgMissionDesc	= [_mission] call BIS_fnc_camp_getMissionDesc;
		_missionName 	= [_cfgMissionDesc,"name"] call BIS_fnc_getCfgData;

		private["_fn_timeOver","_fn_atArmory","_fn_atAssembly","_firstTimeOver","_firstAtArmory","_firstAtAssembly"];

		_firstTimeOver   = true;
		_firstAtArmory   = true;
		_firstAtAssembly = true;

		_fn_timeOver =
		{
			_trigger = "TIME_OVER";

			if (_trigger == _triggerLast) exitWith {}; _triggerLast = _trigger;

			["[HubBriefing][i] trigger executed # time over!"] call BIS_fnc_logFormat;

			BIS_HubBriefing_gameOver = true;

			if ("BIS_Assemble" call BIS_fnc_taskExists) then
			{
				["BIS_Assemble","FAILED",false] call BIS_fnc_taskSetState;
			};

			//blackout
			["bis_timeout",true] call BIS_fnc_blackOut; waitUntil {BIS_fnc_blackOut_completed};

			private["_requiredGear"];

			_requiredGear = [_mission,"bis_inf"] call BIS_fnc_camp_getRequiredGear;

			//setup gear on player, if his gear is not ready for the mission
			if (count _requiredGear > 0) then
			{
				[_mission,"bis_inf"] call BIS_fnc_camp_setupCharacter;
			};

			if (BIS_ZR_gameOver) exitWith {};

			["ExfilCommencing",[toUpper _missionName]] call BIS_fnc_showNotification;

			sleep 5;

			if (BIS_ZR_gameOver) exitWith {};

			//end mission
			["[HubBriefing][i] Exiting hub with ending: '%1'!",_mission] call BIS_fnc_logFormat;

			[_mission,true,0] call BIS_fnc_endMission;
		};

		_fn_nearArmory =
		{
			_trigger = "NEAR_ARMORY";

			if (_triggerLast in ["NEAR_ARMORY","AT_ARMORY"]) exitWith {}; _triggerLast = _trigger;

			["[HubBriefing][i] trigger executed # near armory!"] call BIS_fnc_logFormat;

			//display adv. hint with list of required gear
			if (count([BIS_selectedMission,'bis_inf',true] call BIS_fnc_camp_getRequiredGear) > 0) then
			{
				["[i] HINT OPENED!"] call BIS_fnc_logFormat;

				[["Hub","RequiredGear"],10e10,"!([] call BIS_HubBriefing_isNearArmory)",10e10,"!([] call BIS_HubBriefing_isNearArmory)",true,true] call BIS_fnc_advHint;
			};
		};

		_fn_atArmory =
		{
			_trigger = "AT_ARMORY";

			if (_trigger == _triggerLast) exitWith {}; _triggerLast = _trigger;

			["[HubBriefing][i] trigger executed # armory!"] call BIS_fnc_logFormat;


			private["_requiredGear","_autoRearm","_useBlackOut","_playIntro"];

			_requiredGear = [_mission,"bis_inf"] call BIS_fnc_camp_getRequiredGear;

			if (_firstAtArmory) then
			{
				_useBlackOut = ["Missions",_mission,"HubBriefing","Armory","blackOut"] call BIS_fnc_getCfgDataBool;
				_autoRearm   = ["Missions",_mission,"HubBriefing","Armory","autoRearm"] call BIS_fnc_getCfgDataBool;
				_playIntro   = ["Missions",_mission,"HubBriefing","Armory","playIntro"] call BIS_fnc_getCfgDataBool;
			}
			else
			{
				_requiredGear = [];	//allow checking and force giving of required gear only 1st time you get to the armory

				_useBlackOut = false;
				_autoRearm   = false;
				_playIntro   = false;
			};

			if (_autoRearm || count _requiredGear > 0) then
			{
				_useBlackOut = true;
			};

			if (_useBlackOut) then
			{
				if !("bis_hubbriefing" in BIS_fnc_blackOut_ids) then
				{
					["bis_hubbriefing",true] call BIS_fnc_blackOut; waitUntil {BIS_fnc_blackOut_completed};

					//instantly create cinematic borders
					if !(missionNamespace getVariable ["BIS_fnc_cinemaBorder_shown",false]) then {[0,0,false] call BIS_fnc_cinemaBorder;};
				};

				//reposition the unit, set direction & play standing anim
				player setPosASL _armoryPos;
				player setDir getDir _armoryPoint;


				if (_autoRearm) then
				{
					BIS_HubBriefing_autoRearmed = true;

					//auto-setup gear on player for next mission
					[_mission,"bis_inf"] call BIS_fnc_camp_setupCharacter;
				}
				else
				{
					if (count _requiredGear > 0) then
					{
						["[HubBriefing][ ] Required gear: %1",_requiredGear] call BIS_fnc_logFormat;

						[_mission,"bis_inf",_requiredGear] call BIS_fnc_camp_addRequiredGear;
					};
				};

				if (_autoRearm || count _requiredGear > 0) then
				{
					["bis_inf"] call BIS_Armory_visualizePool;
				};

				if (primaryWeapon player != "") then {player playMoveNow "HubSpectator_stand"} else {player playMoveNow "HubSpectator_standU"};

				//black in
				["bis_hubbriefing",true] call BIS_fnc_blackIn;
			};

			//play armory intro
			if (_playIntro) then
			{
				sleep 1;

				[_mission,"HubBriefing","ArmoryIntro"] call BIS_Conversations_play;
			};

			if (_useBlackOut) then
			{
				//smoothly hide cinematic borders
				if (missionNamespace getVariable ["BIS_fnc_cinemaBorder_shown",false]) then {[1,nil,false] spawn BIS_fnc_cinemaBorder;};

				//un-lock player from the spot
				if (primaryWeapon player != "") then
				{
					player playMoveNow "amovpercmstpslowwrfldnon";
				}
				else
				{
					player playMoveNow "amovpercmstpsnonwnondnon";
				};
			};

			if (_firstAtArmory) then
			{
				_mission spawn
				{
					sleep 1;

					//give user action to the armorer
					[_this] call BIS_HubBriefing_setupArmorer;
				};
			};

			_firstAtArmory = false;
		};

		_fn_atAssembly =
		{
			_trigger = "ASSEMBLE_POINT";

			if !(BIS_HubBriefing_canAssemble) exitWith
			{
				["ArmoryMissingRequiredGear"] call BIS_fnc_showNotification;

				sleep 15;
			};

			if (_trigger == _triggerLast) exitWith {}; _triggerLast = _trigger;

			["[HubBriefing][i] trigger executed # assemble point!"] call BIS_fnc_logFormat;

			BIS_HubBriefing_gameOver = true;

			if ("BIS_Assemble" call BIS_fnc_taskExists) then
			{
				["BIS_Assemble","SUCCEEDED",true] call BIS_fnc_taskSetState;
			};

			if ("BIS_GoArmory" call BIS_fnc_taskExists) then
			{
				if (("BIS_GoArmory" call BIS_fnc_taskState) in ["CREATED","ASSIGNED"]) then
				{
					["BIS_GoArmory","CANCELED",false] call BIS_fnc_taskSetState;
				};
			};

			sleep 2;

			if (BIS_ZR_gameOver) exitWith {};

			["ExfilCommencing",[toUpper _missionName]] call BIS_fnc_showNotification;

			sleep 3;

			if (BIS_ZR_gameOver) exitWith {};

			//end mission
			["[HubBriefing][i] Exiting hub with ending: '%1'!",_mission] call BIS_fnc_logFormat;

			[_mission,true,2] call BIS_fnc_endMission;

			_firstAtAssembly = false;
		};

		while {!(BIS_HubBriefing_gameOver || BIS_ZR_gameOver)} do
		{
			sleep 0.25;

			_playerPos	= getPosASL player;
			_playerHeight	= _playerPos select 2;

			switch (true) do
			{
				case (BIS_HubBriefing_timeOver): _fn_timeOver;
				case ((_playerPos distance _armoryPos < _armoryClose) && (abs(_playerHeight - _armoryHeight) < _armoryHDelta)): _fn_atArmory;
				case ((_playerPos distance _armoryPos < _armoryLong) && (abs(_playerHeight - _armoryHeight) < _armoryHDelta)): _fn_nearArmory;
				case ((_playerPos distance _assemblyPos < 10) && (abs(_playerHeight - _assemblyHeight) < 2.25)): _fn_atAssembly;
				default
				{
					_trigger     = "";
					_triggerLast = "";
				};
			};
		};
	};
};

//cleanup the event handlers on mission exit
addMissionEventHandler
[
	"Ended",
	{
		if (!(isNil {EH_SKIP})) then
		{
			([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown',EH_SKIP];
			uiNamespace setVariable ["BIS_HubBriefing_ehSkip",nil];
		}
	}
];