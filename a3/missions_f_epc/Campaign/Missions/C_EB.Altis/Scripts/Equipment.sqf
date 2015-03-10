// **************
// NATO grenadier
// **************

BIS_NATO_01 setFace "WhiteHead_08"; 
{removeAllWeapons _x, removeVest _x, removeGoggles _x, removeHeadgear _x, removeUniform _x, _x unlinkItem "NVGoggles"} forEach [BIS_NATO_01];
BIS_NATO_01 addVest "V_PlateCarrierGL_rgr"; 
{BIS_NATO_01 addMagazine "30Rnd_65x39_caseless_mag"} forEach [0,1,2,3,4,5,6]; 
{BIS_NATO_01 addMagazine "1Rnd_HE_Grenade_shell"} forEach [0,1,2,3,4]; 
BIS_NATO_01 addWeapon "arifle_MX_GL_Hamr_pointer_F"; 
{BIS_NATO_01 addMagazine "HandGrenade"} forEach [0,1]; 
{BIS_NATO_01 addMagazine "SmokeShell"} forEach [0,1]; 
BIS_NATO_01 addUniform "U_B_CombatUniform_mcam_tshirt"; 
BIS_NATO_01 addItem "FirstAidKit"; 
{BIS_NATO_01 addMagazine "Chemlight_green"} forEach [0,1]; 
BIS_NATO_01 addHeadgear "H_HelmetB_plain_mcamo"; 
BIS_NATO_01 addPrimaryWeaponItem "acc_flashlight"; 

// **************
// NATO heli crew
// **************

BIS_NATO_02 setFace "WhiteHead_06"; 
{removeAllWeapons _x, removeGoggles _x, removeHeadgear _x, _x unlinkItem "NVGoggles", removeVest _x, removeUniform _x} forEach [BIS_NATO_02];
BIS_NATO_02 addVest "V_TacVest_oli"; 
{BIS_NATO_02 addMagazine "30Rnd_45ACP_Mag_SMG_01"} forEach [0,1,2,3,4]; 
{BIS_NATO_02 addMagazine "SmokeShell"} forEach [0,1]; 
BIS_NATO_02 addWeapon "SMG_01_ACO_F"; 
BIS_NATO_02 addUniform "U_B_HeliPilotCoveralls"; 
BIS_NATO_02 addItem "FirstAidKit"; 
{BIS_NATO_02 addMagazine "Chemlight_green"} forEach [0,1]; 

// **************************
// NATO exsplosive specialist
// **************************

BIS_NATO_03 setFace "WhiteHead_15"; 
{removeAllWeapons _x, _x unlinkItem "NVGoggles"; removeHeadgear _x, removeGoggles _x, removeBackpack _x, removeVest _x, removeUniform _x} forEach [BIS_NATO_03]; 
BIS_NATO_03 addVest "V_PlateCarrierSpec_rgr"; 
{BIS_NATO_03 addMagazine "30Rnd_65x39_caseless_mag_Tracer"} forEach [0,1,2,3,4,5]; 
{BIS_NATO_03 addMagazine "HandGrenade"} forEach [0,1]; 
{BIS_NATO_03 addMagazine "SmokeShell"} forEach [0,1]; 
BIS_NATO_03 addWeapon "arifle_MXC_ACO_F"; 
BIS_NATO_03 addPrimaryWeaponItem "acc_flashlight"; 
BIS_NATO_03 addUniform "U_B_CombatUniform_mcam_vest"; 
BIS_NATO_03 addItem "FirstAidKit"; 
{BIS_NATO_03 addMagazine "Chemlight_green"} forEach [0,1]; 
BIS_NATO_03 addHeadgear "H_Booniehat_mcamo"; 
BIS_NATO_03 addBackpack "B_Kitbag_rgr"; 
(unitBackpack BIS_NATO_03) addItemCargo ["Toolkit",1]; 
(unitBackpack BIS_NATO_03) addItemCargo ["MineDetector",1]; 
(unitBackpack BIS_NATO_03) addMagazineCargo ["SatchelCharge_Remote_Mag",1]; 
(unitBackpack BIS_NATO_03) addMagazineCargo ["SLAMDirectionalMine_Wire_Mag",3]; 

// *********
// FIA Medic
// *********

{removeAllWeapons _x, removeUniform _x, removeVest _x, removeHeadgear _x, removeGoggles _x, removeBackpack _x} forEach [BIS_FIA_01]; 
BIS_FIA_01 addVest "V_Chestrig_oli"; 
{BIS_FIA_01 addMagazine "30Rnd_556x45_Stanag"} forEach [0,1,2,3,4]; 
{BIS_FIA_01 addMagazine "HandGrenade"} forEach [0,1]; 
{BIS_FIA_01 addMagazine "SmokeShell"} forEach [0,1]; 
BIS_FIA_01 addWeapon "arifle_TRG20_ACO_F"; 
BIS_FIA_01 addUniform "U_BG_Leader"; 
{BIS_FIA_01 addMagazine "Chemlight_blue"} forEach [0,1,2,3]; 
BIS_FIA_01 addBackpack "B_AssaultPack_rgr"; 
(unitBackpack BIS_FIA_01) addItemCargo ["Medikit",1];  
BIS_FIA_01 addPrimaryWeaponItem "acc_flashlight"; 

// *******
// FIA RPG
// *******

{removeAllWeapons _x, removeUniform _x, removeVest _x, removeHeadgear _x, removeGoggles _x, removeBackpack _x} forEach [BIS_FIA_02]; 
BIS_FIA_02 addVest "V_TacVest_camo"; 
{BIS_FIA_02 addMagazine "30Rnd_556x45_Stanag"} forEach [0,1,2,3,4,5]; 
BIS_FIA_02 addMagazine "RPG32_F"; 
{BIS_FIA_02 addMagazine "HandGrenade"} forEach [0,1]; 
{BIS_FIA_02 addMagazine "SmokeShell"} forEach [0,1]; 
BIS_FIA_02 addWeapon "arifle_TRG21_MRCO_F"; 
BIS_FIA_02 addWeapon "launch_RPG32_F"; 
BIS_FIA_02 addMagazine "RPG32_F"; 
BIS_FIA_02 addUniform "U_BG_Guerilla1_1"; 
BIS_FIA_02 addItem "FirstAidKit"; 
BIS_FIA_02 addBackpack "B_FieldPack_khk"; 
(unitBackpack BIS_FIA_02) addMagazineCargo ["RPG32_F",2]; 
BIS_FIA_02 addHeadgear "H_Shemag_olive"; 
BIS_FIA_02 addPrimaryWeaponItem "acc_flashlight"; 

// ******
// FIA MG
// ******

{removeAllWeapons _x, removeHeadgear _x, removeGoggles _x, removeUniform _x} forEach [BIS_FIA_03]; 
BIS_FIA_03 addVest "V_TacVest_blk_POLICE"; 
{BIS_FIA_03 addMagazine "200Rnd_65x39_cased_Box"} forEach [0,1]; 
{BIS_FIA_03 addMagazine "HandGrenade"} forEach [0,1]; 
BIS_FIA_03 addWeapon "LMG_Mk200_F"; 
BIS_FIA_03 addMagazine "200Rnd_65x39_cased_Box"; 
BIS_FIA_03 addUniform "U_BG_Guerilla2_3"; 
BIS_FIA_03 addItem "FirstAidKit"; 
BIS_FIA_03 addHeadgear "H_Beret_blk_POLICE"; 
{BIS_FIA_03 addMagazine "Chemlight_blue"} forEach [0,1];

// ************
// AAF Marksman
// ************

{removeAllWeapons _x, removeHeadgear _x, removeGoggles _x, removeUniform _x, _x unlinkItem "NVGoggles_indep"} forEach [BIS_FIA_04]; 
BIS_FIA_04 addVest "V_PlateCarrierIA1_dgtl"; 
{BIS_FIA_04 addMagazine "20Rnd_762x51_Mag"} forEach [0,1,2,3,4,5,6]; 
{BIS_FIA_04 addMagazine "HandGrenade"} forEach [0,1]; 
{BIS_FIA_04 addMagazine "SmokeShell"} forEach [0,1]; 
BIS_FIA_04 addWeapon "srifle_EBR_DMS_F"; 
BIS_FIA_04 addUniform "U_I_CombatUniform_shortsleeve"; 
BIS_FIA_04 addItem "FirstAidKit"; 
{BIS_FIA_04 addMagazine "Chemlight_green"} forEach [0,1]; 
BIS_FIA_04 addHeadgear "H_Bandanna_khk_hs"; 
BIS_FIA_04 addPrimaryWeaponItem "acc_flashlight"; 
