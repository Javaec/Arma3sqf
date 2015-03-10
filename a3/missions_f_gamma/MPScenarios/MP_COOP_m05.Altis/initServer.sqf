[player,["A3_Modules_F_Intel"]] call bis_fnc_curatoraddplaceableaddons; //--- ToDo: Move elsewhere

//Loadouts
[east, "EAST_RIFLEMAN"] call bis_fnc_addrespawninventory;
[resistance, "GUER_RIFLEMAN"] call bis_fnc_addrespawninventory;

//Block saving
enablesaving [false,false];

//Curator
#include "initCurator.sqf";

//--- Extract params
_tierMax = paramsArray select 0;
if (_tierMax == 0) then {_tierMax = ceil random 6;};
bis_mission setvariable ["EvacWave",_tierMax,true];
_hour = [paramsArray,1,14,[0]] call bis_fnc_param;
_date = date;
_date set [2,(_date select 2) + 1];
_date set [3,_hour];
setdate _date;

//Respawn menu inventory and respawn menu position initialization
{
	[_x,objnull] call bis_fnc_respawnMenuInventory;
	[_x,objnull] call bis_fnc_respawnMenuPosition;
	_x addmpeventhandler [
		"mprespawn",
		{
			if !(isplayer (_this select 0)) then {
				_this call bis_fnc_respawnMenuInventory;
				_this call bis_fnc_respawnMenuPosition;
			};
		}
	];
} foreach (playableunits + switchableunits);

//Supports - [supply, arty, cas]
BIS_availableRed 	= [1, 2, 1]; publicVariable "BIS_availableRed";
BIS_availableGreen 	= [1, 2, 1]; publicVariable "BIS_availableGreen";

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
	BIS_car_1,
	BIS_car_2,
	BIS_car_3,
	BIS_car_4,
	BIS_car_5,
	BIS_car_6
];
