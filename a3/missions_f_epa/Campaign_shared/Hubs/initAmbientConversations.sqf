scriptName "initAmbientConversations.sqf";

BIS_AmbientConversations_exec =
{
	scriptName "initAmbientConversations.sqf: loop";

	sleep _this;

	private["_units","_anim","_var","_blockedAnims","_blockedVarNames"];

	_units 		= allMissionObjects "Man";
	_blockedAnims 	=
	[
		"SIT_SAD1","SIT_SAD2",
		"PRONE_INJURED_U1","PRONE_INJURED_U2","PRONE_INJURED","KNEEL_TREAT",
		"REPAIR_VEH_PRONE","REPAIR_VEH_KNEEL","REPAIR_VEH_STAND",
		"NONE"
	];

	_blockedVarNames =
	[
		"BIS_inf","BIS_recon","BIS_armory","BIS_armory","BIS_guerLeader","BIS_nikos",
		"BIS_SFA","BIS_SFB","BIS_SFC","BIS_SFD","BIS_SFX",
		"BIS_deltaLead","BIS_alphaLead","BIS_bravoLead","BIS_charlieLead",
		"BIS_SF1","BIS_SF2","BIS_SF3",
		"BIS_FullStart_B_m01","BIS_FullStart_B_m02","BIS_FullStart_B_m03","BIS_FullStart_B_m05","BIS_FullStart_B_out"
	];

	{
		_var	= vehicleVarName _x;
		_anim 	= (_x getVariable ["BIS_ambientAnim",["NONE"]]) select 0;

		if (({_x == _var} count _blockedVarNames > 0) || (_anim in _blockedAnims)) then
		{
			//["[Blocked Unit] %1 | %2 | %3",_x,_var,_anim] call BIS_fnc_logFormat;

			_units set [_forEachIndex,objNull];
		}
		else
		{
			//["[Allowed Unit] %1 | %2 | %3",_x,_var,_anim] call BIS_fnc_logFormat;

			_x setVariable ["BIS_CanChat",true];
		};
	}
	forEach _units; _units = _units - [objNull];

	private["_groups","_pivot","_group"];

	_groups = [];

	//find the groups
	while {count _units > 0} do
	{
		_pivot = _units select 0;

		_group = _pivot nearObjects ["Man",2.5];

		//filter-out soldiers that are nearby, but cannot chat
		{
			if !(_x getVariable ["BIS_CanChat",false]) then
			{
				_group set [_forEachIndex, objNull];
			};
		}
		forEach _group; _group = _group - [objNull];

		//we found a group of soldiers, store it!
		if (count _group > 1) then
		{
			_groups set [count _groups, _group];
		};

		_units = _units - _group;

		sleep 0.1;		//we don't need to hurry, lets avoid fps drop spikes
	};

	if (count _groups == 0) exitWith
	{
		//["[Ambient Conversations] No groups detected!"] call BIS_fnc_logFormat;
	};

	//debug
	BIS_AmbientConversations_groups = _groups;

	//start ambient conversations
	private["_shuffle"];

	_shuffle = getNumber(([missionName] call BIS_fnc_camp_getMissionDesc) >> "AmbientTalk" >> "shuffle") > 0;

	[_shuffle] spawn BIS_fnc_camp_ambientTalk;

	waitUntil{!(isNil "BIS_fnc_camp_ambientTalk__active")};

	if !(BIS_fnc_camp_ambientTalk__active) exitWith {};

	if (isNil "BIS_fnc_camp_ambientTalk__paused") then
	{
		BIS_fnc_camp_ambientTalk__paused = false;
	};

	waitUntil{!(isNil "BIS_fnc_camp_ambientTalk__playing")};

	private["_groups","_groupClosest","_groupCurrent","_distanceClosest","_distanceCurrent","_i","_pivotClosest","_pivotCurrent","_unitVars"];

	_groupClosest 	 = [objNull,objNull];
	_i		 = -1;
	_unitVars	 = ["BIS_AIA","BIS_AIB","BIS_AIC","BIS_AID","BIS_AIE","BIS_AIF"];

	while {BIS_fnc_camp_ambientTalk__active} do
	{
		sleep 0.1;

		if !(BIS_fnc_camp_ambientTalk__paused) then
		{
			waitUntil{!BIS_fnc_camp_ambientTalk__playing};

			_i = _i + 1; if (_i == count _groups) then {_i = 0};

			_groupCurrent = _groups select _i;

			_pivotClosest = _groupClosest select 0;
			_pivotCurrent = _groupCurrent select 0;

			//skip if same groups
			if (_pivotClosest == _pivotCurrent) exitWith {};

			_distanceClosest = player distance _pivotClosest;
			_distanceCurrent = player distance _pivotCurrent;

			//skip if current/evaluated group is further away then group that is already selected
			if (_distanceCurrent >= _distanceClosest) exitWith {};

			_groupClosest = _groupCurrent;

			{
				if (_forEachIndex > (count _unitVars) - 1) exitWith {};

				if (!(isNull _x) && (canMove _x) && !(BIS_fnc_camp_ambientTalk__playing)) then
				{
					missionNamespace setVariable [_unitVars select _forEachIndex, _x];
					//_x setVehicleVarName (_unitVars select _forEachIndex);
				};
			}
			forEach _groupClosest;

			//["[Ambient Conversations] Units renamed. Distance: %1 m.",_distanceCurrent] call BIS_fnc_logFormat;
		};

		//exit auto-selecting script if there are not more then 1 group
		if (count _groups < 2) exitWith {};
	};
};