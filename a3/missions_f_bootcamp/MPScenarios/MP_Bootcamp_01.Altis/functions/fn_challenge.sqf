//Parameters
private ["_action", "_parameters"];
_action		= [_this, 0, "", [""]] call BIS_fnc_param;
_parameters	= [_this, 1, []] call BIS_fnc_param;

switch (toLower _action) do {
	case (toLower "initialize") : {
		// Parameters
		private ["_stageId", "_challengeId", "_challengeTitle", "_challengeDescription", "_challengeScript"];
		_stageId		= [_parameters, 0, "", [""]] call BIS_fnc_param;
		_challengeId 		= [_parameters, 1, "", [""]] call BIS_fnc_param;
		_challengeTitle		= [_parameters, 2, "", [""]] call BIS_fnc_param;
		_challengeDescription	= [_parameters, 3, "", [""]] call BIS_fnc_param;
		_challengeScript	= [_parameters, 4, "", [""]] call BIS_fnc_param;
		
		// The challenge state
		private "_challengeState";
		_challengeState = [
			false,			// Whether the challenge was Completed, can be Succeeded, Failed and Cancelled
			false,			// Whether the challenge was Succeeded
			false,			// Whether the challenge was Failed
			false			// Whether the challenge was Cancelled
		];
		
		// Whether or not the challenge is in progress
		private "_challengeInProgress";
		_challengeInProgress = false;
		
		// Store challenge data
		missionNamespace setVariable ["BIS_stage_" + _stageId + "_challenge_" + _challengeId, [
			_stageId,		// The Stage which this Challenge belongs to
			_challengeId,		// Challenge unique Id
			_challengeTitle,	// Challenge title
			_challengeDescription,	// Challenge description
			_challengeScript,	// Script with switch case sub functions (must follow standard!)
			_challengeState,	// State of the challenge
			_challengeInProgress	// Whether this challenge is in progress
		]];
		publicVariable ("BIS_stage_" + _stageId + "_challenge_" + _challengeId);
		
		// Return
		missionNamespace getVariable ("BIS_stage_" + _stageId + "_challenge_" + _challengeId);
	};
	
	case (toLower "terminate") : {
		// Parameters
		private ["_stageId", "_challengeId"];
		_stageId	= [_parameters, 0, "", [""]] call BIS_fnc_param;
		_challengeId 	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		
		// If in progress we need to terminate challenge script/function
		if (["inProgress", [_stageId, _challengeId]] call BIS_fnc_challenge) then {
			// Get the script
			private "_script";
			_script = ["getScript", [_stageId, _challengeId]] call BIS_fnc_challenge;
			
			// Compile it
			private "_compiled";
			_compiled = compile preprocessFileLineNumbers _script;
			
			// Terminate script
			["terminateAndClear"] call _compiled;
		};
		
		// Destroy challenge information
		missionNamespace setVariable ["BIS_stage_" + _stageId + "_challenge_" + _challengeId, nil];
		publicVariable ("BIS_stage_" + _stageId + "_challenge_" + _challengeId);
	};
	
	case (toLower "getScript") : {
		// Parameters
		private ["_stageId", "_challengeId"];
		_stageId	= [_parameters, 0, "", [""]] call BIS_fnc_param;
		_challengeId 	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		
		// The challenge data
		private "_challengeData";
		_challengeData = missionNamespace getVariable ["BIS_stage_" + _stageId + "_challenge_" + _challengeId, []];
		
		// Return
		_challengeData select 4;
	};
	
	case (toLower "isCompleted") : {
		// Parameters
		private ["_stageId", "_challengeId"];
		_stageId	= [_parameters, 0, "", [""]] call BIS_fnc_param;
		_challengeId 	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		
		// The challenge data
		private "_challengeData";
		_challengeData = missionNamespace getVariable ["BIS_stage_" + _stageId + "_challenge_" + _challengeId, []];
		
		// The challenge state
		private "_challengeState";
		_challengeState = _challengeData select 5;
		
		// Return
		_challengeState select 0;
	};
	
	case (toLower "isSucceeded") : {
		// Parameters
		private ["_stageId", "_challengeId"];
		_stageId	= [_parameters, 0, "", [""]] call BIS_fnc_param;
		_challengeId 	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		
		// The challenge data
		private "_challengeData";
		_challengeData = missionNamespace getVariable ["BIS_stage_" + _stageId + "_challenge_" + _challengeId, []];
		
		// The challenge state
		private "_challengeState";
		_challengeState = _challengeData select 5;
		
		// Return
		_challengeState select 1;
	};
	
	case (toLower "isFailed") : {
		// Parameters
		private ["_stageId", "_challengeId"];
		_stageId	= [_parameters, 0, "", [""]] call BIS_fnc_param;
		_challengeId 	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		
		// The challenge data
		private "_challengeData";
		_challengeData = missionNamespace getVariable ["BIS_stage_" + _stageId + "_challenge_" + _challengeId, []];
		
		// The challenge state
		private "_challengeState";
		_challengeState = _challengeData select 5;
		
		// Return
		_challengeState select 2;
	};
	
	case (toLower "isCanceled") : {
		// Parameters
		private ["_stageId", "_challengeId"];
		_stageId	= [_parameters, 0, "", [""]] call BIS_fnc_param;
		_challengeId 	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		
		// The challenge data
		private "_challengeData";
		_challengeData = missionNamespace getVariable ["BIS_stage_" + _stageId + "_challenge_" + _challengeId, []];
		
		// The challenge state
		private "_challengeState";
		_challengeState = _challengeData select 5;
		
		// Return
		_challengeState select 3;
	};
	
	case (toLower "setState") : {
		// Parameters
		private ["_stageId", "_challengeId", "_complete", "_type"];
		_stageId 	= [_parameters, 0, "", [""]] call BIS_fnc_param;
		_challengeId	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		_complete	= [_parameters, 2, false, [false]] call BIS_fnc_param;
		_type		= [_parameters, 3, "complete", [""]] call BIS_fnc_param;
		
		// The index
		private "_index";
		_index = switch (_type) do {
			case "complete" : { 0 };
			case "succeed" : { 1 };
			case "fail" : { 2 };
			case "cancel" : { 3 };
			case default { 0 };
		};
		
		// The challenge data
		private "_challengeData";
		_challengeData = missionNamespace getVariable ["BIS_stage_" + _stageId + "_challenge_" + _challengeId, []];
		
		// The challenge state
		private "_challengeState";
		_challengeState = _challengeData select 5;
		
		// Change the Challenge state
		_challengeState set [_index, _complete];
		
		// Set the new state
		_challengeData set [5, _challengeState];
		
		// Store
		missionNamespace setVariable ["BIS_stage_" + _stageId + "_challenge_" + _challengeId, _challengeData];
		publicVariable ("BIS_stage_" + _stageId + "_challenge_" + _challengeId);
	};
	
	case (toLower "inProgress") : {
		// Parameters
		private ["_stageId", "_challengeId"];
		_stageId	= [_parameters, 0, "", [""]] call BIS_fnc_param;
		_challengeId 	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		
		// The challenge data
		private "_challengeData";
		_challengeData = missionNamespace getVariable ["BIS_stage_" + _stageId + "_challenge_" + _challengeId, []];
		
		// Return
		_challengeData select 6;
	};
	
	case (toLower "setProgress") : {
		// Parameters
		private ["_stageId", "_challengeId", "_inProgress"];
		_stageId	= [_parameters, 0, "", [""]] call BIS_fnc_param;
		_challengeId 	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		_inProgress	= [_parameters, 2, false, [false]] call BIS_fnc_param;
		
		// The challenge data
		private "_challengeData";
		_challengeData = missionNamespace getVariable ["BIS_stage_" + _stageId + "_challenge_" + _challengeId, []];
		
		// Change
		_challengeData set [6, _inProgress];
		
		// Store
		missionNamespace setVariable ["BIS_stage_" + _stageId + "_challenge_" + _challengeId, _challengeData];
		publicVariable ("BIS_stage_" + _stageId + "_challenge_" + _challengeId);
	};
	
	case (toLower "getTitle") : {
		// Parameters
		private ["_stageId", "_challengeId"];
		_stageId	= [_parameters, 0, "", [""]] call BIS_fnc_param;
		_challengeId 	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		
		// Return
		(missionNamespace getVariable ["BIS_stage_" + _stageId + "_challenge_" + _challengeId, []]) select 2;
	};
	
	case (toLower "getDescription") : {
		// Parameters
		private ["_stageId", "_challengeId"];
		_stageId	= [_parameters, 0, "", [""]] call BIS_fnc_param;
		_challengeId 	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		
		// Return
		(missionNamespace getVariable ["BIS_stage_" + _stageId + "_challenge_" + _challengeId, []]) select 3;
	};
	
	case DEFAULT {
		//Error
		["Invalid action: %1", _action] call BIS_fnc_error;
	};
};
