//Parameters
private ["_action", "_parameters"];
_action		= [_this, 0, "", [""]] call BIS_fnc_param;
_parameters	= [_this, 1, []] call BIS_fnc_param;

switch (toLower _action) do {
	case (toLower "initialize") : {
		// Parameters
		private ["_stageId", "_stageTitle", "_stageDescription", "_stageChallenges"];
		_stageId 		= [_parameters, 0, "", [""]] call BIS_fnc_param;
		_stageTitle 		= [_parameters, 1, "", [""]] call BIS_fnc_param;
		_stageDescription 	= [_parameters, 2, "", [""]] call BIS_fnc_param;
		_stageChallenges	= [_parameters, 3, [], [[]]] call BIS_fnc_param;
		
		// The current active challenge for this stage
		private "_stageActiveChallenge";
		_stageActiveChallenge = "";
		
		// Whether this stage was completed
		private "_stageCompleted";
		_stageCompleted = false;
		
		// The container of the completed challenges in this stage
		private "_stageChallengesCompleted";
		_stageChallengesCompleted = [];
		
		// Whether this stage is in progress
		private "_stageInProgress";
		_stageInProgress = false;
		
		// Store stage data
		missionNamespace setVariable ["BIS_stage_" + _stageId, [
			_stageId,			// Id
			_stageTitle,			// Title
			_stageDescription,		// Description
			_stageChallenges,		// This stage's challenges
			_stageActiveChallenge,		// The active challenge in this stage, if any
			_stageCompleted,		// Whether this stage was completed, meaning, all challenges were completed
			_stageChallengesCompleted,	// The list of challenges id's that were completed for this stage
			_stageInProgress		// Whether this stage is in progress
		]];
		publicVariable ("BIS_stage_" + _stageId);
		
		// Initialize this stage's challenges
		{
			["initialize", _x] call BIS_fnc_challenge;
		} forEach _stageChallenges;
		
		// Return
		missionNamespace getVariable ("BIS_stage_" + _stageId);
	};
	
	case (toLower "terminate") : {
		// Parameters
		private ["_stageId"];
		_stageId = [_parameters, 0, "", [""]] call BIS_fnc_param;
		
		// Destroy challenges
		{
			// The challenge id
			private "_id";
			_id = [_x, 0, "", [""]] call BIS_fnc_param;
			
			// Terminate challenge
			["terminate", [_id]] call BIS_fnc_challenge;
		} forEach (["getChallenges", [_stageId]] call BIS_fnc_stage);
		
		// Destroy stage information
		missionNamespace setVariable [("BIS_stage_" + _stageId), nil];
		publicVariable ("BIS_stage_" + _stageId);
	};
	
	case (toLower "getChallenges") : {
		// Parameters
		private ["_stageId"];
		_stageId = [_parameters, 0, "", [""]] call BIS_fnc_param;
		
		// Return
		(missionNamespace getVariable ("BIS_stage_" + _stageId)) select 3;
	};
	
	case (toLower "getActiveChallenge") : {
		// Parameters
		private ["_stageId"];
		_stageId = [_parameters, 0, "", [""]] call BIS_fnc_param;
		
		// Return
		(missionNamespace getVariable ("BIS_stage_" + _stageId)) select 4;
	};
	
	case (toLower "isCompleted") : {
		// Parameters
		private ["_stageId"];
		_stageId = [_parameters, 0, "", [""]] call BIS_fnc_param;
		
		// Return
		(missionNamespace getVariable ("BIS_stage_" + _stageId)) select 5;
	};
	
	case (toLower "setState") : {
		// Parameters
		private ["_stageId", "_complete"];
		_stageId 	= [_parameters, 0, "", [""]] call BIS_fnc_param;
		_complete	= [_parameters, 1, true, [true]] call BIS_fnc_param;
		
		// The stage
		private "_stage";
		_stage = missionNamespace getVariable ["BIS_stage_" + _stageId, []];
		
		// Set the new state
		_stage set [5, _complete];
		
		// Store
		missionNamespace setVariable ["BIS_stage_" + _stageId, _stage];
		publicVariable ("BIS_stage_" + _stageId);
	};
	
	case (toLower "getCompletedChallenges") : {
		// Parameters
		private ["_stageId"];
		_stageId = [_parameters, 0, "", [""]] call BIS_fnc_param;
		
		// Return
		(missionNamespace getVariable ("BIS_stage_" + _stageId)) select 6;
	};
	
	case (toLower "getUncompletedChallenges") : {
		// Parameters
		private ["_stageId"];
		_stageId = [_parameters, 0, "", [""]] call BIS_fnc_param;
		
		// All the challenges in this stage
		private "_challenges";
		_challenges = ["getChallenges", [_stageId]] call BIS_fnc_stage;
		
		// The un completed challenges
		private "_unCompletedChallenges";
		_unCompletedChallenges = [];
		
		{
			// The challenge ID
			private "_challengeId";
			_challengeId = _x select 1;
			
			// Check whether this Challenge has been completed
			if !(["isCompleted", [_stageId, _challengeId]] call BIS_fnc_challenge) then {
				_unCompletedChallenges set [count _unCompletedChallenges, _x];
			};
		} forEach _challenges;
		
		// Return
		_unCompletedChallenges;
	};
	
	case (toLower "inProgress") : {
		// Parameters
		private ["_stageId"];
		_stageId = [_parameters, 0, "", [""]] call BIS_fnc_param;
		
		// Return
		(missionNamespace getVariable ("BIS_stage_" + _stageId)) select 7;
	};
	
	case (toLower "setProgress") : {
		// Parameters
		private ["_stageId", "_inProgress"];
		_stageId	= [_parameters, 0, "", [""]] call BIS_fnc_param;
		_inProgress	= [_parameters, 1, false, [false]] call BIS_fnc_param;
		
		// The challenge data
		private "_stageData";
		_stageData = missionNamespace getVariable ["BIS_stage_" + _stageId, []];
		
		// Change
		_stageData set [7, _inProgress];
		
		// Store
		missionNamespace setVariable ["BIS_stage_" + _stageId, _stageData];
		publicVariable ("BIS_stage_" + _stageId);
	};
	
	case (toLower "getTitle") : {
		// Parameters
		private ["_stageId"];
		_stageId = [_parameters, 0, "", [""]] call BIS_fnc_param;
		
		// Return
		(missionNamespace getVariable ("BIS_stage_" + _stageId)) select 1;
	};
	
	case (toLower "getDescription") : {
		// Parameters
		private ["_stageId"];
		_stageId = [_parameters, 0, "", [""]] call BIS_fnc_param;
		
		// Return
		(missionNamespace getVariable ("BIS_stage_" + _stageId)) select 2;
	};
	
	case DEFAULT {
		//Error
		["Invalid action: %1", _action] call BIS_fnc_error;
	};
};
