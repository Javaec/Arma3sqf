_sideA = _this select 0;
_sideB = _this select 1;
_areFriendly = _this select 2;

//Add support function
private "_addSupport",
_addSupport = {
	//Make sure we are not ruining on dedicated server
	if (!isDedicated) then {
		if (side group player == WEST) then {
			//West, Supply
			if (BIS_fnc_moduleMPTypeDefense_tier > 1 && !(BIS_supplyBlue in synchronizedObjects BIS_supportBlue) && (BIS_availableBlue select 0) > 0) then {
				[player, BIS_supportBlue, BIS_supplyBlue] call BIS_fnc_addSupportLink;
			};
			//West, Arty
			if (BIS_fnc_moduleMPTypeDefense_tier > 2 && !(BIS_artyBlue in synchronizedObjects BIS_supportBlue) && (BIS_availableBlue select 1) > 0) then {
				[player, BIS_supportBlue, BIS_artyBlue] call BIS_fnc_addSupportLink;
			};
			//West, Cas
			if (BIS_fnc_moduleMPTypeDefense_tier > 5 && !(BIS_casBlue in synchronizedObjects BIS_supportBlue) && (BIS_availableBlue select 2) > 0) then {
				[player, BIS_supportBlue, BIS_casBlue] call BIS_fnc_addSupportLink;
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

switch BIS_fnc_moduleMPTypeDefense_tier do {
	case 0: {
		[west,"WEST1"] call bis_fnc_addrespawninventory;
		[resistance,"GUER1"] call bis_fnc_addrespawninventory;
	};
	case 1: {
	};
	case 2: {
		[] call _addSupport;
		[west,"WEST2"] call bis_fnc_addrespawninventory;
		[resistance,"GUER2"] call bis_fnc_addrespawninventory;
	};
	case 3: {
		[] call _addSupport;
	};
	case 4: {
		[] call _addSupport;
		[west,"WEST3"] call bis_fnc_addrespawninventory;
		[resistance,"GUER3"] call bis_fnc_addrespawninventory;
	};
	case 5: {

	};
	case 6: {
		[] call _addSupport;
	};
	case 7: {

	};
};