/*
	File: fn_radialRed.sqf
	Author: Karel Moricky, Vladimir Hynek, Borivoj Hlava

	Description:
	Red radial postprocess (hit damage, fire damage).

	Parameter(s):
	_this select 0: Object - Unit who gets damage
	_this select 1: String - Body part which gets damage
	_this select 2: Number - Damage
	_this select 3: Object - Shooter - requested only if (_this select 1) is not empty string

	Returned value:
	
	Note: 
*/

_this spawn {
	//-----------------HIT - show red PP---------------------------------------------------------------------------------

	BIS_canStartRed = false;
	_params = [];

	//-----------------------------------Karel's hit detector (see news:jsbtpi$935$1@new-server.localdomain)--------------------------------

	//script gets BIS_hitArray (array returned by HandleDamage event handler) as parameter
	_handleDamageArray = _this;
	_hitpart = _handleDamageArray select 1;
	_damage = _handleDamageArray select 2;

	if (_hitpart != "") then {
		
		//--- Constants
		_delayFade = 1;
		_colorRGB = [0.3,0.0,0.0];
		_coefFront = 0.3; //0.2
		_coefSide = 0.25;
		_coefBack = 0.25;
		
		//--- Declare arguments
		_unit = _handleDamageArray select 0;
		_shooter = _handleDamageArray select 3;

		//--- Caluclate incoming direction
		_dir = if (_unit == _shooter) then {
			0
		} else {
			[_unit,_shooter] call bis_fnc_relativedirto;
		};
		_dirToFront = (180 - _dir) / 180;
		_dirToEnd = (abs _dirToFront / _dirToFront) - _dirToFront;
		_dirTotal = abs _dirToFront * _dirToEnd * 4;

		//--- Calculate size and position of the effect based on direction
		_sizeCoef = 0.85 - (_coefFront * abs _dirToFront);//0.85
		_offsetX = 1 * -_dirTotal * _coefSide;
		_offsetY = 1 * - abs (_dirToEnd^2) * _coefBack;
		_sizeX = 1 * _sizeCoef;
		_sizeY = 1 * _sizeCoef;

		//--- Alpha is based on received damage
		_colorAlpha = 0.4 + 0.5 * (_damage min 0.8);

		//--- Compose params for PP effect
		_adjust = [
			1,
			1,
			0,
			_colorRGB + [_colorAlpha],	//--- Color
			[1,1,1,1],
			[0.3,0.3,0.3,0],
			[
				_sizeX,		//--- Width
				_sizeY,		//--- Height
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
		_adjust set [3,_colorRGB + [0]];
		BIS_HitCC ppeffectadjust _adjust;
		BIS_HitCC ppeffectcommit _delayFade;
		sleep _delayFade;
		BIS_HitCC ppEffectEnable FALSE;
	} else {
		//------- Burning part -------
		if (isBurning (_handleDamageArray select 0)) then {
			//--- Constants
			_colorRGB = [0.3,0.0,0.0];
			
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
		};
	};
	//-----------------------------------Karel's hit detector (see news:jsbtpi$935$1@new-server.localdomain)--------------------------------

	BIS_canStartRed = true;
};

//----------Working - ellipse PP-----------------------------------------
/*
BIS_canStartRed = false;

[]spawn {

	//_damage = 0.1; //damage player;

	//apply post process that is dependent on BIS_fakeDamage
	//_helper = 0.0 max (1 - (_damage^0.6));

	//BIS_HitCC = ppEffectCreate ["ColorCorrections", 1650];
	//BIS_HitCC ppEffectAdjust [1,1,0,[0.2, 0.2, 0.2, 1.0 min ( (((0.0 max (_damage-0.1))^0.5)+((0.0 max (_damage-0.1))/7.6)))],[1, 1, 1, _helper],
	//						 [0.3,0.3,0.3,0],
	//						 [0.1 max (1-((((1.1*_damage)-0.1))^4)), 0.1 max (1-((((1.1*_damage)-0.1))^4)), 0, 0, 0, 0.001, 0.8]];
	
	
	//_deltaDMG = abs( (damage player) - BIS_oldDMG);
	
	
	
	private ["_coef", "_deltaDMG"];  //is dependent also on oxygen to be better aligned with blue suffocating PP
	
	//_deltaDMG = abs( (damage player) - BIS_oldDMG);
	//hint str _deltaDMG;  //pohybuje se od 0.01-0.2 u pistole, az po 1.0, pri topeni 0.016
	
	if (!isAbleToBreathe player) then
	{
		_coef = 0.4 max ((1.0 min (GetOxygenRemaining player * 1.7)) - BIS_deltaDMG); //narrow, from suffocating unit gets damage 0.005/s   //quite good: _coef = 0.0 max (0.6 - BIS_deltaDMG);
		//hint str _coef;
	}
	else
	{
		//_coef = 0.8 max (1 - BIS_deltaDMG);//1 - (BIS_deltaDMG / 2);  //0.8-1.0  //max is here only to ensure that values don't go out of range
		_coef = 1 - (0.2 * BIS_deltaDMG);  //0.2 was ok but almost the same as bleeding PP
		//hint str _coef;
	};
	
	//hint "test";
	//BIS_HitCC ppEffectAdjust [1,1,0,[0.17, 0.0008, 0.0008, 0],[0.17, 0.0008, 0.0008, 0.1],[1, 1, 1, 0], [_coef, _coef, 0, 0, 0, 0.1, 0.5]];
	BIS_HitCC ppEffectAdjust [1,1,0,[0.17, 0.0008, 0.0008, 0],[0.17, 0.0008, 0.0008, 0.1],[1, 1, 1, 0], [_coef, _coef, 0, 0, 0, 0.4, 0.8]];
	BIS_HitCC ppEffectEnable TRUE;
	BIS_HitCC ppEffectForceInNVG TRUE;
	BIS_HitCC ppEffectCommit 0;
	
	sleep 0.1;
	
	// switch Hit PP off
	//BIS_HitCC ppEffectAdjust [1,1,0,[0, 0, 0, 0],[1, 1, 1, 1],[0, 0, 0, 0], [1, 1, 0, 0, 0, 0.1, 0.5]];
	BIS_HitCC ppEffectAdjust [1,1,0,[0.17, 0.0008, 0.0008, 0],[0.17, 0.0008, 0.0008, 0.1],[1, 1, 1, 0], [2, 2, 0, 0, 0, 0.4, 0.8]];
	BIS_HitCC ppEffectCommit 0.7;
	sleep 0.7;

	BIS_HitCC ppEffectEnable FALSE;
	
	sleep 0.1; //let engine disable the effect
	
	
	BIS_canStartRed = true;
						 
};
*/
//----------Working - ellipse PP-----------------------------------------



//old fullscreen red effect---------------------------------------

/*
//deltaDMG = abs( (damage player) - BIS_oldDMG);
BIS_canStartRed = false;

[]spawn {
	_deltaDMG = abs( (damage player) - BIS_oldDMG);
	_delay = (0.2 + random 0.1) * acctime;

	BIS_HitCC ppEffectAdjust [1, 1, 0, [0.1, 0.0, 0.0, _deltaDMG], [1.0, 0.5, 0.5, 0.1], [0.199, 0.587, 0.114, 0.0]];
	//BIS_HitCC ppEffectAdjust [1, 1, 0, [0.0, 1.0, 0.0, _deltaDMG], [0.0, 1.0, 0.0, 0.1], [0.199, 0.587, 0.114, 0.0]];
	BIS_HitCC ppEffectEnable TRUE;
	BIS_HitCC ppEffectCommit _delay;
	sleep _delay;

	//return values to normal
	BIS_HitCC ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0,0,0,1], [0, 0, 0, 0]];
	BIS_HitCC ppEffectCommit _delay;
	sleep _delay;

	// switch Hit PP off
	BIS_HitCC ppEffectEnable FALSE;
	
	BIS_canStartRed = true;

};
*/
//old fullscreen red effect---------------------------------------


//-----------------HIT - show red PP----------------------------------------------------------------------------------