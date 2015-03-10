private ["_sector", "_owner", "_oldOwner"];
_sector 	= _this select 0;
_owner 		= _this select 1;
_oldOwner 	= _this select 2;

if (_owner in [west, resistance]) then {
	//Tickets
	if (BIS_sectorRespawn >= 0) then {
		[missionnamespace, BIS_sectorRespawn] call bis_fnc_respawnTickets;
	};
	
	//Time
	if (BIS_sectorTime >= 0) then {
		estimatedtimeleft (estimatedEndServerTime - servertime + (BIS_sectorTime * 60));
	};
	
	//Sectors in control of players
	private ["_sectorsWest", "_sectorsResistance", "_sectorsTotal"];
	_sectorsWest 		= west call bis_fnc_modulesector;
	_sectorsResistance 	= resistance call bis_fnc_modulesector;
	_sectorsTotal		= _sectorsWest + _sectorsResistance;
	
	//Unlock loadouts depending on how many sectors players control
	switch (_sectorsTotal) do {
		case 1 : {
			[west, "WEST_GRENADIER"] call bis_fnc_addrespawninventory;
			[resistance, "GUER_GRENADIER"] call bis_fnc_addrespawninventory;
		};
		case 2 : {
			[west, "WEST_AUTORIFLEMAN"] call bis_fnc_addrespawninventory;
			[resistance, "GUER_AUTORIFLEMAN"] call bis_fnc_addrespawninventory;
		};
		case 3 : {
			[west, "WEST_AT"] call bis_fnc_addrespawninventory;
			[resistance, "GUER_AT"] call bis_fnc_addrespawninventory;
		};
		case 4 : {
			[west, "WEST_SPOTTER"] call bis_fnc_addrespawninventory;
			[west, "WEST_SNIPER"] call bis_fnc_addrespawninventory;
			[resistance, "GUER_SPOTTER"] call bis_fnc_addrespawninventory;
			[resistance, "GUER_SNIPER"] call bis_fnc_addrespawninventory;
		};
	};
};
