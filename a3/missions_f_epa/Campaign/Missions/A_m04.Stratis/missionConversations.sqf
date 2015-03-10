//***************
//Main
//***************
case "BIS_sitrep": {
	["00_Sitrep","A_m04",nil,"GROUP"] call bis_fnc_kbTell;
};

case "BIS_nearGroup": {
	["05_NearGroup","A_m04",nil,"GROUP"] call bis_fnc_kbTell;
};

case "BIS_onTheWayToMeeting": {
	["10_OnTheWayToMeeting","A_m04",nil,"GROUP"] call bis_fnc_kbTell;
};

case "BIS_nearContact": {
	["15_NearContact","A_m04",nil,"SIDE"] call bis_fnc_kbTell;
};

case "BIS_connorUnderAttackGroup": {
	["25_ConnorUnderAttackGroup","A_m04",nil,"GROUP"] call bis_fnc_kbTell;
};

case "BIS_nikosBoardingVehicle": {
	["30_NikosBoardingVehicle","A_m04",nil,"SIDE"] call bis_fnc_kbTell;
};

case "BIS_connorUnderAttackPapabear": {
	["35_ConnorUnderAttackPapabear","A_m04",nil,"SIDE"] call bis_fnc_kbTell;
};

case "BIS_movingToHelp": {
	["40_MovingToHelp","A_m04",nil,"GROUP"] call bis_fnc_kbTell;
};

case "BIS_howDidTheyFoundOut": {
	["42_HowDidTheyFindOut","A_m04",nil,"GROUP"] call bis_fnc_kbTell;
};

case "BIS_objectives": {
	["45_Objectives","A_m04",nil,"SIDE"] call bis_fnc_kbTell;
};

case "BIS_flanking": {
	["50_Flanking","A_m04",nil,"GROUP"] call bis_fnc_kbTell;
};

case "BIS_medicHelpContact": {
	["55_MedicHelpContact","A_m04",nil,"GROUP"] call bis_fnc_kbTell;
};

case "BIS_medicSaysContactIsDead": {
	["60_MedicSaysContactIsDead","A_m04",nil,"GROUP"] call bis_fnc_kbTell;
};

case "BIS_agiosIoannisClear": {
	["65_AgiosIoannisClear","A_m04",nil,"SIDE"] call bis_fnc_kbTell;
};

case "BIS_lzConnorCasualties": {
	["70_LzConnorCasualties","A_m04",nil,"GROUP"] call bis_fnc_kbTell;
};

case "BIS_lzConnorPapabear": {
	["75_LzConnorPapabear","A_m04",nil,"SIDE"] call bis_fnc_kbTell;
};

case "BIS_lzConnorGroup": {
	["80_LzConnorGroup","A_m04",nil,"GROUP"] call bis_fnc_kbTell;
};

case "BIS_houses": {
	["85_Houses","A_m04",nil,"GROUP"] call bis_fnc_kbTell;
};

case "BIS_agiosCephas": {
	["90_AgiosCephas","A_m04",["a_m04_90_agioscephas_ALP_0", "a_m04_90_agioscephas_ALP_1"],"SIDE"] call bis_fnc_kbTell;
	sleep 2;
	["90_AgiosCephas","A_m04",["a_m04_90_agioscephas_ALP_2"],"SIDE"] call bis_fnc_kbTell;
};

case "BIS_agiosCephasResponse": {
	["95_AgiosCephasResponse","A_m04",nil,"SIDE"] call bis_fnc_kbTell;
};

case "BIS_maxwell": {
	["100_Maxwell","A_m04",nil,"SIDE"] call bis_fnc_kbTell;
};

case "BIS_visualOnMaxwell": {
	["105_VisualOnMaxwell","A_m04",nil,"GROUP"] call bis_fnc_kbTell;
};

//***************
//Exceptions
//***************
case "BIS_x_casualties": {
	["x_00_Casualties","A_m04",nil,"GROUP"] call bis_fnc_kbTell;
};

//***************
//Instructor
//***************
case "BIS_i_flank": {
	["i_00_Flank","A_m04",nil,"GROUP"] call bis_fnc_kbTell;
};

case "BIS_i_clearHousesHelp": {
	["i_05_ClearHousesHelp","A_m04",nil,"GROUP"] call bis_fnc_kbTell;
};
