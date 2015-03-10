// ---------- repeating or leaving a course

disableSerialization;

uiNamespace setVariable ["BIS_interruptDisplay", _this select 0];

private ["_controlRevert", "_controlAbort"];
_controlRevert = (_this select 0) displayCtrl 119;
_controlAbort = (_this select 0) displayCtrl 104;

if (missionNameSpace getVariable "BIS_interruptable") then {
	_controlRevert ctrlSetTooltip localize "STR_A3_VR_restart_tip";
	_controlRevert ctrlEnable TRUE;
	_controlAbort ctrlEnable TRUE;
	_controlRevert ctrlSetEventHandler ["buttonClick", "(uiNamespace getVariable ""BIS_interruptDisplay"") closeDisplay 2; _null = [] execVM ""restart.sqf""; TRUE"];
	_controlAbort ctrlSetText localize "STR_A3_VR_return_text";
	_controlAbort ctrlSetTooltip localize "STR_A3_VR_return_tip";
	_controlAbort ctrlSetEventHandler ["buttonClick", "(uiNamespace getVariable ""BIS_interruptDisplay"") closeDisplay 2; _null = [] execVM ""toHub.sqf""; TRUE"];
} else {
	if ((missionNameSpace getVariable "BIS_topic") < 0) then {
		_controlRevert ctrlEnable TRUE;
		_controlAbort ctrlEnable TRUE;
		_controlAbort ctrlSetEventHandler ["buttonClick", "(uiNamespace getVariable ""BIS_interruptDisplay"") closeDisplay 2; _null = [] spawn {['death'] call BIS_fnc_VRFadeOut; sleep 2; endMission ""End1""}; TRUE"];
	} else {
		_controlRevert ctrlEnable FALSE;
		_controlAbort ctrlSetText localize "STR_A3_VR_return_text";
		_controlAbort ctrlEnable FALSE;
	};
};

TRUE