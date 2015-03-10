_object = _this select 0;

_dist = 50;
_removeDist = 0;
_type = typeOf _object;
_array = getArray (configFile >> "cfgVehicles" >> _type >> "compatibleWires");

if ((count _array) > 0) then {
	//max distance for nearObjects
	{
		if (_dist < (_x select 1)) then {
			_dist = _x select 1
		}
	} forEach _array;

	//get all lines around
	_linesList = (getPos _object) nearObjects ["PowerLines_Wires_base_F",_dist];
	
	//check if lines are in defined distance and delete them
	{
		_wire = _x;
		_wireType = typeOf _wire;
		{
			if (_wireType == (_x select 0)) then {
				if ((_x select 1) > (_wire distance _object)) then {
					_wire setDamage 1
				}
			};
			sleep 0.01
		} forEach _array;
		sleep 0.02
	} forEach _linesList;
};