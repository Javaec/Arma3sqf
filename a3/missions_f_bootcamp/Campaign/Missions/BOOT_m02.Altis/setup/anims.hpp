[] spawn {
	waitUntil {time > 0};
	
	// Lacey
	BIS_lacey switchMove "HubSpectator_stand";
};

// Code to loop animations
BIS_animLoop = {
	private ["_unit", "_anim"];
	_unit = _this select 0;
	_anim = _this select 1;
	
	_unit setBehaviour "CARELESS";
	{_unit disableAI _x} forEach ["ANIM", "AUTOTARGET", "MOVE", "TARGET"];
	_unit enableMimics false;
	
	[_unit, _anim] spawn {
		private ["_unit", "_anim"];
		_unit = _this select 0;
		_anim = _this select 1;
		
		scriptName (format ["characters.hpp: _animLoop - [%1, %2]", _unit, _anim]);
		
		waitUntil {time > 0};
		
		// Play animation
		_unit switchMove _anim;
		
		// Loop animation
		private ["_animEH"];
		_animEH = _unit addEventHandler [
			"AnimDone",
			{
				private ["_unit", "_anim"];
				_unit = _this select 0;
				_anim = _this select 1;
				
				_unit switchMove _anim;
			}
		];
		
		_unit setVariable ["BIS_animEH", _animEH];
		
		// Reset animations if killed
		_unit addEventHandler [
			"Killed",
			{
				private ["_unit"];
				_unit = _this select 0;
				
				_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
				detach _unit;
				_unit switchMove "";
			}
		];
	};
};


// Autorifleman
BIS_team1 attachTo [BIS_team1_logic, [0,0,0]];
[BIS_team1, "InBaseMoves_lean1"] call BIS_animLoop;
[BIS_team1_logic, 2, 7] call BIS_fnc_setPitchBank;

// Grenadier
BIS_team2 attachTo [BIS_team2_logic, [0,0,0]];
[BIS_team2, "HubSittingChairC_idle1"] call BIS_animLoop;

// VR guy
[BIS_VR, "HubStandingUC_idle1"] call BIS_animLoop;

// Talker
[BIS_talker, "HubStanding_idle2"] call BIS_animLoop;