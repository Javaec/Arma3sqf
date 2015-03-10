// ---------- Stage init

call BIS_fnc_VR_cleanup;

player enableSimulation FALSE;

BIS_stageArea = 100;

_null = [] spawn {
	waitUntil {BIS_interruptable};
	_i = BIS_stage;
	while {BIS_stage == _i && BIS_interruptable} do {
		if (player distance markerPos "BIS_center" > BIS_stageArea) then {
			if (vehicle player == player) then {
				call BIS_fnc_VRFadeIn;
				player setPos markerPos "BIS_center";
				player setDir 0;
			} else {
				_null = [localize "STR_A3_time_trials_misctt_rof_17", 0, 0.2, 2, 0.5] spawn BIS_fnc_dynamicText;
				sleep 1;
				_null = [] spawn BIS_fnc_VR_stageFailed;
			};
		};
		sleep 2;
	};
};

_pos = [(markerPos "BIS_center" select 0) + 8, (markerPos "BIS_center" select 1) + 3, 0];
_mrkr = [_pos, "exit"] call BIS_fnc_VRSpawnSelector;
_mrkr spawn BIS_fnc_VR_rotationSpeed;
_mrkr setVariable ["BIS_topicHandle", -1];
_mrkr addEventHandler ["Hit", {_null = [] execVM "toHub.sqf"}];
_null = _mrkr execFSM "topicSelect.fsm";
_iconGrp = createGroup CIVILIAN;
_pos set [2, 0.5];
_iconLogic = "Logic" createUnit [_pos, _iconGrp];
leader _iconGrp setPos _pos;
_iconGrp addGroupIcon ["selector_selectedMission", [0, 0]];
_iconGrp setVariable ["BIS_iconText", localize "STR_A3_mdl_supp_skirmishtrg_hub"];
_iconGrp setGroupIconParams [[1,1,1,1], _iconGrp getVariable "BIS_iconText", 1.75, TRUE];
_iconGrp spawn BIS_fnc_VR_handleIconVisibility;

BIS_compoCenter = markerPos "BIS_center";

_pos = [(markerPos "BIS_center" select 0) - 9, (markerPos "BIS_center" select 1) + 5, 0];
_obj = "Land_VR_CoverObject_01_stand_F" createVehicle _pos; _obj setPos _pos;
_pos set [2,1.3];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0) - 8, (markerPos "BIS_center" select 1) + 5, 0];
_obj = "Land_VR_CoverObject_01_stand_F" createVehicle _pos; _obj setPos _pos;
_pos set [2,1.3];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0) - 7, (markerPos "BIS_center" select 1) + 5, 0];
_obj = "Land_VR_CoverObject_01_stand_F" createVehicle _pos; _obj setPos _pos;
_pos set [2,1.3];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0) - 6, (markerPos "BIS_center" select 1) + 5, 0];
_obj = "Land_VR_CoverObject_01_stand_F" createVehicle _pos; _obj setPos _pos;
_pos set [2,1.3];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0) - 5, (markerPos "BIS_center" select 1) + 5, 0];
_obj = "Land_VR_CoverObject_01_stand_F" createVehicle _pos; _obj setPos _pos;
_pos set [2,1.3];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0) + 9, (markerPos "BIS_center" select 1) + 5, 0];
_obj = "Land_VR_CoverObject_01_stand_F" createVehicle _pos; _obj setPos _pos;
_pos set [2,1.3];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0) + 8, (markerPos "BIS_center" select 1) + 5, 0];
_obj = "Land_VR_CoverObject_01_stand_F" createVehicle _pos; _obj setPos _pos;
_pos set [2,1.3];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0) + 7, (markerPos "BIS_center" select 1) + 5, 0];
_obj = "Land_VR_CoverObject_01_stand_F" createVehicle _pos; _obj setPos _pos;
_pos set [2,1.3];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0) + 6, (markerPos "BIS_center" select 1) + 5, 0];
_obj = "Land_VR_CoverObject_01_stand_F" createVehicle _pos; _obj setPos _pos;
_pos set [2,1.3];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0) + 5, (markerPos "BIS_center" select 1) + 5, 0];
_obj = "Land_VR_CoverObject_01_stand_F" createVehicle _pos; _obj setPos _pos;
_pos set [2,1.3];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0) - 2, (markerPos "BIS_center" select 1) + 8, 0];
_obj = "Land_VR_CoverObject_01_kneelHigh_F" createVehicle _pos; _obj setPos _pos;
_pos set [2,2];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0) - 1, (markerPos "BIS_center" select 1) + 8, 0];
_obj = "Land_VR_CoverObject_01_kneelHigh_F" createVehicle _pos; _obj setPos _pos;
_pos set [2,2];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0), (markerPos "BIS_center" select 1) + 8, 0];
_obj = "Land_VR_CoverObject_01_kneelHigh_F" createVehicle _pos; _obj setPos _pos;
_pos set [2,2];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0) + 1, (markerPos "BIS_center" select 1) + 8, 0];
_obj = "Land_VR_CoverObject_01_kneelHigh_F" createVehicle _pos; _obj setPos _pos;
_pos set [2,2];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0) + 2, (markerPos "BIS_center" select 1) + 8, 0];
_obj = "Land_VR_CoverObject_01_kneelHigh_F" createVehicle _pos; _obj setPos _pos;
_pos set [2,2];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0) - 2, (markerPos "BIS_center" select 1) + 7, 0];
_obj = "Land_VR_CoverObject_01_kneelHigh_F" createVehicle _pos; _obj setPos _pos;
_pos set [2,2];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0) - 1, (markerPos "BIS_center" select 1) + 7, 2];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0), (markerPos "BIS_center" select 1) + 7, 2];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0) + 1, (markerPos "BIS_center" select 1) + 7, 2];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0) + 2, (markerPos "BIS_center" select 1) + 7, 0];
_obj = "Land_VR_CoverObject_01_kneelHigh_F" createVehicle _pos; _obj setPos _pos;
_pos set [2,2];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0) - 2, (markerPos "BIS_center" select 1) + 6, 0];
_obj = "Land_VR_CoverObject_01_kneelHigh_F" createVehicle _pos; _obj setPos _pos;
_pos set [2,2];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0) - 1, (markerPos "BIS_center" select 1) + 6, 2];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0), (markerPos "BIS_center" select 1) + 6, 2];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0) + 1, (markerPos "BIS_center" select 1) + 6, 2];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0) + 2, (markerPos "BIS_center" select 1) + 6, 0];
_obj = "Land_VR_CoverObject_01_kneelHigh_F" createVehicle _pos; _obj setPos _pos;
_pos set [2,2];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0) - 2, (markerPos "BIS_center" select 1) + 5, 0];
_obj = "Land_VR_CoverObject_01_kneelHigh_F" createVehicle _pos; _obj setPos _pos;
_pos set [2,2];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0) - 1, (markerPos "BIS_center" select 1) + 5, 2];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0), (markerPos "BIS_center" select 1) + 5, 2];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0) + 1, (markerPos "BIS_center" select 1) + 5, 2];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0) + 2, (markerPos "BIS_center" select 1) + 5, 0];
_obj = "Land_VR_CoverObject_01_kneelHigh_F" createVehicle _pos; _obj setPos _pos;
_pos set [2,2];
_obj = "Land_VR_CoverObject_01_kneelLow_F" createVehicle _pos; _obj setPos _pos;

_pos = [(markerPos "BIS_center" select 0) - 6.5, (markerPos "BIS_center" select 1) + 3, 0];
_board = "VR_Billboard_01_F" createVehicle _pos;
_board setPos _pos;
_board setDir -70;

_info = [];

if (BIS_topic < 1000) then {
	_info = (BIS_topics select BIS_topic) call BIS_fnc_VR_topicInfo;
} else {
	_info = (BIS_topicsUnofficial select (BIS_topic - 1000)) call BIS_fnc_VR_topicInfo;
};

_board setObjectTexture [0, _info select 2];

BIS_stageFSM = call (((_info select 1) select (BIS_stage - 1)) select 1);
_effectID = 1 + floor random 3;
_videoFile = "A3\Missions_F_Bootcamp\video\VR_GenericTransition_" + str _effectID + ".ogv";
_video = [_videoFile] spawn BIS_fnc_playVideo;
playSound ("Transition" + str _effectID);
sleep 1;

_null = [format ["<br/>%4:<br/><br/>%1 #%2:<br/>%3", _info select 0, BIS_stage, ((_info select 1) select (BIS_stage - 1)) select 0, toUpper localize "STR_A3_VR_init_procedure"], 0, 0.2, 2, 0.5, 0, 1000] spawn BIS_fnc_dynamicText;
sleep 4;

BIS_VR_doneWithRTD = TRUE;

openMap [FALSE, FALSE];
if (vehicle player == player) then {
	_startSquare = "VR_Area_01_square_1x1_grey_F" createVehicle position player;
	_startSquare setPos position player;
};

player enableSimulation TRUE;

call BIS_fnc_VRFadeIn;
sleep 1;

BIS_hideHint = FALSE;
BIS_interruptable = TRUE;

[] spawn {
	while {BIS_interruptable} do {
		if !(difficultyEnabledRTD) exitWith {BIS_VR_doneWithRTD = FALSE};
		sleep 1;
	};
};

_null = [] spawn {
	waitUntil {visibleMap || !BIS_interruptable};
	if (BIS_interruptable) then {
		(findDisplay 12 displayCtrl 51) ctrlMapAnimAdd [0, 0.03, position player];
		ctrlMapAnimCommit (findDisplay 12 displayCtrl 51);
	};
};