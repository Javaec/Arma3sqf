/*
	Create enemy site
	
	Logic: The site unique game logic
		- (OBJECT)
	
	Id (Optional): The site unique id
		- (STRING)
	
	Center (Optional): The center position of the site
		- (STRING)
		- (ARRAY)
		- (OBJECT)
	
	Radius (Optional): The size of the site
		- (STRING)
		- (ARRAY)
		- (NUMBER)
	
	Chaos (Optional): The chaos value this site has
		- (STRING)
		- (NUMBER)
	
	Alarm (Optional): If an alarm sound should play when a site detects enemy
		- (BOOLEAN)
	
	Init Statement (Optional): Code that runs on site initialization
		- (CODE)
	
	Detected Statement (Optional): Code that runs when units at site detects enemy
		- (CODE)
	
	Cleared Statement (Optional): Code that runs when site is cleared
		- (CODE)
	
	Detected (Optional): If detected trigger should be created
		- (BOOLEAN)
	
	Cleared (Optional): If cleared trigger should be created
		- (BOOLEAN)
*/

//Params
private ["_logic", "_id", "_center", "_radius", "_chaos", "_alarm", "_initStatement", "_detectedStatement", "_clearedStatement", "_detected", "_cleared"];
_logic			= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_id			= [_this, 1, format ["%1", _logic], [""]] call BIS_fnc_param;
_center 		= [_this, 2, _logic, [[], "", objNull]] call BIS_fnc_param;
_radius 		= [_this, 3, 100, [0, "", []]] call BIS_fnc_param;
_chaos			= [_this, 4, "low", [0, ""]] call BIS_fnc_param;
_alarm			= [_this, 5, false, [true]] call BIS_fnc_param;
_initStatement		= [_this, 6, {}, [{}]] call BIS_fnc_param;
_detectedStatement	= [_this, 7, {}, [{}]] call BIS_fnc_param;
_clearedStatement	= [_this, 8, {}, [{}]] call BIS_fnc_param;
_detected		= [_this, 9, true, [true]] call BIS_fnc_param;
_cleared		= [_this, 10, true, [true]] call BIS_fnc_param;

//Validate logic object
if (isNull _logic) exitWith {
	"fn_site: Logic object must NOT be null" call BIS_fnc_error;
};

//The center
_center = switch (typeName _center) do {
	case "STRING" : {
		getMarkerPos _center;
	};
	case "ARRAY" : {
		_center;
	};
	case DEFAULT {
		position _center;
	};
};

//The radius
_radius = switch (typeName _radius) do {
	case "STRING" : {
		getMarkerSize _radius;
	};
	case "ARRAY" : {
		_radius;
	};
	case DEFAULT {
		[_radius, _radius];
	};
};

//The chaos value
//This means how much value this site has for the chaos threshold
_chaos = if (typeName _chaos == "STRING") then {
	//String
	switch (_chaos) do {
		case "verylow" : {
			100
		};
		case "low" : {
			200
		};
		case "normal" : {
			300
		};
		case "high" : {
			400
		};
		case "veryhigh" : {
			500
		};
	};
} else {
	//Number
	_chaos;
};

//The init statement
_logic call _initStatement;

//Create detected trigger
private "_detectedTrigger";
if (_detected) then {
	_detectedTrigger = createTrigger ["EmptyDetector", _center];
	_detectedTrigger setTriggerArea [_radius select 0, _radius select 1, 0, false];
	_detectedTrigger setTriggerActivation ["WEST", "EAST D", false];
	_detectedTrigger setTriggerStatements [
		format ["this && isNil { %1 getVariable 'BIS_cleared' }", _logic],
		format ["[%1] call BIS_fnc_sn_siteDetected;", _logic],
		""
	];
};

//Create cleared trigger
private "_clearedTrigger";
if (_cleared) then {
	_clearedTrigger = createTrigger ["EmptyDetector", _center];
	_clearedTrigger setTriggerArea [_radius select 0, _radius select 1, 0, false];
	_clearedTrigger setTriggerActivation ["EAST", "NOT PRESENT", false];
	_clearedTrigger setTriggerStatements [
		"this",
		format ["[%1] call BIS_fnc_sn_siteCleared;", _logic],
		""
	];
};

//Store within logic variables
_logic setVariable ["BIS_id", _id];
_logic setVariable ["BIS_center", _center];
_logic setVariable ["BIS_radius", _radius];
_logic setVariable ["BIS_chaos", _chaos];
_logic setVariable ["BIS_alarm", _alarm];
_logic setVariable ["BIS_initStatement", _initStatement];
_logic setVariable ["BIS_detectedStatement", _detectedStatement];
_logic setVariable ["BIS_clearedStatement", _clearedStatement];
_logic setVariable ["BIS_detectedTrigger", _detectedTrigger];
_logic setVariable ["BIS_clearedTrigger", _clearedTrigger];

//We also store logics on global variable
if (isNil { BIS_sites }) then {
	BIS_sites = [_logic];
} else {
	BIS_sites set [count BIS_sites, _logic];
};

//Log
format ["Site %1 created", _id] call BIS_fnc_log;

//Return value
_logic;
