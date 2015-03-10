_player = _this select 0;

_trigger = BIS_fnc_moduleMPTypeDefense_mission getvariable ["trigger",objnull];

_lastStand = BIS_fnc_moduleMPTypeDefense_mission getvariable ["lastStand",false];

_delay = 10;
_description = "Enemies within the base area. Respawn slowed down.";

if (_lastStand) then {
	[
		{
			BIS_fnc_moduleMPTypeDefense_mission getvariable ["lastStand",false];
		},
		9999,
		"The evac helicopter was shot down. Respawn was disabled."
	] spawn bis_fnc_setRespawnDelay;
} else {
	[
		{
			_trigger = BIS_fnc_moduleMPTypeDefense_mission getvariable ["trigger",objnull];
			count list _trigger > 0
		},
		20,
		"Enemies within the base area. Respawn slowed down."
	] spawn bis_fnc_setRespawnDelay;
};