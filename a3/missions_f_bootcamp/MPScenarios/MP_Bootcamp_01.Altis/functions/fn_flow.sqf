//Parameters
private ["_action", "_parameters"];
_action		= [_this, 0, "", [""]] call BIS_fnc_param;
_parameters	= [_this, 1, []] call BIS_fnc_param;

switch (toLower _action) do {
	case (toLower "initialize") : {
		// Parameters
		private ["_stages"];
		_stages = [_parameters, 0, [], [[]]] call BIS_fnc_param;
		
		// The processed stages
		private "_stagesProcessed";
		_stagesProcessed = [];
		
		// Initialize all stages
		{
			// Initialize stage
			private "_stage";
			_stage = ["initialize", _x] call BIS_fnc_stage;
			
			// Store stage information
			_stagesProcessed set [count _stagesProcessed, _stage];
		} forEach _stages;
		
		// Store
		missionNamespace setVariable ["BIS_stages", _stagesProcessed];
		missionNamespace setVariable ["BIS_stageCurrent", ""];
		publicVariable "BIS_stages";
		publicVariable "BIS_stageCurrent";
		
		// Stages fsm
		[] execFSM "fsms\flow.fsm";
	};
	
	case (toLower "terminate") : {
		// Stages
		private "_stagesIds";
		_stagesIds = ["getStagesIds"] call BIS_fnc_flow;
		
		// Terminate stages
		{
			// Terminate stage
			["terminate", [_x]] call BIS_fnc_stage;
		} forEach _stagesIds;
		
		// Destroy variables
		missionNamespace setVariable ["BIS_stages", nil];
		missionNamespace setVariable ["BIS_stageCurrent", nil];
		publicVariable "BIS_stages";
		publicVariable "BIS_stageCurrent";
	};
	
	case (toLower "getCurrentStage") : {
		// Return
		missionNamespace getVariable ["BIS_stageCurrent", ""];
	};
	
	case (toLower "setCurrentStage") : {
		// Parameters
		private ["_stageId"];
		_stageId = [_parameters, 0, "", [""]] call BIS_fnc_param;
		
		// The list of valid Stages
		private "_stagesIds";
		_stagesIds = ["getStagesIds"] call BIS_fnc_flow;
		
		// Add empty string as valid, so we can halt a Stage
		private "_validIds";
		_validIds = [""] + _stagesIds;
		
		// Validate
		if (_stageId in _validIds) then {
			// Store
			missionNamespace setVariable ["BIS_stageCurrent", _stageId];
			publicVariable "BIS_stageCurrent";
		} else {
			// Error
			["Invalid Stage Id (%1)", _stageId] call BIS_fnc_error;
		};
	};
	
	case (toLower "isStageSelectedAndValid") : {
		// Return
		["isStageSelected"] call BIS_fnc_flow && ["isStageValid", [["getCurrentStage"] call BIS_fnc_flow]] call BIS_fnc_flow;
	};
	
	case (toLower "isStageSelected") : {
		// Return
		["getCurrentStage"] call BIS_fnc_flow != "";
	};
	
	case (toLower "isStageValid") : {
		// Parameters
		private ["_stageId"];
		_stageId = [_parameters, 0, "", [""]] call BIS_fnc_param;
		
		// The Stages pool
		private "_stagesIds";
		_stagesIds = ["getStagesIds"] call BIS_fnc_flow;
		
		// Return
		_stageId in _stagesIds;
	};
	
	case (toLower "getStages") : {
		// Return
		missionNamespace getVariable ["BIS_stages", []];
	};
	
	case (toLower "getStageById") : {
		// Parameters
		private ["_stageId"];
		_stageId = [_parameters, 0, "", [""]] call BIS_fnc_param;
		
		// Get all the stages
		private "_stages";
		_stages = ["getStages"] call BIS_fnc_flow;
		
		// Stage
		private "_stage";
		_stage = [];
		
		// Go through the stages and find matching Id
		{
			// Get the Id
			private "_id";
			_id = [_x, 0, "", [""]] call BIS_fnc_param;
			
			// Do we have a match
			if (_id == _stageId) exitWith {
				_stage = _x;
			};
		} forEach _stages;
		
		// Return
		_stage;
	};
	
	case (toLower "getStagesIds") : {
		// The stages
		private "_stages";
		_stages = ["getStages"] call BIS_fnc_flow;
		
		// The list of ids
		private "_ids";
		_ids = [];
		
		// Go through all stages and get their id
		{
			// The id
			private "_id";
			_id = [_x, 0, "", [""]] call BIS_fnc_param;
			
			// Store id
			_ids set [count _ids, _id];
		} forEach _stages;
		
		// Return
		_ids;
	};
	
	case (toLower "isInstructor") : {
		// Parameters
		private ["_unit"];
		_unit = [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		// Return
		isPlayer _unit && !(isNull getAssignedCuratorLogic _unit);
	};
	
	case (toLower "isRecruit") : {
		// Parameters
		private ["_unit"];
		_unit = [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		// Return
		isPlayer _unit && !(["isInstructor", [_unit]] call BIS_fnc_flow);
	};
	
	case (toLower "instructorExists") : {
		// Return
		count (["allInstructors"] call BIS_fnc_flow) > 0
	};
	
	case (toLower "recruitExists") : {
		// Return
		count (["allRecruits"] call BIS_fnc_flow) > 0
	};
	
	case (toLower "allInstructors") : {
		// The list to return
		private "_instructors";
		_instructors = [];
		
		// Go through all playable units take only the ones that are Instructors
		{
			// Is player a Recruit
			if (["isInstructor", [_x]] call BIS_fnc_flow) then {
				_instructors set [count _instructors, _x];
			};
		} forEach playableUnits;
		
		// Return the list of Instructors
		_instructors;
	};
	
	case (toLower "allRecruits") : {
		["allConnectedRecruits"] call BIS_fnc_flow;
	};
	
	case (toLower "isStageIndexCompleted") : {
		// Parameters
		private ["_index"];
		_index = [_parameters, 0, -1, [0]] call BIS_fnc_param;
		
		// The flag
		private "_isCompleted";
		_isCompleted = false;
		
		// Make sure index is in bounds
		if (_index > -1 && _index < count (["getStages"] call BIS_fnc_flow)) then {
			// All Stages IDs
			private "_stagesIds";
			_stagesIds = ["getStagesIds"] call BIS_fnc_flow;
			
			// The Stage
			private "_stageId";
			_stageId = _stagesIds select _index;
			
			// The flag
			_isCompleted = ["isCompleted", [_stageId]] call BIS_fnc_stage;
		} else {
			// Error
			["Invalid index (%1)", _index] call BIS_fnc_error;
		};
		
		// Return
		_isCompleted;
	};
	
	case (toLower "isStageIndexCurrent") : {
		// Parameters
		private ["_index"];
		_index = [_parameters, 0, -1, [0]] call BIS_fnc_param;
		
		// The flag
		private "_isCurrentStage";
		_isCurrentStage = false;
		
		// Make sure index is in bounds
		if (_index > -1 && _index < count (["getStages"] call BIS_fnc_flow)) then {
			// The Stages
			private "_stages";
			_stages = ["getStages"] call BIS_fnc_flow;
			
			// The matching stage
			private "_stage";
			_stage = _stages select _index;
			
			// The Stage ID
			private "_stageId";
			_stageId = _stage select 0;
			
			// Whether it is in progress or not
			_isCurrentStage = (["getCurrentStage"] call BIS_fnc_flow) == _stageId;
		};
		
		// Return
		_isCurrentStage;
	};
	
	case (toLower "allConnectedRecruits") : {
		private "_list";
		_list = [];
		
		{
			if (isPlayer _x && { ["isRecruit", [_x]] call BIS_fnc_flow }) then {
				_list set [count _list, _x];
			};
		} forEach allUnits + allDeadMen;
		
		// Return
		_list;
	};
	
	case (toLower "allAliveRecruits") : {
		private "_list";
		_list = [];
		
		private "_connected";
		_connected = ["allConnectedRecruits"] call BIS_fnc_flow;
		
		{
			if (alive _x && { ["isRecruit", [_x]] call BIS_fnc_flow }) then {
				_list set [count _list, _x];
			};
		} forEach allUnits;
		
		// Return
		_list;
	};
	
	case (toLower "allDeadRecruits") : {
		private "_list";
		_list = [];
		
		private "_connected";
		_connected = ["allConnectedRecruits"] call BIS_fnc_flow;
		
		{
			if (!alive _x && { ["isRecruit", [_x]] call BIS_fnc_flow }) then {
				_list set [count _list, _x];
			};
		} forEach allDeadMen;
		
		// Return
		_list;
	};
	
	case DEFAULT {
		//Error
		["Invalid action: %1", _action] call BIS_fnc_error;
	};
};
