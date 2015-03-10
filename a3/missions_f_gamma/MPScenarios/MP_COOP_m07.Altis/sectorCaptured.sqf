private ["_sector", "_owner", "_oldOwner"];
_sector 	= _this select 0;
_owner 		= _this select 1;
_oldOwner 	= _this select 2;

if (_owner in [east, resistance]) then {
	//Tickets
	if (BIS_sectorRespawn >= 0) then {
		[missionnamespace, BIS_sectorRespawn] call bis_fnc_respawnTickets;
	};
	
	//Time
	if (BIS_sectorTime >= 0) then {
		estimatedtimeleft (estimatedEndServerTime - servertime + (BIS_sectorTime * 60));
	};
	
	//Sectors in control of players
	private ["_sectorsEast", "_sectorsResistance", "_sectorsTotal"];
	_sectorsEast 		= east call bis_fnc_modulesector;
	_sectorsResistance 	= resistance call bis_fnc_modulesector;
	_sectorsTotal		= _sectorsEast + _sectorsResistance;
	
	//Unlock loadouts depending on how many sectors players control
	switch (_sectorsTotal) do {
		case 1 : {
			[east, "EAST_AT"] call bis_fnc_addrespawninventory;
			[resistance, "GUER_AT"] call bis_fnc_addrespawninventory;
		};
		case 2 : {
			[east, "EAST_DARTER"] call bis_fnc_addrespawninventory;
			[resistance, "GUER_DARTER"] call bis_fnc_addrespawninventory;
		};
		case 3 : {
			[east, "EAST_ASSISTANT_MISSILE_SPECIALIST_AT"] call bis_fnc_addrespawninventory;
			[east, "EAST_MISSILE_SPECIALIST_AT"] call bis_fnc_addrespawninventory;
			[resistance, "GUER_ASSISTANT_MISSILE_SPECIALIST_AT"] call bis_fnc_addrespawninventory;
			[resistance, "GUER_MISSILE_SPECIALIST_AT"] call bis_fnc_addrespawninventory;
		};
		case 4 : {
			[east, "EAST_MISSILE_SPECIALIST_AA"] call bis_fnc_addrespawninventory;
			[resistance, "GUER_MISSILE_SPECIALIST_AA"] call bis_fnc_addrespawninventory;
		};
	};
};
