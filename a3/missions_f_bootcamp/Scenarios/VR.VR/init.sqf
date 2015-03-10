player addEventHandler ["HandleDamage", {(_this select 2) / 100}];	// ---------- drastically limit player's damage to avoid death
enableSaving [FALSE, FALSE];
setGroupIconsVisible [TRUE, TRUE];
setViewDistance 1000;
0 fadeMusic 0.2;
createCenter WEST;
createCenter EAST;
createCenter RESISTANCE;
createCenter CIVILIAN;

// ---------- variables setup

BIS_interruptable = FALSE;			// ---------- TRUE if in a course
BIS_topicSelectDist = 2;			// ---------- min distance from a course selector to start loading
BIS_topicSelectTmout = 3;			// ---------- course loading length
BIS_taskNotificationSuffix = "VR";		// ---------- custom task notifications
BIS_hideHint = FALSE;				// ---------- helper variable for hiding advanced hints
BIS_VR_pauseTimeReset = FALSE;			// ---------- if set to true, automatic daytime reset loop is paused
BIS_VR_spawnArray = [];				// ---------- pool of spawned scripts to terminate after the end of each Stage

// ---------- persistent profile variables init
if (isNil {profileNamespace getVariable "BIS_VR_courseProgression"}) then {
	profileNamespace setVariable ["BIS_VR_courseProgression", []];
	saveProfileNamespace;
};

if (isNil {profileNamespace getVariable "BIS_VR_RTDCourseProgression"}) then {
	profileNamespace setVariable ["BIS_VR_RTDCourseProgression", []];
	saveProfileNamespace;
};

if (isNil {profileNamespace getVariable "BIS_VR_FMHintShown"}) then {
	profileNamespace setVariable ["BIS_VR_FMHintShown", FALSE];
	saveProfileNamespace;
};

// ---------- functions setup

BIS_fnc_VR_handleIconVisibility = compile preprocessFileLineNumbers "functions\handleIconVisibility.sqf";
BIS_fnc_VR_cleanup = compile preprocessFileLineNumbers "functions\cleanup.sqf";
BIS_fnc_VR_topicInfo = compile preprocessFileLineNumbers "functions\topicInfo.sqf";
BIS_fnc_VR_stageDone = compile preprocessFileLineNumbers "functions\stageDone.sqf";
BIS_fnc_VR_stageFailed = compile preprocessFileLineNumbers "functions\stageFailed.sqf";
BIS_fnc_VR_handleVehicle = compile preprocessFileLineNumbers "functions\handleVehicle.sqf";
BIS_fnc_VR_topicSelectUnofficial = compile preprocessFileLineNumbers "functions\topicSelectUnofficial.sqf";
BIS_fnc_VR_equipUnit = compile preprocessFileLineNumbers "functions\equipUnit.sqf";
BIS_fnc_VR_rotationSpeed = compile preprocessFileLineNumbers "functions\rotationSpeed.sqf";
BIS_fnc_VR_getCompletedTopics = compile preprocessFileLineNumbers "functions\getCompletedTopics.sqf";
BIS_fnc_VR_buildComposition = compile preprocessFileLineNumbers "functions\buildComposition.sqf";
BIS_fnc_VR_landingHelper = compile preprocessFileLineNumbers "functions\landingHelper.sqf";

// ---------- grid

BIS_gridCenter = markerPos "BIS_center";

// ---------- handling "death"

_null = [] spawn {
	while {TRUE} do {
		waitUntil {damage player > 3e-5};
		_null = [] execVM "death.sqf";
		waitUntil {damage player == 0};
	};
};

// ---------- terminate if player takes off his uniform / glasses
_null = [] spawn {
	while {TRUE} do {
		if (uniform player != "U_B_Protagonist_VR" || goggles player != "G_Goggles_VR") then {
			call BIS_fnc_VRFadeOut;
			sleep 2;
			endMission "End1";
		};
		sleep 0.25;
	};
};

// ---------- constant daytime
_null = [] spawn {
	while {TRUE} do {
		sleep 300;
		if (!BIS_VR_pauseTimeReset) then {
			skipTime (12 - daytime);
		};
	};
};

// ---------- each procedure should start at a different location to get rid of craters etc.

_null = [] spawn {
	_i = 1;
	_centerPosPool = [[1000, 1000], [2000, 1000], [3000, 1000], [1000, 2000], [2000, 2000], [3000, 2000], [1000, 3000], [2000, 3000], [3000, 3000], [1000, 4000], [2000, 4000], [3000, 4000], [4000, 4000], [1000, 5000], [2000, 5000]];
	while {TRUE} do {
		waitUntil {BIS_interruptable};
		waitUntil {!BIS_interruptable};
		"BIS_center" setMarkerPos (_centerPosPool select _i);
		_i = _i + 1;
		if (_i >= count _centerPosPool) then {_i = 0};
	};
};

// ---------- load topics

BIS_topics = [];
BIS_topicsUnofficial = [];

_topicsCnt = count (configFile >> "CfgVRCourses");

for [{_i = 0}, {_i < _topicsCnt}, {_i = _i + 1}] do {
	if (configName ((configFile >> "CfgVRCourses") select _i) != "Default") then {
		if (getNumber ((configFile >> "CfgVRCourses") select _i >> "official") == 1) then {
			BIS_topics = BIS_topics + [configName ((configFile >> "CfgVRCourses") select _i)];
		} else {
			BIS_topicsUnofficial = BIS_topicsUnofficial + [configName ((configFile >> "CfgVRCourses") select _i)];
		};
	};
};

BIS_topicsLockedOld = [];

// ---------- sort topics by priority

_noPrio = [];

{
	_prio = (_x call BIS_fnc_VR_topicInfo) select 4;
	if (_prio < 0) then {_noPrio = _noPrio + [_x]};
} forEach BIS_topics;

_topicsPrio = [BIS_topics - _noPrio, [], {(_x call BIS_fnc_VR_topicInfo) select 4}, "ASCEND"] call BIS_fnc_sortBy;

BIS_topics = _topicsPrio + _noPrio;
BIS_lastTopic = "Ballistics";

// ---------- IGUI colors

BIS_TT_colorWarning = [0.8,0.5,0,1];
BIS_TT_colorWarningHTML = BIS_TT_colorWarning call BIS_fnc_colorRGBtoHTML;
BIS_TT_colorInactive = [0.45,0.45,0.45,1];
BIS_TT_colorInactiveHTML = BIS_TT_colorInactive call BIS_fnc_colorRGBtoHTML;
BIS_activeColorTexture = "#(argb,8,8,3)color(0.581,0.441,0.293,1,co)";
BIS_inactiveColorTexture = "#(argb,8,8,3)color(0.45,0.45,0.45,1,co)";
BIS_timerRsc = "BIS_timer" call BIS_fnc_rscLayer;

// ---------- helper icon

BIS_iconGrp = createGroup CIVILIAN;
_iconLogic = "Logic" createUnit [position player, BIS_iconGrp];
BIS_iconGrp addGroupIcon ["selector_selectedMission", [0, 0]];
BIS_iconGrp setGroupIconParams [[0,0,0,0], "", 1, TRUE];
BIS_icon = leader BIS_iconGrp;

_null = [] spawn {
	while {TRUE} do {
		waitUntil {((getGroupIconParams BIS_iconGrp) select 0) select 3 > 0 && (getGroupIconParams BIS_iconGrp) select 3};
		_iconSize = 0;
		_pulse = "up";
	 	while {((getGroupIconParams BIS_iconGrp) select 0) select 3 > 0 && (getGroupIconParams BIS_iconGrp) select 3} do {
	 		if (_pulse == "up") then {
	 			_iconSize = _iconSize + 0.05;
	 			if (_iconSize >= 0.5) then {_pulse = "down"};
	 		} else {
	 			_iconSize = _iconSize - 0.05;
	 			if (_iconSize <= 0) then {_pulse = "up"};
	 		};
	 		_dist = cameraOn distance BIS_icon;
	 		if !(isNull attachedTo BIS_icon) then {
	 			_dist = cameraOn distance attachedTo BIS_icon;
	 		};
			BIS_iconGrp setGroupIconParams [BIS_TT_colorWarning, (str round _dist) + localize "STR_A3_rscdisplayarcademap_meters", 1 + _iconSize, TRUE];
			sleep 0.1;
		};
	};
};

// ---------- hub init

_null = [] execVM "hubStart.sqf";