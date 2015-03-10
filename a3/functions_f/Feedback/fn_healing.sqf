/*
	File: fn_healing.sqf
	Author: Borivoj Hlava

	Description:
	Healing postprocess.

	Parameter(s):
	None.

	Returned value:
	None. 
*/


[] spawn {
	//--- Constants
	BIS_fnc_feedback_blue = false;
	_colorRGB = [0.0,0.0,0.3];
	
	//--- Calculate size and position of the effect based on direction
	if (isNil {BIS_pp_burnDamage}) then {BIS_pp_burnDamage = [_damage,(time - 30)]};
	_time = time;
	
	if ((_time - (BIS_pp_burnDamage select 1)) < 1.15) then {
		_partDamage = _damage - (BIS_pp_burnDamage select 0);
		_delayFade = 1.05 - _partDamage;
		
		_sizeCoef = 0.55;
		_offsetX = 0;
		_offsetY = 0;
		_sizeX = 1 * _sizeCoef;
		_sizeY = 1 * _sizeCoef;
		BIS_PP_burnParams = [_sizeCoef,_offsetX,_offsetY,_sizeX,_sizeY,_colorRGB];

		//--- Alpha is based on received damage
		_colorAlpha = 0.45 + 3.6 * (_partDamage min 0.15);

		//--- Compose params for PP effect
		_adjust = [
			1,
			1,
			0,
			_colorRGB + [_colorAlpha],	//--- Color
			[1,1,1,1],
			[0.3,0.3,0.3,0],
			[
				_sizeX * 0.85,		//--- Width
				_sizeY * 0.85,		//--- Height
				0,		//--- Radius
				_offsetX,	//--- X offset
				_offsetY,	//--- Y offset
				0.5,		//--- Border thickness
				1		//--- Border strength
			]
		];
				
		//--- Instantly apply the effect
		BIS_HitCC ppeffectadjust _adjust;
		BIS_HitCC ppEffectEnable TRUE;
		BIS_HitCC ppEffectForceInNVG TRUE;
		BIS_HitCC ppeffectcommit 0;

		//--- Fade the effect away
		_adjust set [3,_colorRGB + [0.35]];
		_adjust set [6,[_sizeX,_sizeY,0,_offsetX,_offsetY,0.5,1]];
		BIS_HitCC ppeffectadjust _adjust;
		BIS_HitCC ppeffectcommit _delayFade;
		sleep _delayFade;
		
		BIS_pp_burnDamage = [_damage,_time];
	} else {
		BIS_pp_burnDamage = [_damage,_time];
	};
	
	BIS_fnc_feedback_blue = true;
};