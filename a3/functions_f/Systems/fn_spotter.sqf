
/*
	File: fn_spotter.sqf
	Author: Karel Moricky

	Description:
	Spotter reprting target distance to sniper

	Parameter(s):
	_this:	OBJECT	- sniper
		OBJECT	- spotter

	Returns:
	Nothing
*/
_sniper = _this select 0;
_spotter = _this select 1;

{
	_x kbaddtopic ["BIS_distanceReport","A3\functions_f\systems\fn_spotter.bikb",""];
} foreach [_sniper,_spotter];

_numberToString = {
	_number = _this;
	_result = switch _number do {
		case 0: {"zero2"};
		case 1: {"one2"};
		case 2: {"two2"};
		case 3: {"three2"};
		case 4: {"four2"};
		case 5: {"five2"};
		case 6: {"six2"};
		case 7: {"seven2"};
		case 8: {"eight2"};
		case 9: {"nine2"};
		default {"zero2"};
	};
	_result;
};

_teamDistanceMax = 50;
_dis = 0;

while {alive _sniper && alive _spotter} do {
	if (player == _sniper) then {
		if (cameraview == "GUNNER") then {
			if (_sniper distance _spotter < _teamDistanceMax) then {
				if !(isnull leader cursortarget) then {
					_disTemp = _sniper distance cursortarget;
					_disRel = abs (_dis - _disTemp);
					if (_disRel > 50 && _disTemp >= 50) then {
						//_disText = (round (_disTemp / 100)) * 100;
						_disText = round _disTemp;
						_disText0001 = (_disText % 10);
						_disText0010 = (_disText % 100 - _disText0001);
						_disText0100 = (_disText % 1000 - _disText0001 - _disText0010);
						_disText1000 = (_disText - _disText0100 - _disText0001 - _disText0010);
						_disText0001 = _disText0001 / 0001;
						_disText0010 = _disText0010 / 0010;
						_disText0100 = _disText0100 / 0100;
						_disText1000 = _disText1000 / 1000;

						_speechArray = [];
						if (_disText >= 1000) then {_speechArray = _speechArray + [_disText1000 call _numberToString]};
						if (_disText >= 0100) then {_speechArray = _speechArray + [_disText0100 call _numberToString]};
						if (_disText >= 0010) then {_speechArray = _speechArray + [_disText0010 call _numberToString]};
						if (_disText >= 0001) then {_speechArray = _speechArray + [_disText0001 call _numberToString]};
						_speechArray = _speechArray + ["Meters"];

						_sentence = [_sniper,"BIS_distanceReport","distanceReport",["Dist",{},str _disText + " " + localize "str_ep1_wordmeters",_speechArray]];
						_spotter kbtell _sentence;
					};
					_dis = _disTemp;
				};
			};
		};
	};
	sleep 1;
};