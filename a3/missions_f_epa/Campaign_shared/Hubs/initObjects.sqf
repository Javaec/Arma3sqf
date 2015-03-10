scriptName "initObjects.sqf";

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
// 	HIDE HELPER OBJECTS
//
//--------------------------------------------------------------------------------------------------
if !(BIS_ShowHelpers) then
{
	{
		_x hideObject true;
	}
	forEach (allMissionObjects "Helper_Base_F");
};

//--------------------------------------------------------------------------------------------------
//
// 	INIT OBJECTS & STORE COORDS & DIRS
//
//--------------------------------------------------------------------------------------------------
private["_objects","_pos","_dir"];

_objects = allMissionObjects "All";

{
	_pos = getPosASL _x;
	_dir = getDir _x;

	_x setVariable ["BIS_pos", _pos];
	_x setVariable ["BIS_dir", _dir];

	//sync formation direction with direction
	if (_x isKindOf "Man") then
	{
		if ((count units group _x) == 1) then
		{
			(group _x) setFormDir _dir;
		};
	};

}
forEach _objects;

//--------------------------------------------------------------------------------------------------
//
// 	AUTO-SPAWNING OF OBJECTS
//
//--------------------------------------------------------------------------------------------------
private["_spawnParams","_spawnPlacement","_objects","_spawned","_class"];

_objects = allMissionObjects "All";
_spawned = [];

{
	_spawnParams = _x getVariable ["BIS_spawnObjects",[]];

	if (count _spawnParams > 0) then
	{
		_spawnPlacement = [_x,_spawnParams select 0];
		_spawnParams set [0,_spawnPlacement];

		_spawned = _spawned + (_spawnParams call BIS_fnc_spawnObjects);
	};
}
forEach _objects;

//process spawned
{
	_class = typeOf _x;

	if (_class == "Land_Camping_Light_off_F") then
	{
		private["_pos","_light","_brightness","_color","_ambient","_intensity","_attenuation"];

		//large mild light
		_pos   = getPosATL _x;
		_pos   = [_pos select 0,_pos select 1,(_pos select 2)+0.75];

		_light = createVehicle ["#lightpoint", _pos, [], 0, "CAN_COLLIDE"];
		_light setPosATL _pos;

		_brightness	= 1.0;

		_color		= [1,0.85,0.6];
		_ambient	= [0,0,0];

		_intensity	= 120;
		_attenuation	= [0,0,0,1.0];

		_light setLightBrightness _brightness;
		_light setLightColor _color;
		//_light setLightAmbient _ambient;
		_light setLightIntensity _intensity;
		_light setLightAttenuation _attenuation;
		_light setLightDayLight false;

		//small sharp light
		_pos   = getPosATL _x;
		_pos   = [_pos select 0,_pos select 1,(_pos select 2)+0.25];

		_light = createVehicle ["#lightpoint", _pos, [], 0, "CAN_COLLIDE"];
		_light setPosATL _pos;

		_brightness	= 1.0;

		_color		= [0,0,0];
		_ambient	= [1,0.85,0.6];

		_intensity	= 360;
		_attenuation	= [0,0,0,30.0];

		_light setLightBrightness _brightness;
		//_light setLightColor _color;
		_light setLightAmbient _ambient;
		_light setLightIntensity _intensity;
		_light setLightAttenuation _attenuation;
		_light setLightDayLight false;

	};
}
forEach _spawned;

//--------------------------------------------------------------------------------------------------
//
// 	POSITION THE MAP ON TABLE
//
//--------------------------------------------------------------------------------------------------
if (true) then
{
	private["_parent","_child","_offset","_dir","_texture"];

	_parent  = ["Hubs",missionName,"HubBriefing","Map","parent"] call BIS_fnc_getCfgDataObject;
	_child   = ["Hubs",missionName,"HubBriefing","Map","object"] call BIS_fnc_getCfgDataObject;
	_texture = ["Hubs",missionName,"HubBriefing","Map","texture"] call BIS_fnc_getCfgData;
	_offset  = ["Hubs",missionName,"HubBriefing","Map","offset"] call BIS_fnc_getCfgData;
	_dir     = ["Hubs",missionName,"HubBriefing","Map","dir"] call BIS_fnc_getCfgData;

	_parent setDir getDir _parent;

	if !(isNull _parent) then
	{
		//[BIS_briefingTable,BIS_map,[0,-0.58,0.857],95] call BIS_fnc_relPosObject;

		[_parent,_child,_offset,_dir] call BIS_fnc_relPosObject;
		_child setObjectTexture [0, _texture];
	};
};