[] spawn {
	waitUntil {time > 0};
	
	// Conway (fake)
	BIS_laceyFake switchMove "HubSpectator_standU";
	
	// Adams
	{BIS_adamsFake disableAI _x} forEach ["ANIM", "AUTOTARGET", "MOVE", "TARGET"];
	BIS_adamsFake switchMove "HubBriefing_loop";
	BIS_adamsFake enableMimics false;
};