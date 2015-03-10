/*
	Author: Jiri Wainar

	Description:
	--------------------------------------------------------------------------------------------
	Creates a core object on an anchor and child object(s) around it.

	Example:
	--------------------------------------------------------------------------------------------
	[_createdObject:object,_weaponHolderContent:string] = _anchorData:array call BIS_fnc_camp_createObjectsAtAnchor;


	Anchor structure:
	--------------------------------------------------------------------------------------------
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
		],[...],...,[...]
	]


	Sample debug / preview code:
	--------------------------------------------------------------------------------------------
	0=cursorTarget spawn {_all = [_this,"Office","Devices"] call BIS_fnc_camp_setupSurfaceObject;sleep 5;{_a = _x;{deleteVehicle (_x select 0)}forEach _a;}forEach _all};
*/

private["_anchorPos","_anchorDir","_surfaceClass","_maxSize","_coreGroup","_coreClass","_xtraData","_input","_output","_fn_createObject","_created"];

_anchorPos 	= _this select 0;
_anchorDir 	= _this select 1;
_surfaceClass 	= _this select 2;
_maxSize 	= _this select 3;
_coreGroup	= _this select 4;
_coreClass	= _this select 5;
_xtraData	= [_this,6,[],[[]]] call BIS_fnc_param;

//generic object creation code
_fn_createObject =
{
	private["_group","_class","_pos","_dir","_rotationNoise","_fixDir","_fixPos","_fixPitch","_fixBank","_created","_holder"];

	_group     = _this select 0;
	_class 	   = _this select 1;

	//calculate the object positions
	if (count _this > 2) then
	{
		private["_offsetDir","_coreSize","_xtraSize","_angle","_radius","_x","_y"];

		_offsetDir = _this select 2;

		//add slight randomization
		_offsetDir = _offsetDir + (random 30) - 15;

		_coreSize = [_class,_coreGroup,"size",2] call BIS_fnc_camp_getObjectParam;
		_xtraSize = [_class,_group,"size",1] call BIS_fnc_camp_getObjectParam;

		_angle = _anchorDir + _offsetDir;
		_radius = (_coreSize + _xtraSize) * 0.12;

		//add slight randomization
		_radius = (0.8 * _radius) + ((random 0.4) * _radius);

		_x = _radius * (sin _angle);
		_y = _radius * (cos _angle);

		_pos = [_anchorPos,[_x,_y,0]] call BIS_fnc_vectorAdd;
	}
	else
	{
		_pos = _anchorPos;
	};

	//object rotation in object coords
	_rotationNoise = [_class,_group,"rotationNoise",[-10,10]] call BIS_fnc_camp_getObjectParam;
	_rotationNoise = (round random((_rotationNoise select 1) - (_rotationNoise select 0))) + (_rotationNoise select 0);

	//object rotation in the world, relative to the anchor rotation
	_dir = _anchorDir + _rotationNoise;

	//get the per-object direction and/or position fix
	_fixDir   = [_class,_group,"fixDir",0] call BIS_fnc_camp_getObjectParam;
	_fixPitch = [_class,_group,"fixPitch",0] call BIS_fnc_camp_getObjectParam;
	_fixBank  = [_class,_group,"fixBank",0] call BIS_fnc_camp_getObjectParam;
	_fixPos   = [_class,_group,"fixPos",[0,0,0]] call BIS_fnc_camp_getObjectParam;

	//recalculate the position offset, cuz the composition is rotated
	//_fixPos	  = [(_fixPos select 0) * (sin _anchorDir),(_fixPos select 1) * (cos _anchorDir),(_fixPos select 2)];

	//["%1 | %2 | %3",_group,_class,_fixPos] call BIS_fnc_logFormat;

	_dir = _dir + _fixDir;
	_pos = [_pos,_fixPos] call BIS_fnc_vectorAdd;

	switch (_group) do
	{
		case "MediKits";
		case "FirstAidKits":
		{
			_holder = createVehicle ["weaponholder_single_limited_item_f", ASLtoATL _pos, [], 0, "CAN_COLLIDE"];
			_holder setDir (_dir + 180);
			_holder setPosASL _pos;
			_holder addItemCargo [_class, 1];

			_created = [_holder,_class];
		};

		case "POI_SmugglerWeapons";
		case "Launchers";
		case "Weapons":
		{
			_holder = createVehicle ["weaponholder_single_limited_weapon_f", ASLtoATL _pos, [], 0, "CAN_COLLIDE"];
			_holder setDir (_dir + 180);
			_holder setPosASL _pos;
			_holder addWeaponCargo [_class, 1];

			_created = [_holder,_class];
		};
		case "Grenades":
		{
			_holder = createVehicle ["weaponholder_single_limited_magazine_f", ASLtoATL _pos, [], 0, "CAN_COLLIDE"];
			_holder setDir _dir;
			_holder setPosASL _pos;
			_holder addMagazineCargo [_class, 1];

			_created = [_holder,_class];
		};
		default
		{
			_created = [_pos,_class,1,nil,_dir] call BIS_fnc_spawnObjects;
		};
	};

	if !(isNil "_holder") then
	{
		//set pitch & bank
		[_holder, _fixPitch, _fixBank] call BIS_fnc_setPitchBank;
	}
	else
	{
		//set pitch & bank
		[_created select 0, _fixPitch, _fixBank] call BIS_fnc_setPitchBank;
	};

	//["_created = %1",_created] call BIS_fnc_logFormat;

	/*
	if (count _this > 2) then
	{
		[_pos,"Sign_Pointer_Pink_F"] call BIS_fnc_spawnObjects;
	}
	else
	{
		[_pos,"Sign_Pointer_Blue_F"] call BIS_fnc_spawnObjects;
	};
	*/

	_created
};

//consolidate the input data and process them, object by object
_input  = [[_coreGroup,_coreClass]] + _xtraData;
_output = [];

{
	_created = _x call _fn_createObject;
	_output set [count _output,_created];
}
forEach _input;

//["_output = %1",_output] call BIS_fnc_logFormat;

_output