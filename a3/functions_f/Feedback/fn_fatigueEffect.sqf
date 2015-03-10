/*
	File: fn_fatigueEffect.sqf
	Author: Borivoj Hlava

	Description:
	Effects for high fatigue values.

	Parameter(s):
	None.

	Returned value:
	None.
*/

[] spawn {
	private["_delay1", "_delay2", "_fatigue"];

	//init PPs to avoid fullscreen color at the beginning (used same values as for FADE OUT)-------------
	/*BIS_fnc_feedback_fatigueRadialBlur ppEffectAdjust [0,0,0.5,0.5];			//================================= hotfix of blur =================================
	BIS_fnc_feedback_fatigueRadialBlur ppEffectCommit 0;*/
	
	//add gaussian blur to make radial blur look better - LOWER
	/*BIS_fnc_feedback_fatigueBlur ppEffectAdjust [0];							//================================= hotfix of blur =================================
	BIS_fnc_feedback_fatigueBlur ppEffectCommit 0; */
	
	//RED
	BIS_fnc_feedback_fatigueCC ppEffectAdjust [1,1,0,[0.15, 0.15, 0.15, 0],[1, 1, 1, 1],[0.587, 0.587, 0.587, 0],[1, 1, 0, 0, 0, 0.2, 1]];

	BIS_fnc_feedback_fatigueCC ppEffectCommit 0;
	//init PPs ------------------------------------------------------------------------------------------
	_fatigue = ((getFatigue player) - 0.5) * 2;
	
	//FADE PPs IN ---------------------------------------------------------------------------------------
	_delay1 = 0.8 * acctime;

	//slight radial blur
	BIS_fnc_feedback_fatigueRadialBlur ppEffectAdjust [0, 0, 0, 0];
	BIS_fnc_feedback_fatigueRadialBlur ppEffectCommit 0;
	BIS_fnc_feedback_fatigueRadialBlur ppEffectEnable TRUE;
		
	//BIS_fnc_feedback_fatigueRadialBlur ppEffectAdjust [((0.005*_fatigue)+0.001067), ((0.005*_fatigue)+0.001067), 0.3, 0.3];  //================================= hotfix of blur =================================
	BIS_fnc_feedback_fatigueRadialBlur ppEffectAdjust [((0.0004*_fatigue)+0.001067), ((0.0004*_fatigue)+0.001067), 0.04, 0.04];  //================================= hotfix of blur =================================
	BIS_fnc_feedback_fatigueRadialBlur ppEffectCommit _delay1;

	//add gaussian blur to make radial blur look better - when player incapacitated switch this off
	/*BIS_fnc_feedback_fatigueBlur ppEffectAdjust [_fatigue/1.5];		//================================= hotfix of blur =================================
	BIS_fnc_feedback_fatigueBlur ppEffectEnable TRUE;
	BIS_fnc_feedback_fatigueBlur ppEffectCommit _delay1;*/
	

	if (currentVisionMode player == 0) then
	{
		//In normal view use red (changes with damage from gray to red)
		BIS_fnc_feedback_fatigueCC ppEffectAdjust [1,1,0,[0.15, 0.15, 0.15, ((0.466*_fatigue)+0.2)],
						[1.0, 1.0, 1.0, 1-((1.3*_fatigue)-0.8)],
						[0.587, 0.587, 0.587, 0.0],
						[0.85, 0.85, 0, 0, 0, 0.2, 1]];
	}
	else
	{
		//In NVG(1) or FLIR(2) use gray (consider using a little darker with NVGs)
		BIS_fnc_feedback_fatigueCC ppEffectAdjust [1,1,0,[0.15, 0.15, 0.15, ((0.466*_fatigue)+0.2)],
						[1, 1, 1, 1],
						[0.3, 0.3, 0.3, 0],
						[0.85, 0.85, 0, 0, 0, 0.2, 1]];
	};

	BIS_fnc_feedback_fatigueCC ppEffectEnable TRUE;
	BIS_fnc_feedback_fatigueCC ppEffectForceInNVG TRUE;
	BIS_fnc_feedback_fatigueCC ppEffectCommit _delay1;
	sleep (_delay1 + 0.1);  //added 0.1 to avoid flickering, see news:jubiqj$d5l$1@new-server.localdomain
	
	//FADE PPs OUT ---------------------------------------------------------------------------------------
	_delay2 = (1.5 + random 0.5) * acctime;
	
	//slight radial blur - LOWER
	BIS_fnc_feedback_fatigueRadialBlur ppEffectAdjust [0,0,0.5,0.5];
	BIS_fnc_feedback_fatigueRadialBlur ppEffectCommit _delay2;
	
	//add gaussian blur to make radial blur look better - LOWER
	/*BIS_fnc_feedback_fatigueBlur ppEffectAdjust [0];					//================================= hotfix of blur =================================
	BIS_fnc_feedback_fatigueBlur ppEffectCommit _delay2; */
	
	BIS_fnc_feedback_fatigueCC ppEffectAdjust [1,1,0,[0.15, 0.15, 0.15, 0],[1, 1, 1, 1],[0.3, 0.3, 0.3, 0],[1, 1, 0, 0, 0, 0.2, 1]];
	BIS_fnc_feedback_fatigueCC ppEffectCommit _delay2;
	
	sleep (_delay2 + 0.1);  //added 0.1 to avoid flickering, see news:jubiqj$d5l$1@new-server.localdomain

	//switch PPs off
	BIS_fnc_feedback_fatigueCC ppEffectEnable FALSE;
	BIS_fnc_feedback_fatigueRadialBlur ppEffectEnable FALSE;
	//BIS_fnc_feedback_fatigueBlur ppEffectEnable FALSE;				//================================= hotfix of blur =================================
	
	BIS_fnc_feedback_fatiguePP = false;
};