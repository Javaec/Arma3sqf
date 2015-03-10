private ["_pos","_radius","_selectRandom","_types","_pos","_nearLocations","_posLocation","_nearObjects"];

_pos =		[_this,0,position vehicle player] call bis_fnc_param;
_radius =	[_this,1,999999,[0]] call bis_fnc_param;
_selectRandom =	[_this,2,false,[false]] call bis_fnc_param;
_types =	[_this,3,["Heliport"],[[]]] call bis_fnc_param;

//--- Find all helipads around
_pos = _pos call bis_fnc_position;
_nearLocations = nearestLocations [_pos,_types,_radius];

if (count _nearLocations > 0) then {
	_location = if (_selectRandom) then {

		//--- Select random helipad
		_nearLocations call bis_fnc_selectrandom;
	} else {

		//--- Select nearest helipad
		[_nearLocations,_pos] call bis_fnc_nearestPosition;
	};
	_posLocation = position _location;

	//--- Find helipad object
	_nearObjects = _posLocation nearobjects ["RooftopLanding_Base_H",500];
	if (count _nearObjects > 0) then {
		[(_nearObjects select 0) modeltoworld [0,0,1],(_nearObjects select 0),_location];
	} else {
		[_posLocation,objnull,_location]
	};
	
} else {

	//--- No locations found
	[[0,0,0],objnull,locationnull]
};