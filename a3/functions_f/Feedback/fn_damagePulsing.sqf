/*
	File: fn_damagePulsing.sqf
	Author: Vladimir Hynek, Borivoj Hlava

	Description:
	Pulsing damage effect.

	Parameter(s):
	None.

	Returned value:
	None. 
*/

//------------------------Total damage PULSING--------------------------------------------------

private["_delay1", "_delay2", "_damage"];
BIS_fnc_feedback_damagePP = TRUE;

[]spawn {
	switch (BIS_fnc_feedback_testHelper) do {
		case 0: {
			//init PPs to avoid fullscreen color at the beginning (used same values as for FADE OUT)-------------
			BIS_fnc_feedback_damageRadialBlur ppEffectAdjust [0,0,0.5,0.5];
			BIS_fnc_feedback_damageRadialBlur ppEffectCommit 0;
			
			//add gaussian blur to make radial blur look better - LOWER
			BIS_fnc_feedback_damageBlur ppEffectAdjust [0];
			BIS_fnc_feedback_damageBlur ppEffectCommit 0; 
			
			//RED
			BIS_fnc_feedback_damageCC ppEffectAdjust [1,1,0,[0.15, 0, 0, 0],[1, 0.5, 0.5, 1],[0.587, 0.199, 0.114, 0],[1, 1, 0, 0, 0, 0.2, 1]];
			BIS_fnc_feedback_damageCC ppEffectCommit 0;
			//init PPs ------------------------------------------------------------------------------------------	
			_damage = damage player;
			
			//FADE PPs IN ---------------------------------------------------------------------------------------
			_delay1 = 0.8 * acctime;

			//slight radial blur
			BIS_fnc_feedback_damageRadialBlur ppEffectAdjust [((0.005*_damage)+0.001067), ((0.005*_damage)+0.001067), 0.3, 0.3];  //more milder than the previous
			BIS_fnc_feedback_damageRadialBlur ppEffectEnable TRUE;
			BIS_fnc_feedback_damageRadialBlur ppEffectCommit _delay1;

			//add gaussian blur to make radial blur look better - when player incapacitated switch this off
			BIS_fnc_feedback_damageBlur ppEffectAdjust [_damage/1.5]; //0.5
			BIS_fnc_feedback_damageBlur ppEffectEnable TRUE;
			BIS_fnc_feedback_damageBlur ppEffectCommit _delay1;
			
			//RED 
			if (currentVisionMode player == 0) then	{
				//In normal view use red (changes with damage from gray to red)
				BIS_fnc_feedback_damageCC ppEffectAdjust [1,1,0,[0.15, 0, 0, ((0.466*_damage)+0.4)],
								[1.0, 0.5, 0.5, 1.2-((1.3*_damage)-0.8)],
								[0.587, 0.199, 0.114, 0],
								[0.85, 0.85, 0, 0, 0, 0.2, 1]];
			} else {
				//In NVG(1) or FLIR(2) use gray (consider using a little darker with NVGs)
				BIS_fnc_feedback_damageCC ppEffectAdjust [1,1,0,[0.15, 0.15, 0.15, ((0.466*_damage)+0.2)],
								[1, 1, 1, 1],
								[0.3, 0.3, 0.3, 0],
								[0.85, 0.85, 0, 0, 0, 0.2, 1]];
			};
			
			BIS_fnc_feedback_damageCC ppEffectEnable TRUE;
			BIS_fnc_feedback_damageCC ppEffectForceInNVG TRUE;
			BIS_fnc_feedback_damageCC ppEffectCommit _delay1;
			
			sleep (_delay1 + 0.1);  //added 0.1 to avoid flickering, see news:jubiqj$d5l$1@new-server.localdomain
			
			
			//FADE PPs OUT ---------------------------------------------------------------------------------------
			_delay2 = (1.5 + random 0.5) * acctime;
			
			//slight radial blur - LOWER
			BIS_fnc_feedback_damageRadialBlur ppEffectAdjust [0,0,0.5,0.5];
			BIS_fnc_feedback_damageRadialBlur ppEffectCommit _delay2;
			
			//add gaussian blur to make radial blur look better - LOWER
			BIS_fnc_feedback_damageBlur ppEffectAdjust [0];
			BIS_fnc_feedback_damageBlur ppEffectCommit _delay2; 
			
			//RED 
			BIS_fnc_feedback_damageCC ppEffectAdjust [1,1,0,[0.15, 0, 0, 0],[1, 0.5, 0.5, 1],[0.587, 0.199, 0.114, 0],[1, 1, 0, 0, 0, 0.2, 1]];
			BIS_fnc_feedback_damageCC ppEffectCommit _delay2;
			sleep (_delay2 + 0.1);  //added 0.1 to avoid flickering, see news:jubiqj$d5l$1@new-server.localdomain
					
			//switch PPs off
			BIS_fnc_feedback_damageCC ppEffectEnable FALSE;
			BIS_fnc_feedback_damageRadialBlur ppEffectEnable FALSE;
			BIS_fnc_feedback_damageBlur ppEffectEnable FALSE;
			
			//allow this script to be executed again
			BIS_fnc_feedback_damagePP = FALSE;
		};
		case 1: {
			//init PPs to avoid fullscreen color at the beginning (used same values as for FADE OUT)-------------
			BIS_fnc_feedback_damageRadialBlur ppEffectAdjust [0,0,0.5,0.5];
			BIS_fnc_feedback_damageRadialBlur ppEffectCommit 0;
			
			//RED
			BIS_fnc_feedback_damageCC ppEffectAdjust [1,1,0,[0.15, 0, 0, 0],[1, 0.5, 0.5, 1],[0.587, 0.199, 0.114, 0],[1, 1, 0, 0, 0, 0.2, 1]];
			BIS_fnc_feedback_damageCC ppEffectCommit 0;
			//init PPs ------------------------------------------------------------------------------------------	
			_damage = damage player;
			
			//FADE PPs IN ---------------------------------------------------------------------------------------
			_delay1 = 0.8 * acctime;

			//slight radial blur
			BIS_fnc_feedback_damageRadialBlur ppEffectAdjust [((0.005*_damage)+0.001067), ((0.005*_damage)+0.001067), 0.3, 0.3];  //more milder than the previous
			BIS_fnc_feedback_damageRadialBlur ppEffectEnable TRUE;
			BIS_fnc_feedback_damageRadialBlur ppEffectCommit _delay1;
			
			//RED 
			if (currentVisionMode player == 0) then	{
				//In normal view use red (changes with damage from gray to red)
				BIS_fnc_feedback_damageCC ppEffectAdjust [1,1,0,[0.15, 0, 0, ((0.466*_damage)+0.4)],
								[1.0, 0.5, 0.5, 1.2-((1.3*_damage)-0.8)],
								[0.587, 0.199, 0.114, 0],
								[0.85, 0.85, 0, 0, 0, 0.2, 1]];
			} else {
				//In NVG(1) or FLIR(2) use gray (consider using a little darker with NVGs)
				BIS_fnc_feedback_damageCC ppEffectAdjust [1,1,0,[0.15, 0.15, 0.15, ((0.466*_damage)+0.2)],
								[1, 1, 1, 1],
								[0.3, 0.3, 0.3, 0],
								[0.85, 0.85, 0, 0, 0, 0.2, 1]];
			};
			
			BIS_fnc_feedback_damageCC ppEffectEnable TRUE;
			BIS_fnc_feedback_damageCC ppEffectForceInNVG TRUE;
			BIS_fnc_feedback_damageCC ppEffectCommit _delay1;
			
			sleep (_delay1 + 0.1);  //added 0.1 to avoid flickering, see news:jubiqj$d5l$1@new-server.localdomain
			
			
			//FADE PPs OUT ---------------------------------------------------------------------------------------
			_delay2 = (1.5 + random 0.5) * acctime;
			
			//slight radial blur - LOWER
			BIS_fnc_feedback_damageRadialBlur ppEffectAdjust [0,0,0.5,0.5];
			BIS_fnc_feedback_damageRadialBlur ppEffectCommit _delay2; 
			
			//RED 
			BIS_fnc_feedback_damageCC ppEffectAdjust [1,1,0,[0.15, 0, 0, 0],[1, 0.5, 0.5, 1],[0.587, 0.199, 0.114, 0],[1, 1, 0, 0, 0, 0.2, 1]];
			BIS_fnc_feedback_damageCC ppEffectCommit _delay2;
			sleep (_delay2 + 0.1);  //added 0.1 to avoid flickering, see news:jubiqj$d5l$1@new-server.localdomain
					
			//switch PPs off
			BIS_fnc_feedback_damageCC ppEffectEnable FALSE;
			BIS_fnc_feedback_damageRadialBlur ppEffectEnable FALSE;
			
			//allow this script to be executed again
			BIS_fnc_feedback_damagePP = FALSE;			
		};
		case 2: {
			call BIS_fnc_healthEffects;
		};
	};
};