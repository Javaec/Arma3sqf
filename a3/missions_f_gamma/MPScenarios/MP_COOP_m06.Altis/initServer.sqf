//Curator
#include "initCurator.sqf"

//Loadouts
[west, "WEST_RIFLEMAN"] call bis_fnc_addrespawninventory;
[resistance, "GUER_RIFLEMAN"] call bis_fnc_addrespawninventory;

//Mission params
_paramsArray = [[paramsArray],0,[],[[]]];
BIS_sectorRespawn = [paramsArray,0,-1,[0]] call bis_fnc_param;
BIS_sectorTime = [paramsArray,1,-1,[0]] call bis_fnc_param;
_hour = [paramsArray,2,5,[0]] call bis_fnc_param;
_date = date;
_date set [2,(_date select 2) + 1];
_date set [3,_hour];
setdate _date;

//Respawn Tickets
[missionnamespace,BIS_sectorRespawn] call bis_fnc_respawnTickets;

//--- Set remaining time only after briefing
sleep 0.1;
if (BIS_sectorTime >= 0) then {
	estimatedtimeleft (BIS_sectorTime * 60);
};
