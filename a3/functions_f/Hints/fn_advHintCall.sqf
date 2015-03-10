/*
	File: advHintCall.sqf
	Author: Borivoj Hlava

	Description:
	Advanced hint call, creates hint itself

	Parameter(s):
	_this select 0: Bool - True for full text, false for small hint notification
	This function gets parameters from variable BIS_fnc_advHint_hint:
	BIS_fnc_advHint_hint select 0: String - Class of hint
	BIS_fnc_advHint_hint select 1: String - Structured text of full hint
	BIS_fnc_advHint_hint select 2: String - Structured text of short hint
	BIS_fnc_advHint_hint select 3: Number - Duration of short hint in seconds
	BIS_fnc_advHint_hint select 4: String - Condition for hiding of short hint (default: "false")
	BIS_fnc_advHint_hint select 5: Number - Duration of full hint in seconds
	BIS_fnc_advHint_hint select 6: String - Condition for hiding of full hint (default: "false")
	BIS_fnc_advHint_hint select 7: Bool - True shows directly full hint (default: false)
	BIS_fnc_advHint_hint select 8: Bool - True for using of sound (default: true)

	Returned value:
	None
*/
private ["_titleClass","_hint","_time","_showTF","_condF","_timeLimit","_shortHint","_showT","_cond","_onlyFull","_timeCheck","_nrCheckF","_nrCheckS","_fnc_advHint_hide"];

if (isNil {BIS_fnc_advHint_nr}) then {
	BIS_fnc_advHint_nr = 0
};

_fnc_advHint_hide = {		//hiding hint function
	_time = _this select 0;
	_showTF = _this select 1;
	_titleClass = _this select 2;
	_condF = _this select 3;
	_hintText = _this select 4;
	_hintTitle = _this select 5;
	_sound = _this select 6;
	BIS_fnc_advHint_HPressed = nil;
	
	_timeLimit = _time + _showTF;
	_nrCheckF = BIS_fnc_advHint_nr;
	waitUntil {(time >= _timeLimit) || (!(isNil 'BIS_fnc_advHint_HPressed')) || (call (compile _condF))};		//wait for H press and then hide the hint
	if ((_titleClass == (player getVariable 'BIS_fnc_advHint_HActiveF')) && (_titleClass == (player getVariable 'BIS_fnc_advHint_HActiveS')) && (_nrCheckF == BIS_fnc_advHint_nr)) then {
		BIS_fnc_advHint_HPressedCtrl = nil;
		if ((!isNil 'BIS_fnc_advHint_HPressed') || (call (compile _condF)) || (time >= _timeLimit)) then {
			RscAdvancedHint_close = true;
			if (_sound) then {playSound ["HintCollapse",true]};		//closed hint sound
		}
	};
	sleep 0.1;
	BIS_fnc_advHint_HPressed = nil;
};

	// ===== ===== FULL HINT ===== =====
if (_this select 0) then {
	_titleClass = BIS_fnc_advHint_hint select 0;
	if ((isNil 'BIS_fnc_advHint_HPressedCtrl') || ((player getVariable 'BIS_fnc_advHint_HActiveF') != _titleClass)) then {		//starts only for showing the full hint
		BIS_fnc_advHint_RefreshCtrl = nil;
		player setVariable ['BIS_fnc_advHint_HActiveF',_titleClass];
		_sound = BIS_fnc_advHint_hint select 8;
		_hint = BIS_fnc_advHint_hint select 1;
		_hintTitle = [_hint,0,"",[""]] call bis_fnc_paramin;
		_hintText = [_hint,1,"",[""]] call bis_fnc_paramin;
		RscAdvancedHint_title = _hintTitle;
		RscAdvancedHint_hint = parsetext _hintText;
		RscAdvancedHint_state = [_titleClass,"expanded"];
		("RscAdvancedHint" call bis_fnc_rsclayer) cutrsc ["RscAdvancedHint","plain"];
		
		if ((isNil {player getVariable "BIS_fnc_advHint_soundCtrl"}) && _sound) then {
			playSound ["HintExpand",true];		//full hint sound
		} else {
			player setVariable ["BIS_fnc_advHint_soundCtrl",nil]
		};
		_time = time;
		BIS_fnc_advHint_HPressedCtrl = true;
		
		_showTF = BIS_fnc_advHint_hint select 5;
		_condF = BIS_fnc_advHint_hint select 6;
		
		[_time, _showTF, _titleClass, _condF, _hintText, _hintTitle, _sound] spawn _fnc_advHint_hide;
	} else {	
		if (isNil {BIS_fnc_advHint_RefreshCtrl}) then {
			_hint = BIS_fnc_advHint_hint select 1;
			_hintTitle = [_hint,0,"",[""]] call bis_fnc_paramin;
			_hintText = [_hint,1,"",[""]] call bis_fnc_paramin;
			RscAdvancedHint_title = _hintTitle;
			RscAdvancedHint_hint = parsetext _hintText;
			RscAdvancedHint_state = [_titleClass,"expanded"];
			
			BIS_fnc_advHint_refresh = true;
			
			_time = time;
			_showTF = BIS_fnc_advHint_hint select 5;
			_condF = BIS_fnc_advHint_hint select 6;
			_sound = BIS_fnc_advHint_hint select 8;
			[_time, _showTF, _titleClass, _condF, _hintText, _hintTitle, _sound] spawn _fnc_advHint_hide;
		} else {
			BIS_fnc_advHint_RefreshCtrl = nil;
		};
	};
} else {
	// ===== ===== SHORT HINT ===== =====
	_titleClass = BIS_fnc_advHint_hint select 0;
	_shortHint = BIS_fnc_advHint_hint select 2;
	_showT = BIS_fnc_advHint_hint select 3;
	_cond = BIS_fnc_advHint_hint select 4;
	_onlyFull = BIS_fnc_advHint_hint select 7;
	_sound = BIS_fnc_advHint_hint select 8;

	_shortHintTitle = [_shortHint,0,"",[""]] call bis_fnc_paramin;
	_shortHintText = [_shortHint,1,"",[""]] call bis_fnc_paramin;

	BIS_fnc_advHint_nr = BIS_fnc_advHint_nr + 1;
	if !(_onlyFull) then {
		if !(call (compile _cond)) then {
			player setVariable ['BIS_fnc_advHint_HActiveS',_titleClass];
			RscAdvancedHint_title = _shortHintTitle;
			RscAdvancedHint_hint = parsetext _shortHintText;
			RscAdvancedHint_state = [_titleClass,"collapsed"];
			("RscAdvancedHint" call bis_fnc_rsclayer) cuttext ["","plain"];
			("RscAdvancedHint" call bis_fnc_rsclayer) cutrsc ["RscAdvancedHint","plain"]; 
			if (_sound) then {playSound ["Hint",true]};			//new hint sound
			
			_time = time;		
			[_time, _showT, _titleClass, _cond] spawn {
				_time = _this select 0;
				_showT = _this select 1;
				_titleClass = _this select 2;
				_cond = _this select 3;
				_timeLimit = _showT + _time;
				
				_nrCheckS = BIS_fnc_advHint_nr;
				waitUntil {(call (compile _cond)) || (time > _timeLimit)};
				if ((_titleClass == (player getVariable 'BIS_fnc_advHint_HActiveS')) && (isNil 'BIS_fnc_advHint_HPressedCtrl') && (_nrCheckS == BIS_fnc_advHint_nr)) then {
					RscAdvancedHint_close = true;
				}
			}
		};
		BIS_fnc_advHint_HPressedCtrl = nil
	} else {
		player setVariable ['BIS_fnc_advHint_HActiveS',_titleClass];
		if (_sound) then {playSound ["Hint",true]};			//new hint sound
		//BIS_fnc_advHint_HPressedCtrl = nil;
		player setVariable ["BIS_fnc_advHint_soundCtrl",true];
		
		BIS_fnc_advHint_HPressed = true;
		[true] call BIS_fnc_AdvHintCall;
	};
	
};