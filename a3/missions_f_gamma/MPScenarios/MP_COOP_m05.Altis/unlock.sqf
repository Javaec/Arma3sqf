//Parameters
private ["_sideA", "_sideB", "_areFriendly"];
_sideA 		= _this select 0;
_sideB 		= _this select 1;
_areFriendly 	= _this select 2;

//Add support function
private "_addSupport",
_addSupport = {
	//Make sure we are not ruining on dedicated server
	if (!isDedicated) then {
		if (side group player == EAST) then {
			//East, Supply
			if (BIS_fnc_moduleMPTypeDefense_tier > 1 && !(BIS_supplyRed in synchronizedObjects BIS_supportRed) && (BIS_availableRed select 0) > 0) then {
				[player, BIS_supportRed, BIS_supplyRed] call BIS_fnc_addSupportLink;
			};
			//East, Arty
			if (BIS_fnc_moduleMPTypeDefense_tier > 2 && !(BIS_artyRed in synchronizedObjects BIS_supportRed) && (BIS_availableRed select 1) > 0) then {
				[player, BIS_supportRed, BIS_artyRed] call BIS_fnc_addSupportLink;
			};
			//East, Cas
			if (BIS_fnc_moduleMPTypeDefense_tier > 4 && !(BIS_casRed in synchronizedObjects BIS_supportRed) && (BIS_availableRed select 2) > 0) then {
				[player, BIS_supportRed, BIS_casRed] call BIS_fnc_addSupportLink;
			};
		} else {
			//Resistance, Supply
			if (BIS_fnc_moduleMPTypeDefense_tier > 1 && !(BIS_supplyGreen in synchronizedObjects BIS_supportGreen) && (BIS_availableGreen select 0) > 0) then {
				[player, BIS_supportGreen, BIS_supplyGreen] call BIS_fnc_addSupportLink;
			};
			//Resistance, Arty
			if (BIS_fnc_moduleMPTypeDefense_tier > 2 && !(BIS_artyGreen in synchronizedObjects BIS_supportGreen) && (BIS_availableGreen select 1) > 0) then {
				[player, BIS_supportGreen, BIS_artyGreen] call BIS_fnc_addSupportLink;
			};
			//Resistance, Cas
			if (BIS_fnc_moduleMPTypeDefense_tier > 4 && !(BIS_casGreen in synchronizedObjects BIS_supportGreen) && (BIS_availableGreen select 2) > 0) then {
				[player, BIS_supportGreen, BIS_casGreen] call BIS_fnc_addSupportLink;
			};
		};
	};
};

//Add inventory function
private "_addInventory";
_addInventory = {
	//Make sure we are only running on the server
	if (isServer) then {
		//Parameters
		private ["_side", "_loadout"];
		_side		= _this select 0;
		_loadout	= _this select 1;
		
		//Add loadout
		[_side, _loadout] call bis_fnc_addrespawninventory;
	};
};

//Add support/loadout depending on current tier
switch BIS_fnc_moduleMPTypeDefense_tier do {
	case 2 : {
		[] call _addSupport;
		[east, "EAST_AUTORIFLEMAN"] call _addInventory;
		[resistance, "GUER_AUTORIFLEMAN"] call _addInventory;
	};
	case 3 : {
		[] call _addSupport;
		[east, "EAST_GRENADIER"] call _addInventory;
		[resistance, "GUER_GRENADIER"] call _addInventory;
	};
	case 4 : {
		[east, "EAST_AT"] call _addInventory;
		[resistance, "GUER_AT"] call _addInventory;
	};
	case 5 : {
		[] call _addSupport;
		[east, "EAST_AA"] call _addInventory;
		[resistance, "GUER_AA"] call _addInventory;
	};
};
