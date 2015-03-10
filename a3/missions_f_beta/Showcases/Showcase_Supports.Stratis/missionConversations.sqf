case "start": {
	sleep 1;
	BIS_req synchronizeObjectsAdd [BIS_player];
	BIS_player synchronizeObjectsAdd [BIS_req];
	[player, "Bravo"] call BIS_fnc_addCommMenuItem;
	[player, "Echo"] call BIS_fnc_addCommMenuItem;
	["BIS_objAA", "Current"] call BIS_fnc_missionTasks;
	_null = [["Tactics", "Supports"], 15] spawn BIS_fnc_advHint;
	["01_Sitrep"] call BIS_fnc_kbTell;
};

case "aa": {
	sleep 1;
	["03_AA_Elimiated"] call BIS_fnc_kbTell;
};

case "bravo_in": {
	sleep 0.5;
	["05_Bravo_green_light"] call BIS_fnc_kbTell;
};

case "echo_in": {
	sleep 0.5;
	["10_Echo_green_light"] call BIS_fnc_kbTell;
};

case "base_clear": {
	["15_Base_clear"] call BIS_fnc_kbTell;
	["Showcase_Commanding_I", 1] call BIS_fnc_endMission;
};

case "casaulties": {
	["x01_Casaulties"] call BIS_fnc_kbTell;
	["EndLoser", FALSE] call BIS_fnc_endMission;
};