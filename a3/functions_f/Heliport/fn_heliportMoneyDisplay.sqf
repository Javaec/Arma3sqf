#define DISPLAY_CONFIG	(configfile >> 'RscTitles' >> 'RscHeliportMoney')
#define DISPLAY		(uinamespace getvariable 'RscHeliportMoney')
#define CONTROL		(DISPLAY displayctrl _idc)
#define RSC_LAYER	33

disableserialization;

private ["_show","_add"];
_show =	[_this,0,true,[true]] call bis_fnc_param;
_add =	[_this,1,0,[0]] call bis_fnc_param;

if (_show) then {

	//--- Start display
	if (isnil {DISPLAY}) then {
		RSC_LAYER cutrsc ['RscHeliportMoney','plain'];
		waituntil {!isnil {DISPLAY}};
	};
	if (isnull DISPLAY) then {
		RSC_LAYER cutrsc ['RscHeliportMoney','plain'];
		waituntil {!isnull DISPLAY};
	};

	//--- Show money
	private ["_idc"];
	_idc = [DISPLAY_CONFIG,"TextMoney"] call BIS_fnc_getIDC;
	if !(isnull CONTROL) then {
		private ["_currency","_money","_textMoney"];
		_currency = "$";
		_money = [] call BIS_fnc_heliportMoney;

		//--- Display helicopter weight
		_textCustom = if (!isnil "BIS_fnc_heliportMenuHeli_preview") then {
			format [
				"<t align='right'><t color='#aaffffff'>Total weight:</t><br /><t size='1.4' color='%2'>%1 Kg</t></t>", //ToDo: Unit conversion
				(weightRTD BIS_fnc_heliportMenuHeli_preview select 0),// + (BIS_fnc_heliportMenuHeli_preview getvariable "BIS_weight"),
				if (BIS_fnc_heliportMenuHeli_preview getvariable "BIS_isOwned") then {"#ffffff"} else {"#aaffffff"}
			];
		} else {
			""
		};
		_textMoneyString = "<t align='right' color='#ffffff' size='2'>%1 %2</t>";

		//--- Animation
		if (_add != 0) then {
			_moneyTemp = _money - _add;
			for "_m" from _moneyTemp to _money step (_add / 10) do {
				_textMoney = format [_textMoneyString,_currency,_m call BIS_fnc_numberText];
				CONTROL ctrlsetstructuredtext parsetext (_textMoney + "<br />" + _textCustom);
				sleep 0.01;
			};
		};
		_textMoney = format [_textMoneyString,_currency,_money call BIS_fnc_numberText];
		CONTROL ctrlsetstructuredtext parsetext (_textMoney + "<br />" + _textCustom);
		true
	};
} else {

	sleep _add;

	//--- Hide
	private ["_idc"];
	_idc = [DISPLAY_CONFIG,"TextMoney"] call BIS_fnc_getIDC;
	CONTROL ctrlsetfade 1;
	CONTROL ctrlcommit 0.5;

	waituntil {ctrlcommitted CONTROL};
	RSC_LAYER cuttext ['','plain'];
};
