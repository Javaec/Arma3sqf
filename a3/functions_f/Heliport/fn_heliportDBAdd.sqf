private ["_mode","_path","_params","_dbAdd","_result","_category","_cfgCategory"];

_mode =		[_this,0,"",[""]] call bis_fnc_param;
_path =		[_this,1,[],[[]]] call bis_fnc_param;
_params =	[_this,2,[],[[]]] call bis_fnc_param;
_result = true;

#define ADD_CATEGORY \
	_category = _path - [_path select (count _path - 1)]; \
	_cfgCategory = [_category] call BIS_fnc_dbConfigPath; \
	_dbAdd = [hsim_heliportDB,_category + ["config"],_cfgCategory] call BIS_fnc_dbValueSet;

#define ADD_ITEM \
	_dbAdd = [hsim_heliportDB,_path + ["config"],_params select 0] call BIS_fnc_dbValueSet;

switch _mode do {

	//--- Missions
	case "Missions": {
		if !([hsim_heliportDB,_path] call BIS_fnc_dbClassCheck) then {
			ADD_ITEM
			_dbAdd = [hsim_heliportDB,_path + ["turn"],[] call bis_fnc_heliportTurn] call BIS_fnc_dbValueSet;
		};
	};

	//--- Helicopters
	case "Helicopters": {
		ADD_ITEM
		["Helicopters_U",_path select 0,nil,[_path select (count _path - 1)]] call bis_fnc_heliportAddForced;
	};

	//--- Helicopter Upgrades
	case "Helicopters_U": {
		ADD_CATEGORY
		ADD_ITEM
		//_dbAdd = [hsim_heliportDB,_path + ["active"],true] call BIS_fnc_dbValueSet;
	};

	//--- Staff
	case "Staff": {
		ADD_CATEGORY
		ADD_ITEM
		_dbAdd = [hsim_heliportDB,_path + ["priceDuration"],_params select 1] call BIS_fnc_dbValueSet;
		if (getnumber (_cfgCategory >> "type") == 1) then {
			_dbAdd = [hsim_heliportDB,_path + ["helicopter"],""] call BIS_fnc_dbValueSet;
		};
	};

	//--- Upgrades
	case "Upgrades": {
		ADD_CATEGORY
		ADD_ITEM
		_dbAdd = [hsim_heliportDB,_path + ["position"],_params select 1] call BIS_fnc_dbValueSet;

/*** Storing helicopter slots  in DB - for future use 
		//--- Load composition
		private ["_composition","_objectScript","_listComposition","_heliSlotCount"];
		_composition = gettext ((_params select 0) >> "composition");
		_objectScript = gettext (configfile >> "CfgObjectCompositions" >> _composition >> "objectScript");
		if (_objectScript != "") then {
			_listComposition = call compile preprocessfilelinenumbers _objectScript;
			_heliSlotCount = 0;
			{
				private ["_class","_position","_direction","_dbAdd"];
				_class = _x select 0;
				if (_class iskindof "helicopter") then {
					_position = _x select 1;
					_direction = _x select 2;
					_heliSlotClass = format ["heliSlot_%1",_heliSlotCount];
					_dbAdd = [hsim_heliportDB,_path + ["HeliSlots",_heliSlotClass,"position"],_position] call BIS_fnc_dbValueSet;
					_dbAdd = [hsim_heliportDB,_path + ["HeliSlots",_heliSlotClass,"direction"],_direction] call BIS_fnc_dbValueSet;
					_heliSlotCount = _heliSlotCount + 1;
				};
			} foreach _listComposition;
		};
/**/
	};

	default {["Mode '%1' not found.",_mode] call bis_fnc_error; _result = false}

};

_result