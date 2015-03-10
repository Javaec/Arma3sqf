// Limit view distance
setViewDistance 1000;

// Force an object to always face the player
BIS_facePlayer = {
	private ["_object"];
	_object = _this;
	
	// Create logic
	private ["_group", "_logic"];
	_group = createGroup sideLogic;
	_logic = _group createUnit ["Logic", [10,10,10], [], 0, "NONE"];
	_logic setPosATL getPosATL _object;
	_logic setDir direction _object;
	_object attachTo [_logic, [0,0,0]];
	
	_object setVariable ["BIS_facePlayer_logic", _logic];
	
	// Face the player
	private ["_EH"];
	_EH = [
		format ["BIS_%1_facePlayer", _object],
		"onEachFrame",
		{
			private ["_logic", "_dir"];
			_logic = _this select 0;
			_dir = [_logic, player] call BIS_fnc_dirTo;
			_logic setDir _dir;
		},
		[_logic]
	] call BIS_fnc_addStackedEventHandler;
	
	_object setVariable ["BIS_facePlayer_EH", _EH];
	
	// Stop when killed
	_object addEventHandler [
		"Killed",
		{
			private ["_object"];
			_object = _this select 0;
			
			[_object getVariable "BIS_facePlayer_EH", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
			deleteVehicle (_object getVariable "BIS_facePlayer_logic");
			
			{_object setVariable [_x, nil]} forEach ["BIS_facePlayer_EH", "BIS_facePlayer_logic"];
		}
	];
};

// Create targets
BIS_createTarget = {
	private ["_pos", "_stance"];
	if (count _this == 3) then {
		_pos = _this;
		_stance = ["Stand", "Kneel"] call BIS_fnc_selectRandom;
	} else {
		_pos = [_this, 0, [10,10,10], [[]], 3] call BIS_fnc_param;
		_stance = [_this, 1, "", [""]] call BIS_fnc_param;
	};
	
	private ["_group"];
	_group = createGroup EAST;
	
	// Create the target
	private ["_target"];
	_target = _group createUnit ["O_Soldier_VR_F", [10,10,10], [], 0, "NONE"];
	
	// Randomize its loadout
	[
		_target,
		["O_Soldier_F", "O_Soldier_LAT_F", "O_Soldier_AR_F", "O_soldier_M_F"] call BIS_fnc_selectRandom,
		["uniform", "magazines", "items", "assignedItems"]
	] call BIS_fnc_loadInventory;
	
	_target linkItem "NVGoggles_OPFOR";
	_target setCaptive true;
	{_target disableAI _x} forEach ["ANIM", "AUTOTARGET", "MOVE", "TARGET"];
	
	_target setVariable ["BIS_createTarget_stance", _stance];
	_target setVariable ["BIS_createTarget_anim", format ["HubShootingRange%1_move", _stance]];
	_target setVariable ["BIS_createTarget_numbers", [1,2,3,4]];
	
	// Play animation
	private ["_anim", "_numbers"];
	_anim = _target getVariable "BIS_createTarget_anim";
	_numbers = _target getVariable "BIS_createTarget_numbers";
	
	private ["_number"];
	_number = _numbers call BIS_fnc_selectRandom;
	_numbers = _numbers - [_number];
	_target setVariable ["BIS_createTarget_numbers", _numbers];
	
	_target switchMove (_anim + str _number);
	
	// Loop animations
	private ["_animEH"];
	_animEH = _target addEventHandler [
		"AnimDone",
		{
			private ["_unit"];
			_unit = _this select 0;
			
			private ["_anim", "_numbers"];
			_anim = _target getVariable "BIS_createTarget_anim";
			_numbers = _target getVariable "BIS_createTarget_numbers";
			if (count _numbers == 0) then {_numbers = [1,2,3,4]};
			
			private ["_number"];
			_number = _numbers call BIS_fnc_selectRandom;
			_numbers = _numbers - [_number];
			_target setVariable ["BIS_createTarget_numbers", _numbers];
			
			_target switchMove (_anim + str _number);
		}
	];
	
	_target setVariable ["BIS_createTarget_animEH", _animEH];
	
	_target addEventHandler [
		"Killed",
		{
			private ["_unit"];
			_unit = _this select 0;
			
			// Deactivate marker
			private ["_marker"];
			_marker = format ["BIS_%1_marker", _unit];
			[_marker, "DEACTIVATE"] call BIS_markerControl;
			
			// Break the anim loop when killed
			_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_createTarget_animEH"];
			_unit setVariable ["BIS_createTarget_animEH", nil];
			
			// Reset animation
			if (_unit getVariable "BIS_createTarget_stance" == "Stand") then {
				// Stand
				_unit switchMove "AmovPercMstpSrasWrflDnon";
			} else {
				// Kneel
				_unit switchMove "AmovPknlMstpSrasWrflDnon";
			};
			
			// Delete marker when he disappears
			[_unit, _marker] spawn {
				private ["_unit", "_marker"];
				_unit = _this select 0;
				_marker = _this select 1;
				
				scriptName (format ["BIS_createTarget: marker control - [%1, %2]", _unit, _marker]);
				
				// Delete marker
				_marker = missionNamespace getVariable _marker;
				waitUntil {isNull _unit};
				deleteVehicle _marker;
			};
		}
	];
	
	// Disappear appropriately when killed
	[_target, false, 0.6] call BIS_fnc_VREffectKilled;
	
	// Move into position
	_target setPos _pos;
	_target setDir ([_target, player] call BIS_fnc_dirTo);
	
	// Ensure it always faces the player
	_target call BIS_facePlayer;
	
	// Spawn effect
	_target call BIS_fnc_VRSpawnEffect;
	
	// Create marker
	private ["_marker"];
	_marker = format ["BIS_%1_marker", _target];
	[_marker, "CREATE", _pos] call BIS_markerControl;
	[_marker, "ACTIVATE"] call BIS_markerControl;
	
	// Return the target
	_target
};

// Move objects
BIS_moveObject = {
	private ["_object", "_pos"];
	_object = _this select 0;
	_pos = _this select 1;
	
	// Determine whether to move the logic or the object
	private ["_move"];
	_move = _object getVariable ["BIS_facePlayer_logic", _object];
	
	// Hide
	[_object, true] call BIS_fnc_VRSpawnEffect;
	
	sleep 1;
	
	// Move
	_move setPos _pos;
	
	sleep 0.25;
	
	// Unhide
	_object call BIS_fnc_VRSpawnEffect;
};

// Control markers
BIS_markerControl = {
	private ["_var", "_mode", "_pos"];
	_var = [_this, 0, "", [""]] call BIS_fnc_param;
	_mode = [_this, 1, "", [""]] call BIS_fnc_param;
	_pos = [_this, 2, [10,10,10], [[]], 3] call BIS_fnc_param;
	
	private ["_marker"];
	_marker = missionNamespace getVariable [_var, objNull];
	
	if (_mode == "CREATE") then {
		// Create marker for the first time
		_marker = createVehicle ["VR_Area_01_square_1x1_grey_F", [10,10,10], [], 0, "NONE"];
	} else {
		// Delete old marker
		_pos = position _marker;
		deleteVehicle _marker;
		
		if (_mode == "ACTIVATE") then {
			// Activate marker
			_marker = createVehicle ["VR_Area_01_square_1x1_yellow_F", [10,10,10], [], 0, "NONE"];
		} else {
			// Deactivate marker
			_marker = createVehicle ["VR_Area_01_square_1x1_grey_F", [10,10,10], [], 0, "NONE"];
		};
	};
	
	_marker setPos _pos;
	missionNamespace setVariable [_var, _marker];
};

// Prevent player from moving
BIS_stopMoving = {
	_this spawn {
		scriptName "init.sqf: BIS_stopMoving";
		
		private ["_stop"];
		_stop = [_this, 0, true, [true]] call BIS_fnc_param;
		
		playSound "Topic_Trigger";
		
		if (!(_stop)) then {
			// Let the player move
			BIS_stopMoving_resume = true;
		} else {
			// Stop the player from moving
			BIS_stopMoving_resume = false;
			
			private ["_pos"];
			_pos = position player;
			
			while {!(BIS_stopMoving_resume)} do {
				player setPos _pos;
				player setVelocity [0,0,0];
				sleep 0.025;
			};
		};
	};
};