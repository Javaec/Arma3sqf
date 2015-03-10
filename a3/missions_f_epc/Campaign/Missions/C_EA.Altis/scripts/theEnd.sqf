disableSerialization;
setAccTime 1;

// The End
private ["_layerText"];
_layerText = "BIS_theEnd" call BIS_fnc_rscLayer;
_layerText cutRsc ["RscDynamicText", "PLAIN"];

private ["_dispText", "_ctrlText"];
_dispText = uiNamespace getVariable "BIS_dynamicText";
_ctrlText = _dispText displayCtrl 9999;

_ctrlText ctrlSetPosition [
	0 * safeZoneW + safeZoneX,
	0.5 * safeZoneH + safeZoneY,
	safeZoneW,
	safeZoneH
];

private ["_text"];
_text = "<t align = 'center' font = 'PuristaBold' size = '1.25'>" + toUpper (localize "STR_A3_epilogue_end") + "</t>";

_ctrlText ctrlSetStructuredText parseText _text;
_ctrlText ctrlSetFade 1;
_ctrlText ctrlCommit 0;

_ctrlText ctrlSetFade 0;
_ctrlText ctrlCommit 7;

// Wait for it to fade in
waitUntil {ctrlCommitted _ctrlText};

// Allow skipping
private ["_dispSkip"];
_dispSkip = [] call BIS_fnc_displayMission;

if (!(isNil {uiNamespace getVariable "BIS_theEnd_skipEH"})) then {
	_dispSkip displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "BIS_theEnd_skipEH"];
	uiNamespace setVariable ["BIS_theEnd_skipEH", nil];
};

private ["_skipEH"];
_skipEH = _dispSkip displayAddEventHandler [
	"KeyDown",
	"
		if ((_this select 1) in [1, 57] && isNil 'BIS_theEnd_skipped') then {
			BIS_theEnd_skipped = true;
			playSound ['click', true];
		};
		
		true
	"
];

uiNamespace setVariable ["BIS_theEnd_skipEH", _skipEH];

// Wait for it to be skipped or the music to finish
waitUntil {{!(isNil _x)} count ["BIS_musicStopped", "BIS_theEnd_skipped"] > 0};

// Remove eventhandler
_dispSkip displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "BIS_theEnd_skipEH"];
uiNamespace setVariable ["BIS_theEnd_skipEH", nil];

// Fade out
3 fadeMusic 0;

_ctrlText ctrlSetFade 1;
_ctrlText ctrlCommit 3;

sleep 4;

// End the mission
endMission "END1";