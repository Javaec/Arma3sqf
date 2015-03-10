[] spawn {
	waitUntil {time > 0};
	
	// Lacey
	BIS_lacey switchMove "HubSpectator_stand";
	
	// Adams
	{BIS_adams disableAI _x} forEach ["ANIM", "AUTOTARGET", "MOVE", "TARGET"];
	BIS_adams enableMimics false;
	BIS_adams switchMove "Acts_listeningToRadio_Loop";
	
	// AAF Trainee 3
	BIS_train3 setUnitPos "MIDDLE";
	BIS_train3 switchMove "AmovPknlMstpSrasWrflDnon";
	
	// Worker
	{BIS_worker disableAI _x} forEach ["ANIM", "AUTOTARGET", "MOVE", "TARGET"];
	BIS_worker enableMimics false;
	BIS_worker switchMove "Acts_ShowingTheRightWay_loop";
	
	// Repair man
	{BIS_repair disableAI _x} forEach ["ANIM", "AUTOTARGET", "MOVE", "TARGET"];
	BIS_repair enableMimics false;
	BIS_repair switchMove "InBaseMoves_repairVehicleKnl";
	
	// Guard
	{BIS_guard disableAI _x} forEach ["ANIM", "AUTOTARGET", "MOVE", "TARGET"];
	BIS_guard enableMimics false;
	BIS_guard switchMove "InBaseMoves_HandsBehindBack2";
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
		private ["_killedEH"];
		_killedEH = _unit addEventHandler [
			"Killed",
			{
				private ["_unit"];
				_unit = _this select 0;
				
				_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
				detach _unit;
				_unit switchMove "";
			}
		];
		
		_unit setVariable ["BIS_killedEH", _killedEH];
	};
};

// AAF Trainee 1
[BIS_train1, "HubStandingUB_idle2"] call BIS_animLoop;

// AAF Trainee 2
[BIS_train2, "HubStanding_idle3"] call BIS_animLoop;

// AAF Trainee 4
[BIS_train4, "HubStandingUC_idle1"] call BIS_animLoop;

// VR guy
[BIS_VR, "HubStandingUC_idle1"] call BIS_animLoop;

// Talker
[BIS_talker, "HubStanding_idle2"] call BIS_animLoop;