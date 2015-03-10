_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_keyPrefix = [_this,1,"",[""]] call bis_fnc_param;
_side = [_this,2,sideunknown,[sideunknown]] call bis_fnc_param;

_oo = "<img image='\a3\Ui_f\data\IGUI\RscIngameUI\RscHint\indent_gr.paa' width='16' /> ";
_o = "<br /><br />" + _oo;

_text = "";
_n = 1;
waituntil {
	_key = _keyPrefix + str _n;
	_n = _n + 1;
	if (islocalized _key) then {
		_oLocal = if (_n > 2) then {_o} else {_oo};
		_text = _text + _oLocal + localize _key;
		false
	} else {
		true
	};
};
{
	if (side _x == _side) then {
		_x creatediarysubject ["BIS_fnc_moduleMPTypeSeize",localize "STR_A3_CfgVehicles_ModuleMPTypeSeize_F_0"];
		_x creatediaryrecord ["BIS_fnc_moduleMPTypeSeize",[localize (_keyPrefix + "0"),_text]];
	};
} foreach ([] call bis_fnc_listPlayers);