private ["_logic","_units","_kindOfWound","_value","_nameOfHitPoint"];

_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_units = [_this,1,[],[[]]] call bis_fnc_param;
_activated = [_this,2,true,[true]] call bis_fnc_param;

if (_activated) then {

	//--- Extract the user defined module arguments
	_value = (_logic getvariable ["value",0]) min 1 max 0;
	_nameOfHitPoint = _logic getvariable ["bodypart","0"];

	// Warning: hitPoint string names are not read dynamically		

	if (_nameOfHitPoint=="0") then
	{
		{
			_veh = vehicle _x;
			if (!(_x isKindOf "CaManBase")) then
			{				
				_veh setDamage _value;			
			};
		} foreach _units
	} else {
		{
			_veh = vehicle _x;
			if (!(_veh isKindOf "CaManBase")) then
			{				
				_veh setHitPointDamage [_nameOfHitPoint,_value];
			};
		} foreach _units	
	};
};

true