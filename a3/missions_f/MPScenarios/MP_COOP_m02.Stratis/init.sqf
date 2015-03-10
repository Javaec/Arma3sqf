group player setGroupId [localize "STR_A3_callsign_headhunters"];
_null = player createDiaryRecord ["Diary", [localize "STR_A3_diary_execution_title", localize "STR_A3_MP_COOP_m02_execution_text"]];

if (isServer) then {
	"objOfficers" call BIS_fnc_missionTasks;
	"objOfficer1" call BIS_fnc_missionTasks;
	"objOfficer2" call BIS_fnc_missionTasks;
	"objOfficer3" call BIS_fnc_missionTasks;
	"objExfil" call BIS_fnc_missionTasks;
};

if !(isDedicated) then {waitUntil {count simpleTasks player > 0}};

if (isServer) then {
	[] spawn {
		waitUntil {!alive BIS_target1};
		["objOfficer1", "Succeeded"] call BIS_fnc_taskSetState;
	};

	[] spawn {
		waitUntil {!alive BIS_target2};
		["objOfficer2", "Succeeded"] call BIS_fnc_taskSetState;
	};

	[] spawn {
		waitUntil {!alive BIS_target3};
		["objOfficer3", "Succeeded"] call BIS_fnc_taskSetState;
	};
};

waitUntil {{alive _x} count [BIS_target1, BIS_target2, BIS_target3] == 0};

if (isServer) then {
	["objOfficers", "Succeeded"] call BIS_fnc_taskSetState;
	"objExfil" call BIS_fnc_taskSetCurrent;
};

waitUntil {{alive _x && (_x distance markerPos "end" > 50 && !(vehicle _x isKindOf "Ship"))} count units BIS_grpMain == 0};

if ({alive _x} count units BIS_grpMain > 0) then {
	if (isServer) then {["objExfil", "Succeeded"] call BIS_fnc_taskSetState};
	["end1"] call BIS_fnc_endMission;
};