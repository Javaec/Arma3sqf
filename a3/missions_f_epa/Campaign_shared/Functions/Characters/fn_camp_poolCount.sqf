/*
	Author: Jiøí Wainar

	Example:
	_count = ["weapon","arifle_katiba_f"] call BIS_fnc_camp_poolCount;
*/

private["_type","_class","_pool","_count"];

_type  	= _this call BIS_fnc_camp_getEquipType;
_class 	= _this call BIS_fnc_camp_getEquipClass;
_pool 	= missionnamespace getVariable format["BIS_PER_POOL_%1",_type];

_count 	= [_pool,_class,0] call BIS_fnc_getFromPairs;

_count