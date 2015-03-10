//Params
private ["_logic", "_holderClass", "_itemClass", "_type", "_support", "_vector"];
_logic 		= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_holderClass	= [_this, 1, "GroundWeaponHolder", [""]] call BIS_fnc_param;
_itemClass 	= [_this, 2, "LMG_Mk200_F", [""]] call BIS_fnc_param;
_type		= [_this, 3, "weapon", [""]] call BIS_fnc_param;
_support	= [_this, 4, objNull, [objNull]]  call BIS_fnc_param;
_vector		= [_this, 5, [0,0,0], [[]]]  call BIS_fnc_param;

//Validate game logic
if (isNull _logic) then {
	"Game logic must not be null" call BIS_fnc_error;
};

//The global position and direction for this weapon holder
private ["_position", "_direction"];
_position 	= getPos _logic;
_direction 	= getDir _logic;

if (!isNull _support) then {
	//Get the height of the supporting object
	//By checking it's bounding box dimensions
	private ["_supportHeightMin", "_supportHeightMax", "_supportHeight", "_supportHeightOffset"];
	_supportHeightMin 	= ((boundingBoxReal _support) select 0) select 2;
	_supportHeightMax 	= ((boundingBoxReal _support) select 1) select 2;
	_supportHeight		= abs (_supportHeightMin - _supportHeightMax);
	_supportHeightOffset	= 0.025;
	
	//Height offset
	_supportHeight = _supportHeight + _supportHeightOffset;
	
	//The position for the weapon holder
	//Set it's height on top of the supporting object
	_position set [2, _supportHeight];
};

//Create the weapon holder
//Special holder that hides magazines
//And set it's direction too
private "_holder";
_holder = createVehicle [_holderClass, _position, [], 0, "CAN_COLLIDE"];
_holder setDir _direction;
_holder setPos _position;
_holder setVectorUp _vector;

//Add the weapon or magazine to the holder
switch (_type) do {
	case "weapon" : 	{ _holder addWeaponCargo [_itemClass, 1]; };
	case "magazine" : 	{ _holder addMagazineCargo [_itemClass, 1]; };
	case "item" : 		{ _holder addItemCargo [_itemClass, 1]; };
	case "vehicle" : 	{ createVehicle [_itemClass, _position, [], 0, "CAN_COLLIDE"]; };
};

//Return
true;
