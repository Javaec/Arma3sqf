_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_keyPrefix = [_this,1,"",[""]] call bis_fnc_param;
_side = [_this,2,sideunknown,[sideunknown]] call bis_fnc_param;

_tierMax = _logic getvariable ["EvacWave","5"];
_tierMax = _tierMax call bis_fnc_ordinalNumber;

_oo = "<img image='\a3\Ui_f\data\IGUI\RscIngameUI\RscHint\indent_gr.paa' width='16' /> ";
_o = "<br /><br />" + _oo;

_text = "";
_n = 0;
waituntil {
	_key = _keyPrefix + str _n;
	_n = _n + 1;
	if (islocalized _key) then {
		_oLocal = if (_n > 1) then {_o} else {_oo};
		_text = _text + _oLocal + localize _key;
		false
	} else {
		true
	};
};
{
	if (side _x == _side) then {
		_x creatediarysubject ["BIS_fnc_moduleMPTypeDefense",localize "STR_A3_CfgVehicles_ModuleMPTypeDefense_F_0"];
		_x createDiaryRecord [
			"BIS_fnc_moduleMPTypeDefense",
			[
				localize "str_a3_diary_mission_title",
				format [_text,_tierMax]
			]
		];
	};
} foreach ([] call bis_fnc_listPlayers);