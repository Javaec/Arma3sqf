vehicle BIS_heli land "GET IN";
{unassignVehicle _x; [_x] orderGetIn FALSE} forEach units BIS_grpResponseHeli;

waitUntil {(position BIS_heli) select 2 < 10 && behaviour BIS_heli != "COMBAT"};

BIS_heli flyInHeight 0;