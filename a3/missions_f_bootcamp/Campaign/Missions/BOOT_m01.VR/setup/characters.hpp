// Conway (Real)
removeAllWeapons BIS_lacey;
removeAllItems BIS_lacey;
removeAllAssignedItems BIS_lacey;
removeVest BIS_lacey;
removeHeadgear BIS_lacey;
BIS_lacey linkItem "ItemRadio";
BIS_lacey setIdentity "Bootcamp_B_Conway";
BIS_lacey addUniform "U_B_Protagonist_VR";
BIS_lacey addGoggles "G_Goggles_VR";
BIS_lacey setGroupID [name BIS_lacey];

// Conway (Fake)
BIS_laceyFake attachTo [BIS_lacey, [0,0,0]];

// Adams (Visual)
BIS_adamsFake allowDamage false;
removeAllWeapons BIS_adamsFake;
BIS_adamsFake addUniform "U_B_Soldier_VR";
BIS_adamsFake setIdentity "Bootcamp_B_Adams";

BIS_adamsFake call BIS_facePlayer;
BIS_adams_logic = BIS_adamsFake getVariable "BIS_facePlayer_logic";

// Adams (Voice)
BIS_adams hideObject true;
BIS_adams allowDamage false;
BIS_adams setCaptive true;
BIS_adams setIdentity "Bootcamp_B_Adams";
BIS_adams setGroupID [name BIS_adams];
BIS_adams attachTo [BIS_lacey, [0,0,0]];