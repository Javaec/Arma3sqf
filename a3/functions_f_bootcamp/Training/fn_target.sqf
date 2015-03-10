/*
	Author: Nelson Duarte

	Description:
	Adds Zeus functionality to the target object

	Parameter(s):
	

	Returns:
	NONE
*/

// Includes
#include "\A3\ui_f_curator\UI\defineResinclDesign.inc"

// Defines
#define TRUE 		0
#define FALSE 		1
#define UP 		0
#define DOWN 		1
#define UID 		0
#define NAME 		1
#define SHOTS 		2
#define CONTAINER 	"BIS_target_container"
#define OBJECT 		"BIS_target_object"
#define SHOT_KEY	0
#define SHOT_VALUE	1
#define SHOT_TIME	0
#define SHOT_DISTANCE	1
#define SHOT_WEAPON	2
#define SHOT_DIRECT	3

// Parameters
private ["_action", "_parameters"];
_action 	= [_this, 0, "", [""]] call BIS_fnc_param;
_parameters 	= [_this, 1, []] call BIS_fnc_param;

// Sub-functions
switch (toLower _action) do {
	case (toLower "initialize") : {
		// Parameters
		private ["_object"];
		_object = [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		// Validate object type
		if !(_object isKindOf "TargetBootcamp_base_F") exitWith {
			// Error
			["Invalid: Object (%1), Type (%2), Required (TargetBootcamp_base_F)", _object, typeOf _obejct] call BIS_fnc_error;
		};
		
		// The default texture
		private "_texture";
		_texture = ((getArray (configFile >> "CfgVehicles" >> typeOf _object >> "textures")) select 0) select 1;
		
		// Set default texture
		_object setObjectTextureGlobal [0, _texture];
		
		// Make sure object is animated up
		["animate", [_object, "up"]] call BIS_fnc_target;
		
		// The stored data
		_object setVariable [CONTAINER, [], true];
	};
	
	case (toLower "terminate") : {
		
	};
	
	case (toLower "animate") : {
		// Parameters
		private ["_object", "_direction"];
		_object		= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_direction	= [_parameters, 1, "down", [""]] call BIS_fnc_param;
		
		// The animation value
		private "_animationPhase";
		_animationPhase = switch (_direction) do {
			case (toLower "up") : { UP };
			case (toLower "down") : { DOWN };
			case default { UP };
		};
		
		// The selection to animate
		private "_selection";
		_selection = ["getAnimatedSelection", [_object]] call BIS_fnc_target;
		
		// Make sure the object is not already animated the way we want it
		if (_object animationPhase _selection != _animationPhase) then {
			// Animate
			[[[_object, _selection, _animationPhase], {
				(_this select 0) animate [_this select 1, _this select 2];
			}], "BIS_fnc_spawn", _object, false] call BIS_fnc_mp;
		};
	};
	
	case (toLower "getAnimationPhase") : {
		// Parameters
		private ["_object"];
		_object = [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		// The phase of the animation
		private "_animationPhase";
		_animationPhase = _object animationPhase (["getAnimatedSelection", [_object]] call BIS_fnc_target);
		
		// Return
		_animationPhase;
	};
	
	case (toLower "getAnimationPhaseString") : {
		// Parameters
		private ["_object"];
		_object = [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		// The phase of the animation
		private "_animationPhase";
		_animationPhase = _object animationPhase (["getAnimatedSelection", [_object]] call BIS_fnc_target);
		
		// Convert to string
		private "_string";
		_string = if (_animationPhase < 0.5) then { "up" } else { "down" };
		
		// Return
		_string;
	};
	
	case (toLower "getAnimatedSelection") : {
		// Parameters
		private ["_object"];
		_object = [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		// The selection to animate
		private "_selection";
		_selection = getText (configFile >> "CfgVehicles" >> typeOf _object >> "animatedSelection");
		
		// Return
		_selection;
	};
	
	case (toLower "hit") : {
		// Parameters
		private ["_object", "_shooter", "_damage"];
		_object 	= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_shooter	= [_parameters, 1, objNull, [objNull]] call BIS_fnc_param;
		_damage		= [_parameters, 2, 0, [0]] call BIS_fnc_param;
		
		// Can the target be shot at
		if (["getAnimationPhase", [_object]] call BIS_fnc_target == UP) then {
			// Properties
			private ["_targetPopup", "_targetPopupDelay"];
			_targetPopup 		= _object getVariable ["RscAttributeTargetPopup", getNumber (configFile >> "CfgVehicles" >> typeOf _object >> "popup")];
			_targetPopupDelay 	= _object getVariable ["RscAttributeTargetPopupDelay", getNumber (configFile >> "CfgVehicles" >> typeOf _object >> "popupDelayDefault")];
			
			// Should the target pop-up/down
			if (_targetPopup == TRUE) then {
				// Animate Down
				["animate", [_object, "down"]] call BIS_fnc_target;
				
				// Make the object pop back up after the delay as finished
				[_object, _targetPopupDelay] spawn {
					// Parameters
					private ["_object", "_targetPopupDelay"];
					_object			= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
					_targetPopupDelay	= [_this, 1, 1, [0]] call BIS_fnc_param;
					
					// Delay
					private "_delay";
					_delay = time + _targetPopupDelay;
					
					// First wait for the object to start animating down
					waitUntil {
						["getAnimationPhase", [_object]] call BIS_fnc_target != UP
					};
					
					// Wait for delay, object deletion or object is animated by an external source
					waitUntil {
						time >= _delay
						||
						{ isNull _object }
						||
						{ ["getAnimationPhase", [_object]] call BIS_fnc_target == UP }
					};
					
					// Make sure target has not been deleted or animated
					if (!isNull _object && { ["getAnimationPhase", [_object]] call BIS_fnc_target != UP }) then {
						// Animate Up
						["animate", [_object, "up"]] call BIS_fnc_target;
					};
				};
			};
		};
	};
	
	case (toLower "hitPart") : {
		// Parameters
		private ["_parts"];
		_parts = [_parameters, 0, [], [[]]] call BIS_fnc_param;
		
		// Parameters
		private ["_object", "_shooter"];
		_object 	= [_parts, 0, objNull, [objNull]] call BIS_fnc_param;
		_shooter	= [_parts, 1, objNull, [objNull]] call BIS_fnc_param;
		
		// Can the target be shot at and shooter is player
		if (["getAnimationPhase", [_object]] call BIS_fnc_target == UP && { isPlayer _shooter }) then {
			// Whether or not the shot information should be stored
			private "_storeData";
			_storeData = _object getVariable ["RscAttributeTargetDataStore", getNumber (configFile >> "CfgVehicles" >> typeOf _object >> "dataStoreDefault")];
			
			// Should we store shot data?
			if (_storeData == TRUE) then {
				// The shooter shots data
				private "_shooterShotsData";
				_shooterShotsData = ["getShotsData", [_object, getPlayerUid _shooter]] call BIS_fnc_target;
				
				// Create shot template
				private "_shot";
				_shot = ["getShotTemplate", _parts] call BIS_fnc_target;
				
				// Store shot data
				_shooterShotsData set [count _shooterShotsData, _shot];
				
				// Store the shots data
				["setShotsData", [_object, getPlayerUid _shooter, _shooterShotsData]] call BIS_fnc_target;
			};
		};
	};
	
	case (toLower "getShooterDataIndex") : {
		// Parameters
		private ["_object", "_shooterUid"];
		_object		= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_shooterUid 	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		
		// The shooters data
		private "_shootersData";
		_shootersData = ["getShootersData", [_object]] call BIS_fnc_target;
		
		// The index
		private "_index";
		_index = -1;
		
		// Go through all data and find matching UID
		{
			// The current ID
			private "_uid";
			_uid = (_x select 0) select 1;
			
			// Do we have a match?
			if (_shooterUid == _uid) exitWith {
				_index = _forEachIndex;
			};
		} forEach _shootersData;
		
		// Return
		_index;
	};
	
	case (toLower "getShooterData") : {
		// Parameters
		private ["_object", "_shooterUid"];
		_object		= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_shooterUid 	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		
		// The shooters data
		private "_shootersData";
		_shootersData = ["getShootersData", [_object]] call BIS_fnc_target;
		
		// The shooters data index
		private "_shooterDataIndex";
		_shooterDataIndex = ["getShooterDataIndex", [_object, _shooterUid]] call BIS_fnc_target;
		
		// Make sure index is valid
		if (_shooterDataIndex != -1) then {
			// Return
			_shootersData select _shooterDataIndex;
		} else {
			// Return
			["getShooterTemplate", [_object, _shooterUid]] call BIS_fnc_target;
		};
	};
	
	case (toLower "setShooterData") : {
		// Parameters
		private ["_object", "_shooterUid", "_shooterData"];
		_object			= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_shooterUid 	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		_shooterData	= [_parameters, 2, [], [[]]] call BIS_fnc_param;
		
		// The shooters data
		private "_shootersData";
		_shootersData = ["getShootersData", [_object]] call BIS_fnc_target;
		
		// First find the shooters data index
		private "_shooterDataIndex";
		_shooterDataIndex = ["getShooterDataIndex", [_object, _shooterUid]] call BIS_fnc_target;
		
		// Make sure it is valid
		if (_shooterDataIndex != -1) then {
			// Entry is modified
			_shootersData set [_shooterDataIndex, _shooterData];
		} else {
			// Entry is added
			_shootersData set [count _shootersData, _shooterData];
		};
		
		// Save the data
		["setShootersData", [_object, _shootersData]] call BIS_fnc_target;
	};
	
	case (toLower "getShotsData") : {
		// Parameters
		private ["_object", "_shooterUid"];
		_object		= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_shooterUid	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		
		// Get the shooter data
		private "_shooterData";
		_shooterData = ["getShooterData", [_object, _shooterUid]] call BIS_fnc_target;
		
		// Make sure shooter data is not empty
		if (count _shooterData > 0) then {
			// Return
			(_shooterData select 2) select 1;
		} else {
			// Return
			[];
		};
	};
	
	case (toLower "getShotsDataFromTargets") : {
		// Parameters
		private ["_objects", "_shooterUid"];
		_objects	= [_parameters, 0, [], [[]]] call BIS_fnc_param;
		_shooterUid	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		
		// Data from all targets
		private "_shotsTotal";
		_shotsTotal = [];
		
		// Go through all target objects and get the data from shooter
		{
			// The target object
			private "_object";
			_object = _x;
			
			// The shooter data on this object
			private "_shots";
			_shots = ["getShotsData"] call BIS_fnc_target;
			
			// Add to container
			_shotsTotal = _shotsTotal + _shots;
		} forEach _objects;
		
		// Return
		_shotsTotal;
	};
	
	case (toLower "getShotsDataWithFilter") : {
		// Parameters
		private ["_object", "_shooterUid", "_by", "_code"];
		_object		= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_shooterUid	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		_by		= [_parameters, 2, "", [""]] call BIS_fnc_param;
		_code		= [_parameters, 3, {}, [{}]] call BIS_fnc_param;
		
		private "_filter";
		_filter = switch (_by) do {
			case "time" : { SHOT_TIME; };
			case "distance" : { SHOT_DISTANCE; };
			case "weapon" : { SHOT_WEAPON; };
			case "direct" : { SHOT_DIRECT; };
			case default { -1; };
		};
		
		// Make sure filter is valid
		if (_filter != -1) then {
			// The shooters shot data in this target
			private "_shots";
			_shots = ["getShotsData", [_object, _shooterUid]] call BIS_fnc_target;
			
			// The valid shots
			private "_shotsValid";
			_shotsValid = [];
			
			{
				private "_value";
				_value = (_x select _filter) select 1;
				
				// Validate value
				if (_value call _code) then {
					_shotsValid set [count _shotsValid, _x];
				};
			} forEach _shots;
			
			// Return
			_shotsValid;
		} else {
			// Return
			[];
		};
	};
	
	case (toLower "setShotsData") : {
		// Parameters
		private ["_object", "_shooterUid", "_shooterShotsData"];
		_object			= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_shooterUid		= [_parameters, 1, "", [""]] call BIS_fnc_param;
		_shooterShotsData	= [_parameters, 2, [], [[]]] call BIS_fnc_param;
		
		// Get the shooter data
		private "_shooterData";
		_shooterData = ["getShooterData", [_object, _shooterUid]] call BIS_fnc_target;
		
		// The shots container
		private "_shots";
		_shots = ["shots", _shooterShotsData];
		
		// Store shoots data
		_shooterData set [SHOTS, _shots];
		
		// Store shooter data
		["setShooterData", [_object, _shooterUid, _shooterData]] call BIS_fnc_target;
	};
	
	case (toLower "getShootersData") : {
		// Parameters
		private ["_object"];
		_object	= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		// Return
		_object getVariable [CONTAINER, []];
	};
	
	case (toLower "setShootersData") : {
		// Parameters
		private ["_object", "_data"];
		_object	= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_data	= [_parameters, 1, [], [[]]] call BIS_fnc_param;
		
		// Store
		_object setVariable [CONTAINER, _data, true];
	};
	
	case (toLower "resetShootersData") : {
		// Parameters
		private ["_object"];
		_object	= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		// Reset data
		_object setVariable [CONTAINER, [], true];
	};
	
	case (toLower "getShooterTemplate") : {
		// Parameters
		private ["_object", "_shooterUid"];
		_object		= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_shooterUid	= [_parameters, 1, "", [""]] call BIS_fnc_param;
		
		// The shooter object
		private "_shooter";
		_shooter = ["getShooterByUid", [_shooterUid]] call BIS_fnc_target;
		
		// Return
		[
			["uid", _shooterUid],
			["name", name _shooter],
			["shots", []]
		];
	};
	
	case (toLower "getShotTemplate") : {
		// Parameters
		private ["_object", "_shooter", "_bullet", "_position", "_velocity", "_selection", "_ammo", "_direction", "_radius", "_surface", "_direct"];
		_object 	= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_shooter	= [_parameters, 1, objNull, [objNull]] call BIS_fnc_param;
		_bullet		= [_parameters, 2, objNull, [objNull]] call BIS_fnc_param;
		_position	= [_parameters, 3, [], [[]]] call BIS_fnc_param;
		_velocity	= [_parameters, 4, [], [[]]] call BIS_fnc_param;
		_selection	= [_parameters, 5, [], [[]]] call BIS_fnc_param;
		_ammo		= [_parameters, 6, [], [[]]] call BIS_fnc_param;
		_direction	= [_parameters, 7, [], [[]]] call BIS_fnc_param;
		_radius		= [_parameters, 8, 0, [0]] call BIS_fnc_param;
		_surface	= [_parameters, 9, "", [""]] call BIS_fnc_param;
		_direct		= [_parameters, 10, false, [true]] call BIS_fnc_param;
		
		// Return
		[
			["time", time],
			["distance", _object distance _shooter],
			["weapon", currentWeapon _shooter],
			["direct", _direct]
		];
	};
	
	case (toLower "getShooterByUid") : {
		// Parameters
		private ["_uid"];
		_uid = [_parameters, 0, "", [""]] call BIS_fnc_param;
		
		// The shooter
		private "_shooter";
		_shooter = objNull;
		
		// Go through all units and find matching UID
		{
			if (getPlayerUid _x == _uid) exitWith {
				_shooter = _x;
			};
		} forEach playableUnits + switchableUnits;
		
		// Return
		_shooter;
	};
	
	case (toLower "uiOpen") : {
		// Parameters
		private ["_object"];
		_object	= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		// Store the target object into the UI namespace so we can get it within the onLoad of the main display
		uiNamespace setVariable [OBJECT, _object];
		
		// Open interface
		createDialog "RscDisplayTargetBoard";
	};
	
	case (toLower "uiOpenToAll") : {
		// Parameters
		private ["_object"];
		_object	= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		
		// Open interface in all connected machines
		[["uiOpen", [_object]], "BIS_fnc_target"] call BIS_fnc_mp;
	};
	
	case (toLower "uiOnLoad") : {
		// The display
		private "_display";
		_display = [_parameters, 0, displayNull, [displayNull]] call BIS_fnc_param;
		
		// The list box control
		private "_listBox";
		_listBox = _display displayCtrl IDC_RSCDISPLAYTARGETBOARD_TABLE;
		
		// Disable list box so it cannot be interacted with
		_listBox ctrlEnable false;
		
		// The target object
		private "_object";
		_object = uiNamespace getVariable [OBJECT, []];
		
		// Fill the list box
		["uiFillTable", [_object, _listBox]] call BIS_fnc_target;
	};
	
	case (toLower "uiFillTable") : {
		// Parameters
		private ["_object", "_listBox"];
		_object		= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_listBox 	= [_parameters, 1, controlNull, [controlNull]] call BIS_fnc_param;
		
		// The shooters data
		private "_shooters";
		_shooters = ["getShootersData", [_object]] call BIS_fnc_target;
		
		// The columns titles
		private "_lbCols";
		_lbCols = getArray (configFile >> "CfgVehicles" >> typeOf _object >> "lbColumns");
		
		// Fill the first row with descriptions
		_listBox lnbAddRow _lbCols;
		
		// Go through all shooters and fill the list box with them
		{
			// The shooter data
			private ["_uid", "_name", "_shots"];
			_uid 	= (_x select 0) select 1;
			_name	= (_x select 1) select 1;
			_shots	= (_x select 2) select 1;
			
			// Fill list box row
			["uiFillTableRow", [_object, _listBox, [_uid, _name, _shots]]] call BIS_fnc_target;
		} forEach _shooters;
		
		// Select first row, the one with column descriptions
		if (count _shooters > 0) then {
			_listBox lnbSetCurSelRow 0;
		};
	};
	
	case (toLower "uiFillTableRow") : {
		// Parameters
		private ["_object", "_listBox", "_shooterArray"];
		_object		= [_parameters, 0, objNull, [objNull]] call BIS_fnc_param;
		_listBox 	= [_parameters, 1, controlNull, [controlNull]] call BIS_fnc_param;
		_shooterArray	= [_parameters, 2, [], [[]]] call BIS_fnc_param;
		
		// The shooter data
		private ["_uid", "_name", "_shots"];
		_uid 	= [_shooterArray, 0, "", [""]] call BIS_fnc_param;
		_name	= [_shooterArray, 1, "", [""]] call BIS_fnc_param;
		_shots	= [_shooterArray, 2, [], [[]]] call BIS_fnc_param;
		
		// The number of shots by this shooter
		private "_shotsCount";
		_shotsCount = count _shots;
		
		// The distances
		private ["_distanceMin", "_distanceMax", "_distanceAvg"];
		_distanceMin = 9999;
		_distanceMax = -1;
		_distanceAvg = 0;
		
		// The weapons used
		private "_weaponList";
		_weaponList = [];
		
		// The number of direct shots
		private "_directShots";
		_directShots = 0;
		
		// Go through all shots and collect data
		{
			// Shot
			private ["_time", "_distance", "_weapon"];
			_time 		= (_x select SHOT_TIME) select SHOT_VALUE;
			_distance 	= (_x select SHOT_DISTANCE) select SHOT_VALUE;
			_weapon 	= (_x select SHOT_WEAPON) select SHOT_VALUE;
			_direct 	= (_x select SHOT_DIRECT) select SHOT_VALUE;
			
			// Min distance
			if (_distance < _distanceMin) then {
				_distanceMin = round _distance;
			};
			
			// Max distance
			if (_distance > _distanceMax) then {
				_distanceMax = round _distance;
			};
			
			// Distances for average
			_distanceAvg = _distanceAvg + _distance;
			
			// The weapon used
			private "_index";
			_index = -1;
			
			{
				private ["_weaponUsed", "_timesUsed"];
				_weaponUsed 	= _x select 0;
				_timesUsed 	= _x select 1;
				
				if (_weaponUsed == _weapon) exitWith {
					_index = _forEachIndex;
				};
			} forEach _weaponList;
			
			// Valid index?
			if (_index != -1) then {
				// Increment weapon used times
				_weaponList set [_index, [_weaponUsed, ((_weaponList select _index) select 1) + 1]];
			} else {
				// Add weapon as used
				_weaponList set [count _weaponList, [_weaponUsed, 1]];
			};
			
			// Direct shot?
			if (_direct) then {
				_directShots = _directShots + 1;
			};
		} forEach _shots;
		
		// The list of weapons used, sorted by the number of times used
		private "_weaponListSorted";
		_weaponListSorted = [_weaponList, nil, { _x select 1 }, "DESCEND"] call BIS_fnc_sortBy;
		
		// The favourite weapon
		private "_weaponFavourite";
		_weaponFavourite = if (count _weaponListSorted > 0) then { _weaponListSorted select 0; } else { ""; };
		
		// Calculate average
		_distanceAvg = round (_distanceAvg / _shotsCount);
		
		// Fill row
		_listBox lnbAddRow [_name, str _shotsCount, str _distanceMin + " m", str _distanceMax + " m", str _distanceAvg + " m", str _directShots];
	};
	
	case default {
		// Error
		["Invalid action: %1", _action] call BIS_fnc_error;
	};
};

/*
	DATA STRUCTURE
	
	// Shooters
	[
		// Shooter
		[
			["uid", ""],
			["name", ""],
			["shots",
			// Shots
			[
				// Shot
				[
					["time", 0],
					["distance", 0]
				]
			]]
		]
	]

*/
