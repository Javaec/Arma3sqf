/*
	Author: Karel Moricky

	Description:
	Effects when player is hit.

	Parameter(s): Sent by "handleDamage" event handler

	Returns:
	BOOL
*/

BIS_fnc_healthEffects_handleDamage_code = {
	_unit = _this select 0;
	_damageReal = _this select 2;
	_damageUnit = damage _unit;
	_damage = _damageReal - _damageUnit; //--- Ignore handlers where _damage value is total, not delta

	if (_unit == player && alive player && (_damage > 0 || _damageReal < 0)) then {
		_hitpart = _this select 1;
		if (_hitpart == "") then {
			private ["_dir","_dirToFront","_dirToEnd","_dirTotal"];
			_shooter = _this select 3;

			//--- Constants
			_delayFade = 2 + (_damageUnit * 4);
			_colorRGB = [0.3,0.0,0.0];
			_coefFront = 0.2;
			_coefSide = 0.25;
			_coefBack = 0.25;
			_coefIncapacitated = 0.3;
			_permanentEffectThreshold = 0.35;

			//--- Incapacitated - no direction
			if (lifestate _unit == "INCAPACITATED") then {
				_shooter = _unit;
				_incapacitatedCoef = ((_damageUnit max 0.85) - 0.85) / 0.15;
				_coefFront = _coefIncapacitated + (0.05 * sin (time * (50 + 100 * _incapacitatedCoef)));

				_adjust = [
					1,
					1,
					0,
					_colorRGB + [0.4 * _incapacitatedCoef],
					[1,1,1,(1 - _incapacitatedCoef) max 0],
					[0.7,0.7,0.7,0]
				];

				BIS_fnc_healthEffects_colorCorrection_incapacitated ppeffectadjust _adjust;
				BIS_fnc_healthEffects_colorCorrection_incapacitated ppeffectcommit 0;
				BIS_fnc_healthEffects_colorCorrection_incapacitated ppeffectenable true;

				//--- Fade the effect away
				_adjust set [3,_colorRGB + [0]];
				_adjust set [4,[1,1,1,1]];
				BIS_fnc_healthEffects_colorCorrection_incapacitated ppeffectadjust _adjust;
				BIS_fnc_healthEffects_colorCorrection_incapacitated ppeffectcommit _delayFade;
			};

			//--- Temporary color (direction)
			if (_damage > 0.07) then {

				//--- Caluclate incoming direction
				if (
					//--- Self inflicted damage / drowning / incapacitated
					_unit == _shooter
					||
					//--- Unit is in vehicle, cannot tell the direction
					vehicle _unit != _unit
					||
					//--- Burning
					isnull _shooter
				) then {
					_dir = 0;
					_dirToFront = 1;
					_dirToEnd = 0;
					_dirTotal = 0;
				} else {
					_dir = [_unit,_shooter] call bis_fnc_relativedirto;
					_dirToFront = (180 - _dir) / 180;
					_dirToEnd = (abs _dirToFront / _dirToFront) - _dirToFront;
					_dirTotal = abs _dirToFront * _dirToEnd * 4;
				};

				//--- Calculate size and position of the effect based on direction
				_sizeCoef = 0.85 - (_coefFront * abs _dirToFront);
				_offsetX = -_dirTotal * _coefSide;
				_offsetY = - abs (_dirToEnd^2) * _coefBack;
				_sizeX = _sizeCoef;
				_sizeY = _sizeCoef;

				//--- Alpha is based on received damage
				_colorAlpha = 0.4 + 0.3 * (_damage min 1);

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
				BIS_fnc_healthEffects_colorCorrection ppeffectadjust _adjust;
				BIS_fnc_healthEffects_colorCorrection ppeffectcommit 0;

				//--- Fade the effect away
				_adjust set [3,_colorRGB + [0]];
				BIS_fnc_healthEffects_colorCorrection ppeffectadjust _adjust;
				BIS_fnc_healthEffects_colorCorrection ppeffectcommit _delayFade;
			};

			//--- Permanent color
			_damageUnitReduced = if (_damageUnit > _permanentEffectThreshold) then {_damageUnit} else {0};
			_adjust = [
				1,
				1,
				(_damageUnitReduced / 4),
				[0.2,0,0,0.2],		//--- Color
				[1,1,1,1 - _damageUnitReduced],
				[0.3,0.3,0.3,0],
				[
					1 - _damageUnitReduced / 3,	//--- Width
					1.2,				//--- Height
					0,				//--- Radius
					0,				//--- X offset
					0,				//--- Y offset
					0.1,				//--- Border thickness
					1				//--- Border strength
				]
			];
			BIS_fnc_healthEffects_colorCorrection_radial ppeffectadjust _adjust;
			BIS_fnc_healthEffects_colorCorrection_radial ppeffectcommit 0;

			//--- Permanent blur
			_adjust = [
				0.007 * _damageUnitReduced,	//--- Strength X
				0,				//--- Strength Y
				0.25,				//--- Width
				0.25				//--- Height
			];
			BIS_fnc_healthEffects_radialBlur ppeffectadjust _adjust;
			BIS_fnc_healthEffects_radialBlur ppeffectcommit 0;
		};
	};
	_damageReal
};
BIS_fnc_healtEffects_init = {
	if (isnil {_this getvariable "BIS_fnc_healthEffects_handleDamage"}) then {
		private ["_eh"];
		_eh = _this addeventhandler ["handledamage",{_this call BIS_fnc_healthEffects_handleDamage_code;}];
		_this setvariable ["BIS_fnc_healthEffects_handleDamage",_eh];

		_eh = _this addeventhandler ["respawn",{[_this select 0,"",-1,_this select 0] call BIS_fnc_healthEffects_handleDamage_code;}];
		_this setvariable ["BIS_fnc_healthEffects_respawn",_eh];
	};
};


//--- Create post-process effects
BIS_fnc_healthEffects_colorCorrection_incapacitated = ppeffectcreate ["ColorCorrections", 1605];
BIS_fnc_healthEffects_colorCorrection_incapacitated ppeffectenable true;

BIS_fnc_healthEffects_colorCorrection_radial = ppeffectcreate ["ColorCorrections", 1606];
BIS_fnc_healthEffects_colorCorrection_radial ppeffectforceinNVG true;
BIS_fnc_healthEffects_colorCorrection_radial ppeffectenable true;

BIS_fnc_healthEffects_colorCorrection = ppeffectcreate ["ColorCorrections", 1607];
BIS_fnc_healthEffects_colorCorrection ppeffectforceinNVG true;
BIS_fnc_healthEffects_colorCorrection ppeffectenable true;

BIS_fnc_healthEffects_radialBlur = ppeffectcreate ["RadialBlur", 166];
BIS_fnc_healthEffects_radialBlur ppeffectadjust [0,0,0,0];
BIS_fnc_healthEffects_radialBlur ppeffectcommit 0;
BIS_fnc_healthEffects_radialBlur ppeffectforceinNVG true;
BIS_fnc_healthEffects_radialBlur ppeffectenable true;

[] spawn {
	waituntil {!isnull player};
	player call BIS_fnc_healtEffects_init;
	[player,"",-1,player] call BIS_fnc_healthEffects_handleDamage_code;

	//--- During team switch, remove handler from previous unit and add it to the new one
	onTeamSwitch {
		private ["_eh"];

		//--- Remove "handleDamage" handler
		_eh = _from getvariable "BIS_fnc_healthEffects_handleDamage";
		if (isnil "_eh") then {_eh = -1;};
		_from removeeventhandler ["handledamage",_eh];
		_from setvariable ["BIS_fnc_healthEffects_handleDamage",nil];

		//--- Remove "respawn" handler
		_eh = _from getvariable "BIS_fnc_healthEffects_respawn";
		if (isnil "_eh") then {_eh = -1;};
		_from removeeventhandler ["respawn",_eh];
		_from setvariable ["BIS_fnc_healthEffects_respawn",nil];

		//--- Initialize a new unit
		_to call BIS_fnc_healtEffects_init;

		//--- Hide PP effects by calling the function with no damage
		[player,"",-1,player] call BIS_fnc_healthEffects_handleDamage_code;
	};
};

true