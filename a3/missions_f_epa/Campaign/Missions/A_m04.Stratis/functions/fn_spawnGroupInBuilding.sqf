//The building
private ["_building", "_classes", "_side"];
_building 	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_maxUnits	= [_this, 1, 2, [0]] call BIS_fnc_param;
_classes 	= [_this, 2, "I_Soldier_F", ["", []]] call BIS_fnc_param;
_side		= [_this, 3, RESISTANCE, [WEST]] call BIS_fnc_param;

//The building positions
private "_buildingPositions";
_buildingPositions = [_building] call BIS_fnc_buildingPositions;

//Shuffle array
private "_buildingPositionsShuffled";
_buildingPositionsShuffled = _buildingPositions call BIS_fnc_arrayShuffle;

//The group
private "_group";
_group = createGroup RESISTANCE;

//Spawn units
for "_i" from 0 to _maxUnits - 1 do {
	//The spawn position, inside building
	private "_position";
	_position = _buildingPositionsShuffled select _i;
	
	//The unit class
	private "_class";
	_class = if (typeName _classes == "ARRAY") then {
		_classes call BIS_fnc_selectRandom;
	} else {
		_classes;
	};
	
	//The unit
	private "_unit";
	_unit = _group createUnit [_class, _position, [], 0, "NONE"];
	
	//Set unit position, otherwise it will spawn on ground level
	_unit setPos _position;
	
	//Set it's direction
	_unit setDir random 360;
	
	//Do stop
	doStop _unit;
	
	//Set unit stance
	_unit setUnitPos "UP";
};

//Return
_group;
