/*
	File: fn_damageChanged.sqf
	Author: Vladimir Hynek, Borivoj Hlava

	Description:
	Handle effects caused by changing of damage.

	Parameter(s):
	None.

	Returned value:
	None.
*/


BIS_applyPP3 = false;
BIS_fnc_feedback_deltaDamage = (damage player) - BIS_oldDMG;
BIS_deltaDMG = abs BIS_fnc_feedback_deltaDamage;

[]spawn {
	private["_damage", "_helper"];

	_damage = damage player;	

	if(BIS_wasHit) then
	{
		if (BIS_fnc_feedback_deltaDamage >= 0) then {
			//---------------- Hit by bullet, explosion, fire or fall - show red---------------------------------------------------
			if (BIS_canStartRed) then
			{
				BIS_hitArray call BIS_fnc_radialRed;
			};
			
			//burning effects - flames - old and ugly looking effect, disabled for now
			/*if (isBurning player) then {
				BIS_fnc_feedback_burningTimer = 0;
				BIS_PP_burning = true;
				if (BIS_applyPP6) then {
					call BIS_fnc_flamesEffect;
				};
			};*/

			//---------------- Hit that caused bleeding - show blood------------------------------------------------------
			//Bleeding textures are not displayed under water (no bleeding there)
			if ((((GetBleedingRemaining player) - BIS_oldBleedRemaining) > 0.0001) && (isAbleToBreathe player)) then {
				_bleedingTime = getBleedingRemaining player;
				[_bleedingTime] call BIS_fnc_bloodEffect;
			} else {
				//bleeding time lowered - update BIS_oldBleedRemaining
				BIS_oldBleedRemaining = getBleedingRemaining player;
			};
		} else {
			//if (BIS_fnc_feedback_blue) then {
			//	call BIS_fnc_healing;	//waiting for new script commands
			//};
			if (BIS_canStartRed) then {	// temporary red effect, should be removed
				BIS_hitArray call BIS_fnc_radialRed;
			};
		};
		BIS_wasHit = false;
	};

	
	//-----------------INCAPACITATED PPs-----------------------------------------
	//switch incapacitated blur ON/OFF
	if((lifeState player) != BIS_oldLifeState) then
	{
		_null = call BIS_fnc_incapacitatedEffect;
	};

	//Incapacitated - RED
	if((lifeState player == "INCAPACITATED") || (lifeState player == "DEAD")) then
	{
		//RED color
		//BIS_UncCC ppEffectAdjust [1,1,0,[0.17, 0.0008, 0.0008, 0.001 max (1 min ((0.05/(_damage-0.8))-0.25))],[0.17, 0.0008, 0.0008, 1],[1, 1, 1, 0]];
		// BIS_UncCC ppEffectAdjust [1,1,0,[0,0,0,0],[0.17, 0.0008, 0.0008, 0.218 max (1 min ((0.03/(_damage-0.819))+0.05))],[1, 1, 1, 0]];
		// BIS_UncCC ppEffectEnable TRUE;
		// BIS_UncCC ppEffectForceInNVG TRUE;
		// BIS_UncCC ppEffectCommit 0;
		
		//blur
		// BIS_UncBlur ppEffectAdjust [0.5];
		// BIS_UncBlur ppEffectEnable TRUE;
		// BIS_UncBlur ppEffectCommit 0;
		
		if (currentVisionMode player == 0) then
		{
			//In normal view use red
			BIS_UncCC ppEffectAdjust [1,1,0,[0.15, 0.0, 0.0, (3.33*_damage)-2.83], [1.0, 0.5, 0.5, 1-((3.33*_damage)-2.83)], [0.587, 0.199, 0.114, 0.0]];
		} else {
			//In NVG(1) or FLIR(2) use gray
			BIS_UncCC ppEffectAdjust [1,1,0,[0.15, 0.15, 0.15, (2.667*_damage)-2.266], [0.5, 0.5, 0.5, 1-((2.667*_damage)-2.266)], [0.587, 0.199, 0.114, 0.0]];
		};
		
		BIS_UncCC ppEffectEnable TRUE;
		BIS_UncCC ppEffectForceInNVG TRUE;
		BIS_UncCC ppEffectCommit 0;
		
		//blur - is launched in BIS_fnc_incapacitatedEffect
		// BIS_UncBlur ppEffectAdjust [0.8];
		// BIS_UncBlur ppEffectEnable TRUE;
		// BIS_UncBlur ppEffectCommit 0;
	} else {
		BIS_UncCC ppEffectEnable FALSE;
		//BIS_UncBlur ppEffectEnable FALSE;
	};

	BIS_applyPP3 = true;
	BIS_oldDMG = damage player;
};