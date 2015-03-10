// ---------- get rid of ALL the things!!!1! (almost), reset player

titleCut ["", "BLACK FADED", 10];
hintSilent "";

{terminate _x} forEach BIS_VR_spawnArray;
BIS_VR_spawnArray = [];

setAccTime 1;
BIS_VR_pauseTimeReset = FALSE;

if (!isNull getConnectedUav player) then {
	player connectTerminalToUav objNull;
};
openMap [FALSE, FALSE];
showCommandingMenu "";
//_null = ["", 0, 0.2, 0.5, 0.5] spawn BIS_fnc_dynamicText;
RscFiringDrillTime_done = TRUE;
BIS_taskNotificationSuffix = "VR";
_null = [player, 0] call BIS_fnc_traceBullets;
player setPos [150,150,0];
{_veh = _x; {_x setPos position _veh; deleteVehicle _x} forEach crew _veh; deleteVehicle _veh} forEach ((allMissionObjects "") - [player, BIS_icon]);
{if (count units _x == 0) then {deleteGroup _x}} forEach allGroups;
enableSentences TRUE;
enableRadio TRUE;
BIS_iconGrp setGroupIconParams [[0, 0, 0, 0], "", 1, TRUE];
detach BIS_icon;
player setDamage 0;
player setCaptive FALSE;
player addRating -rating player;
removeHeadgear player;
removeVest player;
removeBackpack player;
removeAllWeapons player;
removeAllItems player;
{
	player unassignItem _x;
	player removeItem _x;
} forEach (assignedItems player - ["ItemMap"]);

if (!("ItemMap" in items player) && !("ItemMap" in assignedItems player)) then {
	player addItem "ItemMap"; player assignItem "ItemMap";
};
if !("ItemMap" in assignedItems player) then {
	player assignItem "ItemMap";
};

{
	[_x] call BIS_fnc_deleteTask;
} forEach (player getVariable ["BIS_fnc_setTaskLocal_tasks", []]);

player setPos markerPos "BIS_center";
player setDir markerDir "BIS_center";
vehicle player switchCamera "INTERNAL";

BIS_gridCenter = markerPos "BIS_center";
//[BIS_gridCenter] call BIS_fnc_VRDrawGrid;