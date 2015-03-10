/*
	File: fn_radialRedOut.sqf
	Author: Borivoj Hlava

	Description:
	Red radial postprocess (fire damage) is removed.

	Parameter(s):
	None.

	Returned value:
	None.
*/

[] spawn {
	if ((count BIS_PP_burnParams) == 0) then {
		 BIS_PP_burnParams = [0.55,0,0,safezoneW * 0.55,safezoneH * 0.55,[0.3,0.0,0.0]];
		debugLog "Health_PP - undefined _burnParams array!";
	};

	//--- Compose params for PP effect
	_sizeCoef = BIS_PP_burnParams select 0;
	_offsetX = BIS_PP_burnParams select 1;
	_offsetY = BIS_PP_burnParams select 2;
	_sizeX = BIS_PP_burnParams select 3;
	_sizeY = BIS_PP_burnParams select 4;
	_colorRGB = BIS_PP_burnParams select 5;
	_adjust = [1,1,0,_colorRGB + [0],[1,1,1,1],[0.3,0.3,0.3,0],[_sizeX,_sizeY,0,_offsetX,_offsetY,0.5,1]];

	//--- Commit
	BIS_HitCC ppeffectadjust _adjust;
	BIS_HitCC ppeffectcommit 0.3;
	sleep 0.3;
	BIS_HitCC ppEffectEnable FALSE;
};