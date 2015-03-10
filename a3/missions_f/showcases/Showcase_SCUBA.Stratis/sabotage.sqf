BIS_ship removeAction BIS_disableShip;

BIS_player playMove "advepercmstpsnonwrfldnon_advepercmstpsnonwrfldnon_putdown";

sleep 2;

["BIS_objSabotage", "Succeeded"] call BIS_fnc_missionTasks;
BIS_ship setFuel 0;

_delay = 10 + random 10;

sleep _delay;

{unassignVehicle _x; _x action ["Eject", BIS_ship]; _x doWatch BIS_ship} forEach [BIS_diver1, BIS_diver2];

[BIS_diver1] joinSilent grpNull;
[BIS_diver2] joinSilent grpNull;

_pos1 = ([BIS_ship, 7, direction BIS_ship + 90] call BIS_fnc_relPos);
_pos2 = ([BIS_ship, 7, direction BIS_ship + 270] call BIS_fnc_relPos);
_pos1 set [2, -2];
_pos2 set [2, -2];

BIS_diver1 move _pos1;
BIS_diver2 move _pos2;