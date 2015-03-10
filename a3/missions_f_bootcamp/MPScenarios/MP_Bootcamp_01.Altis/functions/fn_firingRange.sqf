// Includes
#include "\A3\UI_F_Curator\UI\defineResinclDesign.inc"

// Defines
#define OBJECT 				"BIS_firingRange_object"
#define CONTAINER 			"BIS_firingRange_container"
#define INDEX_UID 			0
#define INDEX_NAME 			1
#define INDEX_COURSES			2
#define INDEX_HITS 			0
#define INDEX_MISSES 			1
#define INDEX_TIME 			2
#define INDEX_WEAPON			3
#define DEFAULT_POSSIBLE_TARGETS 	10

// Parameters
private ["_action", "_parameters"];
_action 	= [_this, 0, "", [""]] call BIS_fnc_param;
_parameters 	= [_this, 1, []] call BIS_fnc_param;

// Sub-functions
switch (toLower _action) do {
	case (toLower "initialize") : {
		// Parameters
		private ["_object"];
		_object	= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		// The data container
		_object setVariable [CONTAINER, [], true];
	};
	
	case (toLower "terminate") : {
		// Parameters
		private ["_object"];
		_object	= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		// Reset the data container
		_object setVariable [CONTAINER, nil, true];
	};
	
	case (toLower "isInitialized") : {
		// Parameters
		private ["_object"];
		_object	= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		// Return
		!isNil { _object getVariable CONTAINER };
	};
	
	case (toLower "getData") : {
		// Parameters
		private ["_object"];
		_object	= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		// Return
		_object getVariable [CONTAINER, []];
	};
	
	case (toLower "setData") : {
		// Parameters
		private ["_object", "_data"];
		_object	= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_data	= [_parameters, 1, [], [[]]] call BIS_fnc_param;
		
		// Return
		_object setVariable [CONTAINER, _data, true];
	};
	
	case (toLower "getRecruitDataIndex") : {
		// Parameters
		private ["_object", "_uid"];
		_object	= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_uid	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		
		// Get the container
		private "_data";
		_data = ["getData", [_object]] call BIS_fnc_firingRange;
		
		// The recruit data index
		private "_index";
		_index = -1;
		
		// Go through all the data and find matching recruit container
		{
			private "_currentUid";
			_currentUid = _x select INDEX_UID;
			
			// We have a match?
			if (_uid == _currentUid) exitWith {
				_index = _forEachIndex;
			};
		} forEach _data;
		
		// Return
		_index;
	};
	
	case (toLower "getRecruitData") : {
		// Parameters
		private ["_object", "_uid"];
		_object	= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_uid	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		
		// Get the container
		private "_data";
		_data = ["getData", [_object]] call BIS_fnc_firingRange;
		
		// The recruit data index
		private "_index";
		_index = ["getRecruitDataIndex", [_object, _uid]] call BIS_fnc_firingRange;
		
		// Recruit has data stored?
		if (_index != -1) then {
			// Return
			_data select _index;
		} else {
			// Return
			[];
		};
	};
	
	case (toLower "setRecruitData") : {
		// Parameters
		private ["_object", "_dataRecruit"];
		_object		= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_uid		= [_parameters, 1, "", [""]] call BIS_fnc_param;
		_dataRecruit	= [_parameters, 2, [], [[]]] call BIS_fnc_param;
		
		// The recruit data index
		private "_index";
		_index = ["getRecruitDataIndex", [_object, _uid]] call BIS_fnc_firingRange;
		
		// Get the container
		private "_data";
		_data = ["getData", [_object]] call BIS_fnc_firingRange;
		
		// Do we have a valid index?
		if (_index != -1) then {
			// Replace
			_data set [_index, _dataRecruit];
		} else {
			// Add
			_data set [count _data, _dataRecruit];
		};
		
		// Store
		["setData", [_object, _data]] call BIS_fnc_firingRange;
	};
	
	case (toLower "addRecruitCourseData") : {
		// Parameters
		private ["_object", "_uid", "_courseData"];
		_object		= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_uid		= [_parameters, 1, "", [""]] call BIS_fnc_param;
		_courseData	= [_parameters, 2, [], [[]]] call BIS_fnc_param;
		
		private "_recruitData";
		_recruitData = ["getRecruitData", [_object, _uid]] call BIS_fnc_firingRange;
		
		if (count _recruitData > 0) then {
			private "_recruitCourses";
			_recruitCourses = _recruitData select INDEX_COURSES;
			
			// Add the new course information to the container
			_recruitCourses set [count _recruitCourses, _courseData];
			
			// Save recruit data
			_recruitData set [INDEX_COURSES, _recruitCourses];
			
			// Store
			["setRecruitData", [_object, _uid, _recruitData]] call BIS_fnc_firingRange;
		};
	};
	
	case (toLower "getRecruitProperty") : {
		// Parameters
		private ["_object", "_uid", "_index", "_return"];
		_object	= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_uid	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		_index	= [_parameters, 2, 0, [0]] call BIS_fnc_param;
		_return	= [_parameters, 3, -1, ["", 0, [], objNull]] call BIS_fnc_param;
		
		// The recruit data
		private "_data";
		_data = ["getRecruitData", [_object, _uid]] call BIS_fnc_firingRange;
		
		if (count _data >= _index) then {
			_data select _index;
		} else {
			_return;
		};
	};
	
	case (toLower "getRecruitName") : {
		// Parameters
		private ["_object", "_uid"];
		_object	= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_uid	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		
		// Return
		["getRecruitProperty", [_object, _uid, INDEX_NAME, ""]] call BIS_fnc_firingRange;
	};
	
	case (toLower "getRecruitCourses") : {
		// Parameters
		private ["_object", "_uid"];
		_object	= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_uid	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		
		// Return
		["getRecruitProperty", [_object, _uid, INDEX_COURSES, []]] call BIS_fnc_firingRange;
	};
	
	case (toLower "getRecruitBestCourse") : {
		// Parameters
		private ["_object", "_uid", "_hitsRequired", "_weaponRequired"];
		_object		= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_uid		= [_parameters, 1, "", [""]] call BIS_fnc_param;
		_hitsRequired	= [_parameters, 2, -1, [-1]] call BIS_fnc_param;
		_weaponRequired	= [_parameters, 3, "", [""]] call BIS_fnc_param;
		
		// The courses
		private "_courses";
		_courses = ["getRecruitCourses", [_object, _uid]] call BIS_fnc_firingRange;
		
		// The highest amount of hits within a course and it's index
		private ["_index", "_maxHits"];
		_index = -1;
		_maxHits = -1;
		
		{
			private ["_hits", "_misses", "_time", "_weapon"];
			_hits	= [_x, INDEX_HITS, -1, [0]] call BIS_fnc_param;
			_misses	= [_x, INDEX_MISSES, -1, [0]] call BIS_fnc_param;
			_time	= [_x, INDEX_TIME, -1, [0]] call BIS_fnc_param;
			_weapon	= [_x, INDEX_WEAPON, "", [""]] call BIS_fnc_param;
			
			if (_hits > _maxHits && { _hitsRequired == -1 || _hits >= _hitsRequired } && { _weaponRequired == "" || _weapon == _weaponRequired }) then {
				_maxHits = _hits;
				_index = _forEachIndex;
			};
		} forEach _courses;
		
		// Return
		if (_index != -1) then {
			_courses select _index;
		} else {
			[];
		};
	};
	
	case (toLower "uiOpen") : {
		// Parameters
		private ["_object"];
		_object	= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		// Store the target object into the UI namespace so we can get it within the onLoad of the main display
		uiNamespace setVariable [OBJECT, _object];
		
		// Open interface
		createDialog "RscDisplayFiringRangeBoard";
	};
	
	case (toLower "uiOnLoad") : {
		// The display
		private "_display";
		_display = [_parameters, 0, displayNull, [displayNull]] call BIS_fnc_param;
		
		// The list box control
		private "_listBox";
		_listBox = _display displayCtrl IDC_RSCDISPLAYFIRINGRANGEBOARD_TABLE;
		
		// Disable list box so it cannot be interacted with
		_listBox ctrlEnable false;
		
		// The board object
		private "_object";
		_object = uiNamespace getVariable [OBJECT, []];
		
		// Fill the list box
		["uiFillTable", [_object, _listBox]] call BIS_fnc_firingRange;
	};
	
	case (toLower "uiFillTable") : {
		// Parameters
		private ["_object", "_listBox"];
		_object		= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_listBox 	= [_parameters, 1, controlNull, [controlNull]] call BIS_fnc_param;
		
		// Fill the first row with descriptions
		_listBox lnbAddRow [localize "STR_A3_MP_Bootcamp_ScoreBoard_Name", localize "STR_A3_MP_Bootcamp_ScoreBoard_Hits", localize "STR_A3_MP_Bootcamp_ScoreBoard_Missed", localize "STR_A3_MP_Bootcamp_ScoreBoard_Time"];
		
		// The data
		private "_data";
		_data = ["getData", [_object]] call BIS_fnc_firingRange;
		
		// Best courses of each stored player
		private "_bestCourses";
		_bestCourses = [];
		
		{
			private ["_uid", "_name"];
			_uid 	= _x select INDEX_UID;
			_name 	= _x select INDEX_NAME;
			
			private "_bestCourse";
			_bestCourse = ["getRecruitBestCourse", [_object, _uid]] call BIS_fnc_firingRange;
			_bestCourse set [count _bestCourse, _name];
			
			// Get best course
			_bestCourses set [count _bestCourses, _bestCourse];
		} forEach _data;
		
		// Sort data by best time
		private "_dataSorted";
		_dataSorted = [_bestCourses, [], { _x select INDEX_HITS }, "DESCEND"] call BIS_fnc_sortBy;
		
		// Go through all recruits and fill the list box with information
		{
			// Fill list box row
			["uiFillTableRow", [_object, _listBox, _x]] call BIS_fnc_firingRange;
		} forEach _dataSorted;
		
		// Select first row, the one with column descriptions
		_listBox lnbSetCurSelRow 0;
	};
	
	case (toLower "uiFillTableRow") : {
		// Parameters
		private ["_object", "_listBox", "_data"];
		_object		= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_listBox 	= [_parameters, 1, controlNull, [controlNull]] call BIS_fnc_param;
		_data		= [_parameters, 2, [], [[]]] call BIS_fnc_param;
		
		// The shooter data
		private ["_hits", "_misses", "_time", "_weapon", "_name"];
		_hits	= [_data, INDEX_HITS, -1, [0]] call BIS_fnc_param;
		_misses	= [_data, INDEX_MISSES, -1, [0]] call BIS_fnc_param;
		_time	= [_data, INDEX_TIME, -1, [0]] call BIS_fnc_param;
		_weapon	= [_data, INDEX_WEAPON, "", [""]] call BIS_fnc_param;
		_name	= [_data, INDEX_NAME + 3, "", [""]] call BIS_fnc_param;
		
		private ["_hitsFormatted", "_missesFormatted", "_timeFormatted"];
		_hitsFormatted 		= format ["%1", _hits];
		_missesFormatted	= str _misses;
		_timeFormatted		= [(_time / 3600) % 60] call BIS_fnc_timeToString;
		
		// Fill row
		_listBox lnbAddRow [_name, _hitsFormatted, _missesFormatted, _timeFormatted];
	};
	
	case default {
		// Error
		["Invalid action: %1", _action] call BIS_fnc_error;
	};
};
