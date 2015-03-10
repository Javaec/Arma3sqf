/*******************************************************************************

	Author: Jiri Wainar

	Description:
	Place object relative to another object.

	Parameter(s):
	_this select 0: OBJECT - parent object
	_this select 1: OBJECT - child object what will be placed
	_this select 2: ARRAY  - offset [x,y,z] in parent object coords
	_this select 3: SCALAR (optional) - direction of the child object

	Example:
	[BIS_briefingTable,BIS_map,[0,0,1]] call BIS_fnc_relPosObject;

	Returns:
	-

	Example of quick preview code:
	[BIS_briefingTable,BIS_map,[0,-0.58,0.857],98] call BIS_fnc_relPosObject;
	BIS_briefingTable setPos getPos BIS_briefingTable;

*******************************************************************************/

private["_parent","_child","_offset","_dir","_localPos","_worldPos"];

_parent    = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_child     = [_this,1,objNull,[objNull]] call BIS_fnc_param;
_offset    = [_this,2,[0,0,0],[[]]] call BIS_fnc_param;
_dir 	   = [_this,3,0,[123]] call BIS_fnc_param;
_parentSim = [_this,4,false,[false]] call BIS_fnc_param;
_childSim  = [_this,5,false,[false]] call BIS_fnc_param;

//get the anchor position
_localPos = [_parent worldToModel (getPosATL _parent),_offset] call BIS_fnc_vectorAdd;
_worldPos = _parent modelToWorld _localPos;
_worldPos = ATLtoASL _worldPos;

_child setPosASL _worldPos;
_child setDir ((getDir _parent) + _dir);

_parent enableSimulation _parentSim;
_child enableSimulation _childSim;