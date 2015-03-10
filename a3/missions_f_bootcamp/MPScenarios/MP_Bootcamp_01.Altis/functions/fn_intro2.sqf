private "_viewDistance";
_viewDistance = viewDistance;
setViewDistance 2500;

// Screen and sound
0 fadeSound 0;
0 fadeMusic 0;
cutText ["", "BLACK FADED", 99];

// Wait for game to pre load
["BIS_introPreload", "onPreloadFinished", {
	// Remove event handler
	["BIS_introPreload", "onPreloadFinished"] call BIS_fnc_removeStackedEventHandler;
	
	// Set variable
	missionNamespace setVariable ["BIS_readyForIntro", true];
}] call BIS_fnc_addStackedEventHandler;

// Wait
waitUntil {
	!isNil { missionNamespace getVariable "BIS_readyForIntro" }
	&&
	{ !isNull (findDisplay 46) }
};

//Establishing Shot
private "_color";
_color = WEST call BIS_fnc_sideColor;
_color set [3, 0.33];
[
	getMarkerPos "BIS_bootcampCenter",
	localize "STR_A3_MP_Bootcamp_Name",
	250,
	900,
	60,
	1,
	[
		["a3\Ui_F_Curator\Data\RscCommon\RscAttributeInventory\filter_6_ca.paa", [1,1,1,1], getMarkerPos "BIS_firingRange_grenade", 1, 1, 0, "", 0],
		["a3\Ui_F_Curator\Data\RscCommon\RscAttributeInventory\filter_1_ca.paa", [1,1,1,1], getMarkerPos "BIS_firingRange_weapon", 1, 1, 0, "", 0],
		["a3\UI_F_Curator\Data\RscCommon\RscAttributeBootcampStage\Icon_VehiclesFiringRange.paa", [1,1,1,1], getMarkerPos "BIS_firingRange_vehicle", 1, 1, 0, "", 0],
		["a3\Ui_F_Curator\Data\RscCommon\RscAttributeSpeedMode\full_ca.paa", [1,1,1,1], getMarkerPos "BIS_obstacleCourse_infantry", 1, 1, 0, "", 0],
		["a3\Ui_f\data\IGUI\Cfg\Actions\getindriver_ca.paa", [1,1,1,1], getMarkerPos "BIS_obstacleCourse_vehicles", 1, 1, 0, "", 0],
		["a3\Ui_f\data\IGUI\Cfg\Actions\getindriver_ca.paa", [1,1,1,1], getMarkerPos "BIS_karts", 1, 1, 0, "", 0]
	]
] spawn BIS_fnc_establishingShot;

// Screen and sound
5 fadeSound 1;
5 fadeMusic 0.5;
cutText ["", "BLACK IN", 5];

waitUntil { !isNil { BIS_missionStarted } };
setViewDistance _viewDistance;

// Disable saving
enableSaving [false, false];
