[] spawn {
	waitUntil {time > 0};
	
	// Lacey
	BIS_lacey switchMove "HubSpectator_stand";
	
	// Ambushers
	{
		_x setUnitPos "DOWN";
		_x switchMove "AmovPpneMstpSrasWrflDnon";
	} forEach [BIS_ambush1, BIS_ambush2];
	
	// Wounded AAF
	{BIS_wounded disableAI _x} forEach ["ANIM", "AUTOTARGET", "MOVE", "TARGET"];
	BIS_wounded switchMove "Acts_SittingWounded_loop";
	BIS_wounded attachTo [BIS_wounded_logic, [0,0,0]];
};