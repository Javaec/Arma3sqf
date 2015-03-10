/*
	File: fn_incapacitatedEffect.sqf
	Author: Vladimir Hynek

	Description:
	Do not use - WIP.

	Parameter(s):
	-

	Returned value:
	-
*/

//-----------------INCAPACITATED PPs-----------------------------------------

[]spawn {
	//INCAPACITATED ON
	if( (lifeState player == "INCAPACITATED") && ((BIS_oldLifeState == "HEALTHY") || (BIS_oldLifeState == "INJURED")) ) then
	{
	//hint "INCAPACITATED ON";

		BIS_oldLifeState = lifeState player;
		
		//desaturated image
		//BIS_UncCC ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,0.2],[0.35,0.35,0.35,0]];
		//BIS_UncCC ppEffectEnable TRUE;
		//BIS_UncCC ppEffectCommit 3.5;

		//slight radial blur
		//BIS_UncRadialBlur ppEffectAdjust [0.011,0.011,0.1,0.1]; // [0.006,0.012,0.1,0.1];
		//BIS_UncRadialBlur ppEffectEnable TRUE;
		//BIS_UncRadialBlur ppEffectCommit 3.5;

		//add gaussian blur to make radial blur look better
		BIS_UncBlur ppEffectAdjust [1.5]; //[3.15];
		BIS_UncBlur ppEffectEnable TRUE; 
		BIS_UncBlur ppEffectCommit 3.5;
	};

	//INCAPACITATED OFF
	if( (BIS_oldLifeState == "INCAPACITATED") && ((lifeState player == "HEALTHY") || (lifeState player == "INJURED"))  ) then
	{
	//hint "INCAPACITATED OFF";

		BIS_oldLifeState = lifeState player;

		//BIS_UncCC ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,1],[0,0,0,0]];
		//BIS_UncCC ppEffectCommit 3.5; //2.5

		//BIS_UncRadialBlur ppEffectAdjust [0.0, 0.0, 0.5, 0.5];
		//BIS_UncRadialBlur ppEffectCommit 3.5;  //2.5

		BIS_UncBlur ppEffectAdjust [0];
		BIS_UncBlur ppEffectCommit 3.5;  //2.5
		sleep 3.5;
		BIS_UncBlur ppEffectEnable FALSE;
	};
};

//-----------------INCAPACITATED PPs-----------------------------------------