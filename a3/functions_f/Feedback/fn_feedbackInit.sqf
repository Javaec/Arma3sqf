/*
	File: fn_feedbackInit.sqf
	Author: Vladimir Hynek, Borivoj Hlava

	Description:
	Init function for feedback system. Declaration of variables, eventhandlers, etc.

	Parameter(s):
	None.

	Returned value:
	None. 
*/

[] spawn {
	//global variables
	BIS_ppType = "";
	BIS_fakeDamage = 0.1;
	BIS_add = true;
	BIS_distToFire = 10;
	BIS_performPP = true;			//to continue pp and let another pp to stop it
	BIS_fnc_feedback_damagePP = FALSE;		//not to trigger Total damage pulsing twice
	BIS_respawnInProgress = false;  //TEST
	BIS_fnc_feedback_testHelper = 0;

	//checks whether PPs were reseted by engine (see news:jf1bu5$o26$1@new-server.localdomain)
	BIS_EnginePPReset = false;
	if (isNil {player getVariable "BIS_fnc_feedback_postResetHandler"}) then {
		player setVariable ["BIS_fnc_feedback_postResetHandler", true];
		player addeventhandler ["PostReset",{BIS_EnginePPReset = true;} ];
	};

	//init layers to define their order
	["HealthPP_blood"] call bis_fnc_rscLayer;
	["HealthPP_dirt"] call bis_fnc_rscLayer;
	["HealthPP_fire"] call bis_fnc_rscLayer;
	["HealthPP_black"] call bis_fnc_rscLayer;

	BIS_pulsingFreq = getnumber (configfile >> "cfgfirstaid" >> "pulsationSoundInterval");    //frequency of pulsing when unconscious

	BIS_helper = 0.5;
	BIS_applyPP1 = true;
	BIS_applyPP2 = true;
	BIS_applyPP3 = true; //hit-red
	BIS_applyPP8 = true; //to remove UNCONSCIOUS PP and add TOTAL DAMAGE PP again
	BIS_canStartRed = true; //to wait until red PP finishes and then allow it to start again
	BIS_fnc_feedback_blue = true;	//to wait until blue PP finishes and then allow it to start again

	BIS_oldDMG = 0;  //damage player
	BIS_deltaDMG = 0;
	BIS_oldLifeState = "HEALTHY"; //lifeState player, caused problems when respawning

	//Total damage - lowest priority!
	//desaturated image
	BIS_TotDesatCC = ppEffectCreate ["ColorCorrections", 1600];
	BIS_TotDesatCC ppEffectAdjust [1,1,0,[0, 0, 0, 0],[1, 1, 1, 1],[0,0,0,0]];  //to init total CC, to be able to recover tot. damage after unconscious

	//tunnel vision
	BIS_blendColorAlpha = 0.0;
	BIS_fnc_feedback_damageCC = ppEffectCreate ["ColorCorrections", 1605];
	//BIS_fnc_feedback_damageCC ppEffectAdjust [1,1,0,[0, 0, 0, 0],[1, 1, 1, 1],[0,0,0,0], [1,1, 0, 0, 0, 0.001, 0.8]];  //to init total CC, to be able to recover tot. damage after unconscious

	BIS_fnc_feedback_damageRadialBlur = ppEffectCreate ["RadialBlur", 260];
	BIS_fnc_feedback_damageBlur = ppEffectCreate ["DynamicBlur", 160];

	//event handler for pulsing (damage should be >= 0.1)
	if (isNil {player getVariable "BIS_fnc_feedback_damagePulsingHandler"}) then {
		player setVariable ["BIS_fnc_feedback_damagePulsingHandler", true];
		player addeventhandler ["SoundPlayed",
		{
			if(((_this select 1) == 2) && (damage player >= 0.1) && !BIS_fnc_feedback_damagePP &&  (((uavControl (getConnectedUav player)) select 1) == "")) then
			{
				call BIS_fnc_damagePulsing;
			};
		} ];
	};

	//suffocating	
	BIS_SuffCC = ppEffectCreate ["ColorCorrections", 1610];
	//BIS_SuffCC2 = ppEffectCreate ["ColorCorrections", 1610];

	// init PP to avoid artefacts after going under water---------TEST
	BIS_SuffCC ppEffectAdjust [1,1,0,[0, 0, 0, 0 ],[1, 1, 1, 1],[0,0,0,0], [-1, -1, 0, 0, 0, 0.001, 0.5]];

	//BIS_SuffCC ppEffectEnable TRUE;
	//BIS_SuffCC ppEffectCommit 0;

	BIS_SuffRadialBlur = ppEffectCreate ["RadialBlur", 270];
	BIS_SuffBlur = ppEffectCreate ["DynamicBlur", 170];

	BIS_applyPP5 = true;				//to wait until change of suffocating PP is finished
	BIS_oldOxygen = 1.0;			//to cancel suffocating PP only once, when player breaths in

	//burning
	BIS_counter = 1; 					//for yellow/orange flashes
	BIS_alfa = 0.0;
	BIS_applyPP6 = true;				//to wait until change of burn PP is finished
	BIS_oldWasBurning = false;		 //to cancel burn PP only once, when player leaves fire
	BIS_BurnCC = ppEffectCreate ["ColorCorrections", 1620];
	BIS_BurnWet = ppEffectCreate ["WetDistortion", 400];
	BIS_PP_burnParams = [];
	BIS_PP_burning = false;
	BIS_fnc_feedback_burningTimer = 0;

	//fall unconscious + death from unconscious, tired from fatigue (same PP as fainting)
	//BIS_oldFatigue = 0;  //NOT NEEDED according to new Health analysis
	BIS_UncCC = ppEffectCreate ["ColorCorrections", 1603];  //red when incapacitated was 1630. Has now lower priority than BIS_fnc_feedback_damageCC (is rendered before gray effect)
	BIS_UncRadialBlur = ppEffectCreate ["RadialBlur", 280];
	BIS_UncBlur = ppEffectCreate ["DynamicBlur", 180];

	//sudden Death
	BIS_applyPP4 = true; //to apply death only once
	BIS_DeathCC = ppEffectCreate ["ColorCorrections", 1640];
	BIS_DeathRadialBlur = ppEffectCreate ["RadialBlur", 290];
	BIS_DeathBlur = ppEffectCreate ["DynamicBlur", 190];

	// bleeding indication
	BIS_oldBleedRemaining = 0;   //is needed for textures (bleeding caused by hit); Time for which player will bleed.
	BIS_applyPP7 = true; //is needed for indication instead of health guy
	BIS_BleedCC = ppEffectCreate ["ColorCorrections", 1645];

	//hit PP - highest priority
	BIS_HitCC = ppEffectCreate ["ColorCorrections", 1650];
	//hit detection - to recognize hitting by bullets from hitting by fire or suffocating
	BIS_wasHit = false;
	//_this is array returned by eventHandler - save him to global variable and process in the FSM
	//player addEventHandler ["hit", "BIS_wasHit = true"]; //TEST - try HandleDamage to get hit detector working
	if (isNil {player getVariable "BIS_fnc_feedback_hitArrayHandler"}) then {
		player setVariable ["BIS_fnc_feedback_hitArrayHandler", true];
		player addEventHandler ["HandleDamage",{BIS_hitArray = _this; BIS_wasHit = true;} ];
	};

	//damage handling-to recognize near explosions - replaced by new Filip's Explosion handler
	//player addEventHandler ["HandleDamage",{BIS_hitArray=_this;} ];
	BIS_performingDustPP = false;  //to not launch another dust too early
	BIS_damageFromExplosion = 0;
	if (isNil {player getVariable "BIS_fnc_feedback_dirtEffectHandler"}) then {
		player setVariable ["BIS_fnc_feedback_dirtEffectHandler", true];
		player addeventhandler ["Explosion",{_null = _this call BIS_fnc_dirtEffect;_this select 1;} ];
	};

	//TEST
	BIS_myOxygen = 1.0;

	//for reseting all PP when player respawned in MP
	BIS_respawned = false;
	if (isNil {player getVariable "BIS_fnc_feedback_respawnedHandler"}) then {
		player setVariable ["BIS_fnc_feedback_respawnedHandler", true];
		player addEventHandler ["respawn", "BIS_respawned = true"];
	};
	//player addEventHandler ["respawn", "debugLog 'FSMPP-EventHandlerTriggered' "];  //TEST if event handler is destroyed when player dies

	//for reseting all PP when Team switch is done (player switched to another unit)
	BIS_teamSwitched = false;
	onTeamSwitch "BIS_teamSwitched = true";
	BIS_teamSwitched = false;  //to avoid team switch that occurs when player is created
	
	//fatigue related effects
	BIS_fnc_feedback_fatiguePP = false;
	BIS_fnc_feedback_fatigueCC = ppEffectCreate ["ColorCorrections", 1615];
	BIS_fnc_feedback_fatigueRadialBlur = ppEffectCreate ["RadialBlur", 275];
	BIS_fnc_feedback_fatigueBlur = ppEffectCreate ["DynamicBlur", 175];
};