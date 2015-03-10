case "start": {
	["01_Start"] call BIS_fnc_kbTell;
	["02_ChitChat"] call BIS_fnc_kbTell;
};

case "contact_arrival": {
	["03_Contact_Arrival"] call BIS_fnc_kbTell;
	if ({alive _x} count units BIS_grpPursuers > 0) then {
		"BIS_objDefend" call BIS_fnc_missionTasks;
	};
	playMusic "LeadTrack04_F_EPB";
};

case "orestes_alone": 
{
	["x01_Orestes_Alone", nil, nil, BIS_inf] call BIS_fnc_kbTell;
	if ({alive _x} count units BIS_grpPursuers > 0) then {
		"BIS_objDefend" call BIS_fnc_missionTasks;
	};
	playMusic "LeadTrack04_F_EPB";
};

case "pursuers_eliminated": {
	sleep 3;
	["05_Pursuers_Eliminated", nil, nil, BIS_inf] call BIS_fnc_kbTell;
	if (alive BIS_addition) then {
		BIS_ATHolder = "GroundWeaponHolder" createvehicle position BIS_addition;
		BIS_ATHolder setPos position BIS_addition;
		BIS_addition removeWeapon "launch_NLAW_F";
		BIS_addition removeMagazines "NLAW_F";
		BIS_ATHolder addMagazineCargo ["NLAW_F", 2];
		BIS_ATHolder addWeaponCargo ["launch_NLAW_F", 1];
	};
	saveGame;
	["AddTopic", ["i01_Sabotage_Pick", "B_m05", localize "STR_A3_campaign_b_m05_instructor01"]] call BIS_fnc_InstructorFigure;
};

case "meeting_late": 
{
	["x05_Meeting_Late", nil, nil, BIS_inf] call BIS_fnc_kbTell;
	saveGame;
	["AddTopic", ["i01_Sabotage_Pick", "B_m05", localize "STR_A3_campaign_b_m05_instructor01"]] call BIS_fnc_InstructorFigure;
};

case "chopper_getting_away": {
	BIS_heli flyInHeight 100;
	{if (vehicle _x != _x) then {_x setPos [1000,1000,0]; deleteVehicle _x}} forEach units BIS_grpResponseHeli;
	vehicle BIS_heli land "NONE";
	[] spawn {while {landResult BIS_heli != "NotReady" && canMove BIS_heli} do {vehicle BIS_heli land "NONE"; sleep 2;}};
	sleep 2;
	["x10_Chopper_Getting_away"] call BIS_fnc_kbTell;
};

case "sabotage_request_helicopter": {
	["08_Sabotage_Request"] call BIS_fnc_kbTell;
	sleep 1;
	["10_Sabotage_Request_Helicopter"] call BIS_fnc_kbTell;
};

case "sabotage_request_artillery": {
	["08_Sabotage_Request"] call BIS_fnc_kbTell;
	sleep 1;
	["15_Sabotage_Request_Artillery"] call BIS_fnc_kbTell;
	BIS_fireMission = TRUE;
};

case "good_job": {
	sleep 20;
	["20_Good_Job"] call BIS_fnc_kbTell;
};

case "surprise_falcon": {
	["25_Suprise_Falcon"] call BIS_fnc_kbTell;
	enableSentences FALSE;
	(units BIS_contact) joinSilent group BIS_james;
	BIS_james move markerPos "home";
	[["B_hub02", 1]] call BIS_fnc_endMission;
};