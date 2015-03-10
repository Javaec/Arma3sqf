// ---------- Hub init

BIS_topic = -1;
BIS_stageArea = 1000;

call BIS_fnc_VR_cleanup;

skipTime (12 - daytime);

player setFatigue 0;

player addMagazine "30Rnd_65x39_caseless_mag";
player addWeapon "arifle_MX_Black_F";
player selectWeapon "arifle_MX_Black_F";
player switchMove "amovpercmstpsraswrfldnon";

_startSquare = "VR_Area_01_square_1x1_grey_F" createVehicle position player;
_startSquare setPos position player;

sleep 2;

openMap [FALSE, FALSE];

_null = [] spawn {
	waitUntil {visibleMap || BIS_topic >= 0};
	if (BIS_topic < 0) then {
		(findDisplay 12 displayCtrl 51) ctrlMapAnimAdd [0, 0.003, markerPos "BIS_center"];
		ctrlMapAnimCommit (findDisplay 12 displayCtrl 51);
	};
};

_null = [] spawn {
	sleep 1;
	if (BIS_topic < 0) then {
		[
			player,
			"BIS_objCourse",
			[
				localize "STR_A3_VR_task_hub_01_text",
				localize "STR_A3_VR_task_hub_01_title",
				""
			],
			objNull,
			TRUE
		] call BIS_fnc_taskCreate;
	};
};

// ---------- return player back to selectors if he leaves the area
_null = [] spawn {
	while {BIS_topic < 0} do {
		if (player distance markerPos "BIS_center" > BIS_stageArea) then {
			call BIS_fnc_VRFadeIn;
			player setPos markerPos "BIS_center";
			player setDir 0;
		};
		sleep 2;
	};
};

// ---------- setup course selection

_topicsCnt = count BIS_topics + 1;
if (count BIS_topicsUnofficial > 0) then {_topicsCnt = _topicsCnt + 1};
_offset = 8;
_rad = (_offset * _topicsCnt) / (2 * pi);
_degStep = 360 / _topicsCnt;
BIS_stageArea = _rad + (2 * BIS_topicSelectDist);
BIS_topicMarkers = [];
_progress = profileNamespace getVariable "BIS_VR_courseProgression";
_topicsDone = "official" call BIS_fnc_VR_getCompletedTopics;
_topicsLocked = [];

{
	_info = _x call BIS_fnc_VR_topicInfo;
	_unlocked = TRUE; if ({!(_x in _topicsDone)} count (_info select 3) > 0) then {_unlocked = FALSE};
	_iconGrp = createGroup CIVILIAN;
	_pos = [BIS_gridCenter, _rad, _degStep * _forEachIndex] call BIS_fnc_relPos;
	_pos set [2, 0.5];
	_iconLogic = "Logic" createUnit [_pos, _iconGrp];
	leader _iconGrp setPos _pos;
	_iconGrp addGroupIcon ["VRCourse" + _x, [0, 0]];
	_iconGrp setVariable ["BIS_iconText", _info select 0];
	_iconGrp setGroupIconParams [[1,1,1,1], _iconGrp getVariable "BIS_iconText", 2.5, TRUE];

	_iconGrp spawn BIS_fnc_VR_handleIconVisibility;

	if !(_unlocked) then {
		_posLock = [_pos, 0.05, [_pos, player] call BIS_fnc_dirTo] call BIS_fnc_relPos;
		_posLock set [2, 0.5];
		_iconGrpLock = createGroup CIVILIAN;
		_iconLock = "Logic" createUnit [_posLock, _iconGrpLock];
		leader _iconGrpLock setPos _posLock;
		_iconGrpLock addGroupIcon ["VRCourseLock", [0, 0]];
		_iconGrpLock setVariable ["BIS_iconText", ""];
		_iconGrpLock setGroupIconParams [BIS_TT_colorWarning, "", 2.5, TRUE];
		_iconGrpLock spawn BIS_fnc_VR_handleIconVisibility;
		[_pos, leader _iconGrpLock] spawn {
			_pos = _this select 0;
			_log = _this select 1;
			while {BIS_topic < 0} do {
				_posLock = [_pos, 0.05, [_pos, player] call BIS_fnc_dirTo] call BIS_fnc_relPos;
				_posLock set [2, 0.5];
				_log setPos _posLock;
				sleep 0.25;
			};
		};
	};

	_pos set [2, 0];

	_selectorType = "complete";

	if (_unlocked) then {
		_iStages = count (_info select 1);

		for [{_i = 1}, {_i <= _iStages}, {_i = _i + 1}] do {
			if !((format ["%1_%2", _x, _i]) in _progress) then {_selectorType = "incomplete"};
		};
	} else {
		_selectorType = "default";
	};

	_mrkr = [_pos, _selectorType] call BIS_fnc_VRSpawnSelector;
	_mrkr spawn BIS_fnc_VR_rotationSpeed;

	_mrkr setVariable ["BIS_topicHandle", _forEachIndex];

	if (_unlocked) then {
		_mrkr setVariable ["BIS_locked", FALSE];
		_mrkr addEventHandler ["Hit", {if (BIS_topic < 0) then {BIS_topic = (_this select 0) getVariable "BIS_topicHandle"}}];
		_null = _mrkr execFSM "topicSelect.fsm";

	} else {
		_topicsLocked = _topicsLocked + [_x];
		_mrkr setVariable ["BIS_locked", TRUE];
	};
	BIS_topicMarkers = BIS_topicMarkers + [_mrkr];
} forEach BIS_topics;

_extraSpots = 0;

// ---------- selector for community Courses

if (count BIS_topicsUnofficial > 0) then {
	_pos = [BIS_gridCenter, _rad, _degStep * (_extraSpots + count BIS_topics)] call BIS_fnc_relPos;
	_mrkr = [_pos, "default"] call BIS_fnc_VRSpawnSelector;
	_mrkr spawn BIS_fnc_VR_rotationSpeed;
	_mrkr setVariable ["BIS_topicHandle", -10];
	_null = _mrkr execFSM "topicSelectUnofficial.fsm";
	_mrkr addEventHandler ["Hit", {(_this select 0) setDamage 0; _null = BIS_topicsUnofficial spawn BIS_fnc_VR_topicSelectUnofficial;}];
	_iconGrp = createGroup CIVILIAN;
	_pos set [2, 0.5];
	_iconLogic = "Logic" createUnit [_pos, _iconGrp];
	leader _iconGrp setPos _pos;
	_iconGrp addGroupIcon ["selector_selectedMission", [0, 0]];
	_iconGrp setVariable ["BIS_iconText", localize "STR_A3_VR_unofficial"];
	_iconGrp setGroupIconParams [[1,1,1,1], _iconGrp getVariable "BIS_iconText", 1.75, TRUE];
	_iconGrp spawn BIS_fnc_VR_handleIconVisibility;
	_extraSpots = 1;
};

// ---------- selector to quit VR

_pos = [BIS_gridCenter, _rad, _degStep * (_extraSpots + count BIS_topics)] call BIS_fnc_relPos;
_mrkr = [_pos, "exit"] call BIS_fnc_VRSpawnSelector;
_mrkr spawn BIS_fnc_VR_rotationSpeed;
_mrkr setVariable ["BIS_topicHandle", -2];
_mrkr addEventHandler ["Hit", {[] spawn {["death"] call BIS_fnc_VRFadeOut; sleep 2; endMission "End1"}}];
_null = _mrkr execFSM "topicSelect.fsm";
_iconGrp = createGroup CIVILIAN;
_pos set [2, 0.5];
_iconLogic = "Logic" createUnit [_pos, _iconGrp];
leader _iconGrp setPos _pos;
_iconGrp addGroupIcon ["selector_selectedMission", [0, 0]];
_iconGrp setVariable ["BIS_iconText", localize "STR_A3_rscdisplaymain_buttonexit"];
_iconGrp setGroupIconParams [[1,1,1,1], _iconGrp getVariable "BIS_iconText", 1.75, TRUE];
_iconGrp spawn BIS_fnc_VR_handleIconVisibility;

// ---------- unlocked Courses notification

BIS_hintTimeout = 0;

_topicsUnlockedNow = BIS_topicsLockedOld - _topicsLocked;

if (count _topicsUnlockedNow > 0) then {
	BIS_hintTimeout = 5 + count _topicsUnlockedNow;
	_text = "<t align='center' color = '" + BIS_TT_colorWarningHTML + "'>" + toUpper localize "STR_vehicle_unlocked" + ":" + "</t><br/><br/><t align='left'>";
	{
		_text = _text + "- " + ((_x call BIS_fnc_VR_topicInfo) select 0) + "<br/>";
	} forEach _topicsUnlockedNow;
	hintSilent parseText _text;
};

BIS_topicsLockedOld = _topicsLocked;

// ---------- show topic info on mouse hover
_null = [_progress, _topicsDone] spawn {
	waitUntil {profileNamespace getVariable "BIS_VR_FMHintShown"};
	sleep BIS_hintTimeout;
	_checked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	_unchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	_progress = _this select 0;
	_topicsDone = _this select 1;
	_lastSelector = objNull;
	while {BIS_topic < 0} do {
		if (typeOf cursorTarget in ["VR_3DSelector_01_incomplete_F", "VR_3DSelector_01_default_F", "VR_3DSelector_01_complete_F", "VR_3DSelector_01_exit_F"]) then {
			if (cursorTarget getVariable "BIS_topicHandle" >= 0) then {
				_topic = BIS_topics select (cursorTarget getVariable "BIS_topicHandle");
				_info = _topic call BIS_fnc_VR_topicInfo;
				_checkbox = "";
				_text = "";
				if (cursorTarget getVariable "BIS_locked") then {
					_text = "<t align='center' color = '" + BIS_TT_colorInactiveHTML + "'>" + toUpper (_info select 0) + "</t><br/><t align='center' color = '" + BIS_TT_colorWarningHTML + "'>(" + toUpper localize "STR_vehicle_locked" + ")</t>" + "<br/><t align='left' color = '" + BIS_TT_colorInactiveHTML + "'>";
				} else {
					_text = "<t align='center' color = '" + BIS_TT_colorWarningHTML + "'>" + toUpper (_info select 0) + "</t><br/><br/><t align='left'>";
				};
				{
					if ((format ["%1_%2", _topic, _forEachIndex + 1]) in _progress) then {
						_checkbox = _checked;
					} else {
						_checkbox = _unchecked;
					};
					_text = _text + "<img image='" + _checkbox + "' /> ";
					_text = _text + str (_forEachIndex + 1) + ". " + (_x select 0) + "<br/>";
				} forEach (_info select 1);
				_text = _text + "</t>";
				if (cursorTarget getVariable "BIS_locked") then {
					_text = _text + "<br/><t align='center' color = '" + BIS_TT_colorWarningHTML + "'>" + localize "STR_A3_VR_course_unlock1" + "</t><br/><br/><t align='left'>";
					{
						if (_x in _topicsDone) then {
							_checkbox = _checked;
						} else {
							_checkbox = _unchecked;
						};
						_text = _text + "<img image='" + _checkbox + "' /> ";
						_text = _text + ((_x call BIS_fnc_VR_topicInfo) select 0) + "<br/>";
					} forEach (_info select 3);
					_text = _text + "</t>";
				};
				hintSilent parseText _text;
			} else {
				if (cursorTarget getVariable "BIS_topicHandle" == -10) then {
					_text = format ["<t align='center' color = '" + BIS_TT_colorWarningHTML + "'>" + toUpper localize "STR_A3_VR_additional_courses" + "</t>" + "<br/><br/><t align='center'>%1 %2.</t>", count BIS_topicsUnofficial, localize "STR_A3_VR_available"];
					hintSilent parseText _text;
				};
			};
		} else {
			//hintSilent localize "STR_A3_VR_task_hub_01_text";
			hintSilent "";
		};
		sleep 0.25;
	};
};

player setDir ([player, (BIS_topicMarkers select (BIS_topics find BIS_lastTopic))] call BIS_fnc_dirTo) + 10;

call BIS_fnc_VRFadeIn;

if !(profileNamespace getVariable "BIS_VR_FMHintShown") then {
	player setDir 10;
	sleep 0.5;
	_null = [["Arma3", "Welcome1", "HeliPitch_sub5"], nil, nil, 1e4, "BIS_hideHint", nil, TRUE] spawn BIS_fnc_advHint;
	[] spawn {
		_t = time + 15;
		waitUntil {time > _t || (if !(isNil "RscAdvancedHint_close") then {RscAdvancedHint_close} else {FALSE})};
		BIS_hideHint = TRUE;
		profileNamespace setVariable ["BIS_VR_FMHintShown", TRUE];
		saveProfileNamespace;
	};
};

waitUntil {BIS_topic >= 0};

BIS_lastTopic = BIS_topics select BIS_topic;

call BIS_fnc_VRFadeOut;
sleep 1;

// ---------- run all stages consecutively, save progress

BIS_stage = 1;
BIS_phase = 0;
_i = BIS_stage;
_stagesCnt = 0;
if (BIS_topic < 1000) then {
	_stagesCnt = count (((BIS_topics select BIS_topic) call BIS_fnc_VR_topicInfo) select 1);
} else {
	_stagesCnt = count (((BIS_topicsUnofficial select (BIS_topic - 1000)) call BIS_fnc_VR_topicInfo) select 1);
};

while {_i <= _stagesCnt && BIS_topic >= 0} do {
	_null = [] execVM "stageStart.sqf";
	waitUntil {BIS_stage > _i || BIS_topic < 0 || cheat1};
	if (cheat1) then {cheat1 = FALSE; BIS_stage = BIS_stage + 1};
	if (BIS_topic < 0) exitWith {};
	if (BIS_topic < 1000) then {
		_profileStageID = format ["%1_%2", BIS_topics select BIS_topic, _i];
		if !(_profileStageID in (profileNamespace getVariable "BIS_VR_courseProgression")) then {
			profileNamespace setVariable ["BIS_VR_courseProgression", (profileNamespace getVariable "BIS_VR_courseProgression") + [_profileStageID]];
			saveProfileNamespace;
		};
		if (!(_profileStageID in (profileNamespace getVariable "BIS_VR_RTDCourseProgression")) && BIS_VR_doneWithRTD) then {
			profileNamespace setVariable ["BIS_VR_RTDCourseProgression", (profileNamespace getVariable "BIS_VR_RTDCourseProgression") + [_profileStageID]];
			saveProfileNamespace;
		};
		if (getStatValue "BCRealVirtuality" == 0) then {
			if ({!(_x in (profileNamespace getVariable "BIS_VR_courseProgression"))} count ["TargetDesignation_1","Launchers_1","Launchers_2","Ballistics_1","Ballistics_2","Ballistics_3","Ballistics_4","Placeables_1","Placeables_2","Placeables_3","CommandingActions_1","CommandingActions_2","CommandingActions_3","TargetDesignation_2","TargetDesignation_3","CommandingBehaviour_1","CommandingBehaviour_2","CommandingBehaviour_3","Launchers_3","CommandingMovement_1","CommandingMovement_2","CommandingVehicles_1","CommandingVehicles_2","CommandingVehicles_3","HeliBasics_1","HeliBasics_2","HeliBasics_3","HeliWeapons_1","HeliWeapons_2","HeliWeapons_3","HeliWeapons_4","HeliWeapons_5","HeliSlingload_1","HeliAdvanced_1","HeliAdvanced_2","HeliAdvanced_3","HeliAdvanced_4","HeliAdvanced_5"] == 0) then {
				setStatValue ["BCRealVirtuality", 1]
			};
		};
		if (getStatValue "BCVirtualPilot" == 0) then {
			if ({!(_x in (profileNamespace getVariable "BIS_VR_courseProgression"))} count ["HeliBasics_1","HeliBasics_2","HeliBasics_3","HeliWeapons_1","HeliWeapons_2","HeliWeapons_3","HeliWeapons_4","HeliWeapons_5","HeliSlingload_1","HeliAdvanced_1","HeliAdvanced_2","HeliAdvanced_3","HeliAdvanced_4","HeliAdvanced_5"] == 0) then {
				setStatValue ["BCVirtualPilot", 1]
			};
		};
		if (getStatValue "BCAdvVirtualPilot" == 0) then {
			if ({!(_x in (profileNamespace getVariable "BIS_VR_RTDCourseProgression"))} count ["HeliBasics_1","HeliBasics_2","HeliBasics_3","HeliWeapons_1","HeliWeapons_2","HeliWeapons_3","HeliWeapons_4","HeliWeapons_5","HeliSlingload_1","HeliAdvanced_1","HeliAdvanced_2","HeliAdvanced_3","HeliAdvanced_4","HeliAdvanced_5"] == 0) then {
				setStatValue ["BCAdvVirtualPilot", 1]
			};
		};
		if (getStatValue "BCVirtualCommand" == 0) then {
			if ({!(_x in (profileNamespace getVariable "BIS_VR_courseProgression"))} count ["CommandingActions_1","CommandingActions_2","CommandingActions_3","CommandingBehaviour_1","CommandingBehaviour_2","CommandingBehaviour_3","CommandingMovement_1","CommandingMovement_2","CommandingVehicles_1","CommandingVehicles_2","CommandingVehicles_3"] == 0) then {
				setStatValue ["BCVirtualCommand", 1]
			};
		};
	};
	if (_i == _stagesCnt) then {
		playMusic "EventTrack01_F_Curator";
		if (isLocalized "STR_A3_VR_course_completed") then {
			[] spawn {
				sleep 4;
				_null = [toUpper localize "STR_A3_VR_course_completed", 0, 0.2, 2, 0.5, 0, 1000] spawn BIS_fnc_dynamicText;
			};
		};
	};
	BIS_interruptable = FALSE;
	sleep 4;
	RscFiringDrillTime_done = TRUE;
	["done"] call BIS_fnc_VRFadeOut;
	sleep 1;
	_i = _i + 1;
};

if (BIS_topic >= 0) then {
	_null = [] execVM "hubStart.sqf";
};