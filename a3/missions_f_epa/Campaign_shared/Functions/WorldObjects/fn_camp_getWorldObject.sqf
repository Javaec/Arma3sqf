/*
	Author: Jiri Wainar

	Description:
	Get world object by searching the map according to the info from:

		\A3\Missions_F_EPA\Campaign_shared\cfgWorldObjects.hpp

	Params:
	0: _id:string		Class from 'cfgWorldObjects.hpp' associated with the object.
	1: _getRuin:bool 	Shall search for ruin or undamaged object (default: false)?

	Syntax:
	_worldObject:object = [_id:string,_getRuin:bool] call BIS_fnc_camp_getWorldObject;
*/

#define STRING		typeName ""
#define ARRAY		typeName []

private["_cfgWorldObjects","_defined","_id","_getRuin","_class","_position","_radius","_objects","_object"];

_id		= [_this, 0, "", [""]] call BIS_fnc_param;
_getRuin	= [_this, 1, false, [true]] call BIS_fnc_param;

if (typeName _id != STRING) exitWith
{
	["Object id must be a string!"] call BIS_fnc_error;

	objNull
};

_cfgWorldObjects = missionconfigfile >> "WorldObjects" >> worldName >> _id;
_defined 	 = _cfgWorldObjects call Bis_fnc_getCfgIsClass;

if !(_defined) exitWith
{
	//["Cannot find definition of *World Object* for: %1 >> %2",worldName,_id] call BIS_fnc_logFormat;

	objNull
};

if (_getRuin) then
{
	_class	= [_cfgWorldObjects,"classRuin"] call BIS_fnc_getCfgData;
}
else
{
	_class	= [_cfgWorldObjects,"classOk"] call BIS_fnc_getCfgData;
};

_position 	= [_cfgWorldObjects,"position"] call BIS_fnc_getCfgDataArray;
_radius   	= [_cfgWorldObjects,"radius"] call BIS_fnc_getCfgData;


if (_position distance [0,0,0] < 1) exitWith
{
	["Position param of object id '%1' is mandatory!",_id] call BIS_fnc_error;

	objNull
};

if (_radius <= 0) then
{
	_objects = [nearestObject [_position, _class]] - [objNull];
}
else
{
	_objects = (_position nearObjects [_class, _radius]) - [objNull];
};

if (count _objects == 0) exitWith
{
	if (_getRuin) then
	{
		//["Detection of DESTROYED object id '%1' failed!",_id] call BIS_fnc_logFormat;
	}
	else
	{
		//["Detection of object id '%1' failed!",_id] call BIS_fnc_logFormat;
	};

	objNull
};

_object = _objects select 0;

_object