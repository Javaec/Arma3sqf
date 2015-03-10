private ["_heliport","_pilotDefault","_mission","_listHeliClasses","_listHeliNames","_missionReqs","_missionReqsHeli","_missionReqsUpgrades","_selectHeli"];

_heliport =	[_this,0,worldname,[""]] call bis_fnc_param;
_pilotDefault =	[_this,1,"player",[""]] call bis_fnc_param;
_mission =	[_this,2,"",["",configfile]] call bis_fnc_param;

_listHeliClasses = [hsim_heliportDB,[_heliport,"Helicopters"]] call BIS_fnc_dbClassList;
_listHeliNames = [];

//--- Mission requirements
_missionReqs = [_mission,true] call  bis_fnc_heliportMissionRequired;
_missionReqsHeli = _missionReqs select 1;
_missionReqsHeliUpgrades = _missionReqs select 2;

//--- Current heli
_heliCurrent = [hsim_heliportDB,[_heliport,"Staff","Pilots",_pilotDefault,"helicopter"]] call BIS_fnc_dbValueCheck;

BIS_fnc_guiMessage_curselCustom = 0;
{
	private ["_heli","_config"];
	_heli = _x;
	_config = [hsim_heliportDB,[_heliport,"Helicopters",_heli,"config"]] call BIS_fnc_dbValueReturn;

	if !(isnil "_config") then {
		private ["_displayName","_types","_pilot","_configName","_heliUpgrades","_heliTypes"];

		_missionSpecific = getnumber (_config >> "missionSpecific");
		if (_missionSpecific == 0) then {

			//--- Get helicopter
			_displayName = gettext (_config >> "displayname");
			if (_displayName == "") then {_displayName = _heli};

			_types = getarray (_config >> "types");

			_pilot = [0,[_heliport,"Helicopters",_heli]] call BIS_fnc_heliportHeliAssigned;
			if (count _pilot > 0) then {
				private ["_configPilot"];

				_configPilot = [hsim_heliportDB,_pilot + ["config"]] call BIS_fnc_dbValueReturn;
				if (!isnil "_configPilot") then {

					//--- Get pilot
					_displayNamePilot = gettext (_configPilot >> "displayname");
					if (_displayNamePilot == "") then {_displayNamePilot = configname _configPilot};
					_displayname = _displayname + " (" + _displayNamePilot + ")";

					if (configname _configPilot == _pilotDefault) then {BIS_fnc_guiMessage_curselCustom = count _listHeliNames};
				};
			};

			//--- Disabled
			_configName = configname _config;
			_heliUpgrades = [_configName,true] call bis_fnc_heliportHeliUpgrades;

			if !(
				[_config,_missionReqsHeli] call bis_fnc_heliportTypesRequired
				&&
				{
					[_x,_missionReqsHeliUpgrades] call bis_fnc_heliportTypesRequired
				} count _heliUpgrades > 0
			) then {
				_displayName = [_displayName];
			};
			_listHeliNames = _listHeliNames + [_displayName];
		};
	};
} foreach _listHeliClasses;


//--- Current helicopter is acceptable - terminate
if (typename (_listHeliNames select BIS_fnc_guiMessage_curselCustom) == typename "") exitwith {_listHeliClasses select BIS_fnc_guiMessage_curselCustom};


//--- Open selection window
_selectHeli = [
	_listHeliNames,
	"Assign helicopter",
	-1,
	true
] call BIS_fnc_guiMessage;

//--- Return the result
if (_selectHeli select 0) then {
	_cursel = _selectHeli select 1;
	[
		_heliport,
		_listHeliClasses select _cursel,
		_pilotDefault
	] call BIS_fnc_heliportHeliAssign;
	_listHeliClasses select _cursel
} else {
	""
}