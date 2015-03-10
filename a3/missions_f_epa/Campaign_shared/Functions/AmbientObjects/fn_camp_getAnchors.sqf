/*
	Author: Jiri Wainar

	Description:
	Returns array of all anchors for given object.

	Example:

	[_anchor1Data:array,_anchor2Data:array,...] = _surfaceObject call BIS_fnc_camp_getAnchors;

	Anchor structure:
	0: _anchorPos:array 		- ASL position
	1: _anchorDir:scalar		- direction of the anchor point
	2: _surfaceClass:string		- class of the surface object (eg. table)
	3: _maxSize:scalar		- max. allowed size of the spawned object
	4: _coreGroup:string		- class of the object group as listed in cfgHubObjects.hpp (eg. "OfficeSmall")
	5: _coreClass:string		- class of the core / central object
	6: _xtraData:array		- array of data arrays for 1 or more xtra objects
	[
		[
			0: _group	- xtra object group as listed in cfgHubObjects.hpp (eg. "OfficeSmall")
			1: _class	- xtra object class
			2: _dir		- direction from the core / central object
		],[...],[...],..
	]
*/

private["_fnc_log_disable","_anchorPool","_surfaceObject","_surfaceClass","_anchorDir","_anchorPos","_anchor","_anchorOffsets","_anchorOffset","_maxSize","_fixDir","_probability","_randomX","_randomY","_show"];

//surpress the debuglog output
_fnc_log_disable = true;

_surfaceObject = _this;

if (isNil "_surfaceObject") exitWith
{
	["Surface object cannot be nil!"] call BIS_fnc_error;
	[]
};

if (isNull _surfaceObject) exitWith
{
	["Surface object cannot be null!"] call BIS_fnc_error;
	[]
};

_surfaceClass = _surfaceObject getVariable ["BIS_SurfaceObject", typeOf _surfaceObject];

if !(isClass (missionconfigfile >> "HubObjects" >> "SurfaceObjects" >> _surfaceClass)) then
{
	["[!] Surface object '%1' is not defined in config. Using the default values.",_surfaceClass] call BIS_fnc_logFormat;

	_surfaceClass = "Default";
};

_probability	= ["HubObjects","SurfaceObjects",_surfaceClass,"probability"] call BIS_fnc_getCfgData;
_maxSize	= ["HubObjects","SurfaceObjects",_surfaceClass,"maxSize"] call BIS_fnc_getCfgData;
_fixDir		= ["HubObjects","SurfaceObjects",_surfaceClass,"fixDir"] call BIS_fnc_getCfgData;
_randomX	= ["HubObjects","SurfaceObjects",_surfaceClass,"randomX"] call BIS_fnc_getCfgData;
_randomY	= ["HubObjects","SurfaceObjects",_surfaceClass,"randomY"] call BIS_fnc_getCfgData;
_show		= ["HubObjects","SurfaceObjects",_surfaceClass,"show"] call BIS_fnc_getCfgDataBool;
_anchorPool 	= [];
_anchorDir  	= getDir _surfaceObject;

_surfaceObject 	setDir _anchorDir;			//make the anchor / surface object horizontal
_anchorDir	= _anchorDir + _fixDir;			//fix the anchor orientation if the surface object is wrongly turned

private["_temp","_i","_baseOffset","_levelOffset","_count","_height"];

_temp  	       = ["HubObjects","SurfaceObjects",_surfaceClass,"anchors"] call BIS_fnc_getCfgDataArray;
_anchorOffsets = [];

//hide surface object, if it shouldn't be visible
if !(_show) then
{
	_surfaceObject hideObject true;
};

//parse the anchor data and check for automation input
{
	//automation defined, caluclate the anchors
	if (count _x > 3) then
	{
		_baseOffset = [_x select 0,_x select 1,_x select 2];
		_count 	    = _x select 3;
		_height     = _x select 4;

		/*
		if ((random 1) < _probability) then
		{
			_anchorOffsets set [count _anchorOffsets,_baseOffset];
		};
		*/

		for "_i" from 0 to _count do
		{
			if ((random 1) < _probability) then
			{
				_levelOffset = [_x select 0,_x select 1,(_x select 2) + _i * _height];
				_anchorOffsets set [count _anchorOffsets,_levelOffset];
			};
		};
	}
	//no automation, add the anchor streight away
	else
	{
		if ((random 1) < _probability) then
		{
			_anchorOffsets set [count _anchorOffsets,_x];
		};
	};
}
forEach _temp;

private ["_x","_y","_z"];

{
	_anchorOffset = _x;

	_x = _anchorOffset select 0;
	_y = _anchorOffset select 1;
	_z = _anchorOffset select 2;

	//auto-detect top of the object, like tabletop
	if (_z >= 1000) then
	{
		_z = _z - 1000 + (_surfaceObject call BIS_fnc_objectHeight);
	};
	if (_z <= -1000) then
	{
		_z = _z + 1000 + (_surfaceObject call BIS_fnc_objectHeight) ;
	};

	//randomize _x and _y
	_x = -_randomX + random(2*_randomX) + _x;
	_y = -_randomY + random(2*_randomY) + _y;

	_anchorOffset set [0,_x];
	_anchorOffset set [1,_y];
	_anchorOffset set [2,_z];

	//get the anchor position
	_anchorOffset = [_surfaceObject worldToModel (getPosATL _surfaceObject),_anchorOffset] call BIS_fnc_vectorAdd;
	_anchorPos = _surfaceObject modelToWorld _anchorOffset;
	_anchorPos = ATLtoASL _anchorPos;

	//debug
	if (isNil "BIS_debugMode") then
	{
		BIS_debugMode = false;
	};
	if (isNil "BIS_showHelpers") then
	{
		BIS_showHelpers = false;
	};

	/*
	if (BIS_debugMode && BIS_showHelpers) then
	{
		[_anchorPos,"Sign_Pointer_Pink_F",nil,nil,_anchorDir] call BIS_fnc_spawnObjects;
	};
	*/

	//store anchor
	_anchor = [_anchorPos,_anchorDir,_surfaceClass,_maxSize];
	_anchorPool set [count _anchorPool,_anchor];
}
forEach _anchorOffsets;

_anchorPool