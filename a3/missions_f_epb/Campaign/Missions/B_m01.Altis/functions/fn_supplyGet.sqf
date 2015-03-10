//Parameters
private ["_vehicle", "_index"];
_vehicle 	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_index		= [_this, 1, -1, [-1]] call BIS_fnc_param;

//The items
private "_items";
_items = _vehicle getVariable "BIS_vehicleSupplyItems";

//Validate index
if (_index > -1 && _index <= count _items) then {
	//The item
	private "_item";
	_item = _items select _index;
	
	//Log
	["Item index found: %1, Item: %2", _index, _item] call BIS_fnc_logFormat;

	//Return
	_item;
} else {
	//Log
	["Item index out of reach: %1/%2", _index, count _items] call BIS_fnc_logFormat;
	
	//Return
	objNull;
};
