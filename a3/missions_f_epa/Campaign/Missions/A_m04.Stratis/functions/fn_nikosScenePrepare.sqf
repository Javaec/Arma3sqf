//Parameters
private ["_nikos", "_group", "_vehicle", "_units", "_position"];
_nikos 		= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_group		= [_this, 1, grpNull, [grpNull]] call BIS_fnc_param;
_vehicle	= [_this, 2, objNull, [objNull]] call BIS_fnc_param;
_units		= [_this, 3, [], [[]]] call BIS_fnc_param;
_position	= [_this, 4, [], [[]]] call BIS_fnc_param;

//The nearest road segment
private "_nearestRoad";
_nearestRoad = [_position, 50] call BIS_fnc_nearestRoad;

//Set vehicle position and direction
_vehicle setPos position _nearestRoad;
_vehicle setDir (getDir _nearestRoad + 180);

//Damage front vehicle wheels
{
	_vehicle setHit [_x, 1];
} forEach [
	"wheel_1_1_steering",
	"wheel_2_1_steering"
];

//Vehicle damage particle effects
[_vehicle, [["AmmoSmokeParticles2", [-0.5, 1, 0]]]] call BIS_fnc_a_m04_particleEffect;

//Turn off the vehicle engine
_vehicle engineOn false;

//Turn off the vehicle headlights
_nikos action ["lightOff", _vehicle];

//The position for the dead guy
private "_deadPosition";
_deadPosition = _vehicle modelToWorld [-4, 3, 0];
_deadPosition set [2, 0];

//Remove from units container
_units = _units - [_nikos];

//Make nikos disapear, we only need his friend
deleteVehicle _nikos;

//Get nikos friend object
private "_friend";
_friend = _units select 0;

//Move him
_friend setPos _deadPosition;

//Remove vest
removeVest _friend;

//Proper animation
_friend switchMove "AinjPpneMstpSnonWnonDnon";

//Kill him
_friend setDamage 1;

//Remove event handlers of the vehicle
if (!isNil { _vehicle getVariable "BIS_handleDamage" }) then {
	_vehicle removeEventHandler ["HandleDamage", _vehicle getVariable "BIS_handleDamage"];
};
if (!isNil { _vehicle getVariable "BIS_hit" }) then {	
	_vehicle removeEventHandler ["Hit", _vehicle getVariable "BIS_hit"];
};
