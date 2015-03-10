[player,["A3_Modules_F_Intel"]] call bis_fnc_curatoraddplaceableaddons; //--- ToDo: Move elsewhere

enablesaving [false,false];

#include "initCurator.sqf";

//--- Extract params
_tierMax = paramsArray select 0;
if (_tierMax == 0) then {_tierMax = ceil random 6;};
bis_mission setvariable ["EvacWave",_tierMax,true];

_hour = [paramsArray,1,14,[0]] call bis_fnc_param;
setdate [2035,7,2,_hour,0];

[west,resistance,"unlock.sqf"] call bis_fnc_tridentExecute;

{
	[_x,objnull] call bis_fnc_respawnMenuInventory;
	_x addmpeventhandler [
		"mprespawn",
		{
			if !(isplayer (_this select 0)) then {
				_this call bis_fnc_respawnMenuInventory;
			};
		}
	];
} foreach (playableunits + switchableunits);

BIS_random = round random 1;

//Supports - [supply, arty, cas]
BIS_availableBlue 	= [1, 2, 1]; publicVariable "BIS_availableBlue";
BIS_availableGreen 	= [1, 2, 1]; publicVariable "BIS_availableGreen";
