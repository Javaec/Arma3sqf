/*
	Author: Joris-Jan van 't Land, modified by Jiri Wainar

	Description:
	Set a unit's height.

	Parameter(s):

	... if 1st parameter is an object:
	----------------------------------
	_this select 0: OBJECT 		  - affected object
	_this select 1: NUMBER 		  - height in meters
	_this select 2 (Optional): ARRAY  - position (default: object's position)
	_this select 3 (Optional): STRING - relative to (default: "ROADWAY", accepted: "ROADWAY","ASL","ATL")

	... if 1st parameter is a number:
	---------------------------------
	_this select 0: NUMBER 		  - heigth applied to 'this' (for use in init fields).
	_this select 1 (Optional): STRING - relative to (default: "ROADWAY", accepted: "ROADWAY","ASL","ATL")

	Returns:
	Bool
*/

private ["_obj", "_height", "_pos", "_ref"];
_obj = [_this, 0, player, [objNull,0]] call BIS_fnc_Param;

if (typename _obj == typename objnull) then
{
	//--- Set height to an object
	_height = [_this, 1, 0, [-1]] call BIS_fnc_Param;
	_pos = [_this, 2, position _obj, [[]]] call BIS_fnc_Param;
	_ref = [_this, 3, "ROADWAY", [""]] call BIS_fnc_Param;
	_ref =  toLower _ref;
	_pos set [2, _height];

	switch (_ref) do
	{
		case "asl":
		{
			_obj setPosASL _pos;
		};
		case "atl":
		{
			_obj setPosATL _pos;
		};
		default
		{
			_obj setPos _pos;
		};
	};
}
else
{
	_height = _obj;

	_pos = position this;
	_pos set [2, _height];
	_ref = [_this, 1, "ROADWAY", [""]] call BIS_fnc_Param;
	_ref =  toLower _ref;

	//--- Set height to 'this' in init line
	switch (_ref) do
	{
		case "asl":
		{
			this setPosASL _pos;
		};
		case "atl":
		{
			this setPosATL _pos;
		};
		default
		{
			this setPos _pos;
		};
	};
};

true