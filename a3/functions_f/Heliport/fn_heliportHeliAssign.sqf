private ["_heliport","_helicopter","_pilot","_heliCurrentClass","_listCategories","_dbAdd"];

_heliport =	[_this,0,worldname,[""]] call bis_fnc_param;
_helicopter =	[_this,1,"",["",true]] call bis_fnc_param;
_pilot =	[_this,2,"",[""]] call bis_fnc_param;

//--- Auto assign
if (typename _helicopter == typename true) exitwith {
	private ["_heliAvailable","_heliAssigned"];
	_heliAvailable = [hsim_heliportDB,[_heliport,"Helicopters"]] call bis_fnc_dbClassList;
	if (count _heliAvailable > 0) then {
		_heliAssigned = [1,[_heliport,"Staff","PLAYER"]] call bis_fnc_heliportHeliAssigned;
		if (count _heliAssigned == 0) then {
			[_heliport,_heliAvailable select 0,"Player"] call bis_fnc_heliportHeliAssign;
		};
	} else {
		["No helicopters available for '%1'",_heliport] call bis_fnc_error;
	};
	-1
};

//--- Errors
if !([hsim_heliportDB,[_heliport,"Staff","Pilots",_pilot]] call BIS_fnc_dbClassCheck) exitwith {
	["Pilot '%1' not found.",_pilot] call bis_fnc_error;
}; 
if (!([hsim_heliportDB,[_heliport,"Helicopters",_helicopter]] call BIS_fnc_dbClassCheck) && _helicopter != "") exitwith {
	["Helicopter '%1' not found.",_helicopter] call bis_fnc_error;
};

_heliCurrentClass = [hsim_heliportDB,[_heliport,"Staff","Pilots",_pilot,"helicopter"]] call BIS_fnc_dbValueReturn;

//--- Current helicopter same as new one
if (_heliCurrentClass == _helicopter) exitwith {true};

//--- Unassign from other pilots
_listCategories = [hsim_heliportDB,[_heliport,"Staff"]] call BIS_fnc_dbClassList;
{
	private ["_category","_config"];
	_category = _x;
	_config = [hsim_heliportDB,[_heliport,"Staff",_category,"config"]] call BIS_fnc_dbValueReturn;
	if (!isnil "_config") then {
		private ["_type"];
		_type = getnumber (_config >> "type");
		if (_type == 1) then {
			{
				private ["_helicopterPilot"];
				_helicopterPilot = [hsim_heliportDB,[_heliport,"Staff",_category,_x,"helicopter"],""] call BIS_fnc_dbValueReturn;
				if (_helicopterPilot == _helicopter) then {
					[hsim_heliportDB,[_heliport,"Staff",_category,_x,"helicopter"],""] call BIS_fnc_dbValueSet;
				};
			} foreach ([hsim_heliportDB,[_heliport,"Staff",_category]] call BIS_fnc_dbClassList);
		};
	};
} foreach _listCategories;

//--- Assign to pilot
_dbAdd = [hsim_heliportDB,[_heliport,"Staff","Pilots",_pilot,"helicopter"],_helicopter] call BIS_fnc_dbValueSet;
_dbAdd