scriptName "Showcase_Night\scripts\insertion.sqf";

//Params
private ["_position", "_direction"];
_position  = getMarkerPos "BIS_markerInsertionBoatSpawnPosition";
_direction = [_position, getMarkerPos "BIS_markerStart"] call BIS_fnc_dirTo;

//The insertion vehicle
private ["_boatContainer", "_boat", "_boatCrew", "_boatGroup", "_boatDriver"];
_boatContainer	= [_position, _direction, "B_Boat_Transport_01_F", WEST] call BIS_fnc_spawnVehicle;
_boat 		= _boatContainer select 0;
_boatCrew	= _boatContainer select 1;
_boatGroup	= _boatContainer select 2;
_boatDriver	= driver _boat;

//The boat driver
BIS_insertionBoatDriver = _boatDriver;
_boatDriver unassignItem "NVGoggles";
_boatDriver removeItem "NVGoggles";
removeHeadgear _boatDriver;
removeVest _boatDriver;
removeGoggles _boatDriver;
_boatGroup setGroupId ["Rook"];
_boatDriver setIdentity "PB_B_BoatDriver";
_boatDriver addHeadgear "H_Booniehat_dgtl";

//We need to handle if player kills the boat driver or destroys the boat, making the extraction afterwards impossible
private ["_eventhandlerKilled", "_eventhandlerGetOut", "_eventhandlerDriverKilled"];
_eventhandlerKilled 		= _boat addEventHandler ["Killed", { BIS_insertionBoatDestroyed = true; }];
_eventhandlerGetOut 		= _boat addEventHandler ["GetOut", { if (_this select 1 == "driver") then { BIS_insertionBoatDestroyed = true; }; }];
_eventhandlerDriverKilled 	= _boatDriver addEventHandler ["Killed", { BIS_insertionBoatDriverKilled = true; }];

//Move the player inside the boat
BIS_player moveInCargo [_boat, 2];

//Lock the boat so player cannot leave
_boat lock true;

//Set as captive both the boat and driver so enemy AI does not notice it
//Otherwise it could break the scene completely
_boat setCaptive true;
_boatDriver setCaptive true;

//Disable it's AI abilities
//Otherwise he boat driver may detect enemy and behave wierdly
_boat disableAi "FSM";
_boat disableAi "TARGET";
_boat disableAi "AUTOTARGET";

//The destination position
//Here is where the player and his team members will be dropped
private "_destination";
_destination = getMarkerPos "BIS_markerStart";

//Make boat move to destination
_boat doMove _destination;

//Wait
sleep 15;

//Conversation - Player requests boat driver to slow down and some more chatter with bishop team
[] spawn {
	"BIS_slowDownBoat" call BIS_fnc_missionConversations;
	sleep 10;
	"BIS_reportIn" call BIS_fnc_missionConversations;
	sleep 20;
	"BIS_quickBriefing1" call BIS_fnc_missionConversations;
	sleep 34;
	"BIS_quickBriefing2" call BIS_fnc_missionConversations;
	sleep 35;
	"BIS_quickBriefing3" call BIS_fnc_missionConversations;
};

//Wait
sleep 5;

//Force slow speed
_boat forceSpeed 4;

//Wait for boat be ready at destination
waituntil {
	_boat distance _destination < 20
};

//Disable moving abilities so boat does not stop by itself
_boat disableAi "MOVE";

//Turn off the engine
_boat engineOn false;

//Cut the fuel
_boat setFuel 0;

//Conversation - Boat driver says good luck
"BIS_goodLuck" call BIS_fnc_missionConversations;

//Wait
sleep 7.5;

// Do not allow player damage
player allowDamage false;

//Eject player
unassignVehicle player;
doGetOut player;
player action ["Eject", vehicle player];

// Wait for player to be outside of the vehicle
waitUntil { vehicle player == player };

// Move player to correct position, in land, in front of the boat
player setPos ([_boat, 15, getDir _boat] call BIS_fnc_relPos);

//*************************
//Player has been inserted
BIS_playerHasLanded = true;

// Log
"Showcase Night: Player has landed" call BIS_fnc_log;
//*************************

// Allow player damage
[] spawn {
	sleep 5;
	player allowDamage true;
};

//Set players direction, facing Lighthouse
player setDir 117;
player setPos getPos player;

//Set stealth behaviour and Hold Fire mode
group player setBehaviour "STEALTH";
group player setCombatMode "GREEN";

//Add fuel
_boat setFuel 1;

//Turn on the engine
_boat engineOn true;

//The boat's final destination
//Boat will move here and be deleted
private "_finalDestination";
_finalDestination = getMarkerPos "BIS_markerInsertionBoatExit";

//The wanted direction
private "_wantedDirection";
_wantedDirection = [_boat, _finalDestination] call BIS_fnc_dirTo;

//Make sure we have the direction is > 0
if (_wantedDirection < 0) then {
	_wantedDirection = _wantedDirection + 360;
};

//Make sure the direction is between 0-360
if (_wantedDirection > 360) then {
	_wantedDirection = _wantedDirection % 360;
};

//Loop that handles boat direction
//While boat is not facing the direction we want it to, we set it's direction manually
//This is a robust work around the problem with the AI being unable to reverse/turn around when near the coast
while { round(getDir _boat) > round(_wantedDirection) || round (getDir _boat) < round(_wantedDirection) } do {
	if (getDir _boat > _wantedDirection) then {
		_boat setDir (getDir _boat - 0.5);
	} else {
		_boat setDir (getDir _boat + 0.5);
	};
	
	sleep 0.025;
};

//Enable boat's AI ability to move, this has been disabled before
_boat enableAi "MOVE";

//Make boat move away
_boat doMove _finalDestination;

//Wait for boat to be a bit far from the beach
//Then he can speed up, giving the impression of a stealth insertion from beggining to end
waituntil {
	_boat distance _destination > 100
};

//Speed up
_boat forceSpeed -1;

//Remove eventhandlers from boat and it's driver
_boat removeEventHandler ["Killed", _eventhandlerKilled];
_boat removeEventHandler ["GetOut", _eventhandlerGetOut];
_boatDriver removeEventHandler ["Killed", _eventhandlerDriverKilled];

//Wait for the boat to be ready at final destination
//Then we delete it
waituntil {
	unitReady _boat
};

//Get all related objects
private ["_driver", "_group"];
_driver = driver _boat;
_group = group _driver;

//Cleanup
deleteVehicle _driver;
deleteGroup _group;
deleteVehicle _boat;

//Log
"Showcase_Night\scripts\insertion.sqf" call BIS_fnc_log;
