// Includes
#include "\A3\UI_F_Curator\UI\defineResinclDesign.inc"

// Defines
#define OBJECT "BIS_timeTrial_object"
#define CONTAINER "BIS_timeTrial_container"
#define INDEX_UID 0
#define INDEX_NAME 1
#define INDEX_BEST 2
#define INDEX_AVERAGE 3

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
		!isNil { _object getVariable CONTAINER }
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
		_data = ["getData", [_object]] call BIS_fnc_timeTrial;
		
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
		_data = ["getData", [_object]] call BIS_fnc_timeTrial;
		
		// The recruit data index
		private "_index";
		_index = ["getRecruitDataIndex", [_object, _uid]] call BIS_fnc_timeTrial;
		
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
		_index = ["getRecruitDataIndex", [_object, _uid]] call BIS_fnc_timeTrial;
		
		// Get the container
		private "_data";
		_data = ["getData", [_object]] call BIS_fnc_timeTrial;
		
		// Do we have a valid index?
		if (_index != -1) then {
			// Replace
			_data set [_index, _dataRecruit];
		} else {
			// Add
			_data set [count _data, _dataRecruit];
		};
		
		// Store
		["setData", [_object, _data]] call BIS_fnc_timeTrial;
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
		_data = ["getRecruitData", [_object, _uid]] call BIS_fnc_timeTrial;
		
		if (count _data >= _index) then {
			_data select _index;
		} else {
			_return;
		};
	};
	
	case (toLower "getRecruitName") : {
		// Parameters
		private ["_object", "_uid", "_index", "_return"];
		_object	= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_uid	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		
		// Return
		["getRecruitProperty", [_object, _uid, INDEX_NAME, ""]] call BIS_fnc_timeTrial;
	};
	
	case (toLower "getRecruitBestTime") : {
		// Parameters
		private ["_object", "_uid", "_index", "_return"];
		_object	= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_uid	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		
		// Return
		["getRecruitProperty", [_object, _uid, INDEX_BEST, -1]] call BIS_fnc_timeTrial;
	};
	
	case (toLower "getRecruitAverageTime") : {
		// Parameters
		private ["_object", "_uid", "_index", "_return"];
		_object	= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_uid	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		
		// Return
		["getRecruitProperty", [_object, _uid, INDEX_AVERAGE, -1]] call BIS_fnc_timeTrial;
	};
	
	case (toLower "uiOpen") : {
		// Parameters
		private ["_object"];
		_object	= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		// Store the target object into the UI namespace so we can get it within the onLoad of the main display
		uiNamespace setVariable [OBJECT, _object];
		
		// Open interface
		createDialog "RscDisplayTimeTrialBoard";
	};
	
	case (toLower "uiOnLoad") : {
		// The display
		private "_display";
		_display = [_parameters, 0, displayNull, [displayNull]] call BIS_fnc_param;
		
		// The list box control
		private "_listBox";
		_listBox = _display displayCtrl IDC_RSCDISPLAYTIMETRIALBOARD_TABLE;
		
		// Disable list box so it cannot be interacted with
		_listBox ctrlEnable false;
		
		// The board object
		private "_object";
		_object = uiNamespace getVariable [OBJECT, []];
		
		// Fill the list box
		["uiFillTable", [_object, _listBox]] call BIS_fnc_timeTrial;
	};
	
	case (toLower "uiFillTable") : {
		// Parameters
		private ["_object", "_listBox"];
		_object		= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_listBox 	= [_parameters, 1, controlNull, [controlNull]] call BIS_fnc_param;
		
		// Fill the first row with descriptions
		_listBox lnbAddRow [localize "STR_A3_MP_Bootcamp_ScoreBoard_Name", localize "STR_A3_MP_Bootcamp_ScoreBoard_Best", localize "STR_A3_MP_Bootcamp_ScoreBoard_Average"];
		
		// The data
		private "_data";
		_data = ["getData", [_object]] call BIS_fnc_timeTrial;
		
		// Sort data by best time
		private "_dataSorted";
		_dataSorted = [_data, [], { _x select INDEX_BEST }, "ASCEND"] call BIS_fnc_sortBy;
		
		// Go through all recruits and fill the list box with information
		{
			// Fill list box row
			["uiFillTableRow", [_object, _listBox, _x]] call BIS_fnc_timeTrial;
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
		private ["_uid", "_name", "_best", "_average"];
		_uid 		= [_data, INDEX_UID, "", [""]] call BIS_fnc_param;
		_name		= [_data, INDEX_NAME, "", [""]] call BIS_fnc_param;
		_best		= [_data, INDEX_BEST, -1, [0]] call BIS_fnc_param;
		_average	= [_data, INDEX_AVERAGE, -1, [0]] call BIS_fnc_param;
		
		private ["_bestFormatted", "_averageFormatted"];
		_bestFormatted 		= [(_best / 3600) % 60] call BIS_fnc_timeToString;
		_averageFormatted	= [(_average / 3600) % 60] call BIS_fnc_timeToString;
		
		// Fill row
		_listBox lnbAddRow [_name, _bestFormatted, _averageFormatted];
	};
	
	case default {
		// Error
		["Invalid action: %1", _action] call BIS_fnc_error;
	};
};
