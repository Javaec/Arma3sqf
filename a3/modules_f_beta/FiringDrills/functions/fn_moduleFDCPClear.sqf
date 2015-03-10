private ["_target", "_optional", "_targetCP", "_targetCPObj"];
_target = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_optional = _target getVariable ["optional", 0];
_targetCP = _target getVariable ["CP", 1];
_targetCPObj = BIS_FD_CPs select (_targetCP - 1);

if ((BIS_FD_rule1 == 0) && (_optional != 1)) then 
{
	//See how many targets remain in total
	//TODO: too intense for every hit - improve?

	BIS_FD_targetsRemaining = 0;

	private ["_allClear"];
	_allClear = true;
	{
		private ["_activeTargets"];
		_activeTargets = {((_x getVariable ["optional", 0]) == 0) && ((_x getVariable ["noShoot", 0]) == 0) && (((_x getVariable ["state", -1]) in [1, 2]) || (((_x getVariable ["state", -1]) == 0) && (_x getVariable ["triggerActive", false])))} count (_x getVariable ["targets", []]);
		BIS_FD_targetsRemaining = BIS_FD_targetsRemaining + _activeTargets;
		if (_activeTargets > 0) then {_allClear = false;};
	} forEach BIS_FD_CPs;

	if (_allClear) then 
	{
		BIS_FD_ended = true;
	};
};

if (!BIS_FD_ended) then 
{
	//Seperate target count for this CP only
	private ["_targets", "_targetsRemaining", "_bonusesRemaining"];
	_targets = _targetCPObj getVariable "targets";
	_targetsRemaining = {((_x getVariable ["state", -1]) in [1, 2]) && ((_x getVariable ["noShoot", 0]) != 1) && ((_x getVariable ["optional", 0]) != 1)} count _targets;
	_bonusesRemaining = {((_x getVariable ["state", -1]) in [1, 2]) && ((_x getVariable ["optional", 0]) == 1)} count _targets;
	BIS_FD_targetsRemainingCP = _targetsRemaining;

	private ["_textBonusesActive"];
	_textBonusesActive = "";
	if (_bonusesRemaining > 0) then 
	{
		_textBonusesActive = str _bonusesRemaining;
	};
	RscFiringDrillCheckpoint_targetTextTotal = _textBonusesActive;
	
	if (_optional != 1) then 
	{
		if (_targetsRemaining == 0) then 
		{
			BIS_FD_activeCPObj setVariable ["clear", true];

			if (BIS_FD_rule1 != 0) then 
			{
				_targetsRemaining spawn 
				{
					RscFiringDrillCheckpoint_targetTextCurrent = str _this;
					sleep 0.2;
					RscFiringDrillCheckpoint_done = true;
				};
				
				["CheckPoints", "Firing_Drills", [[["ROF", 14], ["ROF", 15], ["ROF", 16], ["ROF", 17], ["ROF", 18]] call BIS_fnc_selectRandom, true], "SIDE"] spawn BIS_fnc_kbTell;

				private ["_cpMarker"];
				_cpMarker = BIS_FD_activeCPObj getVariable ["marker", ""];
				_cpMarker setMarkerType "mil_objective";
				
				playSound "FD_CP_Clear_F";				
			} 
			else 
			{
				RscFiringDrillCheckpoint_targetTextCurrent = str BIS_FD_targetsRemaining;
			};
		} 
		else 
		{
			if (BIS_FD_rule1 != 0) then 
			{
				RscFiringDrillCheckpoint_targetTextCurrent = str _targetsRemaining;
			} 
			else 
			{
				RscFiringDrillCheckpoint_targetTextCurrent = str BIS_FD_targetsRemaining;
			};
		};
	};
};

true