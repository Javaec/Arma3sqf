case "start": {
	["01_Start"] call BIS_fnc_kbTell; 
};

case "plan_b": {
	{
		_x spawn {
			while {TRUE} do {
				waitUntil {speed _this == 0};
				sleep 1;
				if (speed _this == 0) exitWith {};
			};
			_this setUnitPos "MIDDLE";
		};
	} forEach ((units BIS_james) - [BIS_james, BIS_inf]);
	BIS_james doWatch markerPos "convoy_route_9";
	[] spawn {
		sleep 2;
		BIS_james switchMove "Acts_listeningToRadio_In";
	};
	["02_Wait", nil, ["b_m06_02_wait_JAM_0", "b_m06_02_wait_JAM_1"]] call BIS_fnc_kbTell; 
	sleep 3;
	["02_Wait", nil, ["b_m06_02_wait_JAM_2", "b_m06_02_wait_JAM_2"]] call BIS_fnc_kbTell;
	sleep 3;
	["02_Wait", nil, ["b_m06_02_wait_JAM_3", "b_m06_02_wait_JAM_3"]] call BIS_fnc_kbTell;
	sleep 4;
	["02_Wait", nil, ["b_m06_02_wait_JAM_4", "b_m06_02_wait_JAM_4"]] call BIS_fnc_kbTell;
	sleep 3;
	["02_Wait", nil, ["b_m06_02_wait_JAM_5", "b_m06_02_wait_JAM_5"]] call BIS_fnc_kbTell;
	BIS_james switchMove "Acts_listeningToRadio_Out";
	BIS_james doWatch BIS_inf;
	playMusic "LeadTrack02a_F_EPB";
	["03_Plan_B"] call BIS_fnc_kbTell;
	enableSentences FALSE;
	BIS_james doWatch objNull;
	BIS_jamesPlanChanged = TRUE;
	{_x setUnitPos "AUTO"} forEach units BIS_james;
	sleep 2;
	enableSentences TRUE;
	waitUntil {BIS_inf distance BIS_james > 30};
	["04_Brits"] call BIS_fnc_kbTell;
	sleep 5;
	["06_Plan_B_Briefing"] call BIS_fnc_kbTell;
	sleep 1;
	["07_Brits2"] call BIS_fnc_kbTell;
	sleep 5;
	["10_Recommendation", nil, ["b_m06_10_recommendation_STA_0", "b_m06_10_recommendation_STA_7"]] call BIS_fnc_kbTell;
	["10_Recommendation", nil, ["b_m06_10_recommendation_KER_0", "b_m06_10_recommendation_KER_0"], BIS_inf] call BIS_fnc_kbTell;
};

case "rendezvous": {
	["15_Rendezvous"] call BIS_fnc_kbTell;
	
	[BIS_alphaLead] joinSilent grpNull;
	BIS_inf joinAsSilent [BIS_grpAlpha, 1];
	BIS_grpAlpha selectLeader BIS_inf;
	[BIS_alphaLead] joinSilent BIS_grpAlpha;

	["BIS_objRegroup", "Succeeded"] call BIS_fnc_missionTasks;

	"BIS_objCommand_GetIn" call BIS_fnc_missionTasks;
	"BIS_objCommand_Move" call BIS_fnc_missionTasks;

	_null = [] execFSM "commanding.fsm";
};

case "convoy_warning_1": {
	if ({vehicle _x == BIS_supplies && alive _x && canMove BIS_supplies} count units BIS_grpConvoy > 0 && !BIS_convoyAttacked) then {
		["20_Convoy_Info_1", nil, nil, BIS_inf] call BIS_fnc_kbTell;
		BIS_spotter1 setBehaviour "STEALTH";
		BIS_spotter1 setUnitPos "AUTO";
		BIS_spotter1 move markerPos "home";
		sleep 6;
		saveGame;
	};
};

case "convoy_warning_2": {
	if ({vehicle _x == BIS_supplies && alive _x && canMove BIS_supplies} count units BIS_grpConvoy > 0 && !BIS_convoyAttacked) then {
		["20_Convoy_Info_2", nil, nil, BIS_inf] call BIS_fnc_kbTell;
		BIS_spotter2 setBehaviour "STEALTH";
		BIS_spotter2 setUnitPos "AUTO";
		BIS_spotter2 move markerPos "home";
	};
};

case "convoy_warning_3": {
	if ({vehicle _x == BIS_supplies && alive _x && canMove BIS_supplies} count units BIS_grpConvoy > 0 && !BIS_convoyAttacked) then {
		["20_Convoy_Info_3", nil, nil, BIS_inf] call BIS_fnc_kbTell;
		BIS_spotter3 setBehaviour "STEALTH";
		BIS_spotter3 setUnitPos "AUTO";
		BIS_spotter3 move markerPos "home";
	};
};

case "convoy_warning_4": {
	if ({vehicle _x == BIS_supplies && alive _x && canMove BIS_supplies} count units BIS_grpConvoy > 0 && !BIS_convoyAttacked) then {
		["20_Convoy_Info_4", nil, nil, BIS_inf] call BIS_fnc_kbTell;
		BIS_spotter4 setBehaviour "STEALTH";
		BIS_spotter4 setUnitPos "AUTO";
		BIS_spotter4 move markerPos "home";
	};
};

case "truck_immobile": {
	["x01_Truck_Destroyed"] call BIS_fnc_kbTell;
};

case "spotter_meeting_busy": {
	_i = 0;
	_spotter = BIS_spotter1;
	{if (_x distance BIS_inf < _spotter distance BIS_inf) then {_i = _forEachIndex;};} forEach [BIS_spotter1, BIS_spotter2, BIS_spotter3, BIS_spotter4];
	_sentence = ["b_m06_25_meeting_spotters_1_GUB_0", "b_m06_25_meeting_spotters_1_GUC_0", "b_m06_25_meeting_spotters_1_GUD_0", "b_m06_25_meeting_spotters_1_GUE_0"] select _i;
	["25_Meeting_Spotters_1", nil, [_sentence, _sentence]] call BIS_fnc_kbTell;
};

case "spotter_meeting_RTB": {
	_i = 0;
	_spotter = BIS_spotter1;
	{if (_x distance BIS_inf < _spotter distance BIS_inf) then {_i = _forEachIndex;};} forEach [BIS_spotter1, BIS_spotter2, BIS_spotter3, BIS_spotter4];
	_sentence = ["b_m06_25_meeting_spotters_2_GUB_0", "b_m06_25_meeting_spotters_2_GUC_0", "b_m06_25_meeting_spotters_2_GUD_0", "b_m06_25_meeting_spotters_2_GUE_0"] select _i;
	["25_Meeting_Spotters_2", nil, [_sentence, _sentence]] call BIS_fnc_kbTell;
};

case "hideout_reached": {
	["30_Hideout_Reached"] call BIS_fnc_kbTell;
};

case "hideout_attacked": {
	playMusic ["LeadTrack04_F_EPB", 38];
	["35_Hideout_Attacked", nil, ["b_m06_35_hideout_attacked_KER_0", "b_m06_35_hideout_attacked_KER_0"], BIS_inf] call BIS_fnc_kbTell;
	["35_Hideout_Attacked", nil, ["b_m06_35_hideout_attacked_KER_1"]] call BIS_fnc_kbTell;
	sleep 5;
	["40_Blowjob", nil, nil, BIS_inf] call BIS_fnc_kbTell;
	2 fadeMusic 0.25;
	"BIS_objRetreat" call BIS_fnc_missionTasks;
	"home" setMarkerType "hd_flag";
	sleep 30;
	["45_SwitchCamp", nil, nil, BIS_inf] call BIS_fnc_kbTell;
	"home" setMarkerPos markerPos "BIS_realEnd";
	"BIS_ruin" setMarkerType "hd_warning";
	["BIS_objRetreat", markerPos "BIS_realEnd"] call BIS_fnc_taskSetDestination;
	sleep 6;
	saveGame;
};