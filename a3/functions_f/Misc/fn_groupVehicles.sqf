/*
	Author: Nelson Duarte

	Description:
	Returns all vehicles a group possesses, assigned vehicles can be included

	Parameter(s):
	_this select 0:	GROUP or OBJECT	- The unit or group to check, if unit is given it's group is then used
	_this select 1:	BOOLEAN		- If assigned vehicles should also be returned (vehicles that unit's may not be inside of but assigned to)
	
	Returns:
	ARRAY - List of all vehicles in control/assigned to the group, empty if group has none
*/
//Parameters
private ["_group", "_assigned"];
_group		= [_this, 0, grpNull, [grpNull, objNull]] call BIS_fnc_param;
_assigned	= [_this, 1, false, [false]] call BIS_fnc_param;

//The vehicles container
private "_vehicles";
_vehicles = [];

//Validate group/unit parameter
if (isNull _group) exitWith {
	//Error
	"Parameter GROUP must not be null, (OBJECT or GROUP) required" call BIS_fnc_error;
	
	//Return
	_vehicles;
};

//If object given, get it's group
if (typeName _group == "OBJECT") then {
	_group = group _group;
};

//Loop all units and check if it is inside a vehicle or, if required, if it has assigned vehicle
{
	//The unit
	private "_unit";
	_unit = _x;
	
	//The vehicle
	private "_vehicle";
	_vehicle = vehicle _unit;
	
	//Is inside a vehicle?
	if (_unit != _vehicle) then {
		//Make sure vehicle is not inside container already
		if !(_vehicle in _vehicles) then {
			//Store vehicle in container
			_vehicles set [count _vehicles, _vehicle];
		};
	};
	
	//Return assigned vehicles also?
	if (_assigned) then {
		//Has a vehicle assigned?
		private "_assignedVehicle";
		_assignedVehicle = assignedVehicle _unit;
		
		//Make sure assigned vehicle actually exists
		if (!isNull _assignedVehicle) then {
			//Make sure vehicle is not inside container already
			if !(_assignedVehicle in _vehicles) then {
				//Store vehicle in container
				_vehicles set [count _vehicles, _assignedVehicle];
			};
		};
	};
} forEach units _group;

//Return
_vehicles;
