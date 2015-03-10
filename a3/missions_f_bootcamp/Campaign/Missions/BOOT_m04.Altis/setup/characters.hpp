// Conway
[BIS_lacey, "B_Soldier_F", ["headgear", "uniform", "vest", "goggles"]] call BIS_fnc_loadInventory;
BIS_lacey addPrimaryWeaponItem "optic_Hamr";
BIS_lacey setIdentity "Bootcamp_B_Conway";
BIS_lacey setGroupID [name BIS_lacey];
BIS_lacey enableMimics false;
BIS_lacey enableSimulation false;
BIS_lacey removeWeapon handgunWeapon BIS_lacey; 
BIS_lacey removeMagazines "16Rnd_9x21_Mag";
removeGoggles BIS_lacey;

// Adams
BIS_adams setIdentity "Bootcamp_B_Adams";
BIS_adams setGroupID [name BIS_adams];
{BIS_adams disableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];
BIS_adams enableMimics false;
BIS_adams setBehaviour "CARELESS";

// Martinez
BIS_team1 setIdentity "Bootcamp_B_Martinez";
BIS_team1 setGroupID [name BIS_team1];
BIS_team1 assignAsCargoIndex [BIS_heli, 2];
BIS_team1 moveInCargo [BIS_heli, 2];

// McKendrick
BIS_team2 setIdentity "Bootcamp_B_McKendrick";
BIS_team2 assignAsCargoIndex [BIS_heli, 5];
BIS_team2 moveInCargo [BIS_heli, 5];

// Broadway
BIS_BHQ addVest "V_PlateCarrier1_rgr";
[BIS_BHQ, "B_Soldier_F", ["uniform", "vest", "headgear", "goggles", "backpack"]] call BIS_fnc_loadInventory;
BIS_BHQ unlinkItem "NVGoggles";
BIS_BHQ addPrimaryWeaponItem "optic_Hamr";
BIS_BHQ setIdentity "Bootcamp_B_MacKinnon";
BIS_BHQ setGroupID [localize "STR_A3_CfgHQIdentities_BLU_0"];
{BIS_BHQ disableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];
BIS_BHQ enableMimics false;
BIS_BHQ setBehaviour "CARELESS";

// FIA
{
	_x hideObject true;
	_x enableSimulation false;
	_x allowDamage false;
	_x setCaptive true;
	
	_x setVariable ["BIS_alt", getPosATL _x select 2];
	[_x, 1000] call BIS_fnc_setHeight;
} forEach ([BIS_ambush1, BIS_ambush2, BIS_surprise1] + units BIS_attackGroup);

{
	_x setBehaviour "COMBAT";
	_x setCombatMode "BLUE";
	_x disableAI "MOVE";
} forEach [BIS_ambush1, BIS_ambush2];

// Wounded AAF
BIS_wounded setCaptive true;
removeHeadgear BIS_wounded;
removeVest BIS_wounded;
removeAllWeapons BIS_wounded;
BIS_wounded unlinkItem "NVGoggles_INDEP";
BIS_wounded setDamage 0.5;
BIS_wounded setFace "GreekHead_A3_01";

[] spawn {
	waitUntil {time > 0};
	removeGoggles BIS_wounded;
};