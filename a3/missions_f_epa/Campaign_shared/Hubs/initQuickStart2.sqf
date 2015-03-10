//setup the triggering user actions
scriptName "initQuickStart2.sqf";

private["_triggerObj"];

_triggerObj = ["Hubs",missionName,"QuickStart","trigger"] call BIS_fnc_getCfgDataObject;

[_triggerObj] call BIS_QuickStart_addAction;