private ["_logic","_units","_radius","_door","_hatch","_i"];

_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_activated = [_this,2,true,[true]] call bis_fnc_param;

if (_activated) then {

	//--- Extract the user defined module arguments
	_radius = _logic getvariable ["radius",500];
	_door = parseNumber (_logic getvariable ["Door",0]);
	_hatch = parseNumber (_logic getvariable ["Hatch",0]);

	debugLog str (getPos _logic);
	_objects = (getPos _logic) NearObjects ["House",_radius];

	debugLog str _objects;

	_MaxDoorsInHouse = 22;  		//<----------------------- Maximal number of doors in da house - current 22 doors - CAN CHANGE!!!!
	_MaxHatchesInHouse = 6;  		//<----------------------- Maximal number of hatches in da house - current 6 hatches - CAN CHANGE!!!!
	_doorAnimNameStart="Door_"; 	//<----------------------- Animation name for door is now set for all buildings except Airport Hall door to "Door_#DoorNumber_rot"
	_doorAnimNameEnd="_rot";
	_hatchAnimNameStart="Hatch_"; 	//<----------------------- Animation name for hatches is now set for all buildings to "Hatch_#HatchNumber_rot"
	_hatchAnimNameEnd="_rot";
		
	{
		switch (_door) do
		{
			case -1: 	{};
			default  	{
							for "_i" from 1 to _MaxDoorsInHouse do
							{
								_x animate [(_doorAnimNameStart+str(_i)+_doorAnimNameEnd),_door];
							};
						};
		};	
		
		switch (_hatch) do
		{
			case -1: 	{};
			default 	{
							for "_i" from 1 to _MaxHatchesInHouse do
							{
								_x animate [(_hatchAnimNameStart+str(_i)+_hatchAnimNameEnd),_hatch];
							};
						};
		};		
	} foreach _objects;
			
	deleteVehicle _logic;
};

true