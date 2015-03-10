/*
	Author: Karel Moricky

	Description:
	Selects random position of given params within given area

	Parameter(s):
	_this select 0 (Optional): ARRAY - whitelist of elements:
		ARRAY - [center,radius]
		OBJECT - trigger
		STRING - one of following tags:
			"water" - all water surfaces
			"ground" - all ground surfaces
			"out" - area outside of map area
		Default value - map area
	_this select 1 (Optional): ARRAY - blacklist (same rules are for whitelist)
		Default value: ["water","out"]
	_this select 2 (Optional): CODE - custom condition

	Returns:
	ARRAY - [x,y,z]
*/


private ["_whiteList","_blackList","_condition","_result","_fnc_inList"];

_whiteList =	[_this,0,[[] call BIS_fnc_worldArea],[[]]] call bis_fnc_param;
_blackList =	[_this,1,["water","out"],[[]]] call bis_fnc_param;
_condition =	[_this,2,{true},[{}]] call bis_fnc_param;

_result = [0,0];

//--- Read white/blacklist value
_fnc_inList = {
	private ["_area"];
	_area = [_this,0,"",[[],"",objnull]] call bis_fnc_param;

	switch (typename _area) do {

		//--- In trigger
		case (typename []): {
			[_area,_posCandidate] call BIS_fnc_inTrigger;
		};
		case (typename objnull): {
			[_area,_posCandidate] call BIS_fnc_inTrigger;
		};

		//--- Special tags
		case (typename ""): {
			_area = tolower _area;
			switch _area do {
				case "water": {surfaceiswater _posCandidate};
				case "ground": {!surfaceiswater _posCandidate};
				case "out": {!([[] call BIS_fnc_worldArea,_posCandidate] call bis_fnc_inTrigger)};
				default {false};
			};
		};
		default {false}
	};
};

//--- Attempt to find position candidate
for "_i" from 0 to 99 do {
	private ["_area","_isGround"];

	//--- Select random position in random area
	_area = _whiteList call bis_fnc_selectrandom;
	_posCandidate = _area call bis_fnc_randomPosTrigger;

	//--- Conditions
	if (
		{_x call _fnc_inList} count _blackList == 0
		&&
		_posCandidate call _condition
	) exitwith {
		_result = _posCandidate
	};
};


_result