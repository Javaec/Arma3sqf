// Conway
[BIS_lacey, "B_Soldier_F", ["headgear", "uniform", "vest", "goggles"]] call BIS_fnc_loadInventory;
BIS_lacey setIdentity "Bootcamp_B_Conway";
BIS_lacey setGroupID [name BIS_lacey];
BIS_lacey removeWeapon handgunWeapon BIS_lacey; 
BIS_lacey removeMagazines "16Rnd_9x21_Mag";
removeGoggles BIS_lacey;

// Adams
BIS_adams setIdentity "Bootcamp_B_Adams";
BIS_adams setGroupID [name BIS_adams];

// Martinez
BIS_team1 setIdentity "Bootcamp_B_Martinez";
BIS_team1 setGroupID [name BIS_team1];

// McKendrick
BIS_team2 setIdentity "Bootcamp_B_McKendrick";
BIS_team2 setGroupID [name BIS_team2];
[] spawn {waitUntil {time > 0}; removeGoggles BIS_team2};

// Trainee
BIS_train1 setName (localize "STR_A3_CfgIdentities_AAF_Soldier");

// AAF idiot
BIS_idiot1 setName (localize "STR_A3_CfgIdentities_AAF_Soldier");

// VR guy
BIS_VR addUniform "U_B_Protagonist_VR";
removeVest BIS_VR;
removeHeadgear BIS_VR;
removeAllWeapons BIS_VR;
removeAllItems BIS_VR;
removeAllAssignedItems BIS_VR;
[] spawn {waitUntil {time > 0}; removeGoggles BIS_VR};