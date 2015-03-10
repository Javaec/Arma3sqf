private ["_logic","_units","_kindOfWound","_value","_nameOfHitPoint"];

_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_units = [_this,1,[],[[]]] call bis_fnc_param;
_activated = [_this,2,true,[true]] call bis_fnc_param;

if (_activated) then {

	//--- Extract the user defined module arguments
	_value = (_logic getvariable ["value",0]) min 1 max 0;

	// Warning: hitPoint string names are not read dynamically		

	{
		_veh = vehicle _x;
		if (!(_veh isKindOf "CaManBase")) then
		{				
			_veh setVehicleAmmo _value;			
		};
	} foreach _units;
};
true