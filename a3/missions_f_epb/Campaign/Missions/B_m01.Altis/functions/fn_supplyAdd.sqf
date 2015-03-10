//Parameters
private ["_vehicle"];
_vehicle = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

//Segments
private "_segments";
_segments = [
	["object", "Box_IND_Ammo_F", [-0.475,-1.1,-0.4], 0],
	["object", "Box_IND_Ammo_F", [0.375,-1.1,-0.4], 0],
	["object", "Box_IND_Ammo_F", [-0.05,-1.1,-0.4], 0],
	["weapon", "arifle_TRG21_GL_MRCO_F", [-0.3,-1.1,0.54], getDir _vehicle + 90],
	["weapon", "launch_RPG32_F", [0.05,-1.45,0.025], getDir _vehicle + 70],
	["weapon", "arifle_Mk20_F", [-0.5,-1.9,-0.05], getDir _vehicle + 140],
	["weapon", "arifle_TRG20_Holo_F", [-0.3,-1.9,-0.05], getDir _vehicle + 140],
	["weapon", "hgun_ACPC2_F", [-0.5,-1.25,0.56], getDir _vehicle + 60]
];

//Get current items
private "_items";
_items = _vehicle getVariable ["BIS_vehicleSupplyItems", []];

//The current index of items
private "_index";
_index = count _items;

//Maximum number of items reached?
if (_index < count _segments) then {
	//The item class and coordinates in model
	private ["_type", "_class", "_coordinates"];
	_type		= (_segments select _index) select 0;
	_class 		= (_segments select _index) select 1;
	_coordinates	= (_segments select _index) select 2;
	_direction	= (_segments select _index) select 3;
	
	private "_item";
	_item = objNull;
	
	//If item is of type "holder", we need to add item to it
	switch (_type) do {
		case "object" : {
			//Create the object
			_item = createVehicle [_class, position _vehicle, [], 0, "NONE"];
			
			//Attach item to the vehicle
			_item attachTo [_vehicle, _coordinates];
		};
		case "weapon" : {
			//Create the weapon holder
			_item = createVehicle ["GroundWeaponHolder", position _vehicle, [], 0, "NONE"];
			
			//Add item to holder
			_item addWeaponCargo [_class, 1];
			
			//Attach item to the vehicle
			_item attachTo [_vehicle, _coordinates];
		};
		case "magazine" : {
			//Create the weapon holder
			_item = createVehicle ["GroundWeaponHolder", position _vehicle, [], 0, "NONE"];
			
			//Add item to holder
			_item addMagazineCargo [_class, 1];
			
			//Attach item to the vehicle
			_item attachTo [_vehicle, _coordinates];
		};
	};
	
	//Set direction
	_item setDir _direction;
	
	//Vehicle already has items?
	if (count _items < 1) then {
		//Store
		_vehicle setVariable ["BIS_vehicleSupplyItems", [_item]];
	} else {
		//Add item to container
		_items set [count _items, _item];
		
		//Store
		_vehicle setVariable ["BIS_vehicleSupplyItems", _items];
	};
	
	//Log
	["Vehicle (%1) has new item in cargo (%2)", _vehicle, _class] call BIS_fnc_logFormat;
	
	//Return
	count _items - 1;
} else {
	//Error
	["Vehicle (%1) has no more cargo space for items, Index (%2), Segments (%3)", _vehicle, _index, count _segments] call BIS_fnc_error;
	
	//Return
	-1;
};
