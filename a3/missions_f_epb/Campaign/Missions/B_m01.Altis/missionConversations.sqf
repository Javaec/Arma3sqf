//*********************************
//Main
//*********************************
case "BIS_sitrep" : {
	["00_sitrep","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_engagePrepare" : {
	["05_engagePrepare","B_m01", nil, "GROUP"] call bis_fnc_kbTell;
};

case "BIS_plan" : {
	["10_plan","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_Go" : {
	["13_Go","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_engage" : {
	["15_engage","B_m01", nil, "GROUP"] call bis_fnc_kbTell;
};

case "BIS_guardsDead" : {
	["20_guardsDead","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_outpostAttack" : {
	["25_outpostAttack","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_outpostAttackGroup" : {
	if (count units group player > 1) then {
		["30_outpostAttackGroup","B_m01", nil, "GROUP", nil, nil, nil, false] call bis_fnc_kbTell;
	};
};

case "BIS_suppressiveFireStop" : {
	["35_suppressiveFireStop","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_outpostReport" : {
	["40_outpostReport","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_outpostSecure" : {
	["45_outpostSecure","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_deltaMoveIn" : {
	["50_deltaMoveIn","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_deltaArrives" : {
	["55_deltaArrives","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_mortarDetected" : {
	["60_mortarDetected","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_mortarDestroy" : {
	["65_mortarDestroy","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_mortarDestroyGroup" : {
	if (count units group player > 1) then {
		["70_mortarDestroyGroup","B_m01", nil, "GROUP"] call bis_fnc_kbTell;
	};
};

case "BIS_friniReached" : {
	["75_friniReached","B_m01", nil, "GROUP"] call bis_fnc_kbTell;
};

case "BIS_mortarDestroyed" : {
	["80_mortarDestroyed","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_friniLeave" : {
	["85_friniLeave","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_friniLeaveGroup" : {
	if (count units group player > 1) then {
		["90_friniLeaveGroup","B_m01", nil, "GROUP"] call bis_fnc_kbTell;
	};
};

case "BIS_outpostLastStand" : {
	["95_outpostLastStand","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_outpostIsHot" : {
	["100_outpostIsHot","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_outpostIsImpossible" : {
	["105_outpostIsImpossible","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_suppliesSitrep" : {
	["110_suppliesSitrep","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_suppliesReady" : {
	["115_suppliesReady","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_supplyTruckProtected" : {
	["120_supplyTruckProtected","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_retreat" : {
	["125_retreat","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

//*********************************
//Exceptions
//*********************************
case "BIS_x_guardsAlive" : {
	["x00_guardsAlive","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_x_guardsDetected" : {
	["x05_guardsDetected","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_x_getIntoOutpost" : {
	["x10_getIntoOutpost","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_x_getIntoOutpostFailed" : {
	["x15_getIntoOutpostFailed","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_x_alarm" : {
	["x46_alarm","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_x_supplyTruckDestroyed" : {
	["x20_getIntoOutpostFailed","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_x_mortarNeutralizeFailed" : {
	["x25_mortarNeutralizeFailed","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_x_friniLeaveWarning" : {
	["x30_friniLeaveWarning","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_x_friniLeaveFailed" : {
	["x35_friniLeaveFailed","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_x_casualtiesAlpha" : {
	["x40_casualtiesAlpha","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_x_casualtiesBravo" : {
	["x45_casualtiesBravo","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_x_casualtiesCharlie" : {
	["x50_casualtiesCharlie","B_m01", nil, "SIDE"] call bis_fnc_kbTell;
};
