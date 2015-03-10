scriptName "Marta\data\scripts\fnc_effect.sqf";
/*
	File: fnc_effect.sqf
	Author: Karel Moricky

	Description:
	Commits effect on marker.

	Parameter(s):

*/

_logic = BIS_marta_mainscope;

switch (_this select 0) do {

	//-----------------------------------------------------------------------------------------------	
	//--- FADE IN -----------------------------------------------------------------------------------
	//-----------------------------------------------------------------------------------------------
	case "COLOR": {
		_grp = _this select 1;
		_grpIconColorEnd = _this select 2;
		_fadetime = if (count _this > 3) then {_this select 3} else {1};
		_delay = 0.1;
		_step = _delay / _fadetime;

		_grpIconParams = +getgroupiconparams _grp;
		_grpIconColor = +_grpIconParams select 0;
		_difR = ((_grpIconColorEnd select 0) - (_grpIconColor select 0)) * _step;
		_difG = ((_grpIconColorEnd select 1) - (_grpIconColor select 1)) * _step;
		_difB = ((_grpIconColorEnd select 2) - (_grpIconColor select 2)) * _step;
		_difA = ((_grpIconColorEnd select 3) - (_grpIconColor select 3)) * _step;

		for "_i" from 0 to _fadetime step _delay do {
			_grpIconColor set [0,(_grpIconColor select 0) + _difR * _i];
			_grpIconColor set [1,(_grpIconColor select 1) + _difG * _i];
			_grpIconColor set [2,(_grpIconColor select 2) + _difB * _i];
			_grpIconColor set [3,(_grpIconColor select 3) + _difA * _i];
			_grpIconParams set [0,_grpIconColor];
			_grp setgroupiconparams _grpIconParams;

			sleep _delay;
		};
		_grpIconParams set [0,_grpIconColorEnd];
		_grp setgroupiconparams _grpIconParams;
	};


	//-----------------------------------------------------------------------------------------------	
	//--- FADE OUT ----------------------------------------------------------------------------------
	//-----------------------------------------------------------------------------------------------
	case "FADE OUT": {
		_marker = _this select 1;
		_fadetime = if (count _this > 2) then {_this select 2} else {1};
		_delay = 0.1;

		//--- Is marker used? If yes, wait or terminate?
		waituntil {!(_marker in (_logic getvariable "effect_fade"))};
		[_logic,"effect_fade",[_marker]] call BIS_fnc_variableSpaceAdd;

		_step = markeralpha _marker / _fadetime * _delay;
		_n = 0;
		for "_i" from _delay to _fadetime step _delay do {
			if !(_marker in (_logic getvariable "effect_fade")) exitwith {_n = _i};
			_marker setmarkeralphalocal (markeralpha _marker - _step);
			sleep _delay;
		};
		if (_n == 0) then {_marker setmarkeralphalocal 0};

		//--- Marker is no longer used
		_usedmarkers = _logic getvariable "effect_fade";
		[_logic,"effect_fade",[_marker]] call BIS_fnc_variableSpaceRemove;
	};


	//-----------------------------------------------------------------------------------------------	
	//--- SIZE --------------------------------------------------------------------------------------
	//-----------------------------------------------------------------------------------------------
	case "SIZE": {
		_marker = _this select 1;
		_finalsize = _this select 2;
		_fadetime = if (count _this > 3) then {_this select 3} else {1};
		_delay = 1/15;

		//--- Is marker used?
		waituntil {!(_marker in (_logic getvariable "effect_size"))};
		[_logic,"effect_size",[_marker]] call BIS_fnc_variableSpaceAdd;

		_finalX = _finalsize select 0;
		_finalY = _finalsize select 1;
		_stepX = (_finalX - (markersize _marker select 0)) / _fadetime * _delay;
		_stepY = (_finalY - (markersize _marker select 1)) / _fadetime * _delay;

		for "_i" from _delay to _fadetime step _delay do {
			_marker setmarkersizelocal [(markersize _marker select 0) + _stepX,(markersize _marker select 1) + _stepY];
			sleep _delay;
		};
		_marker setmarkersizelocal _finalsize;

		//--- Marker is no longer used
		[_logic,"effect_size",[_marker]] call BIS_fnc_variableSpaceRemove;
	};


	//-----------------------------------------------------------------------------------------------	
	//--- POS ---------------------------------------------------------------------------------------
	//-----------------------------------------------------------------------------------------------
	case "POS": {
		_marker = _this select 1;
		_finalpos = _this select 2;
		_fadetime = if (count _this > 3) then {_this select 3} else {1};
		_delay = 1/15;

		//--- Is marker used?
		waituntil {!(_marker in (_logic getvariable "effect_pos"))};
		[_logic,"effect_pos",[_marker]] call BIS_fnc_variableSpaceAdd;

		_finalX = _finalpos select 0;
		_finalY = _finalpos select 1;
		_stepX = (_finalX - (markerpos _marker select 0)) / _fadetime * _delay;
		_stepY = (_finalY - (markerpos _marker select 1)) / _fadetime * _delay;

		for "_i" from _delay to _fadetime step _delay do {
			_marker setmarkerposlocal [(markerpos _marker select 0) + _stepX,(markerpos _marker select 1) + _stepY];
			sleep _delay;
		};
		_marker setmarkerposlocal _finalpos;

		//--- Marker is no longer used
		[_logic,"effect_pos",[_marker]] call BIS_fnc_variableSpaceRemove;
	};


	//-----------------------------------------------------------------------------------------------	
	//--- DEFAULT -----------------------------------------------------------------------------------
	//-----------------------------------------------------------------------------------------------
	default {hintc format ["MARTA: Error in fnc_effect.sqf - %1",_this]};

};