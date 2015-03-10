if (isServer) then {
	BIS_primaryEscapeVehicles = [BIS_escapeBoat1, BIS_escapeBoat2, BIS_escapeBoat3, BIS_escapeHeli1, BIS_escapeHeli2];

	[] spawn {
		while {TRUE} do {
			"respawn_west" setMarkerPos position leader BIS_grpMain;
			sleep 30
		}
	};

	[] spawn {
		waitUntil {!(isNil "BIS_initSitesDone")};
		{
			if (_x isKindOf "Man" && side group _x == EAST) then {
				_x addEventHandler ["Killed", {
					(_this select 0) spawn {
						waitUntil {{_x distance _this < 2000} count units BIS_grpMain == 0};
						deleteVehicle _this;
					};
				}]
			};
		} forEach allUnits
	};
};

BIS_primaryEscapeVehicles = [BIS_escapeBoat1, BIS_escapeBoat2, BIS_escapeBoat3, BIS_escapeHeli1, BIS_escapeHeli2];

if (isServer) then {
	[BIS_grpMain, "objEscape", [format [localize "STR_A3_MP_COOP_m01_task1_text", "<br/>"], localize "STR_A3_MP_COOP_m01_task1_title", ""], objNull, TRUE] call BIS_fnc_taskCreate;
};

_null = player createDiaryRecord ["Diary", [localize "str_a3_diary_execution_title", format [localize "STR_A3_MP_COOP_m01_execution_text", "<br/>"]]];

sleep 1;

if (time < 5 && !(isPlayer leader BIS_grpMain)) then {hintC localize "STR_A3_MP_COOP_m01_hint_1"};
if (time > 30) then {player setPos markerPos "respawn_west"};

[] spawn {
	waitUntil {{alive _x} count [BIS_escapeHeli1, BIS_escapeHeli2] == 0 && {vehicle _x isKindOf "Ship" || vehicle _x isKindOf "Air"} count units BIS_grpMain < count units BIS_grpMain && {alive _x} count (BIS_primaryEscapeVehicles + [BIS_heli1, BIS_heli2]) > 0};
	if (isServer) then {[units BIS_grpMain, "objShootDown", [localize "STR_A3_MP_COOP_m01_task2_text", localize "STR_A3_MP_COOP_m01_task2_title", ""], objNull] call BIS_fnc_taskCreate};
	waitUntil {{(vehicle _x isKindOf "Ship" || vehicle _x isKindOf "Air") && canMove vehicle _x} count units BIS_grpMain == count units BIS_grpMain};
	["objShootDown", "Succeeded"] call BIS_fnc_taskSetState;
};

[] spawn {
	waitUntil {{alive _x && !canMove _x} count (BIS_primaryEscapeVehicles + [BIS_heli1, BIS_heli2]) > 0};
	sleep 5;
	_null = [["Vehicle", "VehicleRepair"], 15] spawn BIS_fnc_advHint;
};

[] spawn {
	sleep 5;
	waitUntil {triggerActivated BIS_island};
	["objEscape", "Succeeded"] call BIS_fnc_taskSetState;
	["end1"] call BIS_fnc_endMission;
};

[] spawn {
	sleep 5;
	waitUntil {{alive _x} count units BIS_grpMain == 0};
	["objEscape", "Failed"] call BIS_fnc_taskSetState;
	["endLoser", FALSE] call BIS_fnc_endMission;
};

[] spawn {
	waitUntil {({alive _x} count (BIS_primaryEscapeVehicles + [BIS_heli1, BIS_heli2]) == 0) || ((isNil "BIS_engineer" || if (!isNil "BIS_engineer") then {isNull BIS_engineer} else {TRUE}) && {canMove _x} count (BIS_primaryEscapeVehicles + [BIS_heli1, BIS_heli2]) == 0)};
	if ("objShootDown" call BIS_fnc_taskExists) then {["objShootDown", "Failed"] call BIS_fnc_taskSetState};
	["objEscape", "Failed"] call BIS_fnc_taskSetState;
	["end6", FALSE] call BIS_fnc_endMission;
};