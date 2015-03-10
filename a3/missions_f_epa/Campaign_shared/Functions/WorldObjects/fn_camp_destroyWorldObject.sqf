/*
	Author: Jiri Wainar

	Description:
	Destroy a world object defined by a class name in:

		\A3\Missions_F_EPA\Campaign_shared\cfgWorldObjects.hpp

	Returns:
	-

	Syntax:
	nil = [_id:string] call BIS_fnc_camp_destroyWorldObject;
*/

#define STRING		typeName ""
#define ARRAY		typeName []

private["_cfgWorldObjects","_defined","_island","_id","_object","_bruteForce","_ruin"];

_cfgWorldObjects = missionconfigfile >> "WorldObjects";
_defined 	 = _cfgWorldObjects call Bis_fnc_getCfgIsClass;
_island		 = worldName;

if !(_defined) exitWith
{
	["Definition of *World Objects* not found."] call BIS_fnc_logFormat;
};

_id 	= [_this, 0, objNull, [""]] call BIS_fnc_param;
_object = [_id] call BIS_fnc_camp_getWorldObject;

if (isNull _object) exitWith
{
	//["Destruction failed, object is NULL!"] call BIS_fnc_logFormat;
};

_bruteForce = [_cfgWorldObjects,_island,_id,"bruteForce"] call BIS_fnc_getCfgDataBool;
_ruin	    = [_cfgWorldObjects,_island,_id,"classRuin"] call BIS_fnc_getCfgData;

if (_bruteForce) exitWith
{
	_object setDamage 1;
};

if (_ruin == "") exitWith
{
	["Replacing by ruin failed, ruin class for id '%1' is empty string!",_id] call BIS_fnc_error;
};

//does the ruin exists?
if (isClass (configfile >> "CfgVehicles" >> _ruin)) then
{
	private["_pos","_dir"];

	_pos = getPosASL _object;
	_dir = getDir _object;

	//hide current object
	_object hideObject true;

	//create ruin
	_object = createVehicle [_ruin, getPos _object, [], 0, "CAN_COLLIDE"];
	_object setPosASL _pos;
	_object setDir _dir;
}
//no ruin, just destroy the building
else
{
	["Replacing by ruin failed, ruin class for id '%1' doesn't exist! Brute force used instead!",_id] call BIS_fnc_error;

	_object setDamage 1;
};