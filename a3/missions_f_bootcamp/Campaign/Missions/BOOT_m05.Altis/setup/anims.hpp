[] spawn {
	waitUntil {time > 0};
	
	// Conway
	BIS_lacey switchMove "Acts_PknlMstpSlowWrflDnon";
	
	// Martinez
	{
		private ["_unit", "_anim"];
		_unit = _x;
		_anim = "InBaseMoves_patrolling" + str (_forEachIndex + 1);
		
		{_unit disableAI _x} forEach ["ANIM", "AUTOTARGET", "MOVE", "TARGET"];
		_unit enableMimics false;
		_unit setBehaviour "CARELESS";
		
		_unit switchMove _anim;
		
		private ["_animEH"];
		_animEH = _unit addEventHandler [
			"AnimDone",
			format [
				"
					private ['_unit', '_anim'];
					_unit = _this select 0;
					_anim = _this select 1;
					
					if (_anim == '%1') then {
						_unit removeEventHandler ['AnimDone', _unit getVariable 'BIS_animEH'];
						_unit setVariable ['BIS_animEH', nil];
						
						_unit switchMove 'AmovPercMstpSlowWrflDnon';
						
						{_unit enableAI _x} forEach ['ANIM', 'AUTOTARGET', 'MOVE', 'TARGET'];
						_unit enableMimics true;
					};
				",
				_anim
			]
		];
		
		_unit setVariable ["BIS_animEH", _animEH];
	} forEach [BIS_team1];
	
	// Dead AAF
	BIS_wounded switchMove "Acts_SittingWounded_out";
	BIS_wounded attachTo [BIS_wounded_logic, [0,0,0]];
	
	// Akhanteros
	BIS_IHQ switchMove "Acts_Abuse_Akhanteros";
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