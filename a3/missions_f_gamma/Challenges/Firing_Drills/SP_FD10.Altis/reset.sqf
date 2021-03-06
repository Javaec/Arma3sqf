//Fully re-create the holder, because emptying will garbage collect it.
private ["_holderPos"];
_holderPos = markerPos "BIS_FD_weapon1";
deleteVehicle BIS_FD_holderSniper;
BIS_FD_holderSniper = "GroundWeaponHolder" createVehicle _holderPos;
BIS_FD_holderSniper setPos _holderPos;
BIS_FD_holderSniper addWeaponCargo ["srifle_GM6_LRPS_F", 1];
BIS_FD_holderSniper addMagazineCargo ["5Rnd_127x108_Mag", 5];

sleep 0.01;

//We need some non-start magazines for the weapon swap mid-course.
BIS_FD_Competitor removeMagazine "20Rnd_762x51_Mag";
BIS_FD_Competitor removeMagazine "20Rnd_762x51_Mag";
BIS_FD_Competitor removeMagazine "16Rnd_9x21_Mag";
BIS_FD_Competitor addMagazine "5Rnd_127x108_Mag";
BIS_FD_Competitor addMagazine "5Rnd_127x108_Mag";

true