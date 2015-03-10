//Params
private ["_logic", "_containerClass", "_holderClass", "_weaponClass", "_magazineClass", "_magazineCount"];
_logic 		= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_containerClass	= [_this, 1, "Box_IND_Ammo_F", [""]] call BIS_fnc_param;
_holderClass	= [_this, 2, "GroundWeaponHolder", [""]] call BIS_fnc_param;
_weaponClass 	= [_this, 3, "LMG_Mk200_F", [""]] call BIS_fnc_param;
_magazineClass 	= [_this, 4, (getArray (configFile >> "CfgWeapons" >> _weaponClass >> "magazines")) select 0, [""]] call BIS_fnc_param;
_magazineCount 	= [_this, 5, 5, [0]] call BIS_fnc_param;

//Validate game logic
if (isNull _logic) then {
	"Game logic must not be null" call BIS_fnc_error;
};

//The global position and direction for this weapon holder
private ["_position", "_direction"];
_position 	= getPos _logic;
_direction 	= getDir _logic;

//Create container object
//Where weapon holder/weapon will be on top
//And set it's direction too
private "_container";
_container = createVehicle [_containerClass, _position, [], 0, "CAN_COLLIDE"];
_container setDir (_direction + 90);
_container allowDamage false;

//Get the height of the supporting object
//By checking it's bounding box dimensions
private ["_containerHeightMin", "_containerHeightMax", "_containerHeight", "_containerHeightOffset"];
_containerHeightMin 	= ((boundingBoxReal _container) select 0) select 2;
_containerHeightMax 	= ((boundingBoxReal _container) select 1) select 2;
_containerHeight	= abs (_containerHeightMin - _containerHeightMax);
_containerHeightOffset	= 0.075;

//Height offset
_containerHeight = _containerHeight - _containerHeightOffset;

//The position for the weapon holder
//Set it's height on top of the supporting object
_position set [2, _containerHeight];

//Create the weapon holder
//Special holder that hides magazines
//And set it's direction too
private "_holder";
_holder = createVehicle [_holderClass, _position, [], 0, "CAN_COLLIDE"];
_holder setDir _direction;
_holder setPos _position;
_holder setVariable ["BIS_container", _container];

//Add the weapon to the weapon holder
_holder addWeaponCargo [_weaponClass, 1];

//Add some magazines to the container
//But remove stuff from it first
clearItemCargo _container;
clearWeaponCargo _container;
clearMagazineCargo _container;
_container addMagazineCargo [_magazineClass, _magazineCount];

//Return
true;
