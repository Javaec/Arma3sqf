sleep 1;

BIS_lacey enableSimulation true;
BIS_lacey playMoveNow "AmovPercMstpSlowWrflDnon";

// Fade in
enableEnvironment true;
3 fadeSound 1;
titleCut ["", "BLACK IN", 3];

sleep 1;

"01_Start" call BIS_fnc_missionConversations;

// Stop talking on the radio
BIS_adams playMoveNow "Acts_listeningToRadio_Out";

private ["_animEH"];
_animEH = BIS_adams addEventHandler [
	"AnimDone",
	{
		private ["_unit", "_anim"];
		_unit = _this select 0;
		_anim = _this select 1;
		
		if (_anim == "Acts_listeningToRadio_Out") then {
			_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
			_unit setVariable ["BIS_animEH", nil];
			
			{_unit enableAI _x} forEach ["ANIM", "AUTOTARGET", "TARGET"];
			_unit enableMimics true;
		};
	}
];

BIS_adams setVariable ["BIS_animEH", _animEH];

"05_Idiots" call BIS_fnc_missionConversations;

// Instruct others
{BIS_adams disableAI _x} forEach ["ANIM", "AUTOTARGET", "TARGET"];
BIS_adams enableMimics false;
BIS_adams playMoveNow "Acts_SignalToCheck";

private ["_animEH"];
_animEH = BIS_adams addEventHandler [
	"AnimDone",
	{
		private ["_unit", "_anim"];
		_unit = _this select 0;
		_anim = _this select 1;
		
		if (_anim == "Acts_SignalToCheck") then {
			_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
			_unit setVariable ["BIS_animEH", nil];
			
			{_unit enableAI _x} forEach ["ANIM", "AUTOTARGET", "TARGET"];
			_unit enableMimics true;
		};
	}
];

BIS_adams setVariable ["BIS_animEH", _animEH];

"10_Gather" call BIS_fnc_missionConversations;

// Register that the intro ended
BIS_introEnded = true;