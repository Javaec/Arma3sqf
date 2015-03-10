//--- Displayed items with maximum number of names
_credits = [
	"item1",
	"item2",
	["item3",2],
	"item4",
	"item5",
	["item6",7],
	"item7",
	["item8",5],
	"item9",
	["item10",13],
	"item11",
	["item12",11],
	"item13",
	["item14",4],
	"item15",
	["item16",3],
	"item17",
	["item18",3],
	"item19",
	["item20",2],
	"item21",
	["item22",3],
	"item23",
	"item25",
	["item26",5]
];

_cfgCredits = configfile >> "CfgCredits" >> "CreditsMovie";
_layers = ["credits1" call bis_fnc_rscLayer,"credits2" call bis_fnc_rscLayer];
_delay = 5.5; //--- Delay between each set of names
_duration = _delay * 1.5; //--- Duration for which a set of names is displayed

{
	_param = [_x,0,""] call bis_fnc_paramin;
	_resize = [_x,1,-1] call bis_fnc_paramin;

	//--- Format the text
	_item = getarray (_cfgCredits >> _param);
	_title = _item select 0;
	_names = _item select 1;
	if (_resize >= 0) then {_names resize _resize};
	_text = format ["<t font='PuristaBold'>%1</t>",toUpper (_title select 0)] + "<br />";
	{
		_text = _text + _x + "<br />";
	} foreach _names;
	_text = format ["<t size='0.8'>%1</t>",_text];

	//--- Show the text
	_index = _foreachindex % 2;
	_layer = _layers select _index;
	[_layer,_text,_index,_duration] spawn {
		disableserialization;
		_layer = _this select 0;
		_text = _this select 1;
		_index = _this select 2;
		_duration = _this select 3;

		_fadeTime = 0.5;
		_time = time + _duration - _fadeTime;

		_layer cutrsc ["RscDynamicText","plain"];
		_display = uinamespace getvariable ["BIS_dynamicText",displaynull];
		_ctrlText = _display displayctrl 9999;
		_ctrlText ctrlsetstructuredtext parsetext _text;
		_offsetX = 0.1;
		_offsetY = 0.3;
		_posW = 0.4;
		_posH = ctrltextheight _ctrlText + _offsetY;
		_pos = [
			[safezoneX + _offsetX,safezoneY + _offsetY,_posW,_posH],
			[safezoneX + safezoneW - _posW - _offsetX,safezoneY + safezoneH - _posH,_posW,_posH]
		] select _index;
		_ctrlText ctrlsetposition _pos;
		_ctrlText ctrlsetfade 1;
		_ctrlText ctrlcommit 0;
		_ctrlText ctrlsetfade 0;
		_ctrlText ctrlcommit _fadeTime;

		waituntil {time > _time};
		_ctrlText ctrlsetfade 1;
		_ctrlText ctrlcommit _fadeTime;
	};

	_time = time + _delay;
	waituntil {time > _time};

} foreach _credits;