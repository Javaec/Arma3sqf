// Conway
[BIS_lacey, "B_Soldier_F", ["headgear", "uniform", "vest", "goggles"]] call BIS_fnc_loadInventory;
BIS_lacey addPrimaryWeaponItem "optic_Hamr";
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

// Wounded AAF
removeHeadgear BIS_wounded;
removeVest BIS_wounded;
removeAllWeapons BIS_wounded;
removeAllAssignedItems BIS_wounded;
BIS_wounded setDamage 1;
BIS_wounded setFace "GreekHead_A3_01";

[] spawn {
	waitUntil {time > 0};
	removeGoggles BIS_wounded;
};

// MacKinnon
BIS_BHQ setGroupID [localize "STR_A3_CfgHQIdentities_BLU_0"];

// Akhanteros
removeAllWeapons BIS_IHQ;
removeAllItems BIS_IHQ;
removeAllAssignedItems BIS_IHQ;
removeVest BIS_IHQ;
BIS_IHQ linkItem "ItemRadio";
BIS_IHQ addHeadgear "H_Beret_blk";
BIS_IHQ setIdentity "Bootcamp_I_Akhanteros";
BIS_IHQ setName (localize "STR_A3_CfgIdentities_AAF_Officer");

// Abusive AAF
BIS_abuser setName (localize "STR_A3_CfgIdentities_AAF_Soldier");
[] spawn {waitUntil {time > 0}; removeGoggles BIS_abuser};

// Abused FIA
BIS_abused addUniform "U_BG_Guerrilla_6_1";
removeAllWeapons BIS_abused;
removeAllItems BIS_abused;
removeAllAssignedItems BIS_abused;
removeVest BIS_abused;
[] spawn {waitUntil {time > 0}; removeGoggles BIS_abused; removeHeadgear BIS_abused};

// Kerry
[BIS_truckD, "B_Soldier_F", ["uniform", "vest", "headgear", "goggles"]] call BIS_fnc_loadInventory;
BIS_truckD removePrimaryWeaponItem "optic_ACO";
BIS_truckD unlinkItem "NVGoggles";
removeHeadgear BIS_truckD;
BIS_truckD addGoggles "G_Shades_Black";
BIS_truckD setIdentity "Bootcamp_B_Kerry";