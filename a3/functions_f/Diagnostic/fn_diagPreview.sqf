/*
	Author: Karel Moricky

	Description:
	Previews selected classes from given container

	Parameter(s):
	_this select 0: STRING - class container. Can be: "CfgVehicles", "CfgWeapons"
	_this select 1: STRING - parent class of created objects (e.g. "Car" or "Rifle")
	_this select 2 (Optional): NUMBER - distance between created objects (default: 10m)
	_this select 3 (Optional): ARRAY - initial position

	Returns:
	ARRAY - list of created classes
*/
private ["_mode","_parentName","_distance","_initPos","_createobject","_container","_containerCount","_container","_posX","_posY","_classes","_class","_scope","_parents","_objectpos","_classname","_object"];

_mode = [_this,0,"cfgVehicles",[""]] call bis_fnc_param;
_parentName = [_this,1,typeof player,[""]] call bis_fnc_param;
_distance = [_this,2,10,[0]] call bis_fnc_param;
_initPos = [_this,3,position player] call bis_fnc_param;
_initPos = _initPos call bis_fnc_position;
_initPosX = _initPos select 0;
_initPosY = _initPos select 1;

_createObject = switch (tolower _mode) do {
	case "cfgvehicles": {
		{
			createvehicle [_classname,_objectpos,[],0,"none"];
		};
	};
	case "cfgweapons": {
		{
			private ["_holder"];
			_holder = createvehicle ["weaponholder",_objectpos,[],0,"none"];
			_holder addweaponcargo [_classname,1];
			{
				_holder addmagazinecargo [_x,1];
			} foreach getarray (_class >> "magazines");
			_holder
		};
	};
	default {0}
};

if (typename _createObject != typename {}) exitwith {["Mode '%1' is incorrect. Must be one of 'CfgVehicles', 'CfgWeapons'",_mode] call bis_fnc_error; []};

//--- Get container
_container = configfile >> _mode;
_containerCount = count _container - 1;
_parent = _container >> _parentName;
if !(isclass _parent) exitwith {["Parent class '%1' not found in %2",_parentName,_mode] call bis_fnc_error};

//--- Init variables
_posX = 1;
_posY = 0;
if !(isnil "bis_fnc_diagPreview_objects") then {
	{deletevehicle _x} foreach bis_fnc_diagPreview_objects;
};
bis_fnc_diagPreview_objects = [];
_classes = [];

//--- Scan the container
startloadingscreen [""];
for "_i" from 0 to _containerCount do {

	_class = _container select _i;
	if (isclass _class) then {
		_scope = getnumber (_class >> "scope");
		if (_scope > 0) then {
			_parents = [_class] call bis_fnc_returnparents;
			if (_parent in _parents) then {

				_objectPosX = [_initPos,_distance * _posX,direction player] call bis_fnc_relpos;
				_objectPos = [_objectPosX,_distance * _posY,direction player + 90] call bis_fnc_relpos;

				_classname = configname _class;
				_object = call _createObject;
				_object setpos _objectpos;
				_object setdir direction player;
				player reveal _object;
				bis_fnc_diagPreview_objects set [count bis_fnc_diagPreview_objects,_object];
				_classes set [count _classes,_classname];

				_posX = _posX + 1;
				if (_posX > 10) then {_posX = 0; _posY = _posY + 1};
			};
		};
	};
	progressloadingscreen (_i / _containerCount);
};
endloadingscreen;
_classes