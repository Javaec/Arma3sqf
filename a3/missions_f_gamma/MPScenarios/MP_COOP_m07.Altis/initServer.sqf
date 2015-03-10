//Curator
#include "initCurator.sqf"

//Loadouts
[east, "EAST_ENGINEER"] call bis_fnc_addrespawninventory;
[east, "EAST_GRENADIER"] call bis_fnc_addrespawninventory;
[east, "EAST_AUTORIFLEMAN"] call bis_fnc_addrespawninventory;
[resistance, "GUER_ENGINEER"] call bis_fnc_addrespawninventory;
[resistance, "GUER_GRENADIER"] call bis_fnc_addrespawninventory;
[resistance, "GUER_AUTORIFLEMAN"] call bis_fnc_addrespawninventory;

//Mission params
BIS_sectorRespawn = [paramsArray,0,-1,[0]] call bis_fnc_param;
BIS_sectorTime = [paramsArray,1,-1,[0]] call bis_fnc_param;
_hour = [paramsArray,2,5,[0]] call bis_fnc_param;
_date = date;
_date set [2,(_date select 2) + 1];
_date set [3,_hour];
setdate _date;
[missionnamespace,BIS_sectorRespawn] call bis_fnc_respawnTickets;

//AI respawn
{
	if !(isplayer _x) then {
		//[_x,objnull] call bis_fnc_respawnMenuInventory;
		[_x,objnull] call bis_fnc_respawnMenuPosition;
	};
	_x addmpeventhandler [
		"mprespawn",
		{
			if !(isplayer (_this select 0)) then {
				//_this call bis_fnc_respawnMenuInventory;
				_this call bis_fnc_respawnMenuPosition;
			};
		}
	];
} foreach (playableunits + switchableunits);

//Car alarms
{
	_x setVariable ["BIS_alarmEventHandler", _x addEventHandler ["Hit", {
		//The car
		private "_car";
		_car = _this select 0;
		
		//Remove event handler
		_car removeEventHandler ["Hit", _car getVariable "BIS_alarmEventHandler"];
		
		//Execute alarm script
		[[[_car], "carAlarm.sqf"], "BIS_fnc_execVM"] call BIS_fnc_mp;
		
		//Log
		["Car (%1) alarm went off at %2", _car, time] call BIS_fnc_logFormat;
	}]];
} forEach [
	BIS_car_0,
	BIS_car_1,
	BIS_car_2,
	BIS_car_3,
	BIS_car_4,
	BIS_car_5,
	BIS_car_6,
	BIS_car_7,
	BIS_car_8,
	BIS_car_9,
	BIS_car_10,
	BIS_car_11,
	BIS_car_12,
	BIS_car_13,
	BIS_car_14,
	BIS_car_15,
	BIS_car_16,
	BIS_car_17,
	BIS_car_18,
	BIS_car_19,
	BIS_car_20,
	BIS_car_21,
	BIS_car_22
];

//Set remaining time only after briefing
sleep 0.1;
if (BIS_sectorTime >= 0) then {
	estimatedtimeleft (BIS_sectorTime * 60);
};
