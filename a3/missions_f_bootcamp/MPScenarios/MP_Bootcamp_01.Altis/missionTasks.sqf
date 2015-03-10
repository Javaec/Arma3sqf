case "BIS_stage" : {
	// Parameters
	private ["_action", "_parameters"];
	_action 	= [_this, 0, "", [""]] call BIS_fnc_param;
	_parameters	= [_this, 1, []] call BIS_fnc_param;
	
	switch (toLower _action) do {
		case (toLower "create") : {
			// Sub parameters
			private ["_owner", "_position", "_assign"];
			_owner 		= [_parameters, 0, WEST, [objNull, grpNull, WEST]] call BIS_fnc_param;
			_position	= [_parameters, 1, objNull, [objNull, []]] call BIS_fnc_param;
			_assign		= [_parameters, 2, true, [true]] call BIS_fnc_param;
			
			// Create task
			[
				_owner,
				_taskID,
				[
					localize "STR_A3_MP_Bootcamp_Tasks_Instructor_Stage_Description",
					localize "STR_A3_MP_Bootcamp_Tasks_Instructor_Stage_Title",
					localize "STR_A3_MP_Bootcamp_Tasks_Instructor_Stage_Waypoint"
				],
				_position,
				_assign
			] call BIS_fnc_taskCreate;
		};
		
		case (toLower "exists") : {
			// Return
			[_taskID] call BIS_fnc_taskExists;
		};
		
		case (toLower "getState") : {
			// Return
			[_taskID] call BIS_fnc_taskState;
		};
		
		case (toLower "setState") : {
			// Sub parameters
			private ["_state"];
			_state = [_parameters, 0, "", [""]] call BIS_fnc_param;
			
			// Set task state
			[_taskID, _state] call BIS_fnc_taskSetState;
		};
	};
};

case "BIS_waitForInstructor" : {
	// Parameters
	private ["_action", "_parameters"];
	_action 	= [_this, 0, "", [""]] call BIS_fnc_param;
	_parameters	= [_this, 1, []] call BIS_fnc_param;
	
	switch (toLower _action) do {
		case (toLower "create") : {
			// Sub parameters
			private ["_owner", "_position", "_assign"];
			_owner 		= [_parameters, 0, WEST, [objNull, grpNull, WEST]] call BIS_fnc_param;
			_position	= [_parameters, 1, objNull, [objNull, []]] call BIS_fnc_param;
			_assign		= [_parameters, 2, false, [true]] call BIS_fnc_param;
			
			// Create task
			[
				_owner,
				_taskID,
				[
					localize "STR_A3_MP_Bootcamp_Tasks_Instructor_WaitForInstructor_Description",
					localize "STR_A3_MP_Bootcamp_Tasks_Instructor_WaitForInstructor_Title",
					localize "STR_A3_MP_Bootcamp_Tasks_Instructor_WaitForInstructor_Waypoint"
				],
				_position,
				_assign
			] call BIS_fnc_taskCreate;
		};
		
		case (toLower "exists") : {
			// Return
			[_taskID] call BIS_fnc_taskExists;
		};
		
		case (toLower "getState") : {
			// Return
			[_taskID] call BIS_fnc_taskState;
		};
		
		case (toLower "setState") : {
			// Sub parameters
			private ["_state"];
			_state = [_parameters, 0, "", [""]] call BIS_fnc_param;
			
			// Set task state
			[_taskID, _state] call BIS_fnc_taskSetState;
		};
	};
};

case "BIS_waitForRecruit" : {
	// Parameters
	private ["_action", "_parameters"];
	_action 	= [_this, 0, "", [""]] call BIS_fnc_param;
	_parameters	= [_this, 1, []] call BIS_fnc_param;
	
	switch (toLower _action) do {
		case (toLower "create") : {
			// Sub parameters
			private ["_owner", "_position", "_assign"];
			_owner 		= [_parameters, 0, WEST, [objNull, grpNull, WEST]] call BIS_fnc_param;
			_position	= [_parameters, 1, objNull, [objNull, []]] call BIS_fnc_param;
			_assign		= [_parameters, 2, true, [true]] call BIS_fnc_param;
			
			// Create task
			[
				_owner,
				_taskID,
				[
					localize "STR_A3_MP_Bootcamp_Tasks_Instructor_WaitForRecruit_Description",
					localize "STR_A3_MP_Bootcamp_Tasks_Instructor_WaitForRecruit_Title",
					localize "STR_A3_MP_Bootcamp_Tasks_Instructor_WaitForRecruit_Waypoint"
				],
				_position,
				_assign
			] call BIS_fnc_taskCreate;
		};
		
		case (toLower "exists") : {
			// Return
			[_taskID] call BIS_fnc_taskExists;
		};
		
		case (toLower "getState") : {
			// Return
			[_taskID] call BIS_fnc_taskState;
		};
		
		case (toLower "setState") : {
			// Sub parameters
			private ["_state"];
			_state = [_parameters, 0, "", [""]] call BIS_fnc_param;
			
			// Set task state
			[_taskID, _state] call BIS_fnc_taskSetState;
		};
	};
};
