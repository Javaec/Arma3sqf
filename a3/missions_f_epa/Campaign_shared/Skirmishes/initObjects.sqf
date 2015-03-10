//--------------------------------------------------------------------------------------------------
//
// 	ADJUST OBJECT HIGHT
//
//--------------------------------------------------------------------------------------------------
private["_objects","_params","_height","_ref"];

_objects = allMissionObjects "All";

{
	_params = _x getVariable ["BIS_height",[]];

	if (count _params > 0) then
	{
		_x enableSimulation false;

		_height = [_params, 0, 0, [123]] call BIS_fnc_param;
		_ref 	= [_params, 1, "ROADWAY", [""]] call BIS_fnc_param;

		[_x,_height,nil,_ref] call BIS_fnc_setHeight;
	};
}
forEach _objects;

//--------------------------------------------------------------------------------------------------
//
// 	VISUALY HIDING TAGGED OBJECTS
//
//--------------------------------------------------------------------------------------------------
private["_objects","_hide"];

_objects = allMissionObjects "All";

if (BIS_HideObjects) then
{
	{
		_hide = _x getVariable ["BIS_hide", false];

		if (_hide) then
		{
			_x hideObject true;
		};
	}
	forEach _objects;
};

//--------------------------------------------------------------------------------------------------
//
// 	AUTO-MASS-SPAWNING OF OBJECTS
//
//--------------------------------------------------------------------------------------------------
private["_spawnParams","_spawnPlacement"];

{
	_spawnParams = _x getVariable ["BIS_spawnObjects",[]];

	if (count _spawnParams > 0) then
	{
		_spawnPlacement = [_x,_spawnParams select 0];
		_spawnParams set [0,_spawnPlacement];

		_spawnParams call BIS_fnc_spawnObjects;
	};
}
forEach _objects;

/*--------------------------------------------------------------------------------------------------

	"AMBIENT" OBJECTS

--------------------------------------------------------------------------------------------------*/
["BIS_ambientObjects",false] call BIS_fnc_blackOut;

private["_surfaceObjects"];

//gather all surface objects
_surfaceObjects = [] call BIS_fnc_camp_getSurfaceObjects;

{
	_x enableSimulation false;
}
forEach _surfaceObjects;

//check if the surface objects are in disabled POIs
if (isNil "BIS_POIs") then
{
	BIS_POIs = [];
};

private["_poi","_status","_center","_size","_helpers"];

{
	_poi	= _x;
	_status = [_poi] call BIS_fnc_camp_poiGetStatus;
	_center	= ["POIs",_poi,"center"] call BIS_fnc_getCfgData;
	_size	= ["POIs",_poi,"size"] call BIS_fnc_getCfgData;

	if (_center == "auto") then
	{
		_center = format["BIS_%1_%2",_poi,"center"];
	};

	_center = missionNamespace getVariable [_center,objNull];

	if (_status == 1) then
	{
		{
			if (_x distance _center < _size) then
			{
				["[!] Surface object removed!"] call BIS_fnc_logFormat;

				_surfaceObjects set [_forEachIndex,objNull];
			};
		}
		forEach _surfaceObjects;

		_surfaceObjects = _surfaceObjects - [objNull];
	};
}
forEach BIS_POIs;

//process all surface objects
private["_new","_all"];

_all = [];

{
	_new = [_x] call BIS_fnc_camp_setupSurfaceObject;
	_all = _all + [_new];
}
forEach _surfaceObjects;

["BIS_ambientObjects"] call BIS_fnc_blackIn;

//--------------------------------------------------------------------------------------------------
//
// 	HIDE HELPER OBJECTS
//
//--------------------------------------------------------------------------------------------------
private["_helpers","_texture"];

_helpers = allMissionObjects "Helper_Base_F";
_texture = "#(argb,8,8,3)color(1,1,1,0,ca)";

if !(BIS_showHelpers) then
{
	{
		//["[%1] Hiding helper: %2",_forEachIndex,_x] call BIS_fnc_logFormat;

		_x hideObject true;
		_x setObjectTexture [0,_texture];
	}
	forEach _helpers;
};