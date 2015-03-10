scriptName "Showcase_Night\scripts\insertionE3.sqf";

//Params
private ["_positionBoat", "_directionBoat", "_positionPlayer", "_directionPlayer"];
_positionBoat  		= getMarkerPos "BIS_markerStart";
_directionBoat 		= 270;
_positionPlayer  	= [_positionBoat, 10, 80] call BIS_fnc_relPos;
_directionPlayer 	= 117;

//The insertion vehicle
private ["_container", "_boat", "_boatCrew", "_boatGroup", "_boatDriver"];
_container	= [_positionBoat, _directionBoat, "B_Boat_Transport_01_F", WEST] call BIS_fnc_spawnVehicle;
_boat 		= _container select 0;
_boatCrew	= _container select 1;
_boatGroup	= _container select 2;
_boatDriver	= driver _boat;

//Player starts at the beach
player setDir _directionPlayer;
player setPos _positionPlayer;

//Make the boat leave
_boat doMove getMarkerPos "BIS_markerInsertionBoatExit";

//*************************
//Player has been inserted
BIS_playerHasLanded = true;
//*************************

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
"Showcase_Night\scripts\insertionE3.sqf" call BIS_fnc_log;
